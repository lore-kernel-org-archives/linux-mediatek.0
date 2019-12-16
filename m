Return-Path: <SRS0=XFYx=2G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41A76C43603
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Dec 2019 07:11:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECD0720725
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Dec 2019 07:11:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QfsJIN8W";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="SZtUzJjo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECD0720725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PrE4Y1xRXGmKmHlqmh8FeJylZVxYkVmLw3hFR/LDaR8=; b=QfsJIN8Wg5YNU8
	cErPsd5EfnLCxWYrvgA+9HUh+vWgWFYT8ALIO/5NOZha+JGiSfEI0Vzs6QW1oleR3j+3E0VJUHCBZ
	LeWJ2/x1svuXa5Y1jz2Vi/LHUGVJ/475SaBh6LAVcch4NtJSs2RXQBJc7p5Vo/C+Cxdx7ywrWOdrD
	1CVGf6WZ5VQW1RppzJWIvHR4abQbn31N4HZXonkNKcO68eQZcLzKYHQpgWSaFgtR2W3foxneFWIbx
	ztIACyDaAJyoc0V3k3VTg8v9gsussBO01rOxZkgRCNnw3A6zIk+/UQuXHz3walACr984JozyJUHIi
	jzuUZxLdvHEN7yiGe6Lg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igkXh-0000ZX-DF; Mon, 16 Dec 2019 07:11:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igkXU-0000Q3-I2; Mon, 16 Dec 2019 07:11:33 +0000
X-UUID: 65d6d70f0e43436f8e46e1e6892dbca4-20191215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=OgROpEIhh+7JoSk/mlmx76ruWwDI5qaudXsOyA/2J1U=; 
 b=SZtUzJjodDrPtn0UcqacbcSz9+IofzxNSSq0smC+M4AfCtTehIcvxIZG4PqeSWQuh8U/oPLGM3nk6aqDP0cOYoVTNiIQQ29gmqrxIGHSqZCHAYvXHxK+7uuln6L56zDH5GqX8tjhU4MOVt4sVjfvFR5x/N8qTQKxiGsl1jceW3w=;
X-UUID: 65d6d70f0e43436f8e46e1e6892dbca4-20191215
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1827537888; Sun, 15 Dec 2019 23:11:26 -0800
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 15 Dec 2019 23:02:33 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Mon, 16 Dec 2019 15:01:40 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Mon, 16 Dec 2019 15:01:02 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Uwe Kleine-Koenig
 <u.kleine-koenig@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-pwm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, CK Hu
 <ck.hu@mediatek.com>
Subject: [PATCH v2 0/2] pwm_mtk_disp suspend resume issue fix
Date: Mon, 16 Dec 2019 15:01:21 +0800
Message-ID: <20191216070123.114719-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: FD417AFFB53D0E358027859FF6FDC788B0702CA0534DA0C3FEF7EDAD6D821C6A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191215_231132_603775_247D46F2 
X-CRM114-Status: UNSURE (   4.17  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Jitao Shi <jitao.shi@mediatek.com>, sj.huang@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Changes since to v1:
 - Edit commit msg.
 - Remove the register trigger in probe.
 - Rebase to v5.5-rc1.

Changes in patches:
 - match pwm_mtk_disp clock when suspend/resume
 - trigger pwm_mtk_disp reg working after config

Jitao Shi (2):
  pwm: fine tune pwm-mtk-disp clock control flow
  pwm/mtk_disp: move the reg enable trigger in config

 drivers/pwm/pwm-mtk-disp.c | 63 ++++++++++++--------------------------
 1 file changed, 19 insertions(+), 44 deletions(-)

-- 
2.21.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

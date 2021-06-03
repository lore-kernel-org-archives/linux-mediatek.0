Return-Path: <SRS0=bWHh=K5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B63A4C47082
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jun 2021 10:05:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 887B961057
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jun 2021 10:05:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 887B961057
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Wo1JpTmnILLadpGEecdVISQ7OcE56LlehLzVfOFm6CA=; b=YMOcJHfSpC8CKY
	EgABaaMi7/EuG2NQYo2QWY1ApkZfTMJLu8TgS/hwmXV1RMIA+LBwG4UdOJ3BQw4MEuMj0x35ouG1r
	Bd6DGFL94nVkoVYknJaDmH094nmR4YqFiOsxPdDh5VDgjP/hGk2Rnb2CY7qDUQSD2bbh/1VkWsOJ+
	Zf1DVYKrdE9ELWDZxjfzXuIeARpZeqLjNLil+d8zyjYDoYGEJNYapAotnY5SEUpb6TE0WF7XmtVv0
	/J03y/OZlPhFK+z5toYdpRyxZgBIiwmUWnmJaGhQtgCf/qJu+S6FAfKFYUsr9lifeEdHJ8z7vITdK
	SGAwlIshIFLLDQaVam5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lokEV-0080hH-Sl; Thu, 03 Jun 2021 10:05:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lokES-0080ea-Gf; Thu, 03 Jun 2021 10:05:46 +0000
X-UUID: 048fa615b51b4ba387a63c062b778ea9-20210603
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=L75spOTlvZqmrkmdca+z60GCtC1z1RwEtUymYBIXVJU=; 
 b=n/Dmt/Q4aLhASlB3eJm2MDq1ck2dO+uKV9lPSVnuMpWgqzbYr2LNJpT2XOZeHqNJmHXf/j8vFh/xvR2UGU3sRPU7HrR+v0GkfvKP/KiSVJG+NZJXYUuPxGWG+p1DzcWsl3x4cbxHuweEwZWi5EgZoo0EvvXeuso7VKolYYqC/9c=;
X-UUID: 048fa615b51b4ba387a63c062b778ea9-20210603
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1461833944; Thu, 03 Jun 2021 03:05:40 -0700
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Jun 2021 03:05:38 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 3 Jun 2021 18:05:35 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 3 Jun 2021 18:05:33 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: <linux-pwm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <srv_heupstream@mediatek.com>, <yingjoe.chen@mediatek.com>,
 <eddie.huang@mediatek.com>, <cawa.cheng@mediatek.com>,
 <bibby.hsieh@mediatek.com>, <ck.hu@mediatek.com>, <stonea168@163.com>,
 <huijuan.xie@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH v4 0/3] fix the clock on/off mismatch and switch pwm api to
 atomic API
Date: Thu, 3 Jun 2021 18:05:28 +0800
Message-ID: <20210603100531.161901-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TM-SNTS-SMTP: 22F37F3A8C28D6193C7C5BF83EA9545E74F51CA51945BC54C8BC7DD6ABDDF0672000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_030545_157820_31199B16 
X-CRM114-Status: UNSURE (   7.11  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Change since v3:
 - Seperate the clock sequence as single patch.
 - fixup the reg commit when clocks sequence changed
 - Merege the apply and get_state as single patch

Change since v2:
 - Change commit messages to remove the clock operations for atomic APIs.
 - Rebase to v5.13 rc1

Changes since v1:
 - Seperate clock operation as single patch.
 - Seperate apply() as single patch.
 - Seperate get_state() operation as single patch.

Jitao Shi (3):
  pwm: mtk-disp: adjust the clocks to avoid them mismatch
  pwm: mtk-disp: move the commit to clock enabled
  pwm: mtk-disp: Switch to atomic API

 drivers/pwm/pwm-mtk-disp.c | 167 +++++++++++++++++++++----------------
 1 file changed, 93 insertions(+), 74 deletions(-)

-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DFB4C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 09:59:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6B1C613C4
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 09:59:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6B1C613C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YM0D3IEjGEnvmdZKv4Hr6u7ftllIBMkpJFgvJEUjd/A=; b=Vnoe+PeqLvrJQO5bbn7TySQZiX
	TffD8EAcIdRnDTkt7RHVlVTVpilhwu7GZxISPVLamY/KCzCS9MN8QjKnshBGWJXx9xLbs7b5jqV43
	A+xH2ZXN0Xa71Zi7WpCjAvkpltMHUBpiG1gJoFOhMp1IFcdhytZZWIJWA+DvOjCDyPp9Zeb/SD1u9
	QLsYYJRLyFg3QOSSfgEngP3Fch4tbX7YkFCTsFVqayOPrlv0Nakf3m+oYAJH/GBdohPOQs8i0Lvn2
	Ffwwq8qXTAYbKAxwTztvYcQyagsW8xgPX9FQfuIdukqoEWAQoE+5vV07mfYSIFbp3+NvjoGSMCyBC
	yf9NvQLQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTiTy-00265w-9Q; Tue, 06 Apr 2021 09:58:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTiTs-00264W-23; Tue, 06 Apr 2021 09:58:48 +0000
X-UUID: 7043c16f72214608b06ee1909f01f908-20210406
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=8bQi/NK94dcAz0goI0M6bggip70dmHuYgpOVpnB1BN0=; 
 b=i9pPzcGo2lXvm2v0vtmpbFEMPTTlb6m+UoZRo2dmju80yYdrHByDUq8JclYjT2Q8UEY3/lp2N1ISVkaYO7Zs4hDzEQFnT+LZSl4ZwkkV7McsTFAHM8A7b8c40w0Ef1Z+ddhixUoiwHnWnvFO9/wX8ogU5Ok2pUpoZmpciXE2PIs=;
X-UUID: 7043c16f72214608b06ee1909f01f908-20210406
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1214009374; Tue, 06 Apr 2021 02:58:36 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Apr 2021 02:58:35 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Apr 2021 17:58:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 6 Apr 2021 17:58:33 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>,
 <lee.jones@linaro.org>, <matthias.bgg@gmail.com>
CC: <linux-pwm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [v3,PATCH 0/3] Convert the mtk_disp driver to aotmic API
Date: Tue, 6 Apr 2021 17:57:39 +0800
Message-ID: <1617703062-4251-1-git-send-email-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_105846_240037_EB3ED7AC 
X-CRM114-Status: UNSURE (   6.09  )
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

Changes since v3:
 - Modify commit message for PATCH 1/3 pwm: mtk_disp: clear the clock operations

Changes since v1:
 - Seperate clock operation as single patch.
 - Seperate apply() as single patch.
 - Seperate get_state() operation as single patch.

Rex-BC Chen (3):
  pwm: mtk_disp: clear the clock operations
  pwm: mtk_disp: convert the driver to atomic API
  pwm: mtk_disp: implement .get_state()

 drivers/pwm/pwm-mtk-disp.c | 179 +++++++++++++++++++++----------------
 1 file changed, 104 insertions(+), 75 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

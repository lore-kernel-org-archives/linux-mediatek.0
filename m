Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14764C43460
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 09:48:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8E136117A
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 09:48:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8E136117A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lUaXUSv2Koo1WH1zPXGjPQxH9PjjaNexEDGuvWv3cd4=; b=ZUWSYUNKaH4BHVgfIDPoOz3XJ
	8/Fa6IN2BqgqlE1sk/GGJfXbkJmetGRngbt1BqhwGzAIXloS9wVfAiOJ/Yx3gGt3b1hpdoA1yiQf5
	uwM8aSjvaD3h2P4r4NMosORMIav4h7snM91zlbIJkGlscLlB2zBFACM0SYJIoOF2eAzFfA8VCidDa
	tM/oZeymagCwFY0X3VHuNHWhUh6wKmwgS6iywK6ym/IkP8UPKHVd8/vRgLE5d9yjwjospi5p0kDvM
	NmRgml1wFFt/v0HEyoXsdVjkuS3f99kS0hUAji9ASt2ykjMHx2RDbgs2aIb35dM15jFVR8KSJBwtU
	QX/EojWVg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXL4m-001be1-L4; Fri, 16 Apr 2021 09:47:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXKq7-001YZY-QH
 for linux-mediatek@desiato.infradead.org; Fri, 16 Apr 2021 09:33:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=CHkNUbVzQAJI9hsr/w9h5YvqcGbuiVIp1ylnDusrsbY=; b=dcNAppZE0Xcs3fis5rigZuBUlI
 +EQIN/yYjfte2RJ4VTHAzASHuwxhomo0T38EX8KdqXG6Va7cfcO59vRgKodup1Dp0yYRduPAi7jLO
 9nQNFckjhNK0ihR1pMYe9yb+fxA3N/fApBacdc0ePlacl25k98QDg0A0DsdqQsL0JxNf93xPv9wrL
 uHP3qc7WDNfXYIJgECB9S8Y7f1Ze1R3+Qoz10Ilr9UDxyHG6dHFtuDei9eRoEybVr13js/YRoKSpd
 Q0+hHigv/qokvoVmtBorp7JYcCdpKP5FcQas35aCnaea4POQb1w7cu430EnJi8XG2s6uHN11KHOmk
 nXW2mj1A==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXKq5-009FEj-E0
 for linux-mediatek@lists.infradead.org; Fri, 16 Apr 2021 09:32:38 +0000
X-UUID: 45ca2d2a27f14e95a15e9cf262533edf-20210416
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=CHkNUbVzQAJI9hsr/w9h5YvqcGbuiVIp1ylnDusrsbY=; 
 b=MIK/eJrl3wk8MVyquBUeoXkmuB2T0ccc/S7SrutlnfisKQPjdCa6uA0IDn/amRK6+/YVISAhEIirB5RTNWSvHF3SmQdySSw8RC5fpj/00dyxG1TWiIm8uOG+sC6mlfFBgg6GuSfJRich0NXXDG2K69Hr2/cOhx3cBCFFS5G63I8=;
X-UUID: 45ca2d2a27f14e95a15e9cf262533edf-20210416
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <pk.chi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1575192937; Fri, 16 Apr 2021 02:32:34 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Apr 2021 02:32:33 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Apr 2021 17:32:31 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 16 Apr 2021 17:32:30 +0800
From: Po-Kai Chi <pk.chi@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <wsd_upstream@mediatek.com>, CC Hwang
 <cc.hwang@mediatek.com>, Po-Kai Chi <pk.chi@mediatek.com>
Subject: [PATCH v2 4/4] arm64: defconfig: Enable MediaTek DRAMC common driver
Date: Fri, 16 Apr 2021 17:32:18 +0800
Message-ID: <1618565538-6972-5-git-send-email-pk.chi@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1618565538-6972-1-git-send-email-pk.chi@mediatek.com>
References: <1618565538-6972-1-git-send-email-pk.chi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 13DF5259ACF754A1C8355D8857F1BF498FD04F2B3C8B8E785D4E4A59B96A78172000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_023237_493357_0D42A6E1 
X-CRM114-Status: UNSURE (   9.07  )
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

This commit enables MediaTek DRAMC common driver to be built
as a module by default for the ARM64 builds.

Signed-off-by: Po-Kai Chi <pk.chi@mediatek.com>
---
 arch/arm64/configs/defconfig |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d612f63..49d7464 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1163,3 +1163,4 @@ CONFIG_DEBUG_KERNEL=y
 # CONFIG_DEBUG_PREEMPT is not set
 # CONFIG_FTRACE is not set
 CONFIG_MEMTEST=y
+CONFIG_MTK_DRAMC=m
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

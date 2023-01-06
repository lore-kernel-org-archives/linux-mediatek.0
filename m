Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46630C4708D
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Jan 2023 11:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zz4lAG7Fv806LdEwYUd3QNWOhaOm63H4dynzSxg33Ss=; b=vgNKTEHpuRg0159OdtWOV+BEjC
	FmnAQsDKtB65S96+EwSIVdkyTdkg44Ay9P8tutzRj46bX/LbE3EQTlp6OJC2vT12rkSJdudnLgOhc
	cKWsnh+Iz1NTC8MjCRAfEIhvmK9TpYW6hrE+Du+IoItPbdKkFJOKAXaYw9r2CKqbzWAgGcBH2Vcr2
	m+Ngk2j9FLuROgoSULFUYzOvhtWkqUwDrvJYkoTf5RL3O71brSs0+HJu+t/+dT4XtVF/piCq+Oae6
	SmRbvKnFrZSMyHnP4N+TlsX5BtHugSUaEiL/9X2+pGjE1lU8LZblut2txSrdWAR1bnpfvnemy4mrP
	+8jup2Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDlJk-007qgP-LT; Fri, 06 Jan 2023 11:55:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDlJj-007qfj-6n; Fri, 06 Jan 2023 11:55:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Zz4lAG7Fv806LdEwYUd3QNWOhaOm63H4dynzSxg33Ss=; b=rWs6D4cmnyZVKX+EiJf3c5Phe7
	TKEx0fxA9JrY2uQojg5eIeKj39e9An6T09RehNuPXiozhh0nL/PXDp8Op1yotBJQOfxUMvPmfFaUk
	GWs9gpZKqlVu97EYlbKvSLaRlnWFp8IQfe6O78c4RxGAWg1o6OGHdomqcHfZdF/92jOrZeUD9J08r
	H6CdMOJRFGfJpXLRHPSMMz7a/Za/v1QravWIJZNcbc2Uwd1OWKHUmc4uqWEK0MbtdoLCDzGvyDYcq
	kjyHSXV+8FaMmBfn8iWY+1u5/DNNGI+WmXI31W7rykCfM2je6PggWNNgEgaTBUuv49Du7eVc3MSZt
	Q/vBbU/w==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDlJW-001lye-20;
	Fri, 06 Jan 2023 11:55:14 +0000
X-UUID: 679e8759aa0f48f9839972a27eec3179-20230106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Zz4lAG7Fv806LdEwYUd3QNWOhaOm63H4dynzSxg33Ss=;
	b=cO7+jAs4+RjwTzL9KNJjqXDUSR1pScpa6slz38msabFw1LKIlIPv19L8U9dGqEGOthkLwVZIqJ9o3Vh8YrrD9AzIywdytAUxUj5BGLHltJ/IUBrcZ7y+5UhfCKE/db18bD5PgtLv0hTn8WwhT8ZgR4UBlp9lSQPxTm9IKLgWjXw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:28ee8b75-dc2f-411e-869a-73cd2334eda1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.17,REQID:28ee8b75-dc2f-411e-869a-73cd2334eda1,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:543e81c,CLOUDID:eefe788b-8530-4eff-9f77-222cf6e2895b,B
	ulkID:2301061954347QZ90I3W,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0
X-CID-BVR: 0
X-UUID: 679e8759aa0f48f9839972a27eec3179-20230106
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 245501284; Fri, 06 Jan 2023 04:54:33 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 6 Jan 2023 19:54:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 6 Jan 2023 19:54:30 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	<linux-watchdog@vger.kernel.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH 0/2] mtk-wdt: Add reset-by-toprgu support
Date: Fri, 6 Jan 2023 19:53:24 +0800
Message-ID: <20230106115326.15374-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_115511_529830_929A8F10 
X-CRM114-Status: UNSURE (   8.57  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series is based on next-20230106.

In some cases, we may need toprgu to reset the wdt counter after wdt
resets.

Provide a reset_by_toprgu parameter for configuration. We can disable
or enable it by adding reset_by_toprgu in dts.

Allen-KH Cheng (2):
  dt-bindings: watchdog: mtk-wdt: Add reset-by-toprgu support
  watchdog: mtk_wdt: Add reset_by_toprgu support

 .../devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml     | 4 ++++
 drivers/watchdog/mtk_wdt.c                                 | 7 +++++++
 2 files changed, 11 insertions(+)

-- 
2.18.0



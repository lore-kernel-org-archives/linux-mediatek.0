Return-Path: <SRS0=Gsgc=KQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22B34C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 09:53:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B674A613C8
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 09:53:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B674A613C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YvareiE/kXZW2Rnv9YZIGazg/dHM98DqccxQz+mxzV4=; b=lNbYPW7hsVZQ6InRxg5yOlTZ+R
	Bu6YnvLl5d+1IwITqLn3BCp7T9SXb9YMiaQmjjJUT1B6Z8r2e4CvIg2AvfU25KZ3JLsSjPoHHEke9
	Lz8dO5qZqCsJHU64hCivm72YQv0d353Tfg6qSzFn0cI/Z0aQklRvrZJH2zWwDQgJwbS6Ckkm8C18Z
	JEa/fMvb0D7Zq7n4Sjj4W+gtwtGCG5cR9yridgRi1k1Nbw74ZTw3AX+3OkOwebj8QoGFVNsbrAALs
	7Bhty4Cg73vr7pIVI8c7nu7u5Da4gbyIK8iG0CV9tZ3bnrFgRXM1L7tyIBDsOkuU/tL/4zIL4DsnJ
	nu27RZKQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk1qV-004osf-GV; Fri, 21 May 2021 09:53:31 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk1qI-004ooC-8A; Fri, 21 May 2021 09:53:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description:In-Reply-To:References;
 bh=NiwVStXQFEiM4QQyCnnAmiZiqJ5nMHAtF2khNYVeMwM=; b=wh+82qm3VVC08Kfrm/CBO646qY
 MZ0Tm3bbFYvODBpoX4d2RXLzNvAQtlvgKbG6e92PY9BcI4WQ/4eDpZvv/1oKsRsOHgN9I5gEQGZhs
 iIAA7xPCkdDlt4cKlmo907FEQP0yd1yZ+uluVp9IixcAQMKt335adInXRU5wGuHOrw8NmiXcEFf9r
 ATL98Wuyj4o8Jakld/vyYed39NuR4Ck9BIl4IXJiAOVWzC52e9PDJo2lETiWnF+GpD5sRu4xObxQ0
 yP4H8kfGlKHWZcStSQQzljZQR97ytcjKssMUdMLzb6hUHUkiztnFWetjfLi0WZTeOm/j08EpZD4n4
 ids5ciTQ==;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk1qF-00H0iA-7y; Fri, 21 May 2021 09:53:16 +0000
Received: from dggems704-chm.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Fmhg26grWz16Q8Q;
 Fri, 21 May 2021 17:50:22 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggems704-chm.china.huawei.com (10.3.19.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 21 May 2021 17:53:10 +0800
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 21 May 2021 17:53:10 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>
CC: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] arm64: dts: mt8173-elm: Correct the value of the property
 'reg'
Date: Fri, 21 May 2021 17:52:43 +0800
Message-ID: <20210521095243.8527-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.177.72]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_025315_471924_BDFE0DC3 
X-CRM114-Status: GOOD (  10.34  )
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

The values of property '#address-cells' and '#size-cells' defined in the
parent node are both 1. Therefore, the value 0 of the upper 32 bits cannot
be written.

This error is detected by reg.yaml, the information reported is as
follows:

arch/arm64/boot/dts/mediatek/mt8173-elm.dt.yaml:
 mt6397: syscfg_pctl_pmic@c000:reg:0: [0, 49152, 0, 264] is too long

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index 21452c51a20a813..9bc02ea020f10e8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -1112,7 +1112,7 @@ rtc: mt6397rtc {
 		syscfg_pctl_pmic: syscfg_pctl_pmic@c000 {
 			compatible = "mediatek,mt6397-pctl-pmic-syscfg",
 				     "syscon";
-			reg = <0 0x0000c000 0 0x0108>;
+			reg = <0x0000c000 0x0108>;
 		};
 	};
 };
-- 
2.26.0.106.g9fadedd



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

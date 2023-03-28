Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2331FC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 02:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6RFdGCQH8CwMl3cCS8uEv83UelcwU4aqIgZl9J6q30U=; b=ptAnXTnmOxVUs/Zsg82WVm6PyT
	mUjQRbrP1vN2/UI8a3D3pJrZXrO8ZhgiI7hOb/qaBAQCPm2Ewx3EwzR3QVy3yRnWXVJD+nWVVqfGm
	T/OSy6DkAQOPjezwaEqOiI03z/Y36j5xhLd2ROixzrZqbh80dE3WeJAMsemLD3cqCEfM4FAJx9dO4
	Hq0HdZ3W+p7Gu9Evt0N5ZaJiqYR63KpIMjZM95GPnc6xv5ZKxHMpSFhX8c8KJZR3/gKi1v8vvReS9
	ra/xninmbEBqVbZmNU0fLEiYXoqO3MVpNOE2LOa1X4O/CjqWhe7+LRpnbKVVpMyfmfO0ZftvawDaL
	zCGqeqFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgz4x-00CtSj-1z;
	Tue, 28 Mar 2023 02:28:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgz4f-00CtIc-2Z;
	Tue, 28 Mar 2023 02:28:39 +0000
X-UUID: 3b01105acd1011ed8687db9d93187ff1-20230327
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=6RFdGCQH8CwMl3cCS8uEv83UelcwU4aqIgZl9J6q30U=;
	b=Oy5kob+RkQps7huHw82voMwAa67bll06OScjMma7GiD0A0EgfpmS44rtviwHHDfODcvA621fOUxEHbAddS/QLbYFV6DkPlW3nF+jTu3mhAKTEIov60XvkAscIGFr+Pm67YQa5lvTcTgtD9SKnpfnr5fU/rLbf2UXHbSwVav/4dY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:ec66e389-3f93-49ab-8936-5210529e9572,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:8dceac29-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 3b01105acd1011ed8687db9d93187ff1-20230327
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1013668219; Mon, 27 Mar 2023 19:28:31 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Tue, 28 Mar 2023 10:27:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Tue, 28 Mar 2023 10:27:55 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Tinghan Shen
	<tinghan.shen@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v9 02/11] arm64: dts: mediatek: Update the node name of SCP rpmsg subnode
Date: Tue, 28 Mar 2023 10:27:24 +0800
Message-ID: <20230328022733.29910-3-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230328022733.29910-1-tinghan.shen@mediatek.com>
References: <20230328022733.29910-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_192837_835185_EF5EC94B 
X-CRM114-Status: GOOD (  11.63  )
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

Align the node name with the definition in SCP bindings.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi   | 2 +-
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index fbe14b13051a..a259eb043de5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -810,7 +810,7 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&scp_pins>;
 
-	cros_ec {
+	cros-ec-rpmsg {
 		compatible = "google,cros-ec-rpmsg";
 		mediatek,rpmsg-name = "cros-ec-rpmsg";
 	};
diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 9f12257ab4e7..8f14b633c1e1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -1260,7 +1260,7 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&scp_pins>;
 
-	cros-ec {
+	cros-ec-rpmsg {
 		compatible = "google,cros-ec-rpmsg";
 		mediatek,rpmsg-name = "cros-ec-rpmsg";
 	};
-- 
2.18.0



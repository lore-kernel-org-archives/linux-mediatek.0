Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDD8CA0EC3
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 09:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fkseBfphNa4WkzVMYPDfaMKCcq8JsLkWDHhizmg0UQU=; b=cQr2yr3ixlCLT2JMwFIuCLLYdm
	OY0/VFoNx4pph0qSJ9bONFVMb4YPvO7tn1hzzhQakCTGDAXlLBPZB8KuF7hOhU/DyntuyXdlPtWwx
	UlS471KxqdqZmfktfRnGzpSfqOLqb9oqInNvqsPI9F4G7cRf9vGi584VfKaZEBBo7TTa7+zwAM3lR
	v2hmNO9DerIjt6hpJbb15Y4IPMnjCYTcmdGuRbpoOR3AickMsT9DN1I0qZ6tFAsrtQSjbT7kcTyIv
	Pckbp6qPa9OVJAEuAaNhkMugz8Rmu20EMp8WK9CIsekxkviQpUGUSAnJvX6lpCnmzr+NaHMSYizlH
	TkBlQh4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfze9-002j0I-2c;
	Tue, 12 Sep 2023 09:25:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfze2-002iy1-1E;
	Tue, 12 Sep 2023 09:25:23 +0000
X-UUID: 4632a944514e11ee86758d4a7c00f3a0-20230912
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=fkseBfphNa4WkzVMYPDfaMKCcq8JsLkWDHhizmg0UQU=;
	b=Gvi+vaEd8lxpOKIOpqYIdcW6eXCid8nH7FBToCZLyK9RDwcajnruK5b/KAn7XFKkF3zQ5dBl8vHsaVsLjD7MGFcQ7EeZObT9AZn/9ZMVUL4JBsnOSMOdws14yELNN0Q65LBoWvW/i2IuiGJX32ap6022pYPgN1NfxpBhU9fVpG0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:b0bf8ef5-6d65-4a9d-bade-5b64304181de,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:7a0ebebe-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 4632a944514e11ee86758d4a7c00f3a0-20230912
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1639988024; Tue, 12 Sep 2023 02:25:12 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 12 Sep 2023 17:24:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 12 Sep 2023 17:24:47 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Macpaul Lin
	<macpaul.lin@mediatek.com>, =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?=
	<bero@baylibre.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>
Subject: [PATCH v4 2/2] arm64: dts: mediatek: rename mt8365-evk to mt8365-genio-350-evk
Date: Tue, 12 Sep 2023 17:24:44 +0800
Message-ID: <20230912092444.31635-2-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230912092444.31635-1-macpaul.lin@mediatek.com>
References: <20230912092444.31635-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.458800-8.000000
X-TMASE-MatchedRID: 7KGNpgCqvMiTBdr4nKyKPYv2/i8VNqeOTJDl9FKHbrk1LB46LFAAkhTN
	p00+u6eHNPoCkSGhfY8/0YJS2+Uc1h9J5bZqJbIJwCZxkTHxccl9LQinZ4QefPcjNeVeWlqY+gt
	Hj7OwNO1YDuIRWpqxhheIjHYYxV+FRgo2jhGSEUO2rFf9R0TxVGkXgj6L1eq+qw/qoHoLsYq8NT
	GKtRUkEuTAGB78h105NtdXyUGwvGsUKA0bsgzeG6MnTJRI0XInfXwUEm1ouDzLDYxFC1/7rjCBQ
	Dy1BJScwL6SxPpr1/I=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.458800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 54436137ED49A886F6003118A46C973E921841F61101F171B3F9F544397967C52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_022518_421525_35B2B1EE 
X-CRM114-Status: GOOD (  10.95  )
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

Rename mt8365-evk to mt8365-genio-350-evk for following the
naming rules for MediaTek boards.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/Makefile                           | 2 +-
 .../dts/mediatek/{mt8365-evk.dts => mt8365-genio-350-evk.dts}   | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename arch/arm64/boot/dts/mediatek/{mt8365-evk.dts => mt8365-genio-350-evk.dts} (100%)

Changes for v1:
Changes for v2:
 - None.
Changes for v3:
 - New patch added into this patch set v3.
 - depends on https://lore.kernel.org/lkml/20230911115717.26184-1-macpaul.lin@mediatek.com/T/
Changes for v4:
 - No change.

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 10e640c6ae08..b5d529d66393 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -52,6 +52,6 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-cherry-tomato-r2.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-cherry-tomato-r3.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-demo.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-evb.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8365-evk.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8365-genio-350-evk.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-genio-1200-evk.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-genio-350-evk.dts
similarity index 100%
rename from arch/arm64/boot/dts/mediatek/mt8365-evk.dts
rename to arch/arm64/boot/dts/mediatek/mt8365-genio-350-evk.dts
-- 
2.18.0



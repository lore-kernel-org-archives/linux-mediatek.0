Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3C0C7EE2A
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 09:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rG/kvDt+szdolG4p/hjX8suZAmZTY7KUuH+I6rhGaE4=; b=Gt31jrv+1ANtUeJK85nkUpy8xK
	YCFWFTnqwTxjkO4fEtghhjz9emIiOTTq2r5ubkYk/c47+wOBCyX2uX0RPgfTYrJorpPKZ8NU7KjkS
	HvUPWx7yq69osferJ2yGKS3pdsitMjZbGwSxEjkTsvotnNFuC/+j8NFWku8ORcFNGGHZq6lWdX8bB
	VqXUbS13Ag104Bq1atnVUDGKJf3P2bNdBv3BMY6kL8ekkVzTkEPCAZrSLuS9SZB6t9BBE5ot3ZGaU
	K3gTtblSHlQT+UCrhdbGFcwx86SFJAq4AMM0GA/eBTDzqbefHVS5sTUvbVl1sRaUezCzrSLla/ZaS
	8YTkqjwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q11s3-005saw-1n;
	Mon, 22 May 2023 09:30:27 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q11rq-005sUY-0C;
	Mon, 22 May 2023 09:30:15 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E658166058F2;
	Mon, 22 May 2023 10:30:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684747809;
	bh=8THYe79i65UdHa2AS5CAUyFodTMPPnYlaLqy/e9sDbY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AcDyWd4R9EBwLOnEZezjmVfSgRSLA2+plkuc7SNL0Bwl1urZ2d/QO4tAiqHYNfkLk
	 iWuIB8mOVV7oO7hL0X66aiRBP97hM9uJSmjGQCFnewMqIS2+M2ACKrhWfqihUvnEkB
	 6wH5W1HglBuqxomb3ajCfrNo4HwQ5H5sQVX65uudy0qXV2J8vTAeu3M+sisYN3+Um8
	 DEDrv28AVCs14mRDrMU8iopM7v6618t+wMYUjytO9D/f1n+5NwxhtP8PRb2Qwm5pDB
	 MpkAWXhzbM/RDLyRRppMqfhGoTkKD1NFX3IUYL4fLhfD5J/dJu7eY6dpTZet5dxnQG
	 thtJRIMst2x0g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	weiyi.lu@mediatek.com,
	ikjn@chromium.org,
	chun-jie.chen@mediatek.com,
	tinghan.shen@mediatek.com,
	seiya.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 1/2] arm64: dts: mediatek: mt8192: Make sure MSDCPLL's rate is 400MHz
Date: Mon, 22 May 2023 11:30:01 +0200
Message-Id: <20230522093002.75137-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230522093002.75137-1-angelogioacchino.delregno@collabora.com>
References: <20230522093002.75137-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_023014_244601_CB865E93 
X-CRM114-Status: GOOD (  10.09  )
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

Some bootloaders will set MSDCPLL's rate lower than 400MHz: what I have
seen is this clock being set at around 384MHz.
This is a performance concern (and possibly a stability one, for picky
eMMC/SD cards) as the MSDC controller's internal divier will choose a
frequency that is lower than expected, in the end causing a difference
in the expected mmc/sd device's timings.

Make sure that the MSDCPLL frequency is always set to 400MHz to both
improve performance and reliability of the sd/mmc storage.

Fixes: 5d2b897bc6f5 ("arm64: dts: mediatek: Add mt8192 clock controllers")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 5c30caf74026..6fc14004f6fd 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -677,6 +677,8 @@ apmixedsys: syscon@1000c000 {
 			compatible = "mediatek,mt8192-apmixedsys", "syscon";
 			reg = <0 0x1000c000 0 0x1000>;
 			#clock-cells = <1>;
+			assigned-clocks = <&apmixedsys CLK_APMIXED_MSDCPLL>;
+			assigned-clock-rates = <400000000>;
 		};
 
 		systimer: timer@10017000 {
-- 
2.40.1



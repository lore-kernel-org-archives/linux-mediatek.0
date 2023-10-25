Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E191AC25B47
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Oct 2023 09:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XlwhRpk3cSaH0C23/ylhdwPAyGxXmtbKGEnwRsqDOTg=; b=hnHES5DXRN2LoG9PVZ10yyTG4b
	sL5gUNHvW4Gp8vaIEquQ0FV5y+76l+PzHs21LGXcCJlq4rMJX6M/SjqMt+Q0w9uRlfLnu0RSI3XEi
	Nore8koBW+1LRJau+NZyduEVNMRIj05aez1ORnNKDKMnQyZz+Hk/DIvAk2SZ3HOAhBl6sj3aXKFyx
	Frllc23l+i5pxLq4Bsg4e4OK/XqnRuRCODmb70wvQKVtGEH+anIaCYeCYZ86+Ux1D2f6FUYUJx6rU
	FGk6QhOkiSqTwJIAKGS/lXJTCJL3MTC4dH+eojQ/jOa3s1AuyaGTI5xMuTGk5ETHdvNzOymMiE6OO
	GIEp17gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvaME-00BqjQ-0B;
	Wed, 25 Oct 2023 09:39:22 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvaLW-00BqOj-0L;
	Wed, 25 Oct 2023 09:38:39 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B0C646607355;
	Wed, 25 Oct 2023 10:38:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698226716;
	bh=NsQGaQMdwBTZeaq0SwfWzI3tFI6jtmckhrCFUwqRGeo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UHMYIB46Ftw7EJBpfdNM8p0aXqcOWBSOPwZp3eNDsWMglGAqfEuxGxWtFIcUYQx7q
	 G+SDggzWZa5cFCOjXIjOzyWsQFwjBqt/tGjbkJZUlN+3Pt78LeH6Oz3EUye03K5p7X
	 lc9zxSZsa6gMeFY6quoUFIQo53aUVMk9tmCzndZ3TIGMjKQXQRvAlq1QuqjHInK8am
	 Q2G6w1Nh3fR/F3JVXrGVuPYB3b2cqfpd0us/XctlrfdZYk43NDQDUHB9Wh6jzcQDXf
	 cR12xaG+hZvdcADRz1obG95zI5pSFNKJt7nbUAgcIZVOBEr/dU8SgHqTtcY3wvKuqO
	 ChDtp1dvlkZmQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: hsinyi@chromium.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	erin.lo@mediatek.com,
	eddie.huang@mediatek.com,
	pihsun@chromium.org,
	fparent@baylibre.com,
	chunfeng.yun@mediatek.com,
	gregkh@linuxfoundation.org,
	michael.kao@mediatek.com,
	mka@chromium.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 6/8] arm64: dts: mediatek: mt8183-evb: Fix unit_address_vs_reg warning on ntc
Date: Wed, 25 Oct 2023 11:38:14 +0200
Message-ID: <20231025093816.44327-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025093816.44327-1-angelogioacchino.delregno@collabora.com>
References: <20231025093816.44327-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_023838_321869_AAAD827D 
X-CRM114-Status: GOOD (  12.22  )
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

The NTC is defined as ntc@0 but it doesn't need any address at all.
Fix the unit_address_vs_reg warning by dropping the unit address: since
the node name has to be generic also fully rename it from ntc@0 to
thermal-sensor.

Fixes: ff9ea5c62279 ("arm64: dts: mediatek: mt8183-evb: Add node for thermistor")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
index bae9b6763862..681deddffc2a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
@@ -38,7 +38,7 @@ scp_mem_reserved: memory@50000000 {
 		};
 	};
 
-	ntc@0 {
+	thermal-sensor {
 		compatible = "murata,ncp03wf104";
 		pullup-uv = <1800000>;
 		pullup-ohm = <390000>;
-- 
2.42.0



Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4438EC61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 16:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xnehVM1FuCRVZ89sOfIBVNY5vZFnIsQYg3UbLQJ1pxg=; b=P8oFc2WndJ2lh29oUk2hPDZEW6
	MiUlrKep3jgruevGAPgikSINVseV7XH8MO66k9YtoMBtg6kgDEutEA/L/NKH+vr7IWVuegvNEMnSk
	N6O9JixH9E2jvAaRBIIEvdCSXl25EoQKGHc2NqiGNe4MeIhGGg8RYsLZSSgqnKcuBvO47RW/FCRhj
	z+dgmc4Ng5gw1lJg+Z5Ga6MGsELzAQHqvrvfjk3sTiuxSozPSMm3hd+ir2GY1I5iZ6ZtFmgWWS14b
	SVejOycREJxOc+eKtRxp8/vzTDXlei8klgVSdmYVxr/XSNB2rIQA6E1XJM0MJKq71Qq18Ie7GYn1G
	tMNOypBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ9PN-002KiY-8V; Thu, 09 Feb 2023 16:04:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ9PA-002KcK-OX; Thu, 09 Feb 2023 16:04:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B587661B11;
	Thu,  9 Feb 2023 16:04:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63305C4339E;
	Thu,  9 Feb 2023 16:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675958651;
	bh=V8wDSsgg1djz0HK45I77IjKQpKzm88Y/L4dXpGGAku8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CwyX0IbopI3qVx+wdskdzGDIQ1UXlXQqdjKRmVQEpUlq0CslBpp8BpBRcsi1h5CSU
	 YR2IN5EibgubpNfn3FWOESlHAcuS3h0VNmWNEtW3mpgHc2oEtjgO+MTIPa4Wq5bhhw
	 o3l/3ZNDx62iSFqmaI8NTHpKmRLogfV3PKLnDOEu4UI8CcljnzFqPJH+10BtA4B3Xc
	 j+r/RRBoHIunS+EJcBK+Umujvw8vR0hkd3uCB9kVOalctYssLsBynXvvf2pwQCk3OL
	 jA3MZRJNCzHz2C6SZfEyLPnC/J1GrK1z0aopX8dBYbbsBP/7wbsHQFA+JcB4pM8y05
	 j8ebBr9ZF5IJg==
From: matthias.bgg@kernel.org
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com
Cc: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	angelogioacchino.delregno@collabora.com
Subject: [PATCH v1 2/4] arm64: dts: mt8167: Align mmsys node name with dtschema
Date: Thu,  9 Feb 2023 17:03:55 +0100
Message-Id: <20230209160357.19307-2-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230209160357.19307-1-matthias.bgg@kernel.org>
References: <20230209160357.19307-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_080412_880411_99E353F3 
X-CRM114-Status: GOOD (  12.14  )
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

From: Matthias Brugger <matthias.bgg@gmail.com>

The node name should be generic and mmsys expcets 'syscon'

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---

 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index 6a54315cf6502..2374c09530575 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -124,7 +124,7 @@ pio: pinctrl@1000b000 {
 			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		mmsys: mmsys@14000000 {
+		mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8167-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
 			#clock-cells = <1>;
-- 
2.39.0



Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71DEC7EE23
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 May 2023 10:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/36U8f2hjbE2m0TYdKuQASmkYLFLFD+eCwO3lexS9zY=; b=GrFy3CMhlmYRLwkhjWi1sXqgyL
	HgCOy1nS/tN35nth/F4BopcmqaZRu3zsO+asuLf0bxr/2/LHVoQjGcfhng56YIfJ3+mbfjauEjUzY
	D9LAVLg6J0Egwtc7ePF6lQeERGZ7QLmjQTmAaKbfEcq4DwQwfSe5fbAbZYXs/iCbYFqvZQKJpzw4L
	MnKTRCgX7UjscmxY23JGhfrN3VjWEqyOshnpvTaQubQimn/qSLkjrXgYgf6/BCH072A+B5L8Tzl2I
	C2uCVD1w6d5MhtDUSEI2puukIVxfztLM2UItup1Mk68hEwNKWJGm30iSpbca8LYmxf4AaUpoYxvZq
	pdVnwtuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2UNS-001x7c-00;
	Fri, 26 May 2023 10:08:54 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2UNO-001x60-24;
	Fri, 26 May 2023 10:08:51 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1685095692; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=n9HFZ29iB0D4ZHN7ZdUVSCswnEcN/UNexS3aoI1Yz2+1cHwPKZiHQROMYP1q64ti1nrAYFL4FtWF9RJ0z0vd3CbrE5EgmsBaz8INGnuV6SjUn2Sz9k1aqq7+i/7iF/lWk5e3wC60Mt1T0MUTsvS0xnpLLzOogj1prOgpylNACas=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1685095692; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=/36U8f2hjbE2m0TYdKuQASmkYLFLFD+eCwO3lexS9zY=; 
	b=RPXX4Yg2itYXA6bLdwJl9tRcJtGYTkTd0UYmHmycMYJ/Kz5vFxKOwGcqQq/GvMzC7iA6glX8LDWtPUM5EmoGUn65Jt6IenV1Ksiu1M6MJDE/tUEMjYBUOL2CnkVRaNH04sq3iKTsIoOj1SI3OpLfanQERKkl01L1pxN+HII/bNg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1685095692;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=/36U8f2hjbE2m0TYdKuQASmkYLFLFD+eCwO3lexS9zY=;
	b=BwM+5zUvstNWV/orBTuDw3hsvQtHGsh7+SViYivwuEx8j+JHLknxVHiEBSjz4QpJ
	rDKYfcRb9jipvQQHQBLvtwLvwu0pJDde9swvzN6YIOHqbARApUafOVuwOdga5jg0/6g
	6oMDtzIq/jkzUFCogHHhBAUR630ATbETKfk7w9KA=
Received: from edelgard.fodlan.icenowy.me (120.85.97.71 [120.85.97.71]) by mx.zohomail.com
	with SMTPS id 1685095691240276.4832447024337; Fri, 26 May 2023 03:08:11 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Douglas Anderson <dianders@chromium.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH] arm64: dts: mediatek: mt8173-elm: remove panel model number in DT
Date: Fri, 26 May 2023 18:08:01 +0800
Message-Id: <20230526100801.16310-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_030850_760458_7E7A528C 
X-CRM114-Status: GOOD (  12.64  )
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

Currently a specific panel number is used in the Elm DTSI, which is
corresponded to a 12" panel. However, according to the official Chrome
OS devices document, Elm refers to Acer Chromebook R13, which, as the
name specifies, uses a 13.3" panel, which comes with EDID information.

As the kernel currently prioritizes the hardcoded timing parameters
matched with the panel number compatible, a wrong timing will be applied
to the 13.3" panel on Acer Chromebook R13, which leads to blank display.

Because the Elm DTSI is shared with Hana board, and Hana corresponds to
multiple devices from 11" to 14", a certain panel model number shouldn't
be present, and driving the panel according to its EDID information is
necessary.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index d452cab28c67..737737528eed 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -285,7 +285,7 @@ ps8640_out: endpoint {
 
 		aux-bus {
 			panel: panel {
-				compatible = "lg,lp120up1";
+				compatible = "edp-panel";
 				power-supply = <&panel_fixed_3v3>;
 				backlight = <&backlight>;
 
-- 
2.39.1



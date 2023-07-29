Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CDFDC0015E
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Jul 2023 11:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ebeM2mGR4TMnC3Hsqfbcbfw6t45XlZ3ZN9tmUhCmp/4=; b=pYlGdJck8f1Iqx5k4W6C4M4rWS
	cfrxjaTLs7tdJyllbCxjuhqU8lzeR8ZL4Yf1mDjJDA4haMIZSasti2fDWYOfhcMn32tVI5kVDnfgE
	42e7BURbls/hPwD7lZql9UZVgq3AHSQjQ6t7tkY2A0ueO0dVIzRgTDmMlM8iiL5c9nw2BsKT3N6iP
	Eqgmsavi/yJieP+TjXcbeQohl/l+4tC3UO0Ak+bk8F/2qwyADxJnPAtbsUNVUZqnEpiG65Ih2xI/O
	xQH0BgJmF7TMSzxsW+3OUJcOORJV9RzUMc8SgGGiaN1EbSYhhKMD4+qmATT2Kzh45R/IPcXaRxv2a
	8R+KmOCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPhkv-007INH-1O;
	Sat, 29 Jul 2023 11:05:05 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPhks-007IMG-0L;
	Sat, 29 Jul 2023 11:05:03 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b9cbaee7a9so28927621fa.0;
        Sat, 29 Jul 2023 04:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690628698; x=1691233498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ebeM2mGR4TMnC3Hsqfbcbfw6t45XlZ3ZN9tmUhCmp/4=;
        b=YqlKluSjEj86SSIVP8nR4TGkwdMAClWe/imOTxoQAiw9js2nPW6HHe8DDDUFoPCFz1
         SsdArHnaFoFWm+nMuu2SdFf3+phqw6AZIDSgc+/2ICmQ0cc7Iz8E7ayYQMLbkIMaCf71
         8z9D83CdLluWAGJqq1gV71Ra7zBOVefgt+8zSK0LItSkKykRry/euEtbve0ZSVgj+wvz
         vNE42Jr3eNABTHEGxZRseMFPpdfMwv/9FehB0BleHXOBtO5K4htAb4jw4vtKcW51ZBMF
         6faHRP+klBQO2pEyPV67KYxpUMHAwPgwzV3IKpDI/BXPuQDHa1HeHJ8gsVhbUrbM8ZXZ
         3tUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690628698; x=1691233498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ebeM2mGR4TMnC3Hsqfbcbfw6t45XlZ3ZN9tmUhCmp/4=;
        b=iOKtmA/zLhgMdRBwTn9r2lRQZzqIgdrG1m0Fzx71baXFkJpmbXTD/L4zkPppwFmE9Z
         UQTSmztt4NHWLZwQxKkYVwYh0MnR7Gp+TmvxZKmjtscZzluRsmVXzKTX8CNOkONbTtNV
         zFMMkS8eoOzwMvoruyQJSpY5HoQDu0gscMdv1koDjkfvobYg6tPiI+VBTDVtCSLl/6wK
         Q5Ef+WApjc9GdqOgrmh3J1dXUcflJbRdYw9WnuIAcZhYqZ2i5Q494KOT8RP1lnG4GfH4
         8ieo6YHTjxsytyw52DCcfZBvblNQuyRvOGJCcfFeHA0JGLzsw+oR16w6akYwan/gdDdw
         zVjA==
X-Gm-Message-State: ABy/qLYM1/FztKHgqhQaO/B29l94ucbdQT3BTeK83pQHumGPe9zVxqCe
	U72OfYGOF667OkHs72VAs0I=
X-Google-Smtp-Source: APBJJlHNub5uJTMcqIiLRw0Io/ZV6tQGW8ogC+GOYzkIcNXpusJt/7q9LmBqiU3iW1LpLkV8BbgQMw==
X-Received: by 2002:a2e:2c0e:0:b0:2b8:4026:1f54 with SMTP id s14-20020a2e2c0e000000b002b840261f54mr3344659ljs.49.1690628697874;
        Sat, 29 Jul 2023 04:04:57 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id y9-20020a2e9789000000b002b9ae051ea1sm1438688lji.113.2023.07.29.04.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 04:04:57 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] mips: dts: ralink: reorder MT7621 clocks in Ethernet block
Date: Sat, 29 Jul 2023 13:04:49 +0200
Message-Id: <20230729110449.1357-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230729_040502_149715_36EBB9BB 
X-CRM114-Status: GOOD (  11.91  )
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

From: Rafał Miłecki <rafal@milecki.pl>

Use order as specified in the binding (first "ethif" then "fe").

This fixes:
arch/mips/boot/dts/ralink/mt7621-tplink-hc220-g5-v1.dtb: ethernet@1e100000: clock-names:0: 'ethif' was expected
        From schema: Documentation/devicetree/bindings/net/mediatek,net.yaml
arch/mips/boot/dts/ralink/mt7621-tplink-hc220-g5-v1.dtb: ethernet@1e100000: clock-names:1: 'fe' was expected
        From schema: Documentation/devicetree/bindings/net/mediatek,net.yaml

Fixes: 7a6ee0bbab25 ("mips: dts: ralink: add MT7621 SoC")
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/mips/boot/dts/ralink/mt7621.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi b/arch/mips/boot/dts/ralink/mt7621.dtsi
index 7caed0d14f11..73035d4f4cc1 100644
--- a/arch/mips/boot/dts/ralink/mt7621.dtsi
+++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
@@ -300,9 +300,9 @@ ethernet: ethernet@1e100000 {
 		compatible = "mediatek,mt7621-eth";
 		reg = <0x1e100000 0x10000>;
 
-		clocks = <&sysc MT7621_CLK_FE>,
-			 <&sysc MT7621_CLK_ETH>;
-		clock-names = "fe", "ethif";
+		clocks = <&sysc MT7621_CLK_ETH>,
+			 <&sysc MT7621_CLK_FE>;
+		clock-names = "ethif", "fe";
 
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.35.3



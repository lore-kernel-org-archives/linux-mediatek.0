Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DACC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Oct 2022 12:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uM8Nu9TmydtHxxHyCRFHEwcP9qh/lbeNGXh9Me0s3WY=; b=HkRO9LAYrJmMZ1li/Gx9FA/amo
	LH4chWHzy6RAgKM6dWogiSUCllikk6QxSZGu2IjOA/kEK9r8Up5N4Vb7g347WLKlznY4SPlV4he02
	PgMmdFYAgTTzH+mXrR5sia8uzWBhnJaraaMR2hPDCMCU7cKjhuZAxPy/wBoE8Ox3nn4oNivHsQKiR
	k5IgUmzO9W1pm6RddPJE2X2uuiCcCIAYoAA4GequOc+hKGooK2kh+m4ZFXqe9cVOpM29cQNPE5+gs
	VjEVADU5+K67p7JceTsZITa+JpxVfFC0wweReJ9gRaC5sFr1aJhvWOlDVwAWF8SRvABL5fpw+5GKt
	h9NwWZtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogmxE-0090DC-FV; Fri, 07 Oct 2022 12:59:52 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogmx1-00906i-2g; Fri, 07 Oct 2022 12:59:40 +0000
Received: by mail-wr1-x429.google.com with SMTP id b4so7223111wrs.1;
        Fri, 07 Oct 2022 05:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uM8Nu9TmydtHxxHyCRFHEwcP9qh/lbeNGXh9Me0s3WY=;
        b=UayFlbTHQyH39G2geEKKMjf7ErZvT0CWj+MP2JMdCMWjqrmSxSPmnbItg69T/JTUek
         Br6PWhYKAFppnX2F8lTkShSZTJ1PzFMqY87+vkpFQt5K3PhqKMraPRT0Ah3wzydrK+q5
         3KILQJcvsSjXNzBggPu5PTipoUzC03LHqqmsJU2BivTQvWXB0AHeHnrGFfoEI3SynHr3
         gCMYBdzslZiGreEnlInuQwohFdlsqRKdkjNGkXrrreX89MnC/tVWYfsk5jnETibAE2ky
         edtgkuGUWyeyIKSpXGkJjwJsY1Y8pvpgTnzt6QRRqaJW24ln1JAQt3Y/IqprKUYG8hIg
         6f3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uM8Nu9TmydtHxxHyCRFHEwcP9qh/lbeNGXh9Me0s3WY=;
        b=IC+WEbreMwz6YhzG0GlQ27qERR3wKPzryskoCmohcCS5lz/9ZIsb6HFTdO/tPH/qGM
         fC2QuGKjgWAcyO5BQSIwSG+HXjKzGL58ZXOBoRoOpvDJw/APOBo6WssGvBWCZKJs6Y1u
         j6zsZ/feOk/Ch+M75Dv5XHT5vynI4d2ohbcrDwv2FeIIXNHZpL2aO+DmRrATG5l2ueQ8
         Ge/L+7t7958IX1nwmejUNpagL6OvpZFZy8CgQtll2X14SvPL+VZmi26wwMNH36fkp2P5
         XzRnfzWO9HUIGkjWumpDQhBmc3wETLgeovfxPy8keFqijupoxfwIt8jCiT8J/nVAgUWu
         A/XQ==
X-Gm-Message-State: ACrzQf2brDQ0jOtbhNbD2mn1WMgm4mkmvQyAsxliSkFUQVdsqAc+NrtR
	68k6BF1ZcQgg9f9/wdQmVOg=
X-Google-Smtp-Source: AMsMyM7vRJlGfejIvx+TmqyrjdUCwPe4WDimT9tPv8ja63b0eB0KKV95LL096zQ/z4T00xXP0AA3+w==
X-Received: by 2002:a05:6000:1a8e:b0:22a:f55a:94d6 with SMTP id f14-20020a0560001a8e00b0022af55a94d6mr2997464wry.606.1665147575437;
        Fri, 07 Oct 2022 05:59:35 -0700 (PDT)
Received: from localhost.localdomain ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id i15-20020adffdcf000000b00223b8168b15sm2008243wrs.66.2022.10.07.05.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 05:59:35 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Andy Teng <andy.teng@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 01/10] arm64: dts: mediatek: mt6779: Remove syscon compatible from pin controller
Date: Fri,  7 Oct 2022 15:58:55 +0300
Message-Id: <20221007125904.55371-2-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221007125904.55371-1-y.oudjana@protonmail.com>
References: <20221007125904.55371-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_055939_138480_77DF6852 
X-CRM114-Status: GOOD (  13.98  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Remove syscon compatible string from pin controller to follow
DT bindings and pass checks. Adding the syscon compatible to
the DT bindings documentation instead causes a different check
error due to the syscon document specifying a maximum of 1 item
in the reg property, while this has 9. This pin controller has
never been, and will never be, used as a syscon, hence it is
safe to drop this compatible.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 arch/arm64/boot/dts/mediatek/mt6779.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6779.dtsi b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
index 9bdf5145966c..a6fa5212da4e 100644
--- a/arch/arm64/boot/dts/mediatek/mt6779.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
@@ -160,7 +160,7 @@ infracfg_ao: clock-controller@10001000 {
 		};
 
 		pio: pinctrl@10005000 {
-			compatible = "mediatek,mt6779-pinctrl", "syscon";
+			compatible = "mediatek,mt6779-pinctrl";
 			reg = <0 0x10005000 0 0x1000>,
 			      <0 0x11c20000 0 0x1000>,
 			      <0 0x11d10000 0 0x1000>,
-- 
2.38.0



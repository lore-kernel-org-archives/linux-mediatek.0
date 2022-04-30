Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2391C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Apr 2022 15:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6SvMwplpwMYd0YrA7z7iOzFKXeiIUKuQMae+DhyYt2Y=; b=JDAw/2BDWGIWLG
	ExG8kb+Wu9Hh/Xc44x10aqHPnCfRCtG8TyOngzmwJSRgxsz0ZA0DqIqv6vUBpJN06L0+exZhr0h/A
	EwoMH38HgGZW4+6ySAcxFxDrx+YhI+qBewTS5p9GclaKM2TrhQji9sIYRu2voPdZx09IyfDMXHwAe
	jFZAmkHaCa5B5ZxGxG9Ito+61zkgZdHLUQlkHZvD7gfmNLMgyfsFOiqb9dj/D02eNZZMKBHmD8f8r
	EePQmXp08ljsacFvT/jnAdPR334mjL7SLm72XGbFvVstPlelGOyQ6bzu8jPvoIyb82Z23hLw+J173
	d33VYH1CkGL+xv+Tek/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkpO5-00Eaj0-Is; Sat, 30 Apr 2022 15:52:01 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkpNv-00Eahe-IN; Sat, 30 Apr 2022 15:51:52 +0000
Received: by mail-pf1-x430.google.com with SMTP id p8so9231774pfh.8;
 Sat, 30 Apr 2022 08:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LpVI+wHvPmtuQd7BRofKYFwZVUXSQ/H1fRvs7yRvcu8=;
 b=T6VqIbSNwWtxsP2iTpZwkecEU9TxdUfWQg102Z4oprwO++xzkOjrF8S5CPwAuuhFoC
 ywfnEV5HXFU4Jc8W9tYVmW2iwwVXsBrKi3L1mqIbYVwvcuUUbJC1pw1Qm3PjfKNzeZww
 BUxQJ2CE8sDkMWDXwJObdoFLa+eJcytzQ+SzBSBIY8JIRBXwe1XK2uZrSeU2qtHCrp/I
 eaRXHoIJgT7sfWnvtqZuOR3X0cTaFHUsEjQKGre2U3QrFS4U7+dRijXWzNHvkXdcbvVU
 QvOznGEDYDPiXi6Ws7AZzzXUVpEWkPz7Azsqis0cbE4M9zuv6j6rajjAoPGpQeOAjQNq
 r+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LpVI+wHvPmtuQd7BRofKYFwZVUXSQ/H1fRvs7yRvcu8=;
 b=px+hCcf9iSpvu0l4b1j2cCIRnfvsy7MVTD+DgtX76RTaNaJbA3kJXMWNaUuIC38GUm
 bGf2n3e/JdA8BL0ammWmPoRU6AWT2sfhxjW/kqw4Uj8PwpjUF8tFIMnx8SdKRzDzrvGu
 +knETpHqMYUKCxiqkP6qpm4FAl+lG/kldUBocFJSg+YuEor6m2wLni2keRxCdvvpV/H9
 u5hIEzFTtGqaBwRVh+RkSki+cM8N58IGwn3mC5YSfeb8iTflQcYl76iwfGOaBllM1pVy
 6nx+jH9QN2Doq/CMfRo6VkhiXr6U8scyd+jBOl835Bg2LCoCohmy3bK/AXPvwYaEL+ec
 vQDw==
X-Gm-Message-State: AOAM5305rOFrJcdb40ncTz5BVX1B/ORBcu6biiD87GfhZ/dk1rA3pll0
 ik6uy7M/klORiSrxmcljeV0KqbRrIoXJyw==
X-Google-Smtp-Source: ABdhPJxZR+6dKYd/WUpP6bN1rIoOdXa/nL+GYJHP2ncA9uKKuYd0a53b5ViyBDHJJx9n2czHRuyEow==
X-Received: by 2002:a65:6657:0:b0:381:1b99:3f04 with SMTP id
 z23-20020a656657000000b003811b993f04mr3479256pgv.512.1651333905220; 
 Sat, 30 Apr 2022 08:51:45 -0700 (PDT)
Received: from guoguo-omen.lan ([2001:250:3000:7000:c0f1:53a1:ea79:5d2f])
 by smtp.gmail.com with ESMTPSA id
 j16-20020aa783d0000000b0050dc76281b8sm1755734pfn.146.2022.04.30.08.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 08:51:44 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Chuanhong Guo <gch981213@gmail.com>, stable@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), 
 linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support), 
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] arm64: dts: mt7622: add irq to spi-nor controller
Date: Sat, 30 Apr 2022 23:51:11 +0800
Message-Id: <20220430155112.227902-1-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220430_085151_666677_13F55D33 
X-CRM114-Status: GOOD (  10.97  )
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

Save some CPU from unnecessary polling and make SPI flash reading
a tiny bit faster.

Cc: <stable@vger.kernel.org> # v5.7+
Fixes: 23beb1adb5f6 ("arm64: dts: mt7622: add flash related device nodes")
Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
The nor controller driver in kernem when this dt is added doesn't
support IRQ so there isn't one defined in dt back then. However,
device-tree is supposed to describe the hardware, so I think this
can count as a fix.
My main purpose for the fixes tag is just for the linux-stable
backport though. spi-mtk-nor supports interrupt since v5.7.

 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index 8c2563a3919a..e263a81a011b 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -570,6 +570,7 @@ nor_flash: spi@11014000 {
 		compatible = "mediatek,mt7622-nor",
 			     "mediatek,mt8173-nor";
 		reg = <0 0x11014000 0 0xe0>;
+		interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_LOW>;
 		clocks = <&pericfg CLK_PERI_FLASH_PD>,
 			 <&topckgen CLK_TOP_FLASH_SEL>;
 		clock-names = "spi", "sf";
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

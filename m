Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33359C982C4
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2026 12:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9DiXn+phYCGaEDpGaEGNQSOv3DEFlZqBn0YDd/SEo94=; b=zd2jlRK9TYV7fKomln083FzH/Q
	TGgpWs9kTAXtLMYK+0myhLXGGOykXFcgFcUod44YSuNId5VZTwcVdPc42Aw0JKDHAQ+fdxAxhcTf1
	sjTfaWM6HRrov+NqtAphbcz5lcY3FX3mHoD6bTVrUXYT5VeBZYRTf8nLLiJa0CziwYpv7JHZapXrm
	R4UllOsEyUz2+qlq5fWXXtj599hejMsGuUD8lo/24ylEdsi6+2hzU9u/WTjbqAIGuBQ6VdDg2OH/O
	/9WyOgDpwAjYa9V3WTXNxvdLGagIyrTn1oBGG2CQCgLZWeHFxbK+Jq9FVuZ8UF+Jzl8ORP98CePtK
	9apGJKww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SRE-00000006XCP-0kEu;
	Tue, 15 Sep 2026 12:39:04 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SQp-00000006WjJ-22OI
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Sep 2026 12:38:42 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so1729845e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 05:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789475918; x=1790080718; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9DiXn+phYCGaEDpGaEGNQSOv3DEFlZqBn0YDd/SEo94=;
        b=Y9P2U4LnWXrEgGzqSZwvnkHtAj+p5KkiIyGrdzkE2c0LisXvVHeuhNl8oMG4lG4fTf
         56BM20Jgm/YGL1ik98XFOdnF4vXW/cblJfBakmroLX7kATNVuERqvMyXkARLbYi9vivM
         b5LfcHxUk8Y7qrbIgitlKqEy6aHVL2VrGszNdSSNe7o1RMYYkd113rrLkgIq5apTYfIM
         d7hv70wiVpE3Yt6hX3khhww3K81/YHBna63NHaUs9Do/WPSTUwypjEV0nUqGcpxdMWgk
         VzRFU7pWOs75HLJS+5v5gGMIbgJM2EgOK3w5ZG1hFXXUVWc1aHX+Or41xg6RvX/nexpQ
         Hypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475918; x=1790080718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9DiXn+phYCGaEDpGaEGNQSOv3DEFlZqBn0YDd/SEo94=;
        b=O3I4lP64zAiMXgR7e1wzqnQdHhG1zqaPX1uU+8Wdbmo1X8HaQZsdCDQPY1QLOv6u1h
         gtGetE5HBXlNiHsgwsESuMEVnzZ8kLJGYphZj0/CmYVsEDMCf7aom7FbXyk5ozlLTlWO
         R0DSQTnWv0VGSoKzoXUBcttLW+XVXbGehYnv8Lzh37ZCeox9Uz5U0UW5EQA3udqgIJKe
         a5xuRHgZM8iM1y5E82kFk8bAtoE6GtfR1ywbrm5JXn3+fdmj3jLA1DaFIajKNrvYE0sT
         zuE0CUoRo0nhb8OwtmIrV6MlWQS8RiQRZQM+5WV9PGuNjvxXeo8Vr2XODDw4n06F231E
         mM8g==
X-Forwarded-Encrypted: i=1; AKwUvBw35UUFLTHePbHcZmsLbXTCjl3d/92rh0lhyQ2MqinwxrhXtNUPEX/b3c7BOy/xKsPoiapxllaePmdYYTVasg==@lists.infradead.org
X-Gm-Message-State: AFuF++kBF6OTCZh+cp9IoKbrSLwoe6HPLI92Wg+SDavY78/8dyMze0JW
	2zZVQcEpt9hmipohOmXPFKp8Sb7SYMc9t+xDeXj6v8YTdbfenaNwj6FS
X-Gm-Gg: AYBFou39NehdoQXDNjApipZjFdUCm8dYRJwhsj46pfBG8DP1QtSjDk+rl5nrRCZTyRW
	AUQXRzKja+w4MsWc67NAlRH5397r598Bp1nrh/aEW2qYmAQfEVCjAOzG81MDIKhtxgh/BfrNedM
	Su0uKdgLW6dK3q17OnVGM0PIXGMGRu26M5DEAFcqpbDjJ+a1WVUCIbLrjZZfwRwGLPYCw3+yQwR
	zeJGpHRRpihGwJBRAXntW4neAaWEiAPomNGdRVkmpUqfM38YcqfaAkV3oTH8gptf487xbl4+NA0
	L7fd8yfD9eG94Ehbf6AN0mFcW2i7HAKLmYN2X61//2gsE0PtvauNyyEZJH4TaqzhmqkAh6JsGCF
	BnZ2sPkJisr4UedMf/keDMUQ3Cwzqg6XowkDLU2GFMrTru2QRh7b0faSRn07KWCwGfZVIuW//Vy
	Pc8hTka9YF9E2dLwN+7myovaq23h+5QUczrm4cboT0jWrWca5XkTKbB3U/Gp58InPNvjPUBCEGx
	ib8R3DkBXBMvzFP0qhBObAtQiAGXTW1+Foo8+kaewHAM2ZKKo4mTEGscGGcVStFu+XJx286rWs=
X-Received: by 2002:a05:600c:1d01:b0:49e:6de9:62e8 with SMTP id 5b1f17b1804b1-49e8222c825mr13854845e9.6.1789475917733;
        Tue, 15 Sep 2026 05:38:37 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e7d6a8d5asm62958635e9.9.2026.09.15.05.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:38:37 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v22 7/9] MAINTAINERS: add myself as maintainer for Airoha AN8855 Switch
Date: Tue, 15 Sep 2026 14:38:04 +0200
Message-ID: <20260915123812.14747-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915123812.14747-1-ansuelsmth@gmail.com>
References: <20260915123812.14747-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_053839_590965_A24E93C0 
X-CRM114-Status: GOOD (  10.46  )
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

Add myself as maintainer for AN8855 DSA driver and all the related
subdriver (mfd, mdio, phy, nvmem)

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0e04d92d1b09..afe9d363ddf4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -759,6 +759,22 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
 F:	drivers/net/ethernet/airoha/
 
+AIROHA AN8855 DSA DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
+F:	Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
+F:	Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
+F:	Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
+F:	drivers/mfd/airoha-an8855.c
+F:	drivers/net/dsa/an8855.c
+F:	drivers/net/dsa/an8855.h
+F:	drivers/net/phy/air_an8855.c
+F:	drivers/nvmem/an8855-efuse.c
+
 AIROHA PCIE PHY DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.53.0



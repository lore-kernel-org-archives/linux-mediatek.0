Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F8DC636D6
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 18:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=91+V2URQd5z0cRWdOdijFthyyEN9gwUVNKx2OIXRm+M=; b=hjV3BaWfCB8L1F
	zGqAxNFMU/j3y5L33G+4APWswTn99wC2GLCa8KdeV2VkxPkKtUdfnv/1NbvYAtLV/VI72ReVTadXU
	LNxVuurLeumUUSQv/gvt38KLHF+EVy2FUnSvKw9+mw9qnAi6TgdwEh0s8L+ZGvreaTFkFgf4Ics2a
	i9ZS5TWwTQ0wBdVAsQb9JRo3dsbvYUvYf/Rb+WDx6inf0zkMN6Hf5Lx1EKlLaFnpOT7mdu6g6pPvV
	qjiiGwW+TwjEAD5QPpQMOqkmMa99sTU20vciH25BBFPyxxUpNc7Rq7k8A2n/XphmPPHgOqXSio3Bi
	zR6otPo1mb/JZgYjc+fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUu28-00DThA-PE; Wed, 22 Feb 2023 18:40:04 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUu25-00DTel-TY; Wed, 22 Feb 2023 18:40:03 +0000
Received: by mail-wr1-x432.google.com with SMTP id bt28so2089120wrb.8;
        Wed, 22 Feb 2023 10:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=91+V2URQd5z0cRWdOdijFthyyEN9gwUVNKx2OIXRm+M=;
        b=luRFZSblmPWY3gvrk6yKViXpppEt290S64jD0a09c5fdl2Wa+zgTS/VVVcLaeZtGf1
         uQc5DXdqqz1i38W1yT70ERXNJiB92MhivB/TLlXOsjqbGBOEDn1YmsVCAyVyitmZEi+V
         ex1usBk+Gq8bgb5cFOGt1bzMGObP/5AaaIJq8A7KCF7pCl693CW+ZZPd0NIFwJsBP5y4
         eMy+V9aV2/NCp7+OpslssgUNIdTwKfTlw4iLNITnyTSGaNfk2ouKTJnx7PWmbcAkNCXT
         KSnq0GDCosZ1Gz7uM4hNy2HQQTaq6TJIGWSGQjmnHB6JsLLQ5KM/1/SAimU4XXSZhm4J
         QVJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=91+V2URQd5z0cRWdOdijFthyyEN9gwUVNKx2OIXRm+M=;
        b=Oc/MFrAduN6Yyx1c+awvQOraFxTRlFKrOeUlPaVZm2ayqpupsz+nA9xZTOqIfwrfiX
         M9CDEgcRggkrdx/xBpeBlyOUcn1StoW7l0nU4Ygq4BkgbUHR8Pa9dO7/V0uqemv71EiP
         70O6hUTwxwA8Y1ZzysOpegssJop7QZWwaZzPer+JqcdQWGbeL2/1RfpySrZ5JeggfGrh
         LO4VOOhSaBm5P6TkbsPd991ebbZmejE5Hp1RyuIfVCdSSiHFuggdyStkuBf1Y2Vhqeuc
         nvOswBPMssIcKqtrXpIR+Zxfr0A5f6Z4BJ2Pypq5tnfir/fljGzr7OzRhNZ+uA0oAL9K
         V8Dg==
X-Gm-Message-State: AO0yUKVqWXKXnx9lPAHIDivyC3VzgNy79FyosOr2WKjY69iG9j4mrJS2
	i7OHfhYVT0RzSPu/FWLmi/A=
X-Google-Smtp-Source: AK7set/Ay1pTP7dhUzrpNZ4kePGXVZQAHKH5ICQPaMGVsqN5CiW4i4RTql7o2vSio2A1mf+Qef4G7A==
X-Received: by 2002:a5d:6305:0:b0:2c7:e1f:60eb with SMTP id i5-20020a5d6305000000b002c70e1f60ebmr802521wru.69.1677091197184;
        Wed, 22 Feb 2023 10:39:57 -0800 (PST)
Received: from arinc9-PC.lan ([37.120.152.236])
        by smtp.gmail.com with ESMTPSA id l18-20020a5d4112000000b002c56179d39esm9372845wrp.44.2023.02.22.10.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 10:39:56 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [RFC PATCH 00/16] pinctrl: ralink: fix ABI, improve driver, move to mediatek, improve dt-bindings
Date: Wed, 22 Feb 2023 21:39:16 +0300
Message-Id: <20230222183932.33267-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_104002_001232_F5E73CFE 
X-CRM114-Status: GOOD (  16.91  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, Daniel Santos <daniel.santos@pobox.com>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This is an ambitious effort I've been wanting to do for months.

Straight off the bat, I'm fixing the ABI that I broke a while back, by
reintroducing the ralink,rt2880-pinmux compatible string.

If you take a look at the schema for mt7620 and rt305x, some functions got
multiple lists for groups. Like refclk on mt7620. Because mt7620 and
mt7628/mt7688 SoCs use the same compatible string, it's impossible to
differentiate on the binding which SoC a devicetree is actually for.
Therefore, the binding will allow all groups listed for that function. For
example, if the SoC is mt7620, only the refclk function for the mdio group
can be used. If one were to put "spi cs1" as the function there, there
wouldn't be a warning.

I address this by introducing new compatible strings for these SoCs, then
split the schemas. I also separate mt7628/mt7688 from mt7620 pinctrl
subdriver in the process.

I wanted to split the rt305x driver too but too much code would be reused
so I backed down from that.

Ralink was acquired by MediaTek in 2011. These SoCs have been rebranded as
MediaTek. We're moving the Ralink pinctrl driver to MediaTek, and rename
the schemas to mediatek.

I've renamed the ralink core driver to mtmips. I decided to call the core
mtmips as I've seen folks from MediaTek use the same name when they added
support for MT7621 pinctrl on U-Boot. Feel free to comment on this.

The MTMIPS pinctrl driver requires rt_sysc_membase from
arch/mips/ralink/of.c, so, for COMPILE_TEST to be useful, RALINK must be
selected. These headers, asm/mach-ralink/ralink_regs.h and
asm/mach-ralink/mt7620.h, from arch/mips/include are also required but
they can easily be included:

ifeq ($(CONFIG_COMPILE_TEST),y)
CFLAGS_pinctrl-mtmips.o			+= -I$(srctree)/arch/mips/include
endif

Sergio, do you see a way to make the pinctrl driver independent of
architecture code? At least avoid using rt_sysc_membase.

dtbs_check will print warnings for DTs with the old strings as it will
match multiple bindings. I assume that's acceptable in order to have the
things properly documented without breaking the ABI. The bindings will work
fine with the new compatible strings.

I could define the checks under $defs:, then refer to it if the compatible
string is the one which would work fine. Or I could put only the new
compatible strings on the documentation. What are your thoughts Krzysztof,
Rob?

Arınç




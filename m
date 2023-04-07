Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB79C77B7C
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 12:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CfcyjQNnjJKyfut48sN8/xADyro7NrSR3hTnCNZX/QE=; b=IFQQtRiPbRqd42DI4Y0rxThGJ7
	uizsYlNKoJlqgg+C1EmcaY9/sQsbWCO8+QzLCcHypwV3ljL19LDj7yrf3s/xCiNjOeZWmtj/4eQks
	whTArkrCnTJxpyUdTOmtIwygNR7MwQRMYp31K2gH+FrZ6++/c55z4GfXaAAqmPGkqR7dQ34iJt5pQ
	4g5BtiD2lkYJzfUrDSs5xv7xyX8Mx8cTfE8ADqbEwE0paO1+dP1hxhyd41jdf2PBv9wPNKl5CtXlc
	C5qM/PCFp93aEpRpXbORUFPEQQ9RQTreV36oumPQDeJDMmygZwKbQm0+YdVeu6e3mP3khm+/fizIB
	4Fj6/SQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pklgy-00AEQh-2Q;
	Fri, 07 Apr 2023 12:59:48 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pklgu-00AENU-1F
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 12:59:46 +0000
Received: by mail-wm1-x32d.google.com with SMTP id d11-20020a05600c3acb00b003ef6e6754c5so21560249wms.5
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 05:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680872383; x=1683464383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CfcyjQNnjJKyfut48sN8/xADyro7NrSR3hTnCNZX/QE=;
        b=b2giEx0I++QT94DRuN8jH9pGk7u1tl+V39YofW83rGdzvzzmPQuh/Xyfy6OqExcl/U
         1oqYJNwW/IiFzcOUjBkHvs2IiLMUhucoWryP1tUWYhgOmmxf5pTHrsM9zmU33yc46oc6
         ZuEt9nJO9L/OzYXjIBC1H0WIu6aRRMkREJBsq/dpYsCb5mCX4bVdcj5Ko5ie/8kNAyfD
         LxsH2/ZFr2XLjuXiRFsUvtNvLvkSgbvq0f0/ngEb7JVx8HlQ1IODj7ORq75Oe86T2KzQ
         LVa0PoCW9pUFWD5+UKqr6IrGcwO0Np+TESojnZBJbV6vgw/VlAlvq2GHNiSDydP0iyq9
         brVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680872383; x=1683464383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CfcyjQNnjJKyfut48sN8/xADyro7NrSR3hTnCNZX/QE=;
        b=ANIpBd4Drt0vuG4WUabkFaGF8CCSAnoCoU55vD6nIlgRmV9NV7YBhgXF7gDXXfs4rV
         aHPqpJWuK7wmE5R7JVLwmCRGf0LYwyEjvL+nqE0/6RMmVYu7eO87ApTuWce8B37NlB2+
         fphC+YC6puXOFznXeLtk3Lhbj05bGw2Al180G1zOE8VMe+2rWDQUfFBmRQQwheOLKZ/X
         ochPtq/OLdaB/kn6kvjcsjkqEHQySYiRygnWsYhBjLKeIwcaSlbYmdFtPwOee2F0ne3h
         WFvQ3ADitHy8YI9ShI/5hJN5BR4c5UQ63GMUW12ZSCUyfXRULZ/e8QvA/YFZ9GZOyMzY
         QlAA==
X-Gm-Message-State: AAQBX9dawE/Ph1/gUe9V9NWdSOlf70oZUoyBKYwC4bC6p+3HkuQZYSMf
	gGKZPciLbYFkGhpgBHaqFcKjAQ==
X-Google-Smtp-Source: AKy350a0mSzUresI8Qrw6rLqP7KVvyQ/h/qTUx2AGaI8dw6HgQWcJdZC04b2dwrui04EfmC7Mbgi+A==
X-Received: by 2002:a05:600c:2183:b0:3eb:29fe:f911 with SMTP id e3-20020a05600c218300b003eb29fef911mr1329928wme.13.1680872382864;
        Fri, 07 Apr 2023 05:59:42 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id t4-20020a5d6a44000000b002e558f1c45fsm4471446wrw.69.2023.04.07.05.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 05:59:42 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 07 Apr 2023 14:59:21 +0200
Subject: [PATCH v5 02/12] arm64: defconfig: enable Mediatek PMIC key
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v5-2-1883c1b405ad@baylibre.com>
References: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Zhiyong Tao <zhiyong.tao@mediatek.com>, 
 =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>, 
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=696; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=Y50nUyCeJOixDSHXG+mQZU/+URiR+SRJRINiChTJUZk=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkMBO6HFk1tMX573OLGmez/7zh7KzG4duai4jQcwJq
 iQGmSoOJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZDATugAKCRArRkmdfjHURSR3D/
 9mS4P2gqL8iNFNUpbPB3gvJLISPFisIppUDqged+FWNbWhqOKHqXCCB4hzCQAdGmJZPKxUrF61YlUn
 0ryu7f8FV9ww+MW54RsoIoEkG61BF6J121ZMBxbUtp9Dp4imt6n3ZaoA07PpqQV8dtBUbNqQjJERTK
 bNMY1rfljeAcxqSa9QZLkumfpZziHAa1/5Agg8fqHrRQasvpwOkP2zVW46rsU0mQeWP6XlZDXqK6CZ
 h5oGx+xVfL84uavPac65uMtIAVTJ7nbw9Ix9/EM+ahj0ckPD9bl1Ee4HrjQCJJ+oQaSGen2FKyhdRZ
 tca7dNlj+YEXIG7zD6eGCgTlIJYVpdagx+qPDBxibWPJMqEEXufu5ct7dMpzPNEfint7XldSlh5xw/
 A208sfc0mRPaUQ29Nu6J7WhUwt/alu9xDky9MSRjyN7W89BAUsM6Zu9Qm5WGvNDQwPf0mmioayZaox
 ZCcB8bi0L+vSBgezZ1PLZVfjIiAKW693h+KPsvEpd/UhdIR9VEzJcH5+Dl2ot/p0PZsvSp6qXidxG/
 ppxp4fYEg/4+4TgxjWyQpTK9n3VZdWZ+5nH+sEA6PMI3KsSExy/5YTkXEapclW1lY6LR7mmTkAxutq
 96CuLmjz3Z/t1NGKYE89mtSV81nLV06uITftJeza4r5HZbvIFLCBT64A3EUA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_055944_642749_AEF2FBC3 
X-CRM114-Status: UNSURE (   8.88  )
X-CRM114-Notice: Please train this message.
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

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e4cb65889ae6..91fad635e565 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -406,9 +406,11 @@ CONFIG_MHI_WWAN_MBIM=m
 CONFIG_INPUT_EVDEV=y
 CONFIG_KEYBOARD_ADC=m
 CONFIG_KEYBOARD_GPIO=y
+CONFIG_KEYBOARD_GPIO_POLLED=m
 CONFIG_KEYBOARD_SNVS_PWRKEY=m
 CONFIG_KEYBOARD_IMX_SC_KEY=m
 CONFIG_KEYBOARD_CROS_EC=y
+CONFIG_KEYBOARD_MTK_PMIC=m
 CONFIG_MOUSE_ELAN_I2C=m
 CONFIG_INPUT_TOUCHSCREEN=y
 CONFIG_TOUCHSCREEN_ATMEL_MXT=m

-- 
2.25.1



Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43195C6FA8E
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 00:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C0V8gGwG4F8KBp545Lv3/ljJ2Ow7XQ9likzzC+tBuUA=; b=e/Ae7iWhCgMgxN
	vQDLhwnz045f4rwbSoPlHTqDVfUbiH0o5XK6CUHQAmgO/UqrEK3AdFytYwkRZCUfUq/D1Z4UYYNsz
	/Z7iKM7LNATQeSOXhWvRhxEqJphA/Eat+VduF3stbdx+cE4FIMXmYUUGtb+wz/N41ZQyNlKniiPW9
	IcfM6R91OdgCYX6L7lf0ziz2CvJRf1DTqucdPmCHoopQVFtw5CxUS+CX3UZ/i7QqQZ2/hsGzHt4gQ
	KOIIpzyqd542f3/GDHEf91anszbCaji5K7dbSMqYnU/taTdlCqKmCHmEvS/eUJwfU0Lj9l2yzsQiC
	5O+7lZokozIgFdHxsjuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXtJZ-003quR-Cv; Fri, 03 Mar 2023 00:30:25 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXtJA-003qgM-Dc; Fri, 03 Mar 2023 00:30:01 +0000
Received: by mail-lj1-x22e.google.com with SMTP id z5so743117ljc.8;
        Thu, 02 Mar 2023 16:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677803398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0V8gGwG4F8KBp545Lv3/ljJ2Ow7XQ9likzzC+tBuUA=;
        b=pUQwRRXlmWsUaWpHVdXbMAbgsJbT9jxb6RuCj4j6BBhw9kbRtS769Y18ye06N7/k4+
         apU+Tg9rAfRps+EO7ZLmdPLZutbl1uvSfL2DJcYnsiwsC4vKPs01GaB3BHcdPrWGavva
         RHfggMd0htpGunfcKvB5IJj9srQlEpWVstHSWINXogrUaTF2R3IVH+oOO34hUILOlr6I
         GQYNXkVBYkwQmsdOpV0+Lw0jtkTVSAdV1I9IGUYkOItdIF/GGt6bUxTqUBqtEJgqI9k6
         YLE+m9fya255BxiMxILyOlef+O8ENrMC0KGuRc014Q5288bpE3r22UGlGA/7ldZvVuUv
         j+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677803398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C0V8gGwG4F8KBp545Lv3/ljJ2Ow7XQ9likzzC+tBuUA=;
        b=A4bJpi6LJ2CrVuiJSKCpDxDmZjB+K//yiJ5OAU9ZvcAy+BN40EQHLUleFPIfFDLzWY
         NvWxIspUkig4sQ7sbilUR0ER1mogUkcDu8eV2HiJ8QqGW3b5lcSDeO6sT/b8j0h7Dh/T
         Bd/moRqYhywlAOHmUSK6mLhjogkfznowr8teROkBQvHa8N71lPmCHiWMi1D+ro2aaCFX
         0vXDoVp2lJLaU2V+vNte+g20GisKd15I0UjtkTAC2Ju4oElTy7SB0dRnl4xOMn7tjJpU
         VsLj4N8XKcciBQF7hUcA+AajUL0ZcmA+oDOTBDUwvSQygQb6R3KARZNfOZ8sxk6r3baG
         CUjg==
X-Gm-Message-State: AO0yUKUOlMSu4ad73XW38hl0+4BR6SoR88wEq3e6RAAtuy4IeobWKwwb
	8Lf8b99/MPDHJDvVqExaQJI=
X-Google-Smtp-Source: AK7set+DZD+U7yW1QEwtAyid3F/XilrETaVv6RFqKTU9SJ2UOCysI6OFCwS5SucE8Rc3p9xbSDUM5w==
X-Received: by 2002:a2e:9108:0:b0:295:a96e:4f22 with SMTP id m8-20020a2e9108000000b00295a96e4f22mr3441868ljg.17.1677803398121;
        Thu, 02 Mar 2023 16:29:58 -0800 (PST)
Received: from arinc9-PC.lan ([212.68.60.226])
        by smtp.gmail.com with ESMTPSA id v19-20020a2e9f53000000b002932b817990sm64901ljk.31.2023.03.02.16.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 16:29:57 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 03/20] pinctrl: ralink: rt305x: add new compatible string for every SoC
Date: Fri,  3 Mar 2023 03:28:32 +0300
Message-Id: <20230303002850.51858-4-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230303002850.51858-1-arinc.unal@arinc9.com>
References: <20230303002850.51858-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_163000_512411_80866A79 
X-CRM114-Status: GOOD (  12.82  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, Daniel Santos <daniel.santos@pobox.com>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Add new compatible strings to make every SoC, or SoCs that use the same
pinmux data have a unique compatible string. This ensures that the pin
muxing information of every SoC, or a set of SoCs that use the same pinmux
data can be properly documented.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/pinctrl/ralink/pinctrl-rt305x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/ralink/pinctrl-rt305x.c b/drivers/pinctrl/ralink/pinctrl-rt305x.c
index f6092c64383e..fa3743c7680f 100644
--- a/drivers/pinctrl/ralink/pinctrl-rt305x.c
+++ b/drivers/pinctrl/ralink/pinctrl-rt305x.c
@@ -118,6 +118,8 @@ static int rt305x_pinctrl_probe(struct platform_device *pdev)
 
 static const struct of_device_id rt305x_pinctrl_match[] = {
 	{ .compatible = "ralink,rt305x-pinctrl" },
+	{ .compatible = "ralink,rt3352-pinctrl" },
+	{ .compatible = "ralink,rt5350-pinctrl" },
 	{ .compatible = "ralink,rt2880-pinmux" },
 	{}
 };
-- 
2.37.2



Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB467C7618E
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Apr 2023 12:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kQ2ocTAU3w1gKmLb5aCBlSTPYDVel56Zbysqh02DwsU=; b=0X4QqIvWRfQ4uY/VDZ15QhRkwK
	34rDmE6e4/ZaQY9iU321zvY8MpgSCrC9h2ct+G+A1YJXJ9bYb2INQp1T8dfDlyNiMLiWfSP0sYvL3
	IiCWsNgML7I+95gOqq/pCBOw6g51fUGfvqttAfPLGHGrGN1cHwEdqKvzoCk6V/WPiW0fH7OzWUWWf
	onRg0ar1whvsFf5LXV9aSC/5f8fs9bFTMi4ZZKvyI3zULLAVbDwKixGdQCXDvQhlXlKLwbQ1ix58A
	NbsCpnyBqdrZa6yCgXoxL64Q/vXLrV5gc6wbUKCp+EqP54Ksfb9hrF4vTEABs5fHzYEPQoxsLppK4
	FhCQZ41Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prdp4-003qK1-26;
	Wed, 26 Apr 2023 12:00:34 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prciT-003eRu-23
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Apr 2023 10:49:43 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f178da219bso69130265e9.1
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Apr 2023 03:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1682506178; x=1685098178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kQ2ocTAU3w1gKmLb5aCBlSTPYDVel56Zbysqh02DwsU=;
        b=XnF9TRXDlY/DK+hthG/Blg3DT8/nuQKX0ruzN6TorxzikeyruZ4/vxjMDGX0QPwc0M
         f5VIsH1DBzXJt+aeESPe5YF5bE1UbkpC5sySC1kwvM2eQcoK75y8hlRjZcbeuD7Q7I+V
         NHy3+6UB2aQnRLL4EAG/m4/ozufa8QXrF7UiOMf6CK/0USkr8aBUUfk4RzNFJNlQ9p1W
         CiPCGZ4cdVCdbYDC1lGMrRUIm2M92MFZbqq6H89X+c8T7Za6uFQNveLsT3uiU34A+GX1
         z7p2ZOn0dBcgCLIOPRtJ0mv1Yzhi3kfNMf+wOnFsHY6XKLjT0KkGd27R3Y+YnZpiirgP
         Mo6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682506178; x=1685098178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kQ2ocTAU3w1gKmLb5aCBlSTPYDVel56Zbysqh02DwsU=;
        b=PlYQehR7YmrZpS1n1rDBFEbk2daFGNuqs+AUAi4iy4vigedr1wwAkXzBHHRTmNn1ZY
         YMsNxmx8PuQAr6n/q7LJY9re3jVoAS/mSAR3SN5T5WKgXJzfOduurZaOkG9V3uyKjVh+
         oRezazLK5+nbOSAmTQPletx5UbWIxrbvYMls7eEJlsiICL+bsB4ZxW3AT8TW2qg6ac4/
         xkR5MR4Nobr5jJkbD1nEvruebSQ34aBofxcm+3a/XviNUQzIOlQPkvlDOauAuaIaQFut
         8QQ3nx1C+udjncxGR4DtVimaV3+Olf1FE/y5zZON6OoR17esZ9i89dYXuAf0l3gUPAoc
         Cq5w==
X-Gm-Message-State: AAQBX9dDkaku3eDAb9hvZcbnU8Fq4f5b9d22DwOXPwbNkxhhCtUDheR1
	c++7tGrzYbm6H5XZ3TA2+vdhMA==
X-Google-Smtp-Source: AKy350YS0RMYAbp2tq4KoRMWXe/tmDg25LdX/lZEi3WR4NrxuEmIAgG0m3L0wS2o8+Zw6pLwGW/q8Q==
X-Received: by 2002:a1c:7918:0:b0:3f1:6942:e024 with SMTP id l24-20020a1c7918000000b003f16942e024mr13035866wme.27.1682506177702;
        Wed, 26 Apr 2023 03:49:37 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 25-20020a05600c025900b003ed2c0a0f37sm17601988wmj.35.2023.04.26.03.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 03:49:37 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 26 Apr 2023 12:49:01 +0200
Subject: [PATCH v6 01/12] arm64: defconfig: enable MT6357 regulator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v6-1-8d6b1cfe7f29@baylibre.com>
References: <20230203-evk-board-support-v6-0-8d6b1cfe7f29@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v6-0-8d6b1cfe7f29@baylibre.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=793; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=mrWNpoe4C/7P/FRc2t6J8feM9yfT9dI6dxq0LTHYw3M=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkSQG/qSDMgZ3r8fdgRPPg4FrVKd77rLRBKVCAHwRF
 uAyw4nuJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZEkBvwAKCRArRkmdfjHURSnKEA
 DG5y+5y/X+JV48T/DjWBISDlJgDT4FA7qzOZH0cDY5DVdhamwKYCcU8847ERf0DwGj78G0QefmdgKo
 szfrdw+b29JrZ888Ofi+sh1oHb3QpeVfhi7/AJVXB3Sf+Uh2bjQLV8bhKIUVXtundZymBw4HQ06WTD
 5Bb/SmiwL8Ws0HtoYCX0Co9CjrgTsSAVXoS36Qx5hef1YFTOhf4d8ZtxPIJTn98YHS8Ii81K+Ac5Zd
 Iltu2Yl66GRonTMhTd99RUatBOnnYlimiXom1CRUewG4PhMud0w0PUB+13fpLXTr82WiNa5IEeJqlS
 6PzGEYfCyHGfVcnAF7vZqJesFcdiAlcS1So1N9MVfOZOHpyQT6cL1NQCfG0e8k67EtrDv6LXuPEkwM
 KX7MgrCcXV5UsoW/9hJNqXX5ccC/MyB4g0x2Hr7ci/WRCY8optCd60IB00JxfxLLjmJzKeKbCrQZ3N
 /QCwnwwVB+qfz3MS3trWn2KcqB1oKS+4AjKjhsUR4RE7gVZvGJUrQl0QVcRmetH9rHkvjnsLDAfX3k
 udG7WVzdtKwr9xioRfJrjRnjTNpUFYcLi1BRT1p0MR+eO6Ht2ELKmU4ajGl7hEnuIYEKaiwwImowPs
 SRaJ66Hznhnhi8z9HRTrRZPUN9z+Nwg+60xYAqpHM8e5wHeV4lVDg6EQAC3g==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_034941_675082_F4AE485D 
X-CRM114-Status: UNSURE (   9.54  )
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

Enable the power regulator support of MediaTek MT6357 PMIC. This driver
supports the control of different power rails of device through
regulator interface.

Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7790ee42c68a..e4cb65889ae6 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -685,6 +685,7 @@ CONFIG_REGULATOR_MAX77620=y
 CONFIG_REGULATOR_MAX8973=y
 CONFIG_REGULATOR_MP8859=y
 CONFIG_REGULATOR_MT6315=m
+CONFIG_REGULATOR_MT6357=y
 CONFIG_REGULATOR_MT6358=y
 CONFIG_REGULATOR_MT6359=y
 CONFIG_REGULATOR_MT6360=y

-- 
2.25.1



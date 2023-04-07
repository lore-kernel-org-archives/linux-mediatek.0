Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B04C77B61
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 14:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jwase7lH/pIQ+fdUHX1Peydgp8rdPYou8E/famXpXaM=; b=U9cTv2xqGugzWo8TAPeBD3JV11
	QjpXdl6b/u7m/+nsLVIXnCgqp3pA0gbF0kiW9duyilrB2AAV0Dl5TEBZzw7D7b5/XUO8+QNfqm9Df
	bccWDcm/NUMHpzfpsJcawkE/Jz+r8mWie4DHbMd4NI46yA8hVl3mtQZgr6gpPFmvDmHqwGXIkibzp
	YjSxANpUNJl3K8Pn5yczcjdsoMQXXELuHqm/7qvRPYRZIS73PD0HuGAvt8risplcdICt9pGW0HdS/
	StJ3AtySkNaFSE/bjb5FheFv/BRTlH516ePl7ccGy+YXAsGynSUE+GL+348k4OSbQYqVfDjSkRwiY
	2LSdgPqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmgN-00ARUl-0O;
	Fri, 07 Apr 2023 14:03:15 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pklgx-00AEOP-1g
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 12:59:49 +0000
Received: by mail-wr1-x433.google.com with SMTP id h17so42230556wrt.8
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 05:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680872385; x=1683464385;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jwase7lH/pIQ+fdUHX1Peydgp8rdPYou8E/famXpXaM=;
        b=HZIRXZ2OO+IgFWTwX8N94qnUwwC5vld/cbyCY537t1m6tz5sUMZVV3HuDHLVWJW67/
         OL0uvDo1OVhoksXptNVyffY6zfZEjSHHDZauLUCU20HdLoHNQ2750v3DIkC5vYJq2wL7
         P+wCcAbq+V1b6Y7qnH2b3DiEN95pG3r27rBK4gb1O1cH/WtVYpGP3kJmzoujyB+LpYKo
         aV5P5ZVzmryTLLNphLfeSZ0jrwlpV9TPLSxUSwDt/ouFqQHfG8w85CrlsgqZWGxhLC9D
         26VzWdYysYz9tAzXUJQusfAj5G1DdC6iO1o56EDmNCQScwgL4ubjHe1xpAAIYYKX4M7d
         BELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680872385; x=1683464385;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jwase7lH/pIQ+fdUHX1Peydgp8rdPYou8E/famXpXaM=;
        b=A5tEitnvMQdYc7Ccpu3hgJDE62W95z3PwMeWVU1dnfaTEyMiVCWk8wLIYFUbO4C4x8
         L60GRQCJpaVVoKq0MAvd/Sf6J01HnZK379Cs30C6wYn2D7qtORxON0Fs3bluQVsWhimk
         MUqp87nWOPO0RjJpcHo48nX4a8xuiYIVS0yaJ6FOIf/Nwtyskd/8+nM+jNzVr1sds/DJ
         mQm7NULrtuW9H15qtgLKOIizs+9a0se4nDqcuqaTRP6c4QRAeKX6TMpHX6/nIYPn09SY
         GI0kJARkTGYgZcAcnXYcCqsAGJfmSbv9ha/vh8m0X8XA4Ja3rcMNxERWMH1X3kxfH0V+
         UmQQ==
X-Gm-Message-State: AAQBX9cJ6eNYgLNueq27bRMGQRDhOvFRAvvZZytNTd/oWnMX4sYGLoCX
	8KBqp5iywKWlFerIVdS9LLC2Aw==
X-Google-Smtp-Source: AKy350bxfJ4o6nXLivlRDDZqJIOQlu2G++yNOda81ZJAup+Eaz+itOJxPYtj1Zy4xw2m8NlQLkFoRw==
X-Received: by 2002:a5d:4f06:0:b0:2ce:9d06:58c6 with SMTP id c6-20020a5d4f06000000b002ce9d0658c6mr1510029wru.53.1680872385407;
        Fri, 07 Apr 2023 05:59:45 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id t4-20020a5d6a44000000b002e558f1c45fsm4471446wrw.69.2023.04.07.05.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 05:59:45 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 07 Apr 2023 14:59:23 +0200
Subject: [PATCH v5 04/12] arm64: dts: mediatek: add watchdog support for
 mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v5-4-1883c1b405ad@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=892; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=sanLlORy8ZXQl/7pqZ+xOL9pEwEsbTjvO/nq6i79rEI=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkMBO60J7EzOGKmb/4WFccYICcyIp/r1bWyW3d1Nv+
 OsX6ofGJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZDATugAKCRArRkmdfjHURUVVEA
 CfyE+FhgX8+cFqJ4LCg5L/DbXQRH/woKvefBnuz0E5dBhfBVS7JfAnOUVDM19i5tnxzJlGu2BdaaS0
 E4cqPIDIMvo8GoBBGmTSQ/5MiovW0GXRSwunDn84KzocpFpQf5iZlYnGsh4Qj534wZOlbIUnftrWd1
 Z0OyEdKsjXJ1Cw2aI1NKSRh5xWG0z+p+gs0R2kABm0K+QqJ14CcSKd5SYWAxUQYfjvYScSg0NAN9ni
 aaxMGUGyMMVRLHqqs3uiEc/Ux40hjSBL1DXicioVdyFDCmt2IwoC0Avnl5e5lZ3HBl7Zu3KBzKzDm9
 KzweasxI3oXqABU/W9JP503dOOMc9VX169fDLp7m1oh0GwtKWpy7sw5dV6qIaSMGcLFeuBSBXp0NFS
 9Ru2JrkjDQpUgaZbsQjLDhw4zVDDEbu6Pij7QAJzcR4m5MN7ZRjlJPAl4gInrc00OKyfyF6BHQdVwU
 cfvHf4zsUHtJs0IE3jmf6JQseo3LnZDcZx04MrEpZPIlFGGYV5VbHwLhuwDZLpJpBPWEFIne+bG+dO
 Dg9pPOsLdzWip7RR6kv/H/nmUsXBRW9YlAxkRyELaCGQJLrO2E0P/Mlq3AHvGmSKd4CODwPT1ijsPh
 pJFWhgJT1mBNHSxjSre1HkWzTQA+7ajgWmfoCp99cMq4gd2LLDNxaPrCzgkg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_055947_607810_E4319321 
X-CRM114-Status: UNSURE (   9.31  )
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

Add watchdog support.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 1f6b48359115..bb45aab2e6a9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -162,6 +162,12 @@ syscfg_pctl: syscfg-pctl@10005000 {
 			reg = <0 0x10005000 0 0x1000>;
 		};
 
+		watchdog: watchdog@10007000 {
+			compatible = "mediatek,mt8365-wdt", "mediatek,mt6589-wdt";
+			reg = <0 0x10007000 0 0x100>;
+			#reset-cells = <1>;
+		};
+
 		pio: pinctrl@1000b000 {
 			compatible = "mediatek,mt8365-pinctrl";
 			reg = <0 0x1000b000 0 0x1000>;

-- 
2.25.1



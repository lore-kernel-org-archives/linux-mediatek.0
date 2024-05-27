Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26B2C25B74
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 May 2024 12:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=be+meMFX+lXLsoY1vauyMtoGL9wXpaeQ3cLiiOkxwWM=; b=Etw8TZ1fZX2OiMB35bXBgIvjYD
	5wj+35J3/NiBIxk70qatGmqkxn25PSEtk1Q+hyg6tPUY8mts3o8aBpvZ92AJe8Xb9mSnrhJ4vt0Ee
	y1Ij2+JRODTNB9YaCdNPIRIGVJpFKXucErtKx083YMjAg78tL8PxkN8MQVam/Yw36C92inCWvcbHQ
	FsYJf2K0a0SA0TeXTS89HIg8hjBgSs6pfqNaHGEiSuT8SFrxv9IdDU5TtsILgMzALPcUxdbQey3Wc
	x6LY9GyS2sduiQoXzzp4LlT92JW3BwXtakaOEY5eFD1fiL5kj8TbGfXMA8yii3hjK4tsYwewiq+U6
	s57yOEOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZ1f-0000000ElwF-2AMN;
	Mon, 27 May 2024 12:00:27 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZ1U-0000000Elps-1DtM;
	Mon, 27 May 2024 12:00:19 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a6265d3ccbdso290973766b.0;
        Mon, 27 May 2024 05:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716811213; x=1717416013; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=be+meMFX+lXLsoY1vauyMtoGL9wXpaeQ3cLiiOkxwWM=;
        b=K/u7ws3fjpoQ5QCx4ApaUU5CoCb9itWGHCf/0aINTyoXUTGVnjWVSx53029ZgU10VE
         JmZNYmCNlp/vWfvIf9Ia+vyqcOAMu5K8etfxUP6PWsvm1yNYEMA7cyNP5KbsZn6ApEx6
         oDN0W6mX8G7yoR8vMrzJQuv7xYi1nEX8i/kNBhKKagMDmjrmRQH3bGQNGJwCA9Rxv+lv
         q5wyMAZbqKxt0vXdNzeJQUc2JiQ3bkq3Pc4h9GjtYt1Wje6YSaAavFb3z31itbWSRAll
         hwo/CGiOAfJt7CsJEQyOzR/xj/O1Y/gaTw8L8CVTmfawYa6uNwzr8EQHLNs1XXukeQwY
         5vfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716811213; x=1717416013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=be+meMFX+lXLsoY1vauyMtoGL9wXpaeQ3cLiiOkxwWM=;
        b=rJOWI/C4KNWwTmICvLZB74a4Rvc5xl+XXp/kOOfhlECxTmTf5Mf9SNl8WETuz8gbv7
         qTDNDfnY1uxAg2dQHcnhljmaeZxg6yZeVcut0UtHTdiHE0pDGoY+/0Anr/1dTDMkV15q
         xUm9tLnHNF1cRUboa4N8DUbsAoSyTopZ8I47LRbBIwFVpTIcWZJph5FqMNDpQIED9p/W
         kpU8pAoM06rq84pHjzi6jab2IJkaUplErTGp+DgbAwAY95nIkFo3D+xxk1YfgyxMwlUF
         wait7Md9VuGNkCjU9GFDl9SN8HoOyrcHH/gOAkfZPChXgg4TJy+rLn4ge0HaWT3R7ZbE
         awuA==
X-Forwarded-Encrypted: i=1; AJvYcCWTuT/Gm8TCBTrUofK4grU6IZIEaSTnXd0+DJmcKU0ZT0D46jPRrRH+mf/9SmHmJhvg5JgCOFfBjVaXxnkU2tCNWSibSjja3Uqkt7la7VL7dkIpkvoihN6lED2gHFW1Larvax476FROXtDfCwAJleQ5mxoAWS6Atho=
X-Gm-Message-State: AOJu0YzoE+WMSDIjAxkbtJdBqVoElZqenCUBqsZbQtOJFWjgsZjAhIgC
	njJzyRMJO22C9EGx7dH5N/7Q5XnQl31Qz04yH23LvKR+g9Ynou1o
X-Google-Smtp-Source: AGHT+IHlmAFvgLS49lyX6ic7wbO5heyC9S7czR8KX49sC5/pb+ilLrFGYK3uJlCTdzLLSUVQ9HvEUg==
X-Received: by 2002:a17:907:94cb:b0:a62:eab9:4be2 with SMTP id a640c23a62f3a-a62eab94d52mr228164166b.44.1716811213252;
        Mon, 27 May 2024 05:00:13 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc8da37sm484669766b.183.2024.05.27.05.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 05:00:12 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	Sebastian Reichel <sre@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	openwrt-devel@lists.openwrt.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 2/3] dt-bindings: arm64: dts: mediatek: Add OpenWrt One
Date: Mon, 27 May 2024 13:59:32 +0200
Message-Id: <20240527115933.7396-3-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240527115933.7396-1-zajec5@gmail.com>
References: <20240527115933.7396-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_050016_477444_0FB790D5 
X-CRM114-Status: GOOD (  10.91  )
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

OpenWrt One is the first ever OpenWrt product. It's based on MT7981B and
has entered an early production stage.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index eccc3f7cc4e6..c150acde1f90 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -86,6 +86,7 @@ properties:
       - items:
           - enum:
               - cudy,wr3000-v1
+              - openwrt,one
               - xiaomi,ax3000t
           - const: mediatek,mt7981b
       - items:
-- 
2.35.3



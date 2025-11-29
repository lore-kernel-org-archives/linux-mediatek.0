Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4F2D116EA
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Nov 2025 23:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qCXAC0GBbAxPWdhq7j/4nJ+adBCJDMjQOJVyf/bKFTU=; b=dT8Q5K7BWf8OoPvCd8bLMkSlqK
	ZLgr6/Vl6/O7LTgr2aV6ZAcxqV0HKyP4ipZqFjqRn9vZCk0hDQ07c9+JORwZgaDfPwjOuBwyd8NVJ
	/eawHfWJ1S096QP5ntfhMYNz5ABY4NU7ysVH15mQ3Bmr90sLBoXHhkZ0+NagihbaHguj495zU5TBz
	km8c7E2KF0U+heDJNCQi7vE2/hjXBF3d/di1iJNT5gX45JnprHBb/xk0qvk2Mh8/VgrxYrfGjwx8j
	qtomeRRY79zP5FgumWFk658NTa1TmHXB6E5cHO+xt+PondSg+jbIX3M5pgjV921KU6hTMLnXXetel
	xRWeTC6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPUeJ-00000001sPS-3lHt;
	Sat, 29 Nov 2025 23:46:43 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPUeH-00000001sOZ-1NoM
	for linux-mediatek@lists.infradead.org;
	Sat, 29 Nov 2025 23:46:42 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7bf0ad0cb87so3587895b3a.2
        for <linux-mediatek@lists.infradead.org>; Sat, 29 Nov 2025 15:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764460001; x=1765064801; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qCXAC0GBbAxPWdhq7j/4nJ+adBCJDMjQOJVyf/bKFTU=;
        b=GWxwBEgAPZJ19rw/6yASIEq3PrcIXLkwdgztwsXoHpmJaDh7kYUuv2jJ9GeRhMuGxh
         xAvNO6mdyzqGEKVwHZMqEeEUCSsIqHDY7Ex4d2heaUgNVe8D8WAYBJAZ3OJC/ABngNKJ
         aSkZwCDmjfkpTywDjmLjJPndAsK6hQnyijmptoXRa5WGBRZMwJhnSay96HBjkqYfMx3n
         aZFnna8MMhTyep+GoIJB7I8mnB+lhZ8nka+64TRvIsAIjO40Labd/21D0PnWOjVdFBQu
         p33seuQwRm4SG5ujXzlxNU9koxti4szegM8vXvQpD4jRCU4HmPOgMw+t1uXJt6KYB3HS
         nH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764460001; x=1765064801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qCXAC0GBbAxPWdhq7j/4nJ+adBCJDMjQOJVyf/bKFTU=;
        b=dTs4gjwmTZjneK8UbNTkEgMCj9n/eZMdn3M8PnZB2A5ES+yFR8ROluLBHi74cmLf0/
         jO3qadg8yTwwTZ19QbarS/xx4q337p2DbdekiDuuaEc3gknAO9eG9J6S1Iu3v6GM2LBZ
         GT36o0lenTuiw5zFtWmqO+g5fG4Lvtl5NlMq+zVtYXK4zP3J29RDZGQAwhWquvFvvf9M
         ttrQLZLh5F2TVxAYBJvNdWZPgz+bI+aVWgAFCkIt5q7msut81HVSExcYDUXNGxD/8rX3
         0DWsMPc8U4JpWf1BDy3qSN10t7b+5H0Nz3XJSzsLUa5mO54zTC0WTrNcJOnVqpGcVXHw
         J9Ug==
X-Forwarded-Encrypted: i=1; AJvYcCVfraQlJ3SJmFb1whfeihcT0Xp1oZDh4CQvCoePSpvJZVzu8xFL6Q0WWV5OEaueAi7oiUHEm5ckkwN6UJAq0g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyqkmM5WpiU3RN9BDjSwjvv/mknBJlod5f13xT94ABj4nhZpUps
	D4Hs9XYN3RMrHhcw4BFiIgvC51hg13ZEiMdHvJOhXMoAG8ElpOCFhkmX
X-Gm-Gg: ASbGncv4TUIdEnMsXk6k5FOAnNpbaOr4iPStMT0pje18Y3LCNwP4pVq9gtfM+N5ymxm
	j/DCbOcH1TNTYg6xVWS2NwRgNN+cdZUzEUJFFTkhWHTW5HCxNNaeHwVgvd9igby13PAsGt8SB6o
	PUdBGVI2bGejke/pcjVTwKutPBefXTyBT/KzKhbeJNu5p/SXZv6ktzqxKFgNZQABbumligq7kkB
	RO1iKoJDTe2D+9hSmVjCwKge+0U780b+ox8kC6nmTQhh4Q1C8cRXxji4F1jYXwqH3mZD/5vTmdU
	o09+2Si5fNmyVEBDHJMyn4M4qBBMf7fjsR0LK1DxOSN8th35QrwCWYLXsfh0U0FLVMRX3/IJ//7
	3eZTiGTufWkSmiytfrWG6MmO66DkbCvTzgDZGDCG58XnJCRWny9nLRP6rrPBJV7wyOiY5KlF1hQ
	Sf2/7z
X-Google-Smtp-Source: AGHT+IEvcsMa5l/AhUy3wA67rw2nUoJkcI0nAX7R5RA7tZwpSoC+/PEIe8H7hubTPSio4L+mBgUalw==
X-Received: by 2002:a05:6a20:3d1a:b0:34f:47f8:cca2 with SMTP id adf61e73a8af0-36150f424b2mr33755297637.58.1764460000749;
        Sat, 29 Nov 2025 15:46:40 -0800 (PST)
Received: from SC-GAME.lan ([104.28.201.78])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15fc08bd1sm8921049b3a.63.2025.11.29.15.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 15:46:40 -0800 (PST)
From: Chen Minqiang <ptpt52@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew@lunn.ch>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	Chen Minqiang <ptpt52@gmail.com>
Subject: [PATCH v3 2/2] net: dsa: mt7530: Use GPIO polarity to generate correct reset sequence
Date: Sun, 30 Nov 2025 07:46:03 +0800
Message-Id: <20251129234603.2544-2-ptpt52@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251129234603.2544-1-ptpt52@gmail.com>
References: <20251129234603.2544-1-ptpt52@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251129_154641_372638_C07D3C03 
X-CRM114-Status: GOOD (  13.28  )
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

The MT7530/MT7531 reset pin is active-low in hardware, but the driver
historically hardcoded a high-active reset sequence by toggling the GPIO
as 0 → 1. This only worked because several DTS files incorrectly marked
the reset GPIO as active-high, making both DTS and driver wrong in the
same way.

This patch changes the driver to respect the GPIO polarity using
gpiod_is_active_low(), and generates the reset sequence as:

    assert   = drive logical active level
    deassert = drive logical inactive level

As a result, both cases now correctly produce the required
high → low → high transition on the actual reset pin.

Compatibility
-------------

This change makes the driver fully backward-compatible with older,
incorrect DTS files that marked the reset line as GPIO_ACTIVE_HIGH:

 * Old DTS marked active-high:
       is_active_low = 0
       driver drives 0 → 1
       actual levels: high → low → high  (correct)

 * New DTS marked active-low:
       is_active_low = 1
       driver drives 1 → 0
       actual levels: high → low → high  (correct)

Therefore, regardless of whether a DTS is old or new, correct or
incorrect, the driver now generates the correct electrical reset pulse.

Going forward, DTS files should use GPIO_ACTIVE_LOW to match the
hardware, but no regressions will occur with older DTS blobs.

Signed-off-by: Chen Minqiang <ptpt52@gmail.com>
---
 drivers/net/dsa/mt7530.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 548b85befbf4..615e9a5709ca 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2405,9 +2405,10 @@ mt7530_setup(struct dsa_switch *ds)
 		usleep_range(5000, 5100);
 		reset_control_deassert(priv->rstc);
 	} else {
-		gpiod_set_value_cansleep(priv->reset, 0);
+		int is_active_low = !!gpiod_is_active_low(priv->reset);
+		gpiod_set_value_cansleep(priv->reset, is_active_low);
 		usleep_range(5000, 5100);
-		gpiod_set_value_cansleep(priv->reset, 1);
+		gpiod_set_value_cansleep(priv->reset, !is_active_low);
 	}
 
 	/* Waiting for MT7530 got to stable */
@@ -2643,9 +2644,10 @@ mt7531_setup(struct dsa_switch *ds)
 		usleep_range(5000, 5100);
 		reset_control_deassert(priv->rstc);
 	} else {
-		gpiod_set_value_cansleep(priv->reset, 0);
+		int is_active_low = !!gpiod_is_active_low(priv->reset);
+		gpiod_set_value_cansleep(priv->reset, is_active_low);
 		usleep_range(5000, 5100);
-		gpiod_set_value_cansleep(priv->reset, 1);
+		gpiod_set_value_cansleep(priv->reset, !is_active_low);
 	}
 
 	/* Waiting for MT7530 got to stable */
-- 
2.17.1



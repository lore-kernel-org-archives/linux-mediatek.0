Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E04C71135
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jun 2025 07:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vFu6VBmeq/w4W0+U2cqQ9ftqsZ6qKfNlKR84sMlRxPs=; b=F3PFRaTYgLxG81
	Q21Moi7IccQqvIq1tPwtFb2BNM+Zs1sDuz0F1KvRWC5GGNPcg9hbPkwGMupAlnCfoHJfcjExXD2r+
	Ej8bsMfgIYIcVew66E8xFQ0rBav3Z9eJWmfEVgOxLhmLoJlgrwmwCtX8UOixIS76vIzcDxuv2SDuG
	uax5LJEjh6TvG8BoZxyksNJmYhLUEw4mhEgBFCpINW1f0ppJKzFy3AZdU2rRzId7LrAcgkkpdmAaf
	KZf2Hq/k3zig10dPCuwaLKD57uTLAgvQD8nq5AKEA5wtJ0LY7YIFR5sW3zrFTpZcLPGb/W0YYjpom
	JUZtd5fkdNnYFFg3IXTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR4Na-00000003ewD-3XGe;
	Mon, 16 Jun 2025 07:35:42 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR4CT-00000003dCa-0u7p
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Jun 2025 07:24:15 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a35c894313so4721523f8f.2
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Jun 2025 00:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750058651; x=1750663451; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vFu6VBmeq/w4W0+U2cqQ9ftqsZ6qKfNlKR84sMlRxPs=;
        b=QoOSUsVGHpPsKHBhBIwRbcso2rZwLz2rmidU5dkc9XHqsUZO2rCXWr9d3mWmdbOOp2
         AMhR17ZE6XB7dz9NkXfaysDOH40DPh7OfC7OD3T6fnR8NprvwBHNf0IKbq6pbvRCJQya
         F5ugJa9gCxx3Uqlvf8WflLt0prY/gCkSmtotejym4vr5cyZErvhGSJtyFIojeOufDYCV
         h89j2A0Qm03Ur/n3L9AljQThUlzEUIsaTmA2LjTBPu5de+Gk6JIM8BPoK3JKbwO+GZRt
         Z3RXkM9IgThbLhXGDXFC5wIqo6sgQl3f+Vwya/Ve5DcF/qZ1ZE+2Jp9QmaXgzwUcyF6d
         wadQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750058651; x=1750663451;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vFu6VBmeq/w4W0+U2cqQ9ftqsZ6qKfNlKR84sMlRxPs=;
        b=i7H7OUaBxDPSuclL+gRtAI1zzUMMISxBfAwRTZeciuE2o7UM3+/GRkyIvxHij0DXmZ
         6moteTS8P31uihDkhwe2qFEUHtiinTf+cNP5P/I7HJONPQGKwHHS3fK/jYFereGzXP7I
         9mgOfAK6NmnwbXmFarmORjULuqAPCK0hFsdc1XQ3b+aumQ6FE35TRsfuSdpOn/7jUUYJ
         39pOPTe1yyIExcA5KNbiPKRcFu8R6SxSv7Wn4Yj2vQm25DeTk6mUC4GoOEi5reC62xJO
         0flG0rg6VWR4MbtHOg5Axq81VN4hGFgr9OarRDDGK26Z5p5/5WdpVudcv9gaSpZlyKYv
         ukHw==
X-Forwarded-Encrypted: i=1; AJvYcCWZhAvOrIXXOHXK9T8Cn6KPHQfkbLMqheD6pznR3HmoMUbKj63mt0RPiWqK0+8JA5SHrBVqPinLmTNiBQ3+BQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGV0l2Kd2KAhStsDQUWPKo75gioOsyAS3U2fkQGWlYzeW026+7
	E1eG3YTIrb/lR5MDIu0pasH5I26dYkjZB9tXrEy0MzxIwIwc3b37vVqgIe5mjyuYV+M=
X-Gm-Gg: ASbGncujqWJ6/oHxzFfXfnHzaJ+fcdC6ZVaYNDD3835UidRKBA5A443tvKZBZIRPzSr
	KgHtXGflDivjjkpGCuNFj2IeGNxFXKtGDmm+H1/ETHbbkk1miPE+X0WJrt4HkRnRoboK7tarCO6
	KBCrktSnUfqBgzABDDuEeNthL5mL3KlpYqBW9W0XZ+XOQq9hE2MrUDTxuJQmIh3peqnRZFpPqcX
	DQQGDwr0fl6QzePaEmsgSf8xNXwIDdh2qlWKe9j+St+iY1W+gUjBr72ogYn8Wex5tg5zTstS60j
	F2ncnrYlPqZ7l/UgRA5HiMCj4Z/di0TAsQULrWV6V+SqTqtwE7bVQ382mXxIxzss0/k=
X-Google-Smtp-Source: AGHT+IGOQ/05R6rCvIZwn3dIA2Nugc/IsmfEl2HAgh9BK3DzCi3R0HMyStiSUVCIGzVyM4FshOI6yQ==
X-Received: by 2002:a05:6000:2507:b0:3a4:efc0:c90b with SMTP id ffacd0b85a97d-3a5723974e2mr7184735f8f.15.1750058651143;
        Mon, 16 Jun 2025 00:24:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4238:f8a4:c034:8590])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08c99sm10312334f8f.63.2025.06.16.00.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:24:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 0/5] net: use new GPIO line value setter callbacks
Date: Mon, 16 Jun 2025 09:24:03 +0200
Message-Id: <20250616-gpiochip-set-rv-net-v2-0-cae0b182a552@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJPGT2gC/22NwQrCMBBEf6Xs2ZUk2sR68j+kh5pu2wVJyqYEp
 fTfjfXqaXgD82aFRMKU4FqtIJQ5cQwFzKECP3VhJOS+MBhlalUbh+PM0U88Y6IFJWMo0ZB7NLo
 7m8F5KMtZaODXbr23hSdOS5T3fpL1t/35rFZ/fVmjwlNt7aXvtXd2uD05dBKPUUZot237AKUyb
 PG3AAAA
X-Change-ID: 20250527-gpiochip-set-rv-net-9e7b91a42f7c
To: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 "Chester A. Unal" <chester.a.unal@arinc9.com>, 
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-can@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1610;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=uR2GGIFJoNUWja26+eqtvHQqGtdircsCPqOzrEceufw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoT8aYW4MUwvKOocqHKQFcXvihCO599Xx46HuuP
 BdHcdXSED+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaE/GmAAKCRARpy6gFHHX
 cvZBD/0aIizVMfAcrRGn+eGFgxroefc64UEncpO5XRYZr4fpLreEOW/l/6kJdsUC3ln+H5m7qyd
 afXzJbi7dzgzaaakQc0F1Yl+Xk3ybyaO9jL9EijyiRnrThzoYCuJEn2/uLHV+NK8n+mMWa6/vmU
 4iKlPXYrPpKMMp4vF5r6UBKlFKQd68CXKBqaUvLQlq5NK4K8hFyMVxGngeVomNZJEOs8Xb/RNae
 CY2grMseA4NDMv0+JNPAEoFFPvYDyhLjm9jSZdwXItdJJJ9Hxs4SoAo+hrS9mI1nFETaXK95JII
 K5lzvRb8Gaciin93TS4nnmpboRPiyKHjjNjG3f6G9bMD9N4O1ZhsJdidluXfoYINmbuECVCmhBo
 oI8F4ba9fca7wCeBSvTpopmVe055GxvDiUoX1Pf4BrEEqXdIU1O3d2yadpQcrNqc8M2NJmnuVwe
 HcEjM/EZiESaur6u6pva7RjUNFK0AyVWHaRy1BQO66SK7Z867KEhTyFW4Ktc05qPpzXJY+nUvV/
 8RMUio65JmAVSUOsG1GzV48Zh1dlS46nqyItSAiEje8/saGqMuCqVyyMK1jZT/wYP576NtkqcXf
 +iiCZPwC1n6roZHDTuirFnU5fInYX3zemFdlV9BGW4VaG3RuwHRHuDuP0FlLi4HraM9oJSfXHh8
 Ez87K2sH4EmaVOQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_002413_275735_517D41F2 
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

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts all GPIO chips implemented under drivers/net/.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- propagate the return value of mcp251x_spi_write() in the mcp251x
  driver up to the new GPIO callbacks (and the old request() too)
- check the return value of phy_read_mmd() as well in qca807x
- Link to v1: https://lore.kernel.org/r/20250610-gpiochip-set-rv-net-v1-0-35668dd1c76f@linaro.org

---
Bartosz Golaszewski (5):
      net: dsa: vsc73xx: use new GPIO line value setter callbacks
      net: dsa: mt7530: use new GPIO line value setter callbacks
      net: can: mcp251x: propagate the return value of mcp251x_spi_write()
      net: can: mcp251x: use new GPIO line value setter callbacks
      net: phy: qca807x: use new GPIO line value setter callbacks

 drivers/net/can/spi/mcp251x.c          | 37 +++++++++++++++++++++++-----------
 drivers/net/dsa/mt7530.c               |  6 ++++--
 drivers/net/dsa/vitesse-vsc73xx-core.c | 10 ++++-----
 drivers/net/phy/qcom/qca807x.c         | 13 ++++++------
 4 files changed, 41 insertions(+), 25 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250527-gpiochip-set-rv-net-9e7b91a42f7c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>



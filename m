Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615BDC5B543
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Jun 2025 14:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=76J2LCVixashUDb/m2qpfx8ikv/ZEUvoe4KOmQxn0YQ=; b=aUTZ1eMVj38+QF
	8QjwuPrQMv0vZUk855mlAAFi08K7sng/+C3V+WCZgReaXh/7jima3Ow9TP/2OkFWV8pXffTDXphIz
	RV2AXECzaeOr3X1Zzi/5Z44vUuKesoaB09lz/xj1KM0BS7utCux1nzcyerim/QEbeq+rVkc0YNsef
	rvP7Wrygk5p9xMmNK8Z5sl9hqHxQ/wNz6dFZm38zmUo7S01hpg0MX3gOJPlKzdD2gPYePI/5SkQJE
	Vtj0RFj2vQVzOKpTQ8lLXbvqjoSXZQu7NwIc9fEIy1kg5PgISzXq+UHbVr8ZnqaDa4J9PZyv8h0ME
	hpV9YfRdW5tX+jchNq4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOzu9-000000077ht-3Efy;
	Tue, 10 Jun 2025 14:24:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyEu-00000006nL6-35N6
	for linux-mediatek@bombadil.infradead.org;
	Tue, 10 Jun 2025 12:38:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=76J2LCVixashUDb/m2qpfx8ikv/ZEUvoe4KOmQxn0YQ=; b=W/G8WhB3SMVpjdXYDaVZrJQ+3m
	88Ik+iP5t7qacOGnI+MVtebwEJhIskIP8u1HQnawpz8WD74hZJe3eeeWRkHI006MTJTbXlMAGKuWC
	3xkrTTc9Yt3sKIBPc4Oa2qXPx2cS8sadZk6Yas9DXyFz9wSpstutPQYtSTEFqYeEnDKIeP8neWdOW
	OsDogE1eA++tpkldCK7/IpRJxbOYsl25jEv7JrcQG/a9Knggm2B+PDcjPMg5/Sq9QdDCN2h/LNOef
	HgpyLA55Z/6qk4u2ifBpAIjTWso07vmviuGq0cqMehhjPKiZQOw0KzQCg/deyPBceG2R6aLGHYVqU
	MGeCRW5Q==;
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyEs-00000001osa-3Qq3
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Jun 2025 12:38:04 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a510432236so4228086f8f.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Jun 2025 05:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749559080; x=1750163880; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=76J2LCVixashUDb/m2qpfx8ikv/ZEUvoe4KOmQxn0YQ=;
        b=XqL/6v2ueWzdYTL5WrOrdkARtjRK2LzMgJuMll4PblppQn7EzUWbcuDDn9aCoyMNWM
         jhW+qatwlNVX0lAYTHyMU5/aC16GYFWIYLCeL8FkpO9O2b2aAo5B1vmJSBNg4Oq5aAWA
         3BViOwoltP1Lh9Vu7d2qEgAaCxSqSwbOXd7MSYfdIbGJoSw8TmYqvny9wdF38vcuGyLJ
         BkYoW6TN2i+DNdQ2bKEXIjhdxdOcKU2g94Qppsgd5huwnVPQE4c4HCFUnWbzwFj7ZR5Q
         n9o67TTjshadeCUKa4F62pXrhhFHKDCHpFonUknrg/wkpZWOiR+0r0G8UzvhJHZxsFy7
         g0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559080; x=1750163880;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=76J2LCVixashUDb/m2qpfx8ikv/ZEUvoe4KOmQxn0YQ=;
        b=dHRkRHMQ2uvI/mq4bv3hFcKZkJelbyjQA49QXwonCzxYG64TE/bHedL4Iy8Lg81DQl
         TbpTLpsmvh9q7fVeMHHUGm/gwYG+p1kZib0skadTXPM/7TBvp5KCM86Gv3/+v0mZtVjf
         hQIuXP8N1oorKAM5TS5RuBgxK+7z975KFc11T9zaYzt4TlDNQWhugZgudT640+pOuSVW
         QWSWrDDAZNcQBKIEG6A+sfa4OaQm6Sl/s+TDPjYpf40hTtvcgJgDk/a/RYedBT5Ml4iV
         hzcEhaALHIocKCBY7F3bir3fKFz477PL/1IhfjkATRNFPh5H1BH53dmEmnbsuFnlLRdq
         MBjA==
X-Forwarded-Encrypted: i=1; AJvYcCVxPhzU7gAGrlwN5QSRhTI5/QCYCjZqVSs4DQpU+rhNVGJZ41ch9dHi7ZP8shHNmi6SO0QEtk05VkfH3ErOPA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz1TWLG7Q1p6EdsFujRjdmi8Ex5bWvPX6lvGmNJy0RLo2eSsKo
	MKab7eam87fGYwUOdKSy4PjxNuLO//ogdJUMbX2qDEoLL8b/iEMEV881ko6VT+mblLk=
X-Gm-Gg: ASbGnctu8SHsA8tohl+0qNBz9QZhxwV2T/oNN1VhD5w5mprUOjpri6jfywenRFTz9jo
	zPA1qYLUT/g+Jdeh8kkQziSAFBOBNj7K5TFUEEyE7l6ovGlZm6w25RDIzz9oOyfBgPgvDf2VK4E
	kExLCTdDdsojNBa6hSl7L443bBYDoecM0nPQf7B22tV42qBM8uOeQZgx9P1V49iIXLqcEOrNeOU
	w7k/vPTxYl7eCBbN1myQgZiWRLXFBkG8J6eXip+ujDNXjqnO/JHP/y4tnMbgpL1WNLNpI5DldGH
	3NjNTkkUBWMFqmxDiv7t9J3ZBP3pHWZzyAcuCi19KQyqExo8EaQfLsbstfHiumtV
X-Google-Smtp-Source: AGHT+IGsSDaRB1hqZwU1/G5MCu4Szr+Exf9GnhrFkMwxOumN0QR4RfbCMoZmzXDX0IpoSo9pzctkjw==
X-Received: by 2002:a05:6000:26c8:b0:3a3:7077:aba1 with SMTP id ffacd0b85a97d-3a531ce677bmr13926248f8f.48.1749559080359;
        Tue, 10 Jun 2025 05:38:00 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45213759fb2sm142476805e9.38.2025.06.10.05.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:38:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/4] net: use new GPIO line value setter callbacks
Date: Tue, 10 Jun 2025 14:37:56 +0200
Message-Id: <20250610-gpiochip-set-rv-net-v1-0-35668dd1c76f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACQnSGgC/x2MMQqAMAwAv1IyG9CgFP2KOGiNbZZaUimC+HeL0
 3HD3QOZVTjDZB5QLpLljFW6xoALa/SMslcHamloB7Lok5wuSMLMF2rBWDGy3cZu7emwDmqZlA+
 5/+u8vO8HXLWAMGUAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1195;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=KwxEa/uJuk3pJvTN2X8lujDshvrYOWCdkyKc2L1pS/I=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCcm+33A95fkBlAJxBo1vos+qspK8wslT2V1V
 Wh30tXt2cyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgnJgAKCRARpy6gFHHX
 cuYrD/44rRjrB6mmO6/fNfGeJctkPA103u6ffSW8zmiUHtgIJ5B1V5Qasz+jhTr2tg3lUTCnbYe
 w34O88SipckwpEJoWpdvuB2hboyNKzPQQS1WPa2E39MYGaJw7fYPsbvFVVrtxBCZ7RzWFExW3MQ
 3TOsO1fEzH+UzzX4LwNR5DYvCTbc5uo6WA/tYEj2Cf5UdkI3ukiMfJB3cxEaZgW1Xhv0oVIOX0C
 NpnbvH/9zY+5TwvO/xjSNoOdxotzl2H05KRpJ5Aa5WaeU68D/TlijfF/9pB3tsq0N0SK4uPITOk
 1nvjFoAGwO9zoPERN3DQ+sB0Tp5RHQXfrfpo11vUn9qqGhDExZAen6z8FlYixLirLMdzj+UvWxj
 XBKO0O1hoZfuK4ZHjVYa5tdLT5ofLoIoKxVQd3n3UENerD2HXefvq4tvwtxQ4+MVk9r0Vwd8BZL
 dweZ0tHZ/7Ntl8kGYNe7A7JtI42JgVzJXVV/t3fa7pzQBU+ulPgswxTSNIeYXYxETT7g4cYWjK7
 25FpJqsQrKFCE9mZbAaj+kQt6QKR7ceIUa3pe0x5mnErUjbysE7QUJcphFy2dh4QZ+YpI328z8P
 Z8jaeoUcMeTqO8wIjnMJV4NBzsCznTgTgvtZ5EFwA8JfF2IN/tWFT0I8wKy1PwzioUBgGqzP1R3
 QGBdUz7g9snOoDg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_133802_958556_F5FF52AA 
X-CRM114-Status: UNSURE (   7.97  )
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
Bartosz Golaszewski (4):
      net: dsa: vsc73xx: use new GPIO line value setter callbacks
      net: dsa: mt7530: use new GPIO line value setter callbacks
      net: can: mcp251x: use new GPIO line value setter callbacks
      net: phy: qca807x: use new GPIO line value setter callbacks

 drivers/net/can/spi/mcp251x.c          | 16 ++++++++++------
 drivers/net/dsa/mt7530.c               |  6 ++++--
 drivers/net/dsa/vitesse-vsc73xx-core.c | 10 +++++-----
 drivers/net/phy/qcom/qca807x.c         | 10 ++++------
 4 files changed, 23 insertions(+), 19 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250527-gpiochip-set-rv-net-9e7b91a42f7c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>



Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71CD1C5B552
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Jun 2025 14:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XTr0inICqzQ40JhWVH9IpfJkMwVhTdLoWQ78V1Jjb84=; b=ZnlaE2dtxjqWyhSjCbFec7yGHQ
	Ty1t/bZzOqOgKUafckzaR1nSl1Pr1pnknThb5Te0PpxrdDCiTtSBKPGUm34osAVSO53CGjJ14e8Y0
	KF/Sh/Z0rp+7dvUhcJ1/olkmmBxjVndngf2xsNe0LbhjQ6goQtPpUct0IomEHf8LMBvza/U4Q+b5F
	3TgJUeKpof3vfbDritLIclnFMps74w7bRyN25s5tfbAFDYMf268wy2ov5k6agU1iF5vnuUC64am7T
	r8SHdCbrDPuPed+247dXPNu662zZJw+LgRASITCpqYLx4BPO2Z0q0uaXsjIvd70Zdvo0KULjdV7qd
	RDcwz4pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP02e-000000078YT-1trk;
	Tue, 10 Jun 2025 14:33:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyEz-00000006nMJ-35Od
	for linux-mediatek@bombadil.infradead.org;
	Tue, 10 Jun 2025 12:38:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=XTr0inICqzQ40JhWVH9IpfJkMwVhTdLoWQ78V1Jjb84=; b=WXerQnRLXdjXZHBExoxF0dPXGq
	4wJ257yWJZRG+DprXgClpxxbDiujMg6BNbQjPjvaITF65DDNpssX7WA7/0sUsW7r75gSmk38MCd0v
	l01DJC2GK0t2TLjlqfkgjKUftrRH7xG6nUMsa4DmbmygazSacteFR7o1HMvI92zhPXfr8kvuoo0UV
	K0Gb5n0lN2XYvJjh8BNya2/jyxUWjlbARj2afqTYCKjK5Col8ml+bWwK/C4e+1m0kA4oTmglKIUsD
	CVAnGE9vGUcVdZ5d+curnEbsujLNP26ZDN4DLYjX3NVIpAX4BWANdOdcGDLSc8RcxgZBcPkg723iv
	pPd0agTg==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyEx-00000001owi-3OcS
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Jun 2025 12:38:09 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so42063835e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Jun 2025 05:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749559085; x=1750163885; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XTr0inICqzQ40JhWVH9IpfJkMwVhTdLoWQ78V1Jjb84=;
        b=gQMvu/cbUzxn+1MffofmS+6fbOaau4Uh/F2g36kMTo7pZwtnJdktZPgSzLu+f/naCS
         XMIAguTI3VwxmEmbGKeq3luB6KfnXsIaBKWCAGaisRrO6fRXap6n/S6Ainl5F1ZQ1fOr
         tqAp1sHgld2l9P5vjs5dRX0gRhOa0fYNtHi4cOQCw41LzxKQjfl+2eHb03RJAGrUHksx
         G0OC9TaVdH9tzqqyAMtbLrAJ2ETe0NvsDbF9vzPHdIP9d2NWQTo5V+O4/iGoDGV/kQ9i
         JjJJgOcexhAs9+vNp64pxxtGItsF/dA804suE7dYvofwRDZ99yGiilJNM/ycz+piDCyG
         06zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559085; x=1750163885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XTr0inICqzQ40JhWVH9IpfJkMwVhTdLoWQ78V1Jjb84=;
        b=CK/SLhA9+UHtcSbqQZzxTt05/u/eFZhLqtUlUPufyzdbN0UyKbB2+UzUBBB2YIOPmj
         +YxvfcyUTjlCgVn63VOkkKeKAQ8H53PrarQRWCsOuudGCWH5ABX7s4HrF3YTr4gstKjf
         lughOPea7gRgLhjn3TD8zbmCTWVJSTg9sSdmkQDysDZxDKpqa2wC1SgDs5Y9TQvclIW9
         EFpVHYXJikEBAFRy+Vj+PjiSpiZPgBA9ZuDYIRNWIGVHq2/U/3RFrxaiQlfXEKHqB2Fm
         U06q5VU6QoTPu064Ma0H/zCrQr3UnFjAhW6gvWWLFZAR0LEl1v6YErRcJ50AS/wsp5N2
         SpaA==
X-Forwarded-Encrypted: i=1; AJvYcCVQ4VD8ebfZjYyEp1y+stC83KjiGW/AYOwM7QlGuL6YTt97JMwGDVLK1ii87eptCXnwym5Atg4vP5CsGSIJeA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxsSKK9uhGxI0O/3+N+wK8TemnmJUcz0mwqpa8wBTiwsEqdpdVg
	j3NTF3ZkW4eHJwC0LvkCq2AO9btp/hNNNCHTVGqUPNZucxDqumPaV+jZ5heoMaM2JNQ=
X-Gm-Gg: ASbGncvE3xQNU9h1u1MtaLaKVnRUZD6u1GROT3rDUw7YJvbt4k9sJrZxlFF4vuqNShK
	28uHOqUc9hyn5I71TbQiMtACovuGWSOjVn8DoQWUFEhpG5zTnffAi9QGL7ZYz3KUhPLr+h1h6jy
	egfsXxpyu7c0uCsGjDEBjOWE5bqFhdqVmlUMDUd/eCcSn8IH7yUT+ZCw6bK5YDQIRHkJeQW44xB
	Mny3Gz1imNyBwAZ9JOgh5/ctb5ljCdfFY9Z6WxljsRfmJ6/4Tecwvl54qKXdtaES6fWFRDnoV5U
	1EmJeoj4mFHRjAf/bOeZrcqj0OyN3kzNqqgQHk71/3z79TOMWExq7nay2nhklIMA
X-Google-Smtp-Source: AGHT+IHzFp5JvTZ7l1OpOejBOEwCS7yH077Wpi4SDtJY3ulJlf0B+102s2G4CnPyWgM17PCQBMBlxQ==
X-Received: by 2002:a05:600c:3ba6:b0:43d:fa5f:7d30 with SMTP id 5b1f17b1804b1-4531d00c453mr31747955e9.16.1749559084818;
        Tue, 10 Jun 2025 05:38:04 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45213759fb2sm142476805e9.38.2025.06.10.05.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:38:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:38:00 +0200
Subject: [PATCH 4/4] net: phy: qca807x: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-net-v1-4-35668dd1c76f@linaro.org>
References: <20250610-gpiochip-set-rv-net-v1-0-35668dd1c76f@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-net-v1-0-35668dd1c76f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1888;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=MAnjKHaMoYF5O3f5BcIOHcEhF8AXjM+PNGzo8Pp9cg8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCcnC1sEIoktf6UHY2MqMzPGNw9DXFVujb7Kq
 dZR+XEf6QGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgnJwAKCRARpy6gFHHX
 csmrD/99f0lIH+W3DfmoJQoGq0LOeqm5buMf8Ch/sw2VizC+NzZBIJnfGPUt6/dMjtzjqFKZdUb
 PqOQGMYAyle/pWuVoS4rqbX6Y6Ct8op5TOVgYw9OJ+Vm2+tpdkJ9O0RGKgPLqidx7WxmDle7eCD
 Ce0FNDGVTnCvEjLlAbUVrnLvH5xp4/5cyi3oDa8DofuWMhbtpowOpcSUHjjAYgn8/lqKl0yz7NK
 g4+uyOJHPYWep1Kr/L1SrDH9reI0B4lnK0N4qyTTJJ1df0JoWw8ZludlKXfa08juZk3BWprkwLT
 Gsri56yEFWJrig1ad/dfL2ME7p4cayZQ2InlJ2uWZbiGhGJwe5XoNfi2bCo45uqO+1F7Nnp8KAA
 3Zjr61t3T6+FauqS5RAzKMjnBDsccpotbDB0oBQjUG1EdBgC8TvAxyy56FujRh8nkIBU1WpJLrz
 TfBdZ+mmrfbnvrNsiz/KAq7yaVOLRltW1nefhvGjP09tnqCEe0vQCK1ENpBKhTb8QoFG7b0x+xt
 AyD2DICy5a6mUUWRrlXQAVlnS2BJ+f8s8pHm+EWr5f52gyithh1/FwFo3LJfiDJtEbzo6+XAer7
 wnx7GBla5W1pPXIf9AI9UPcP0lHc6ECfA8NLILvEcgdNI1UdotkBPEEyG5PhsMMgZa+INZbIV7j
 Sm+SNOSFlvaCYpA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_133807_889565_FF90CBE9 
X-CRM114-Status: GOOD (  12.48  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/phy/qcom/qca807x.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/net/phy/qcom/qca807x.c b/drivers/net/phy/qcom/qca807x.c
index 1af6b5ead74bf615ad155e396b0ecc6fe5636e8c..bc480710c2bd27d621dad3b5595f0a292a4c72c1 100644
--- a/drivers/net/phy/qcom/qca807x.c
+++ b/drivers/net/phy/qcom/qca807x.c
@@ -377,7 +377,7 @@ static int qca807x_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	return FIELD_GET(QCA807X_GPIO_FORCE_MODE_MASK, val);
 }
 
-static void qca807x_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
+static int qca807x_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct qca807x_gpio_priv *priv = gpiochip_get_data(gc);
 	u16 reg;
@@ -390,14 +390,12 @@ static void qca807x_gpio_set(struct gpio_chip *gc, unsigned int offset, int valu
 	val |= QCA807X_GPIO_FORCE_EN;
 	val |= FIELD_PREP(QCA807X_GPIO_FORCE_MODE_MASK, value);
 
-	phy_write_mmd(priv->phy, MDIO_MMD_AN, reg, val);
+	return phy_write_mmd(priv->phy, MDIO_MMD_AN, reg, val);
 }
 
 static int qca807x_gpio_dir_out(struct gpio_chip *gc, unsigned int offset, int value)
 {
-	qca807x_gpio_set(gc, offset, value);
-
-	return 0;
+	return qca807x_gpio_set(gc, offset, value);
 }
 
 static int qca807x_gpio(struct phy_device *phydev)
@@ -425,7 +423,7 @@ static int qca807x_gpio(struct phy_device *phydev)
 	gc->get_direction = qca807x_gpio_get_direction;
 	gc->direction_output = qca807x_gpio_dir_out;
 	gc->get = qca807x_gpio_get;
-	gc->set = qca807x_gpio_set;
+	gc->set_rv = qca807x_gpio_set;
 
 	return devm_gpiochip_add_data(dev, gc, priv);
 }

-- 
2.48.1



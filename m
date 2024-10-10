Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A05CD24454
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Oct 2024 21:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fUDTsje5EfzdoMuNeif+3YwfWRAgSWK+tp+b+is46Rk=; b=2i6n2OVf3oIZim5XfpZONGda9G
	aWwbnyKRI9SuMZJEI/MGOwhLjhp+RetWAqMXR2oFh/DMUZAhq9Oi1XiWQbNrMvyIpapqpgo7mp9DI
	8O2VCnpdTZgu7QXpcYCeR6Q11oJH5OYhe5OH/lGPcIhHfy8xmy2esZYiNerrikiCIXpOrrGBnmDx1
	UqSLFEd3I8quchi1uNERQpKQQjEHy6D6p65K/lSwVSTuSbmEYv9CsCMlxBFiTMgsel1QgpTaRxK2d
	7FumodGMHmDQ9QR/4AWMMPvrFCDM4oWasQCP2M0u/ztnPkG3GaH+x14ktkoKEL22tpdO+pu4rFJ9w
	2Z35xYlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz0tT-0000000EQu6-270G;
	Thu, 10 Oct 2024 21:40:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sz0fu-0000000EP8r-3n6B;
	Thu, 10 Oct 2024 21:26:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=fUDTsje5EfzdoMuNeif+3YwfWRAgSWK+tp+b+is46Rk=; b=qalTHx/iUCw3C6/CCRfu2etpWJ
	rvYKjKu71G1sh9YBldQfIvAHH0kIltb5EJx65oNT4V6Pg9IcefRYR+BSDLm9k+ujsk3qRQfM6c6E1
	D5qgfZQ7zlFNcdaGBAg25jvoPu2Jt1AFVtTl2tPkxJuEQhv1a9sjurCsaVgr0tyh9/2Wp2HMenaux
	JpcfpaWMu+K6QL5tA4rwppiSV0/AmP+fkd8E3xBBZ4N5xq66Gilxi4oEuBfZGRD7/wUoIQZfiEARq
	hu3XRid7ixiqRofmO1nXoK4tQz7bCZnI+5fJmSV59dRzQNzCQGR9pBdAnJ5RbCzaO5VISwrUSeohM
	TrNNdqVA==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sz0fr-00000005ffD-2FKf;
	Thu, 10 Oct 2024 21:26:21 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-37d4a5ecc44so767200f8f.2;
        Thu, 10 Oct 2024 14:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728595577; x=1729200377; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fUDTsje5EfzdoMuNeif+3YwfWRAgSWK+tp+b+is46Rk=;
        b=a53XYebZZqXsyxdl8ooZSK7NYwsZUSc7MRUmmQKaxhvZBFTLtYKi5jYv6f7K+aGyVV
         TZci72Wuxikjyy8L5XcSKjNOFb2E1XP/zRha/o7a+KH6YViH0wyKR7qU6jx8Xg+ulaoS
         2ymXQK9WnnXJMYS6HZC3cwSdWC7/touXQ27Jrv5+3WDLxgJF7vsnk0bgpA8cbSgxZwMj
         G9p1qIDX3c1G4kDeDRIdKSpJgakJjzGO+HO2noEOvzRNkhp+Ohbxt493faNnyLdNYDoa
         gNEJ1GBzkqg6+VUDUIA8jionSc+g7I6PyzzNbkHVGYJRaU5nHM2gaGPOxkXebVrMIUj8
         fm+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728595577; x=1729200377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fUDTsje5EfzdoMuNeif+3YwfWRAgSWK+tp+b+is46Rk=;
        b=T6/l06z0p25cnhvdyyPsWV58v86hjO3kbVMf11QwnvLSBT9hJnxUwwPdZ2mjfTaUBJ
         RZmlEA50CdPxRwkIUeRb1k1SMLokuxmSrYO/xcfsdqHoN3rS2Kn7yx/gsLyFpEte67rZ
         rwmzNRZRLJZyGZBjwXN6o7MtTw4OZvW92/3kiXGlvRiHlvDg2OXRbQI6KO/p/po2nHlg
         VsphdEJff7RK8TFhb3b33mBYppCHSfhXxawNWQt2YfN0Ra9+EKQ1D5MT+18yD53LN0/v
         F72PKQTmM9ZHcc2A1EZTVLJaTT2u2xVCMdXbcENnHIBQZIofUSapsfAa1S4RFzi0LgfB
         7gdg==
X-Forwarded-Encrypted: i=1; AJvYcCVAuH9WKQXnndZPGc00BTb1ZMzZXyx5jpC2sptv7PRffZ9XKbh/2sJQ/6GqUb7QWN+0nLfBFAchPhxuguq3E7hs@lists.infradead.org, AJvYcCVGOX1W+FC7XpSa4c42A2ww7J/x/4A04Ud0aYDjZyAo/ubRt4+VlxWAxSo5zvhWQLguE1epES9ML7SNX1HRi4A=@lists.infradead.org, AJvYcCX8P/cgaqVE1yMYemM+P+SvXcGHf3biNvq9scanMksbezZi2CBtfn03wk67ZGX7J954LpBiZs8QCQBnLAHsBmUZlA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3DRDF6/BDUe5dVJNgcp/n9qYpYET7qAkkWIFgsbN7DcQGJBEd
	6oQ46pITuaj03Q6GFarJbc7Xp1kY5LQof4U62DUkkkT6qYpa/z9x
X-Google-Smtp-Source: AGHT+IErfYIIobd2OyStqSYzXYY8mQXAN1McuuX/JaESc8XSKGTQGWz4nicjCFOz7wSr2wv2o2OOOQ==
X-Received: by 2002:a5d:6645:0:b0:37d:4e03:ff86 with SMTP id ffacd0b85a97d-37d55313314mr307553f8f.49.1728595576937;
        Thu, 10 Oct 2024 14:26:16 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3d08-841a-0562-b7b5.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3d08:841a:562:b7b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a8940sm2402083f8f.6.2024.10.10.14.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 14:26:16 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 10 Oct 2024 23:25:58 +0200
Subject: [PATCH 08/10] Input: i8042 - use cleanup facility for device_node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-input_automate_of_node_put-v1-8-ebc62138fbf8@gmail.com>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
In-Reply-To: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728595555; l=1046;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=osj1On2Z4WQ2i4hQXIWGqEGjGF6nBC2nMsxNyB0VvTE=;
 b=jnKPKqCaHxm+V0jnKxBl/3/ALs7b4E092gZ+6qqIEjdd4p92lVndVLYBkmFyIyZ+Riv1vvWHl
 EyNknbnL/FjAys5GQDIwfXUWt02P6ak3U6BA9XJn0TyCcEaSZ5CS/sI
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_222620_075183_293AAC88 
X-CRM114-Status: GOOD (  12.32  )
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

Use the '__free(device_node)' macro to automatically free the device
node, removing the need for explicit calls to 'of_node_put()' to
decrement its refcount.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/input/serio/i8042-sparcio.h | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/input/serio/i8042-sparcio.h b/drivers/input/serio/i8042-sparcio.h
index c2fda54dc384..8f38b6f4ae77 100644
--- a/drivers/input/serio/i8042-sparcio.h
+++ b/drivers/input/serio/i8042-sparcio.h
@@ -106,17 +106,13 @@ static struct platform_driver sparc_i8042_driver = {
 
 static bool i8042_is_mr_coffee(void)
 {
-	struct device_node *root;
+	struct device_node *root __free(device_node) = of_find_node_by_path("/");
 	const char *name;
 	bool is_mr_coffee;
 
-	root = of_find_node_by_path("/");
-
 	name = of_get_property(root, "name", NULL);
 	is_mr_coffee = name && !strcmp(name, "SUNW,JavaStation-1");
 
-	of_node_put(root);
-
 	return is_mr_coffee;
 }
 

-- 
2.43.0



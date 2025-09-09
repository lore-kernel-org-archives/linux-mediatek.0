Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99A2CAC583
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Sep 2025 15:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a7pQfDGCPblKxfSBCBsu+k2H7lASoalxBm+PQPOef3U=; b=4/bilnB0g1P3ltsONe1dwDcWPo
	9gsnk5+PvOij7JrqDsvcKRMirdn7coUltBXcY7g1kVfZ+y3kb2PG5syy8a3bKhpcMACV/npMB3lBg
	xWjF3dzRv3mnI5ZcvQ90k6HnWayOgy93hVj5s0QpkmFNzpkcap+C/aW5x7BKKTn518XHB0cG7SwBl
	OjUrUD6YohLUafyLFDEp7hcnn0dsckcTzzA5P9u9XHjB64FMb9z2btYCebxzHHzg5DOX7BPVTZbaj
	KbnImSf+oOvDHB9cRwkNP7O27V9W31lNHpBpbd9PqsARsmLft9JgUpPShnRkWICcWbwSy7rQdHq+p
	tKPO/Hwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0Pf-0000000881a-22D6;
	Tue, 09 Sep 2025 15:37:44 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuS1-00000005sTH-1ZZm
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Sep 2025 09:15:46 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3c68ac7e18aso3372787f8f.2
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Sep 2025 02:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757409344; x=1758014144; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a7pQfDGCPblKxfSBCBsu+k2H7lASoalxBm+PQPOef3U=;
        b=oDMzmBa6+iR/9wLwCbynqNf6S8Sk6QivcJiZLjns4++qiM85QwJsJoGyIZVHaL6U9q
         CaPHCTrGUmW94P23Tex+GPzuboGvRxUDHHflhRPZ9bzDh81y359mWLMijRFEgn3rda0Z
         i1iPqyFiTF8K8LAnVPBwAOvMW9ZMrVK3fHwnGATsnbvfKj7ITLLkaVF5nB+d98mGhBJE
         46O/FJ/XHrh7xhqF33biiQVaQ6LHwao8uM9CK9ls9N5Lpf4iRoB+8mSKPKEUO835k/EM
         CYpjA9269yus+kZUkNoqRWw8gUn9wG37loUJQ2syT3HZ+Vk3SNcX5gdmvTjI3o8V06DB
         XJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409344; x=1758014144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a7pQfDGCPblKxfSBCBsu+k2H7lASoalxBm+PQPOef3U=;
        b=wzZqnQqY/Pv4THi2llqqj/lUBr4xdWst2Ui3JDvJHZu+oolklgb4dlZRhy9S4vOJU6
         zX44hvLP+5SsRz8SYArkk+ZmnPKNVU9sFA3oB1LFMzjcmqWsV1FbLbOfyTiuta/HL+bL
         WVGNMjNlJi844yLtpUBxOOUeUxPRFvAfQWQXPpd7yTuQy6q0cU7xO5yg6ewtF8nwjHZC
         v6DruD+ed8AfP0Ly2b6h3257PCc0ItpyZRs1/JheyIt3aCb1+b2r6H/yCit5E7cH9sYI
         ucC+jpOehGgAxRJxbhpJVs+lveGbuLfnVJovIwp47V53RzsGqL7OHhnV15PbZsiflNvh
         Tk9w==
X-Forwarded-Encrypted: i=1; AJvYcCU/rvvW8yxrhztFi80zPKfRo6RbA8ICHtOUDpwdfM1t1DmPVsQxYbCT0v5EPR11KpI2G7NxLt66deS8td/QLg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxSAIBoy7hz8w9d2NXAPtHRJwQt5dIYaybzQcNeMQozmwFpQFw8
	9XZyxxyaHD48HJr6H7zM8yzTJQdg5kRJsLz4hlm/pFmeA+3mpTClPloxXbwmm7clb9g=
X-Gm-Gg: ASbGncsxMZNLtVG4dVVy++jGRt72uWVuMguUfk/1XWk3fyyuEj8IOQ61bhcFlBFTPBY
	iZXmAJFX1LAYTI6w+UNbY+jnN4gCUjoXpzD+phQLbACfWIb7YnDYZlfWmAaz6OoFJEsEyrdBrwT
	3+puRyaeIgw+9rZ0KNBe7ZKVx1pLHhtTo4XwgvHgf/gPyjCTM+KHca1UwhJrK+eFZVkFFD0P9tm
	KcFIw5Ma7RewvONVTQyTvL+wXq7mPEKdPT6PcQ+dDMu0//oCNCGtGTf4me9ArjFg6DSmG5KDHtR
	961oGnDqShDoYXiG9bhWml0zAyEWl9ctnlSoo/NHrrYSOCCGahtVRu8X6JVJDm2f0kLwzyQYS4y
	Khc+utq+UIw1xPF5w3Q==
X-Google-Smtp-Source: AGHT+IECDvyJ3MhP86HfNBVWgMSE9naIJTJZ0ycY5JDb9n5YXZLF4Z2JGvdK2tqbA8o20swd57M3IQ==
X-Received: by 2002:a05:6000:40c9:b0:3e4:bec8:dcd3 with SMTP id ffacd0b85a97d-3e64c1c2d59mr10736450f8f.42.1757409343760;
        Tue, 09 Sep 2025 02:15:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9caasm1900039f8f.19.2025.09.09.02.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:15:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 09 Sep 2025 11:15:28 +0200
Subject: [PATCH 01/15] gpio: loongson1: allow building the module with
 COMPILE_TEST enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-gpio-mmio-gpio-conv-part4-v1-1-9f723dc3524a@linaro.org>
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
In-Reply-To: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
 Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=739;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=iZ4PlFFkHvr3VSD1LivXtszs5JdORDU8d2OKjqzKoYc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBov/A2X122vy1cTHyhSgsG7MkIlsciNRM8ZFaAn
 T0KGuq7L2KJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaL/wNgAKCRARpy6gFHHX
 coJPD/sF2yokXt5SbcL4IYbnNJAAMtC0yciCVu9NMg4HOIEJbnJLMgoDU6f/Lye1GJHoJd/r8bg
 psxEzWVypKMAKXC2sb+CSVVktqi2LrWPd8WvjbD1w2ncKGKzuoVyrAB92tWBa1NfLh3OHEC0/ku
 wXBtt25qo0HmUF1tPPNUvjxgq2bP9TIbQyvUarSxnG1iQ43oZqiFep6k+G/aSkGV/eXl9TU97AV
 RiQxqO1JzL7fY/XVn+T589yE1pLjj+axt8MR7YyrZIyTlTCZzpRhxzrT5TOcFcBXyrdQuaK4G8S
 JvZcqp69ousBbMjF2RCkf6zj9stt/FPHhc+NIVzaO/+3Sa8+ozpD12cukCkwRGN1QLu8gIdG3B+
 7GobaI7NpSdG8YFEC2lE+CIWQTVJpeopaa/MVfsBLom8dXS1rNZSHXTXXExOTkQne5Y8oRI54bO
 dSblAGdXRavGi6h4oh3itiTfoSZ4M2+tv/WBS0fg0FbvwFAs4Zzw6lqS5iigmBx328VHt10DT4d
 p3OpeS4s1QtcpZmXPa9n3iQz4eK+u7bsgZALZlItLZr+caxJ/Q5lFLxgMJeqxzV4cHRROk2u17y
 qsz/m/yy5OZlZLgQ7uwBNunQYNBtvrqCQsCUhjR2JYSvEf0IrCHidjQP2VNeU9r0zEuIV4zBpsJ
 WMI3XWLHsq/gdow==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_021545_534928_DCF9CDAB 
X-CRM114-Status: GOOD (  11.89  )
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

Increase build coverage by allowing the module to be built with
COMPILE_TEST=y.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 31f8bab4b09df1640c892f4d839860edaa2ad6a3..09cb144f076661e0a2069016175d0692257fb156 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -885,7 +885,7 @@ config GPIO_ZYNQMP_MODEPIN
 
 config GPIO_LOONGSON1
 	tristate "Loongson1 GPIO support"
-	depends on MACH_LOONGSON32
+	depends on MACH_LOONGSON32 || COMPILE_TEST
 	select GPIO_GENERIC
 	help
 	  Say Y or M here to support GPIO on Loongson1 SoCs.

-- 
2.48.1



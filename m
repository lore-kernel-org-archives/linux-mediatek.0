Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB501CEBF61
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 23:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NM+8ic/Px3mQTsuCcs62/53dsl/B3jVBAf4+IMQjl4A=; b=MqxNES60ZQI9Z97nKcLs7IuWD5
	7OGQ0JRSkwqmu0P6C7M2wlTDWo8aYN++sy2uToXFOl2tsjqROi7q2f7tL75v6oxUVdxGdLYxNVm6o
	/u3I8N4VKUXT0GzbnWMPaIIRnxPPecsQnH/AWMu1On38SpwCv6/R6IRjbe8DVzzy7Q9UdxsGMfOGi
	vuidP+TfioyCHuk1Lj9thmI6faNMJrT4OODxGxP+LOGQWAj5sV35FwTsmpz6VI8uFVoG3Xcn7YGb0
	JXHtZqrYBz20hPfaa5UOwBOzG44cnuRCaCoCEy1mzAiXjVoM58ttgOxDNgJN6QSh3J9qawUafk/tD
	3pFASI/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sty8I-00000009cyX-3TuM;
	Thu, 26 Sep 2024 23:42:50 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stxo3-00000009Z6m-121Y;
	Thu, 26 Sep 2024 23:21:56 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5c5c3a1f474so1584782a12.0;
        Thu, 26 Sep 2024 16:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392913; x=1727997713; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NM+8ic/Px3mQTsuCcs62/53dsl/B3jVBAf4+IMQjl4A=;
        b=ejSzFDOMLLXVhan//VTgqXkGGxZ03kYIhH1zNxPbqe6xX120ntGGGjRcUZt6MhiqeG
         D3vZg/aqaFs3W4w8GB7af2fFj+LuM7utnXV/gADcT9OOeREBg/cqQDNqxJGupRNhHVnY
         HNnKCajSk4JQfqrepOQ3ZvjCoqebMwHh9bXlM0cA5z4dGDSDGKn3Q5MPmEzDziIBT/1F
         /SVwlvS0zgfgKRPy2psYloQ5mNT45O1prZBgPrLTMUk9ivUrfM4ysvUdZnJvXEABIZY1
         2/3SA5otAodDlYMlDhBOcmrtOCsn/pTB6U97jIc1QpZHVaELSkBtUROr0eoS+S0gkC0W
         fQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392913; x=1727997713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NM+8ic/Px3mQTsuCcs62/53dsl/B3jVBAf4+IMQjl4A=;
        b=nqIt7XBDcTARgU8v2y4HHQ9ENP4A/JftADVeeuXtxCxxqXcRoCNse21opdpRNdG1yu
         MP46yxjd4xuhjHHqnS2L6T48zlSymCk8M7J0+RmrK5mSbLT1yNfiXstkWNT5Yw47k2Cy
         iw7xzPmguFLQhOhVvGpWlwrfUymmbMBu+wFM/VS7EYpS3dYhw7LZkUF9BOaQGOSwA6MR
         xJiea20lHZj7q+XhpcKAFdTsdndVW0JO/hDylqFO2wicas8y9V9hj25qylzIJExxnfks
         hbkEevOCIY0qvAE3sqLkfRWdcj2GnxqM+eJGo+p+VN+6/ZN90dez3MyuaMIFF4VN+3+t
         sGyw==
X-Forwarded-Encrypted: i=1; AJvYcCVIWtJzhGMZ30w6qvGPRSO/gCc8IKJz2+mYJLIVsL0mXp1zpt7fHsK/EjpbLmIw6sJZIac2DpQKVYMvuzIQL+FS@lists.infradead.org, AJvYcCVORfyEspMQjkbIV0uXoqsl3wOm9h7KfFiGspwlcG21npco4eNV4SNtXfLOYQi7w6ntYNiYkZ8piG6aTxVBqA8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzJIY1MjDpQf3leYXrZt/KqvPZOAXmTYf6GVC6UZ5gtXmtzyFDv
	mDFSBGX0ap4lb6oFwpUjTS89nLyJ1YbUbY0pYANFPXXbRky3oPMl+MqZIT2B
X-Google-Smtp-Source: AGHT+IEjGS5H1uM127zHsUDENMHQP4peBo2B0LKYmvOBCuq2OU03bEqMYA+oUjVvyxH/GoEWditQPw==
X-Received: by 2002:a17:907:1c0f:b0:a86:aee7:9736 with SMTP id a640c23a62f3a-a93c4ac9334mr83767066b.46.1727392912970;
        Thu, 26 Sep 2024 16:21:52 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:51 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:21:07 +0200
Subject: [PATCH 16/18] leds: tca6507: switch to
 device_for_each_child_node_scoped()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-16-95c0614b38c8@gmail.com>
References: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
In-Reply-To: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Gene Chen <gene_chen@richtek.com>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=1443;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=uZ6AU+qHxNHc+7ZSbOLvFpKS951bl9x9VeT+GuFOE+o=;
 b=NGlWdNHQgGpOwQAC3L9GY90Rn3MtzUIW2LrL0gjOsK+kWA98v8Pom7eibl6iKW9m1g68g/UJo
 C3/17jLgkcHBEyM4LlOU2NTx5/2Qx+Dapk5n5sfsJBSp2CMoP1wmmcy
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_162155_321516_21958044 
X-CRM114-Status: GOOD (  13.38  )
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

Switch to device_for_each_child_node_scoped() to simplify the code by
removing the need for calls to fwnode_handle_put() in the error path.

This also prevents possible memory leaks if new error paths are added
without the required call to fwnode_handle_put().

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/leds-tca6507.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
index 4f22f4224946..acbd8169723c 100644
--- a/drivers/leds/leds-tca6507.c
+++ b/drivers/leds/leds-tca6507.c
@@ -658,7 +658,6 @@ static struct tca6507_platform_data *
 tca6507_led_dt_init(struct device *dev)
 {
 	struct tca6507_platform_data *pdata;
-	struct fwnode_handle *child;
 	struct led_info *tca_leds;
 	int count;
 
@@ -671,7 +670,7 @@ tca6507_led_dt_init(struct device *dev)
 	if (!tca_leds)
 		return ERR_PTR(-ENOMEM);
 
-	device_for_each_child_node(dev, child) {
+	device_for_each_child_node_scoped(dev, child) {
 		struct led_info led;
 		u32 reg;
 		int ret;
@@ -688,10 +687,8 @@ tca6507_led_dt_init(struct device *dev)
 			led.flags |= TCA6507_MAKE_GPIO;
 
 		ret = fwnode_property_read_u32(child, "reg", &reg);
-		if (ret || reg >= NUM_LEDS) {
-			fwnode_handle_put(child);
+		if (ret || reg >= NUM_LEDS)
 			return ERR_PTR(ret ? : -EINVAL);
-		}
 
 		tca_leds[reg] = led;
 	}

-- 
2.43.0



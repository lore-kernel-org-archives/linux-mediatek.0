Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71DA2CEBF60
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 23:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RKtvZEPDH+fIZPKBCRGZ7MZSFbm8PGwqKLmwiboGd/E=; b=rwbi9nvptHGsJg8D9Uka1kvdNV
	6zvIpmcrP8QFhXdEcwBPnL6Rz1MgZ7dv6dtRGWTaQ+41VaHfn4gNNa1tfmE9YN2xoJtiePEfjAu/y
	qWTVVnIDxanstqm5qWPqjRD13heUmNIfFwjFlAQZ0fWAsj8Wn20LMxQIgltLKGjFbFrmiRVEVQbq3
	DzSL1dJzz1qAYbHPddahefhp4EQcQK4/hCqDOH7qJkuAIdmdaz0pPkc6M2O0VHSKVQcSf7XnG3uXl
	mSBrt3gS6Z7sqH/isG53/eSTg2B4XavffAXIC/djzaYG3z2+1hKqWrc71xEDpXfx6o9Jp706bdEKJ
	iU4mB4wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stxva-00000009aeA-1xFh;
	Thu, 26 Sep 2024 23:29:42 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stxnf-00000009Yvj-3CUD;
	Thu, 26 Sep 2024 23:21:33 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5c71f1396e4so1766473a12.0;
        Thu, 26 Sep 2024 16:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392890; x=1727997690; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RKtvZEPDH+fIZPKBCRGZ7MZSFbm8PGwqKLmwiboGd/E=;
        b=Si0mEyGXSYqo2UeT/D1Nr5qLQHaDwAP67Uca4Zbwgi33WCixwiwvSOXotCLmToBnG4
         hVq+nYiLiqLnXmV0KOUmkmI0EBKP1saDjwM6kDe3WfNl9UUI69o/tW0glLU9nK0ESyB9
         uLKdVyCvGChMDtMQDQVOiRrNtDecqMV1xnAJlX82Q/I5PRn1gpFp9wQo0yjKuDAkC33k
         MvGPFvLQYsYGXmEUTmL+R+hl06gQ3UJNiDKKBp28D0NnviPDsEM4c6YXaBy49nYZsXm+
         cKDUg1Z5xH10rDQFRdsz+JBpCr1B7jmAnoDf8ms7wHiRw5gz8YjZ2zk0QXQVpeNe9VYu
         PRVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392890; x=1727997690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RKtvZEPDH+fIZPKBCRGZ7MZSFbm8PGwqKLmwiboGd/E=;
        b=Io+XgAu2fbPufmLqkyVgUiZgYupy75HcH5xtLyF3FKlz1c41HHtsy2BgJCdDOXre+H
         M0QVDPjFok6KeEkyvAWYxiKLm56TVhoyzYT7jDXhR/YDoN31obkysXXkh3Q+8crQb/up
         zZM4H2E6PYrX8uNnJg0y8YZFp5wzXx8LV85CRkgHdZkAJdc76RWnWYCM0alBahC1DBAl
         RmrNFs7T4fzCA9abVru2QgdkA6elb9dhDaAV+nlwQBU348hpiO4emXM/ov3jGJyuWqrQ
         sbY45j5pmaoZZhySrwse9PI1ebTiVvst2C6uo8RwIcXylzFSKFUs8wVz1hcoKboUF3hI
         PmJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWR434Rd4YXktcSjIGlr71r3AHRRAqEkykuR35u8pz0NEbv0R/3qd6jJhlhmONbmDfMoCSsugaXg/fbTx5KsAE=@lists.infradead.org, AJvYcCXPoD96rc21jqktV2xn37vTUNFaaY+MaedRSrHycbzP2Euh0MxjMja2m78okVi02yWVDegErRZHl4wdnYkUrR22@lists.infradead.org
X-Gm-Message-State: AOJu0Ywb5GDKB4KU7475iwjPD5mF2uTixFJnH8W/50J37hpSzrJL4odf
	iCGcJANx9JhdiqMt20gf2ODlvsT3N8brlaqf1Qqzd0YIUWGuWBF39s+ehp97
X-Google-Smtp-Source: AGHT+IHjxclqmwCts53ey2Mkw8lOf7cm6f6r/L5Uli3GTjR48O81vxvj6U2y1w0YBmydxDpTTVPPDQ==
X-Received: by 2002:a17:907:6ea4:b0:a8d:555f:eed1 with SMTP id a640c23a62f3a-a93c4946d94mr84366166b.31.1727392889478;
        Thu, 26 Sep 2024 16:21:29 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:28 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:20:56 +0200
Subject: [PATCH 05/18] leds: cr0014114: switch to
 device_for_each_child_node_scoped()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-5-95c0614b38c8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=1242;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=ReP7Qr/J0AJ2qUDKb/L8HtY4TnwQiLgJ9A1DOQKpN7I=;
 b=jAh+BzDwMT0vn09JLTdN0MvzxhKKOiSKKW8O/GHNIet44fgm7ZR14Rvbw3/y5IEMMN9dMTqL7
 Q05KmODqeDkDJyq7FeIhBaMWdt9zpVsDxf2x/EqmSbBsNmsdTzpoi0R
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_162131_856959_CE0DE65A 
X-CRM114-Status: GOOD (  12.52  )
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
removing the need for calls to fwnode_handle_put() in the error paths.

This also prevents possible memory leaks if new error paths are added
without the required call to fwnode_handle_put().

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/leds-cr0014114.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/leds/leds-cr0014114.c b/drivers/leds/leds-cr0014114.c
index c9914fc51f20..7e51c374edd4 100644
--- a/drivers/leds/leds-cr0014114.c
+++ b/drivers/leds/leds-cr0014114.c
@@ -181,11 +181,10 @@ static int cr0014114_probe_dt(struct cr0014114 *priv)
 {
 	size_t			i = 0;
 	struct cr0014114_led	*led;
-	struct fwnode_handle	*child;
 	struct led_init_data	init_data = {};
 	int			ret;
 
-	device_for_each_child_node(priv->dev, child) {
+	device_for_each_child_node_scoped(priv->dev, child) {
 		led = &priv->leds[i];
 
 		led->priv			  = priv;
@@ -201,7 +200,6 @@ static int cr0014114_probe_dt(struct cr0014114 *priv)
 		if (ret) {
 			dev_err(priv->dev,
 				"failed to register LED device, err %d", ret);
-			fwnode_handle_put(child);
 			return ret;
 		}
 

-- 
2.43.0



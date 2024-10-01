Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F479CE7CE7
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 09:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6ziXpabWoT+cHo2FMgHSApxGngpcxDuLrv8V1LP1luA=; b=cLMOiBo/lpGeKkNJkzimcGNcNU
	erV6ZxWhofkeewmOMwhGuQxhojCpBueCnKCjfvUtEVmQwg4lAdFepdfdIhmj1UBK1rLFkdbDDrtky
	fIoC1lcThsSE122uIm0GaKyVxBywh+k1JQHfB69TYRx4fgKBfTaG9rytcUXdO8xK5JidVjOo6pTDq
	od9fOwSUt9EE+z/WK9bDGkxd0+wnd0pJ/KLB9laH82jF7DR03T0i3x0cPdqv8/6vrQ3yRkpzyR2pD
	EMFkyYkclKqVtqrZ51UM0p5PZCmzN45Q1B/JcMCTUitOFTi6RCmKNbQSulo37xXtQcjyybfVE+n1t
	Kq4pxl6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svZKs-00000002FXw-1a8X;
	Tue, 01 Oct 2024 09:38:26 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svZKo-00000002FWI-1b4A
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Oct 2024 09:38:24 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-20b7259be6fso24299135ad.0
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Oct 2024 02:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727775500; x=1728380300; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6ziXpabWoT+cHo2FMgHSApxGngpcxDuLrv8V1LP1luA=;
        b=deUSYpFJFAvjJD+Tt0kSbbUiyPkcNX9oowMCk6Whq5vIb1SbsJSerNYJAj6ye0loyo
         1D5mvVLiC+l1SLKUm9xi69L+XV/zOcV7pR+trkYpeA7I6f71MOdzx67WfWIUFavfBrPi
         Ll2on7raysebSuQqnr3Vnb5ZacJDy8rzvo6DE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727775500; x=1728380300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ziXpabWoT+cHo2FMgHSApxGngpcxDuLrv8V1LP1luA=;
        b=wV0SXLT4WV2l1lSC609DHYIgSqorsfwBdfjQmbMWifNQZwSPdM3O6O4ZdhRFJtUv87
         bz3383SHZ0vmtzJqdxy0iR6VFUzUY7Z5cifpKif458vpVxkAAAYM4KDdu5zxk+xWWT2p
         XPgqb4GHPa5cxsgkGcsLCn1mkFalM7+vsdb0TQDTsRZi5kY26yX9yoo1PE2GvdO5IeqC
         /e0HgzGWG1265OFiUBzQVvTSayUgwrto+rrNj55xSqEnFemOTgTlaPVTDLq36KLKeH0h
         7ioBMa+fqpglAHdjlTUqlteG/3iQ9HjI3y1MNyrBuh2CT/ayuSmrmEVGGqlwLLYe6ClH
         Tkbw==
X-Forwarded-Encrypted: i=1; AJvYcCVI7tbrjIk0r80vWncfDzUoGHfKyy8Rx40L2GZI9dX0pZnhusvvqHfvBbSdK8WdfE/VWNSS/jwlZhoDURL6LQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwkgG4rCjYpIIeKVieQUb2AAq9oYDeag1OoPQtHMDaw5Dq5nimw
	c36Gn9oUwuK7O5ymPXTzv4+JhffyVNyN0OX2gMZMlscpDyBsvtRJNYcYPyBvyCoK8t8bKW5yDYM
	=
X-Google-Smtp-Source: AGHT+IF24jB+QWOJMW7Lc40JtllgUfd6H5l1orvGNaAB/Xbwklif8b/5HjnAkM9TxmV3LP6xto3+TQ==
X-Received: by 2002:a17:902:c403:b0:20b:4d4c:43e with SMTP id d9443c01a7336-20b4d4c057emr188965825ad.15.1727775500570;
        Tue, 01 Oct 2024 02:38:20 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6e0e:9591:90bc:e522])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e5ecc1sm66591385ad.268.2024.10.01.02.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 02:38:20 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] Input: elan_i2c - Wait for initialization after enabling regulator supply
Date: Tue,  1 Oct 2024 17:38:14 +0800
Message-ID: <20241001093815.2481899-1-wenst@chromium.org>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_023822_468348_2D2EEEBB 
X-CRM114-Status: GOOD (  14.92  )
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

Elan trackpad controllers require some delay after enabling power to
the controller for the hardware and firmware to initialize:

  - 2ms for hardware initialization
  - 100ms for firmware initialization

Until then, the hardware will not respond to I2C transfers. This was
observed on the MT8173 Chromebooks after the regulator supply for the
trackpad was changed to "not always on".

Add proper delays after regulator_enable() calls.

Fixes: 6696777c6506 ("Input: add driver for Elan I2C/SMbus touchpad")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
This will unfortunately slightly slow down the driver probe and resume.
An optimization would be to check if the regulator is enabled already,
and shorten or skip the delay if it is. This would require a new API
though.
---
 drivers/input/mouse/elan_i2c_core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index ce96513b34f6..89556f61004e 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -46,6 +46,8 @@
 #define ETP_FWIDTH_REDUCE	90
 #define ETP_FINGER_WIDTH	15
 #define ETP_RETRY_COUNT		3
+/* H/W init 2 ms + F/W init 100 ms w/ round up */
+#define ETP_POWER_ON_DELAY	110
 
 /* quirks to control the device */
 #define ETP_QUIRK_QUICK_WAKEUP	BIT(0)
@@ -1237,6 +1239,8 @@ static int elan_probe(struct i2c_client *client)
 		return error;
 	}
 
+	msleep(ETP_POWER_ON_DELAY);
+
 	/* Make sure there is something at this address */
 	error = i2c_smbus_read_byte(client);
 	if (error < 0) {
@@ -1374,6 +1378,8 @@ static int elan_resume(struct device *dev)
 			dev_err(dev, "error %d enabling regulator\n", error);
 			goto err;
 		}
+
+		msleep(ETP_POWER_ON_DELAY);
 	}
 
 	error = elan_set_power(data, true);
-- 
2.46.1.824.gd892dcdcdd-goog



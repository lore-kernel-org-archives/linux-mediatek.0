Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBE2CEBF61
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 23:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TyRYSLB4FUMG7ZQozSGEenWyDF3XZ2iz0mCpEEN+5z4=; b=3YZyIoY0Uhc0CdNuxN11dLKtGG
	b7/ojWgSEPImGhuS+9bVuZ3WiphtSLlUiBJUzszW0C6xGYWNPG0vK2ZAWkyQeQKDoeHmwXMEWjL0u
	2+vu31LWBO636fS+N2i+fzRe6x/tm5BBPBxOOtbSdd7ke40FsEPgpx/sNWcMT2MxoC4BfHdMRcGL3
	MTqr2Dl8rVBhyrjMpC7l+dKuAHma7THXYCQC0oplz/Ga70R9wprE11H0mQnyvp0rsI0ox3LKGTy+B
	VheDVuf8N97PPyTmV/Q+5VgtRzgae4hIBSlBJW2Y8DTe6Z1jyy/R+p/kTDcHw1ByCSTc1XPzJVqbL
	OtvrzkUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sty4n-00000009cAE-0peZ;
	Thu, 26 Sep 2024 23:39:13 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stxnw-00000009Z4b-2b9U;
	Thu, 26 Sep 2024 23:21:50 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5c241feb80dso4774528a12.0;
        Thu, 26 Sep 2024 16:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392906; x=1727997706; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TyRYSLB4FUMG7ZQozSGEenWyDF3XZ2iz0mCpEEN+5z4=;
        b=hZEKYDhFjC7yXwskyJdyRDCc/AMDu55GKvlTfzj+ugvw4PQzB3P44lDkhJlyDbk8I1
         w1IwRUqwMtQ0FqUfDR47jdoDmT1pfo3V36/wQtuyZNbeAKXcKTL+ZpfBi3w/EA1hkWBN
         y1RONobm2U5C7Kry+THuO1TLJ0Kl0U/TPIiUaAfjp4PmrSCJYxusgOjoqwdXDOaUZ2dW
         LmyDpPODIeKX7kZR92us059YDueqFcBgZkJeod6dpqYqeicD0P3FTxVyvAJ628Lw2Ob9
         F7paA8GFNW4ncIy8D0HlJBKJPcdjd9ja2x66F+j0u41iEDsix3IwFoEbGepVpqcH/y/K
         5YkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392906; x=1727997706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TyRYSLB4FUMG7ZQozSGEenWyDF3XZ2iz0mCpEEN+5z4=;
        b=DJdxjyjBBKFMwVkA1Unu3JJMfZjXpEEkhp1ZCcClgUK35jTyBuRGZfYs//28nRLQcS
         iCEU9oraNHRA2ooDcfT41pDU6DPUULG1jUYmCnLt6xK/G0fVmHtqY6MQNvdsbsduDdI9
         HMpJe5fbUkLquhc5UPl8rOjTsgJfF3HMHi4EmGBF8mB+rqVVMMrDmN+7SzzqhurrZGJL
         PRhUauNH5JnHN0S2YreHhctgfgd8wl10Xe8Qv2g48XVETafhkHrRadYNcB+7PX0MtLSQ
         RAjUltM017EqJDu0zs/95klZBOeGrGmwDfZ7zd2QA31bG4YKyJStmCq/yU39rsCafiHe
         1WNA==
X-Forwarded-Encrypted: i=1; AJvYcCUFME3JINsTQsFfChIl0+L+i1g4LbWywkVHMuRad8Y/rpjFYFkzbJhVamQRvSrIi8HMzO1nTmKIfzDRzGM/5oc=@lists.infradead.org, AJvYcCVWvwG+5clNMA3kqj7vM++6SCEBnaZGuZ6lHPZmqvCGCmq4lMYfNN6ERNJsaTL1eurEKOoo8MBHtYSCk9xl/wan@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp38q2+2WLx2FlSEPwx+p+Co+dyYthr3NuRmaKgGslS77idfCl
	thPsMeno+tHbW85CqEffwzmyhpAC2pRBMwwiF8JJowNadLSLpkj7F7OyyNjh
X-Google-Smtp-Source: AGHT+IF2h6rfpoYNPcv3IJUyf/0VxJB+Tzg7enQ3X9qTLHoriZAfUF5SXe05FRA9//n3nOpoi2FKjQ==
X-Received: by 2002:a17:907:36cd:b0:a7a:acae:340b with SMTP id a640c23a62f3a-a93c32119afmr152457166b.31.1727392906224;
        Thu, 26 Sep 2024 16:21:46 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:44 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:21:04 +0200
Subject: [PATCH 13/18] leds: pca963x: switch to
 device_for_each_child_node_scoped()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-13-95c0614b38c8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=1968;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=Pv0inpasEwKB4z2yQMzZWyX6wkHoCypZJXtRjmgK+mU=;
 b=4OyN2lOQijDJ7XTOSToVZf5Jm5nLKGku+MN88b0WkN8LPNF8MQ75n8vIksJCldHP70NcDZrab
 N/kVJn2HWk2DcMaBUelGlqT9fiv7ll/wbB/w8wUBdi5v4GKnZbdtw3R
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_162148_697422_E895649B 
X-CRM114-Status: GOOD (  14.29  )
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

After switching to the scoped variant, there is no longer need for a
jump to 'err', as an immediate return is possible.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/leds-pca963x.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
index b53905da3592..050e93b04884 100644
--- a/drivers/leds/leds-pca963x.c
+++ b/drivers/leds/leds-pca963x.c
@@ -306,7 +306,6 @@ static int pca963x_register_leds(struct i2c_client *client,
 	struct pca963x_chipdef *chipdef = chip->chipdef;
 	struct pca963x_led *led = chip->leds;
 	struct device *dev = &client->dev;
-	struct fwnode_handle *child;
 	bool hw_blink;
 	s32 mode2;
 	u32 reg;
@@ -338,7 +337,7 @@ static int pca963x_register_leds(struct i2c_client *client,
 	if (ret < 0)
 		return ret;
 
-	device_for_each_child_node(dev, child) {
+	device_for_each_child_node_scoped(dev, child) {
 		struct led_init_data init_data = {};
 		char default_label[32];
 
@@ -346,8 +345,7 @@ static int pca963x_register_leds(struct i2c_client *client,
 		if (ret || reg >= chipdef->n_leds) {
 			dev_err(dev, "Invalid 'reg' property for node %pfw\n",
 				child);
-			ret = -EINVAL;
-			goto err;
+			return -EINVAL;
 		}
 
 		led->led_num = reg;
@@ -369,16 +367,13 @@ static int pca963x_register_leds(struct i2c_client *client,
 		if (ret) {
 			dev_err(dev, "Failed to register LED for node %pfw\n",
 				child);
-			goto err;
+			return ret;
 		}
 
 		++led;
 	}
 
 	return 0;
-err:
-	fwnode_handle_put(child);
-	return ret;
 }
 
 static int pca963x_suspend(struct device *dev)

-- 
2.43.0



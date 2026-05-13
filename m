Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B01A0CD37AC
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 May 2026 17:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WBiwKaJQY0yLoEZVoPD+i2CuAdzYgrrUN0KXkB5SBzk=; b=xErGjp3hcgDkmm3XhPoTiEcLHZ
	vdhb2AfpSYNcaI68mXQahBaTZ/Iah6l724WM5XHlRhUKua/NKsvC/UnoC1cYFhIvUJ/2oEFlXo8wZ
	GLC+wOc4ZcOzj7oEyaF6jdZGm/zosKZZHeY/bKAe3aTBBFmw+KKb1kEp7ysLhMvDiBMkDKwmRUfjZ
	e5NVRe1j2tlkRhoJ25b7iRA+sB0z/52bnch90ik7yfldqp7sRwmq2ovALAUfdA1IukpFIAamxev7f
	7PIgGPqvYzLZhf17S2EEYjNwThMsDxltUVLfPd2KdlekVLpmnAj6Av+N72haBwYqB0XgR2aJz/uR6
	fPkv914g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDIo-00000003LDp-1piK;
	Wed, 13 May 2026 17:23:22 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDIl-00000003LCR-1Lbd
	for linux-mediatek@lists.infradead.org;
	Wed, 13 May 2026 17:23:21 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso80863845e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 13 May 2026 10:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778692997; x=1779297797; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WBiwKaJQY0yLoEZVoPD+i2CuAdzYgrrUN0KXkB5SBzk=;
        b=yREGTsDwOzaSB9YVnIMJ/kBnFVEnoixTNyY9Fl7R7ZIQpVBN8xo0Qi3+tCYpgsQ6GQ
         XdS9zqt6al9RQwENPji41uJmszNYhMgVVXe1O9P1xblSw9Dedw5W0AYWwmk1QKUwxW1V
         yliGAlGQpz+xEMRNq0cKwtZ3aCNCQeYE+pS3TMNh9ENRQLxdFO0sQLoqzM4qxdBSzquZ
         o7zFtZVaAkSTVYfun+BLztelvIrdkfxRaFTsqdHOXJUYganode/t/ndzHx/AFcErVNxc
         edSa3/yJEqg0X5SMe9QZ4sCopJdYtCwK9Y3uXqst70KvrnFkjTbWqoevHBp3jKJ0CCum
         yEVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778692997; x=1779297797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WBiwKaJQY0yLoEZVoPD+i2CuAdzYgrrUN0KXkB5SBzk=;
        b=rYJfKSSGWtirzGHG7DeIXpgW/fMUdBtcWe59BSH2BrsJ4zHvMWssCIftWEA9ACcrx9
         0qfvcK/ulDx8Yipr2mVWvtWoRU3/g6jD5GTL8f/qMvoDdjX0ndll5nGaQJiIHyHc0Jdt
         CzTaIDLHcdo8n3l1MUo6N7uom5eNNEh+9hVfgDiZTG+cYkhwLXMiEUswSg6uIcJ3NuFT
         dpzohx7ZeQ2cJGfpdP2yWlJCjPJLSGxxWDCZyIIC7LjMCclAAoycwjjDImFbMWpWMXV3
         WvRxzoPGvjqXnsSLU5Y2RQAdCJLUzO+H1kEKUpl4XHEzAEaUMhgO1BicAglxiIblSdkC
         U9qg==
X-Forwarded-Encrypted: i=1; AFNElJ9sgvbYBLkzrw6I/b2AudUV39QUzyHNSCIMm8hY38JwMUL5bGya0KKg6gl31GHsVwGtj7aXA/5CJ0sXFrOfXA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwmM4hShDKTvCcvMhrEGSATCDBRtrqwd1tcZoL60HOCpHpeU4Qn
	zeDg93MODSTTYdEwWkXEaG4HqH7SOadStE9/M2892pAns47CrjG66uHT+a+75Lepsj8=
X-Gm-Gg: Acq92OGMM9xo+5f0Z3XQiJ8rktnvD/sGBzfMOILwmnecZNMcRA63UoN5SFS9F9adLaV
	B7/mcr5EJTeYXZtLEeHnaF2liczrAA0hQ+8GldiADT2fVKr3JZRVYknlW8IteeoTyJy8mYjrkdv
	4zdvVl4busgwnyXDLxsOuIRkWQfnz2oVWArjH93eYhfXJRsm8kZHgrI1GpmmM9uFXODaNOiz7Xm
	MSGVbid0Ay4dDEm3Drk5LIFoO4bOCFFIDb5uXr7qOziZQCfOD2rgTZ6KLMCTJxC6R8ym00zbIdR
	GuHLk2Ei+DU/IcaUpWc4crm6T6d5Jm99Cx2fnMEgcZQeaxjtyJv6J4bCQlZBh9oZGPHEshDCbT2
	GK9txqqRpi8bhd5RGwA86L6i5CiwgssCXYopD5q2uc4/W+nT6KlyThnNYsS904tce5EO1KpOmLn
	fZ2Xuo0FgbLikj/Bqq3Kfl++TIxZAnbBrNAaRCNORlBx+MMDT9YJbkfmOuBP9QRultxOuFrp1t8
	rdeBgjzsdxCJPgXbDaRmVfa0g==
X-Received: by 2002:a05:600c:1792:b0:488:b811:51c4 with SMTP id 5b1f17b1804b1-48fcff534edmr31119785e9.25.1778692996712;
        Wed, 13 May 2026 10:23:16 -0700 (PDT)
Received: from localhost (p200300f65f47db04379dbd4376e53036.dip0.t-ipconnect.de. [2003:f6:5f47:db04:379d:bd43:76e5:3036])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48fd648a6casm5365505e9.4.2026.05.13.10.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:23:16 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	=?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	M R Swami Reddy <mr.swami.reddy@ti.com>,
	Vishwas A Deshpande <vishwas.a.deshpande@ti.com>,
	Peter Rosin <peda@axentia.se>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabio Estevam <festevam@gmail.com>,
	Kiseok Jo <kiseok.jo@irondevice.com>,
	Kevin Cernekee <cernekee@chromium.org>,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Chris Morgan <macromorgan@hotmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Aaron Kling <webgeek1234@gmail.com>,
	Teguh Sobirin <teguh@sobir.in>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Bharadwaj Raju <bharadwaj.raju@machinesoul.in>,
	Hsieh Hung-En <hungen3108@gmail.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Shimrra Shai <shimrrashai@gmail.com>,
	Zhang Yi <zhangyi@everest-semi.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Qasim Ijaz <qasdev00@gmail.com>,
	Sharique Mohammad <sharq0406@gmail.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	Neo Chang <YLCHANG2@nuvoton.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Kees Cook <kees@kernel.org>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Tim Bird <tim.bird@sony.com>,
	Bram Vlerick <bram.vlerick@openpixelsystems.org>,
	Peter Korsgaard <peter@korsgaard.com>,
	Linus Walleij <linusw@kernel.org>,
	Wenyuan Li <2063309626@qq.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	Xichao Zhao <zhao.xichao@vivo.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v1 0/2] ASoC: Rework initialization of i2c_device_ids
Date: Wed, 13 May 2026 19:23:02 +0200
Message-ID: <cover.1778692164.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=14547; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=0kx9nXHgcrCeA+wtwjRfMNhh1Ea6m6Da/DfM7P1VOcA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqBLN2Nm3PEL/Sz0K+vQWH1XxUY//RfwT4gR/sc PXjrKxV01qJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCagSzdgAKCRCPgPtYfRL+ TgCzB/4tkpOYSSUU/IdtpZiBaOH7zqSllHElRHgZ1q63Ume5K5IygtuZyROolQNaDGgbpgbZ4gg XSsljcYTDD7ygjhXMQWNyxRTbZze+Lj/s6ylX+dvjfHC9HUtF1eSH4TyJ6UkZ2s98tYeEvIS7LC KziMrzweb2xnIV4GphNtOPHXkjovnRINC6OEdTZULV1gWXZSwoQxHXFiHafrIu65aCSu3GVVeUs HwDduA1gaUGTfb3+LBKl+ftiRBy7hJC6Gnkf6TCOAT+qoZLXuGvU1wGavrnK8nkbUpOM3NLSFue sBfbX8HfmrZzYHDGGydvMPlB/ziJWpA1SBX5QA5pav1Oof+2
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_102319_501765_B72037D7 
X-CRM114-Status: GOOD (  18.11  )
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

Hello,

this series is a preparation for

	diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
	index 23ff24080dfd..aebd3a5e90af 100644
	--- a/include/linux/mod_devicetable.h
	+++ b/include/linux/mod_devicetable.h
	@@ -477,7 +477,11 @@ struct rpmsg_device_id {
	 
	 struct i2c_device_id {
		char name[I2C_NAME_SIZE];
	-	kernel_ulong_t driver_data;	/* Data private to the driver */
	+	union {
	+		/* Data private to the driver */
	+		kernel_ulong_t driver_data;
	+		const void *driver_data_ptr;
	+	};
	 };
	 
	 /* pci_epf */

and this requires that .driver_data is assigned via a named initializer
for static data. This requirement isn't a bad one because named
initializers are also much better readable than list initializers.

The union added to struct i2c_device_id enables further cleanups like:

        diff --git a/drivers/iio/accel/kxcjk-1013.c b/drivers/iio/accel/kxcjk-1013.c
        index 8a082ff034dd..b2aac7348d22 100644
        --- a/drivers/iio/accel/kxcjk-1013.c
        +++ b/drivers/iio/accel/kxcjk-1013.c
	@@ -1429,7 +1429,7 @@ static int kxcjk1013_probe(struct i2c_client *client)
	 
		if (id) {
			name = id->name;
	-		data->info = (const struct kx_chipset_info *)(id->driver_data);
	+		data->info = id->driver_data_ptr;
		} else {
			name = iio_get_acpi_device_name_and_data(&client->dev, &ddata);
			data->info = ddata;
	@@ -1630,11 +1630,11 @@ static const struct dev_pm_ops kxcjk1013_pm_ops = {
	 };
	 
	 static const struct i2c_device_id kxcjk1013_id[] = {
	-	{ .name = "kxcjk1013", .driver_data = (kernel_ulong_t)&kxcjk1013_info },
	-	{ .name = "kxcj91008", .driver_data = (kernel_ulong_t)&kxcj91008_info },
	-	{ .name = "kxtj21009", .driver_data = (kernel_ulong_t)&kxtj21009_info },
	-	{ .name = "kxtf9", .driver_data = (kernel_ulong_t)&kxtf9_info },
	-	{ .name = "kx023-1025", .driver_data = (kernel_ulong_t)&kx0231025_info },
	+	{ .name = "kxcjk1013", .driver_data_ptr = &kxcjk1013_info },
	+	{ .name = "kxcj91008", .driver_data_ptr = &kxcj91008_info },
	+	{ .name = "kxtj21009", .driver_data_ptr = &kxtj21009_info },
	+	{ .name = "kxtf9", .driver_data_ptr = &kxtf9_info },
	+	{ .name = "kx023-1025", .driver_data_ptr = &kx0231025_info },
		{ }
	 };
	 MODULE_DEVICE_TABLE(i2c, kxcjk1013_id);

that are an improvement for readability (again!) and it keeps some
properties of the pointers (here: being const) without having to pay
attention for that. (I didn't find a good example in sound/soc, so an
iio driver was used to demonstrate the gain.)

My additional motivation for this effort is CHERI[1]. This is a hardware
extension that uses 128 bit pointers but unsigned long is still 64 bit.
So with CHERI you cannot store pointers in unsigned long variables.

The first patch drops a few empty remove callbacks that I found while
working on patch #2. The second converts all hwmon drivers to use named
initializers.

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (2):
  ASoC: Drop empty i2c remove callbacks
  ASoC: Use named initializers for arrays of i2c_device_data

 .../hda/codecs/side-codecs/cs35l41_hda_i2c.c  |  4 +-
 .../hda/codecs/side-codecs/cs35l56_hda_i2c.c  |  8 ++--
 .../hda/codecs/side-codecs/tas2781_hda_i2c.c  |  4 +-
 sound/soc/codecs/ad193x-i2c.c                 |  4 +-
 sound/soc/codecs/adau1372-i2c.c               |  2 +-
 sound/soc/codecs/adau1373.c                   |  2 +-
 sound/soc/codecs/adau1701.c                   |  8 ++--
 sound/soc/codecs/adau1761-i2c.c               |  8 ++--
 sound/soc/codecs/adau1781-i2c.c               |  4 +-
 sound/soc/codecs/adau1977-i2c.c               |  6 +--
 sound/soc/codecs/adau7118-i2c.c               |  4 +-
 sound/soc/codecs/adav803.c                    |  2 +-
 sound/soc/codecs/ak4118.c                     |  4 +-
 sound/soc/codecs/ak4535.c                     |  2 +-
 sound/soc/codecs/ak4613.c                     |  2 +-
 sound/soc/codecs/ak4619.c                     |  2 +-
 sound/soc/codecs/ak4642.c                     |  8 ++--
 sound/soc/codecs/ak4671.c                     |  2 +-
 sound/soc/codecs/alc5623.c                    |  8 ++--
 sound/soc/codecs/alc5632.c                    |  4 +-
 sound/soc/codecs/aw87390.c                    |  4 +-
 sound/soc/codecs/aw88081.c                    |  4 +-
 sound/soc/codecs/aw88166.c                    |  2 +-
 sound/soc/codecs/aw88261.c                    |  2 +-
 sound/soc/codecs/aw88395/aw88395.c            |  2 +-
 sound/soc/codecs/aw88399.c                    |  2 +-
 sound/soc/codecs/cs35l32.c                    |  4 +-
 sound/soc/codecs/cs35l33.c                    |  4 +-
 sound/soc/codecs/cs35l34.c                    |  4 +-
 sound/soc/codecs/cs35l35.c                    |  4 +-
 sound/soc/codecs/cs35l36.c                    |  4 +-
 sound/soc/codecs/cs35l41-i2c.c                | 10 ++---
 sound/soc/codecs/cs35l45-i2c.c                |  4 +-
 sound/soc/codecs/cs35l56-i2c.c                |  6 +--
 sound/soc/codecs/cs4265.c                     |  2 +-
 sound/soc/codecs/cs4270.c                     |  4 +-
 sound/soc/codecs/cs4271-i2c.c                 |  2 +-
 sound/soc/codecs/cs42l42-i2c.c                |  4 +-
 sound/soc/codecs/cs42l51-i2c.c                |  2 +-
 sound/soc/codecs/cs42l52.c                    |  2 +-
 sound/soc/codecs/cs42l56.c                    |  2 +-
 sound/soc/codecs/cs42l73.c                    |  4 +-
 sound/soc/codecs/cs42l84.c                    |  4 +-
 sound/soc/codecs/cs42xx8-i2c.c                |  6 +--
 sound/soc/codecs/cs43130.c                    | 10 ++---
 sound/soc/codecs/cs4341.c                     |  2 +-
 sound/soc/codecs/cs4349.c                     |  4 +-
 sound/soc/codecs/cs530x-i2c.c                 | 14 +++---
 sound/soc/codecs/cs53l30.c                    |  4 +-
 sound/soc/codecs/cx2072x.c                    |  6 +--
 sound/soc/codecs/da7210.c                     |  2 +-
 sound/soc/codecs/da7213.c                     |  2 +-
 sound/soc/codecs/da7218.c                     |  4 +-
 sound/soc/codecs/da7219.c                     |  2 +-
 sound/soc/codecs/da732x.c                     |  2 +-
 sound/soc/codecs/da9055.c                     |  2 +-
 sound/soc/codecs/es8311.c                     |  2 +-
 sound/soc/codecs/es8316.c                     |  4 +-
 sound/soc/codecs/es8323.c                     |  2 +-
 sound/soc/codecs/es8326.c                     |  4 +-
 sound/soc/codecs/es8328-i2c.c                 |  4 +-
 sound/soc/codecs/es8375.c                     |  2 +-
 sound/soc/codecs/es8389.c                     |  2 +-
 sound/soc/codecs/fs210x.c                     |  6 +--
 sound/soc/codecs/isabelle.c                   |  2 +-
 sound/soc/codecs/lm4857.c                     |  2 +-
 sound/soc/codecs/lm49453.c                    |  2 +-
 sound/soc/codecs/max9768.c                    |  2 +-
 sound/soc/codecs/max98088.c                   |  4 +-
 sound/soc/codecs/max98090.c                   |  4 +-
 sound/soc/codecs/max98095.c                   |  2 +-
 sound/soc/codecs/max98371.c                   |  2 +-
 sound/soc/codecs/max98373-i2c.c               |  4 +-
 sound/soc/codecs/max98388.c                   |  4 +-
 sound/soc/codecs/max98390.c                   |  4 +-
 sound/soc/codecs/max98396.c                   |  6 +--
 sound/soc/codecs/max9850.c                    |  2 +-
 sound/soc/codecs/max98504.c                   |  2 +-
 sound/soc/codecs/max98520.c                   |  4 +-
 sound/soc/codecs/max9860.c                    |  2 +-
 sound/soc/codecs/max9867.c                    |  2 +-
 sound/soc/codecs/max9877.c                    |  2 +-
 sound/soc/codecs/max98925.c                   |  2 +-
 sound/soc/codecs/max98926.c                   |  2 +-
 sound/soc/codecs/max98927.c                   |  4 +-
 sound/soc/codecs/ml26124.c                    |  2 +-
 sound/soc/codecs/mt6660.c                     |  4 +-
 sound/soc/codecs/nau8325.c                    |  2 +-
 sound/soc/codecs/nau8540.c                    |  2 +-
 sound/soc/codecs/nau8810.c                    |  6 +--
 sound/soc/codecs/nau8821.c                    |  2 +-
 sound/soc/codecs/nau8822.c                    |  2 +-
 sound/soc/codecs/nau8824.c                    |  2 +-
 sound/soc/codecs/nau8825.c                    |  6 +--
 sound/soc/codecs/ntp8835.c                    |  4 +-
 sound/soc/codecs/ntp8918.c                    |  4 +-
 sound/soc/codecs/pcm1681.c                    |  4 +-
 sound/soc/codecs/pcm1789-i2c.c                |  2 +-
 sound/soc/codecs/pcm179x-i2c.c                |  2 +-
 sound/soc/codecs/pcm186x-i2c.c                |  8 ++--
 sound/soc/codecs/pcm3168a-i2c.c               |  2 +-
 sound/soc/codecs/pcm512x-i2c.c                | 14 +++---
 sound/soc/codecs/pcm6240.c                    | 44 +++++++++----------
 sound/soc/codecs/rt1011.c                     |  2 +-
 sound/soc/codecs/rt1015.c                     |  2 +-
 sound/soc/codecs/rt1016.c                     |  2 +-
 sound/soc/codecs/rt1019.c                     |  2 +-
 sound/soc/codecs/rt1305.c                     |  4 +-
 sound/soc/codecs/rt1308.c                     |  2 +-
 sound/soc/codecs/rt1318.c                     |  2 +-
 sound/soc/codecs/rt274.c                      |  4 +-
 sound/soc/codecs/rt286.c                      |  6 +--
 sound/soc/codecs/rt298.c                      |  4 +-
 sound/soc/codecs/rt5514.c                     |  2 +-
 sound/soc/codecs/rt5575.c                     |  2 +-
 sound/soc/codecs/rt5616.c                     |  6 +--
 sound/soc/codecs/rt5631.c                     | 10 ++---
 sound/soc/codecs/rt5640.c                     |  6 +--
 sound/soc/codecs/rt5645.c                     |  4 +-
 sound/soc/codecs/rt5651.c                     |  2 +-
 sound/soc/codecs/rt5659.c                     |  4 +-
 sound/soc/codecs/rt5660.c                     |  2 +-
 sound/soc/codecs/rt5663.c                     |  4 +-
 sound/soc/codecs/rt5665.c                     |  4 +-
 sound/soc/codecs/rt5668.c                     |  4 +-
 sound/soc/codecs/rt5670.c                     |  6 +--
 sound/soc/codecs/rt5677.c                     |  2 +-
 sound/soc/codecs/rt5682-i2c.c                 |  4 +-
 sound/soc/codecs/rt5682s.c                    |  4 +-
 sound/soc/codecs/sgtl5000.c                   |  4 +-
 sound/soc/codecs/sma1303.c                    |  4 +-
 sound/soc/codecs/sma1307.c                    |  4 +-
 sound/soc/codecs/src4xxx-i2c.c                |  2 +-
 sound/soc/codecs/ssm2518.c                    |  2 +-
 sound/soc/codecs/ssm2602-i2c.c                |  6 +--
 sound/soc/codecs/ssm4567.c                    |  2 +-
 sound/soc/codecs/sta32x.c                     |  6 +--
 sound/soc/codecs/sta350.c                     |  8 +---
 sound/soc/codecs/sta529.c                     |  2 +-
 sound/soc/codecs/tas2552.c                    |  2 +-
 sound/soc/codecs/tas2562.c                    |  6 +--
 sound/soc/codecs/tas2764.c                    |  2 +-
 sound/soc/codecs/tas2770.c                    |  2 +-
 sound/soc/codecs/tas2780.c                    |  2 +-
 sound/soc/codecs/tas2781-i2c.c                | 42 +++++++++---------
 sound/soc/codecs/tas5086.c                    | 12 ++---
 sound/soc/codecs/tas571x.c                    | 14 +++---
 sound/soc/codecs/tas5720.c                    |  6 +--
 sound/soc/codecs/tas5805m.c                   |  2 +-
 sound/soc/codecs/tas6424.c                    |  2 +-
 sound/soc/codecs/tda7419.c                    |  2 +-
 sound/soc/codecs/tfa9879.c                    |  2 +-
 sound/soc/codecs/tlv320adc3xxx.c              |  6 +--
 sound/soc/codecs/tlv320adcx140.c              |  8 ++--
 sound/soc/codecs/tlv320aic23-i2c.c            |  4 +-
 sound/soc/codecs/tlv320aic31xx.c              | 16 +++----
 sound/soc/codecs/tlv320aic32x4-i2c.c          |  6 +--
 sound/soc/codecs/tlv320aic3x-i2c.c            | 10 ++---
 sound/soc/codecs/ts3a227e.c                   |  2 +-
 sound/soc/codecs/tscs42xx.c                   |  4 +-
 sound/soc/codecs/tscs454.c                    |  2 +-
 sound/soc/codecs/uda1342.c                    |  2 +-
 sound/soc/codecs/uda1380.c                    |  2 +-
 sound/soc/codecs/wm1250-ev1.c                 |  2 +-
 sound/soc/codecs/wm2000.c                     |  2 +-
 sound/soc/codecs/wm2200.c                     |  2 +-
 sound/soc/codecs/wm5100.c                     |  2 +-
 sound/soc/codecs/wm8510.c                     |  2 +-
 sound/soc/codecs/wm8523.c                     |  2 +-
 sound/soc/codecs/wm8580.c                     |  4 +-
 sound/soc/codecs/wm8711.c                     |  2 +-
 sound/soc/codecs/wm8728.c                     |  2 +-
 sound/soc/codecs/wm8731-i2c.c                 |  2 +-
 sound/soc/codecs/wm8737.c                     |  2 +-
 sound/soc/codecs/wm8741.c                     |  2 +-
 sound/soc/codecs/wm8750.c                     |  4 +-
 sound/soc/codecs/wm8753.c                     |  2 +-
 sound/soc/codecs/wm8776.c                     |  4 +-
 sound/soc/codecs/wm8804-i2c.c                 |  2 +-
 sound/soc/codecs/wm8900.c                     |  8 +---
 sound/soc/codecs/wm8903.c                     |  2 +-
 sound/soc/codecs/wm8904.c                     |  6 +--
 sound/soc/codecs/wm8940.c                     |  2 +-
 sound/soc/codecs/wm8955.c                     |  2 +-
 sound/soc/codecs/wm8960.c                     |  2 +-
 sound/soc/codecs/wm8961.c                     |  2 +-
 sound/soc/codecs/wm8962.c                     |  2 +-
 sound/soc/codecs/wm8971.c                     |  2 +-
 sound/soc/codecs/wm8974.c                     |  2 +-
 sound/soc/codecs/wm8978.c                     |  2 +-
 sound/soc/codecs/wm8983.c                     |  2 +-
 sound/soc/codecs/wm8985.c                     |  4 +-
 sound/soc/codecs/wm8988.c                     |  2 +-
 sound/soc/codecs/wm8990.c                     |  2 +-
 sound/soc/codecs/wm8991.c                     |  2 +-
 sound/soc/codecs/wm8993.c                     |  2 +-
 sound/soc/codecs/wm8995.c                     |  4 +-
 sound/soc/codecs/wm8996.c                     |  2 +-
 sound/soc/codecs/wm9081.c                     |  8 +---
 sound/soc/codecs/wm9090.c                     |  4 +-
 200 files changed, 398 insertions(+), 426 deletions(-)


base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.47.3



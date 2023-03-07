Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A039C6FD1A
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 13:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eeel5XHVDoFzIY2YG1FRNg5liLwMdDxd6X70lesaeNg=; b=BghoE4pcg37lFNIX0SIQdGXgKz
	2IJyaWX09bvVrXqAvhIWzQCYyCPkUkl0PDY19Z+dBMJQ+DzZcEGkj2dqcBriZeUqle4AAkM6DnSKl
	8wTIszTO5B5f3YPeyg26+Zm16yZLMhJpK6rcEgCWiCQ6RpTLjYaALI+1FbIn9uvHdrxAVeqk0H7qC
	mprn7fTnmVNps+A//eSYa+gj92bEBFWc/Bq4g2eHmXtL98L3o+lwMebzH+E8Sr2uG8oDJ009Qacow
	RoR6mUWs+C9EnzLduTIJvh1Uc2hCr1LHmAK2Zl8yda7m51ZZtHEJdGeKKXAh0dNzXeLVj1ZvyeszK
	9N3rr/DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXnT-000YrO-Lx; Tue, 07 Mar 2023 13:56:07 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXac-000TQH-St
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 13:42:53 +0000
Received: by mail-wr1-x433.google.com with SMTP id f11so12151869wrv.8
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 05:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678196568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eeel5XHVDoFzIY2YG1FRNg5liLwMdDxd6X70lesaeNg=;
        b=cbqb/e/w8w236fE3rmjvQsm/3PyhLPMdyuWqyoTBlqyuTuh4Zx/mzq9dD/hjQM321F
         EPB63dMqDynEzEDCff8rJuhWAX0PUbR47loqbnjH60nmVA00l41/8wBdy7xRukr/QcUB
         ++pbWDmgErb4+w499XFEq4DfaPlLlTf3SdD8SrXqLCdEL2MyhQvoRBTKg20+piBh5+m/
         CCCuJRSWnewbDQIs/r6yxYgEhDO4p3noRsmSDMMaAnHkeTvDz7rQxGYCDnkyJAU1AC7U
         1dy7QQb3V8jKCHqPH19PBYbF6nyFthwQQZ6D+8uFXby+DfyGtvOZHdG91NHBDkmmwQ5u
         OPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678196568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eeel5XHVDoFzIY2YG1FRNg5liLwMdDxd6X70lesaeNg=;
        b=VRdvHRx5JJE2tmaGWdpi0WWBqTEF7qdWML0VPi9evUOUQs/r3GbVsvPba2mDdPJ8uM
         rG2tvEBHi6sZ9pJPEIsQKwF5xmKu9mo5ARR/WavK8gQmLPsBQY+q5FskPZ8V/v6b3vis
         ebjQBzv2/UOfNIeMrgrq6h7j1deWHNbVj8M7LE2fFDefX4uDiAH56oCYxw8UJAZuehg2
         FFElqMw6h+Izclh8NPYeQNuyDJvfvLgqu7hiXgyL+cMiSRQ/6Gl0eufXtU/Ew00ZUyh3
         PXNddasCA7FjoxNXZwObvj56ZJEZEXOmwIcN085somu4sHOcWT8UtRNQr4I47fijWeCT
         QRPA==
X-Gm-Message-State: AO0yUKUklwnyDoDQnIfw+nuuYc0Kww2KdwEVtkCuoMcNUGIE0wmO3VrI
	sFy05BrsaljcFKLmISj2JnODyw==
X-Google-Smtp-Source: AK7set+aspRSIaTh4/XbS+bw8KYAx2Ifi6PVWrobx0AWeOOli8vUV5Ail29oq9+yZ42Y9gSmbdGEzw==
X-Received: by 2002:adf:ea90:0:b0:2c9:d90c:56c3 with SMTP id s16-20020adfea90000000b002c9d90c56c3mr8924250wrm.53.1678196568111;
        Tue, 07 Mar 2023 05:42:48 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-657-1-248-155.w90-24.abo.wanadoo.fr. [90.24.137.155])
        by smtp.gmail.com with ESMTPSA id f2-20020a5d4dc2000000b002be5bdbe40csm12495589wru.27.2023.03.07.05.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:42:47 -0800 (PST)
From: bchihi@baylibre.com
To: daniel.lezcano@linaro.org,
	angelogioacchino.delregno@collabora.com,
	rafael@kernel.org,
	amitk@kernel.org,
	rui.zhang@intel.com,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	rdunlap@infradead.org,
	ye.xingchen@zte.com.cn,
	p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	khilman@baylibre.com,
	james.lo@mediatek.com,
	rex-bc.chen@mediatek.com
Subject: [PATCH] thermal/drivers/mediatek/lvts_thermal: fix memcpy's number of bytes in lvts_calibration_init()
Date: Tue,  7 Mar 2023 14:42:45 +0100
Message-Id: <20230307134245.83599-1-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126161048.94089-1-bchihi@baylibre.com>
References: <20230126161048.94089-1-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_054250_951112_B894E6EA 
X-CRM114-Status: GOOD (  13.76  )
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

From: Balsam CHIHI <bchihi@baylibre.com>

Replace memcpy 2 bytes by sizeof(int) bytes of LVTS calibration data.

Reported-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
---
Rebased on top of thermal/linux-next
base-commit: 6828e402d06f7c574430b61c05db784cd847b19f

Original email :
Hello Balsam CHIHI,

The patch f5f633b18234: "thermal/drivers/mediatek: Add the Low
Voltage Thermal Sensor driver" from Feb 9, 2023, leads to the
following Smatch static checker warning:

        drivers/thermal/mediatek/lvts_thermal.c:562 lvts_calibration_init()
        warn: not copying enough bytes for '&lvts_ctrl->calibration[i]' (4 vs 2 bytes)

drivers/thermal/mediatek/lvts_thermal.c
    555 static int lvts_calibration_init(struct device *dev, struct lvts_ctrl *lvts_ctrl,
    556                                         const struct lvts_ctrl_data *lvts_ctrl_data,
    557                                         u8 *efuse_calibration)
    558 {
    559         int i;
    560
    561         for (i = 0; i < lvts_ctrl_data->num_lvts_sensor; i++)
--> 562                 memcpy(&lvts_ctrl->calibration[i],
    563                        efuse_calibration + lvts_ctrl_data->cal_offset[i], 2);
                                                                                  ^
This is copying an array of known ints to a u32 array.  It should copy
sizeof(int) instead of 2.  It only works because the data you're on
little endian and the data is small.

    564
    565         return 0;
    566 }

regards,
dan carpenter
---
---
 drivers/thermal/mediatek/lvts_thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index ddfdcbcf6d86..b505c6b49031 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -575,7 +575,7 @@ static int lvts_calibration_init(struct device *dev, struct lvts_ctrl *lvts_ctrl
 
 	for (i = 0; i < lvts_ctrl_data->num_lvts_sensor; i++)
 		memcpy(&lvts_ctrl->calibration[i],
-		       efuse_calibration + lvts_ctrl_data->cal_offset[i], 2);
+		       efuse_calibration + lvts_ctrl_data->cal_offset[i], sizeof(int));
 
 	return 0;
 }

base-commit: 6828e402d06f7c574430b61c05db784cd847b19f
prerequisite-patch-id: 73be949bd16979769e5b94905b244dcee4a8f687
prerequisite-patch-id: d23d83a946e5b876ef01a717fd51b07df1fa08dd
prerequisite-patch-id: d67f2455eef1c4a9ecc460dbf3c2e3ad47d213ec
prerequisite-patch-id: 9076e9b3bd3cc411b7b80344211364db5f0cca17
prerequisite-patch-id: e220d6ae26786f524c249588433f02e5f5f906ad
prerequisite-patch-id: b407d2998e57678952128b3a4bac92a379132b09
prerequisite-patch-id: fbb9212ce8c3530da17d213f56fa334ce4fa1b2b
prerequisite-patch-id: 5db9eed2659028cf4419f2de3d093af7df6c2dad
prerequisite-patch-id: a83c00c628605d1c8fbe1d97074f9f28efb1bcfc
prerequisite-patch-id: 56a245620a4f8238cf1ba3844dc348de3db33845
prerequisite-patch-id: 7df24b0bf11129ddd3356eacf192cc3fdb2bcded
prerequisite-patch-id: 3213ca70cb5b26d54a7137ff40ca8cd2a795c414
prerequisite-patch-id: 6c2202e85215d1c7e8ab16a6b85922e994c68d9b
-- 
2.34.1



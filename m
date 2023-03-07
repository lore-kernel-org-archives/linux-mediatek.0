Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59317C678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 14:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Eeel5XHVDoFzIY2YG1FRNg5liLwMdDxd6X70lesaeNg=; b=a6qrRmWYW+jyBf/lCNRUaLbK1f
	yMauD7cm+FTL42QBBmhrB4X3Knb2BN4fdYProLdwf2/s/j72ZF+MgGwNXC7cNO6/SjTXsbnd5/rgh
	bSCcfwodm3pxWD5xOgNjXbWuzrZPc6fbgq7F60NXfZCL7/B0eeBLrnV4DymwH1i8WbmbB8jmDX7p7
	vb5fMGGYhogZ9alFE+GaJ8WHgF78MEuUl+5F2TE8q56s+IebKLsu73etDIgHPJ+6qrsQM3IYUKf1D
	ul9V9nAck+5NtZ9UWpEbfuZ8cCEMHt0W4yUJCkheDL84kiTKv/BnKIaQ68+eJ0gK9o6O8WTkwQpnU
	1jGd37Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXwg-000dFG-G8; Tue, 07 Mar 2023 14:05:38 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXjJ-000X6I-8l
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 13:51:51 +0000
Received: by mail-wm1-x336.google.com with SMTP id o11-20020a05600c4fcb00b003eb33ea29a8so7248116wmq.1
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 05:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678197107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Eeel5XHVDoFzIY2YG1FRNg5liLwMdDxd6X70lesaeNg=;
        b=Zul4ruBfa/4iBgPzuTyulUW2npk8hslUuGmdoKV6W1NGhZCB2WsdJ6inQE0lZBH1ja
         v216EEM+zbVi2bi8qJ+6av8hAAMz8eFLlOAb7asF+k0yv0vaSLs4G7+b1jWMUPI7S58P
         nQtbgMwDpZd+m9lg+0bGR6LlrwkYm4APvCrSGsizO7k08F1vWO7QFlsR/tTldgtNL9wn
         odn8XpNCXiJxAm+B9iFaTHSrltoQQ/tk4RNFU3mdrHXiyHYQuLZDvnT50gOfO4oLcGRX
         LmRDM/uwVAnuvfZG/BFVOf2gRXoKbLRowc0lBaIvhe8q2awjIafGfEC6Cfs/xAZLS6Rb
         0Xng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678197107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eeel5XHVDoFzIY2YG1FRNg5liLwMdDxd6X70lesaeNg=;
        b=w8Map1KNRWFhUngKZjFY8JEVtaWhT9mT6TuZE3fjbSO8yeT4o/l4qTzqlp68AbdnuI
         0Qm6IxzQ5aD/Agu4zP0jwya0b7zQYpM//jlCUblzwTKb4sIJXhfGKNOVlDtPZ5NAIAdm
         AXxBYJaBrdyfVMk0O59WMfewWUsFS0ND/ZT8gwiylEHFrukff7xwGSVga/Nu9mCrToe0
         QmtyAl+njwyTJ8IMkNFlPNLlUW1+fzyA0+H8fm72GqnVsQpTIJGXcg7KuQdcw7AcaAMx
         tpL85t+7pJYvchXVUoR/Vo28v7bfdf9LKOnuDRHipVacAOYBqvArzK421w92cqR8Mhx3
         b9TQ==
X-Gm-Message-State: AO0yUKXzKKa28TNyT0oXc4LhCw7M+yXrm80gkhBA74A+4jKCbu2ftm8+
	xv+M4IVnJPkhLtCRmZm9cRGZaQ==
X-Google-Smtp-Source: AK7set8fzjhfw2Vzck5v/uH3rauzSEaxrWDWm8Wl3uUWZtgthYi3j6xE9TCTVnFUsIDO5+Vg40Sr6A==
X-Received: by 2002:a05:600c:3b16:b0:3eb:5990:aea4 with SMTP id m22-20020a05600c3b1600b003eb5990aea4mr13164051wms.12.1678197107500;
        Tue, 07 Mar 2023 05:51:47 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-657-1-248-155.w90-24.abo.wanadoo.fr. [90.24.137.155])
        by smtp.gmail.com with ESMTPSA id d14-20020a056000114e00b002c57475c375sm12932964wrx.110.2023.03.07.05.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:51:47 -0800 (PST)
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
	rex-bc.chen@mediatek.com,
	error27@gmail.com
Subject: [PATCH] thermal/drivers/mediatek/lvts_thermal: fix memcpy's number of bytes in lvts_calibration_init()
Date: Tue,  7 Mar 2023 14:51:46 +0100
Message-Id: <20230307135146.86084-1-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_055149_357323_520EAE8D 
X-CRM114-Status: GOOD (  13.61  )
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



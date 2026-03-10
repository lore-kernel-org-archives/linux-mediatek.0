Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FAEEFD4F2A
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2026 20:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zN04QOyvuNYqHR2KOr7qmaUFc0qRULIxaBq4auralkg=; b=ARGOUcjeRgwMwahjLCuuQ6pYd8
	9mBqBHOFUdEWA35tEDr2AxJrSd6MCjPKcLUrDuBF8E8LMOGXr7AiL82Sgh7yHzaorRxzFGCT6k0m6
	nnv/pu6TQQxNw6ATQWqbppeqEn5gL5+Tt1Jf8mGgA+Bwv22874FjZOTli3KyvSHoAAtOzrAGql55J
	iGRj/dPs/+wNHF1Ki3TGb/grz/cQjf6zVdQCppKzt9K/Cg4+Jq3X2JzeD41jDGzYFO61Yea8w4piM
	2dys71C3do8bpjO7azaIEQdrP5LskYcVnkUr8h4LxkBKnLuzaG3mR8u48lZKN2Q5GNuqNn2fwXEJJ
	BZ0OkFkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w03LC-0000000ADmo-2tby;
	Tue, 10 Mar 2026 20:06:08 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w03L9-0000000ADlI-2U5X
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Mar 2026 20:06:05 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-829b2018c94so2370726b3a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2026 13:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773173163; x=1773777963; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zN04QOyvuNYqHR2KOr7qmaUFc0qRULIxaBq4auralkg=;
        b=SheI5TSDpUb6bHAxnHW2kUXrl+I36NXS8on0JYnxpZeSYNlJk97yzWZ0jtGfh2rQqY
         Z3xp2opjui+LjfDEuAKu5X/1b4qshSJI3/Ai5i+vGpN8U5sNA1oolLlkZUjTHtaFSPTZ
         hdCLvvUmaSVYC8F4h9gvtHVxKlsWtqe3IW0xHiXqdpc2UhfalFXgKg/rmFKRGJJew/HG
         SdsTIUDeSEFbv3s9psPbnRjwzUCKpdpn0Xc9RgdSIz2TidOp9+RrAt+bsH1GdmtkKZkK
         pTeXc7YKvpO7a1h3ctXnIHNwTVZC66e2FFxUydtDyv8v0tVXatlZEp/ewq+T6jeS6rDI
         OtwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173163; x=1773777963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zN04QOyvuNYqHR2KOr7qmaUFc0qRULIxaBq4auralkg=;
        b=GZ9W0jUsnfa84u3wYiQrH4PKch9kFXwlAH1PZKXbI65IajEkzSGwd5E9nwN3BP1ltO
         kNGaZTP4hiOF8TdOkCZlzXNv9AkxvrHLAgeui23vDHGgrdLy3utbMS6LFaN/x3YMCap5
         idvqKzoNlfnkfrnEn5BbjFt7o35ik+8pcRbrbpad1166Fsi45LwxoGaL0FF28ERYEz8w
         70Mnj0T31oa+BMclHkB2R1ib0e5PeDu/OC2I7jiXLs5/Nm9eBDWqGiC/l0Z5zC6ssmoL
         zW20yx6ny7jlBRJ9gscmgvG8T2yOQHHZAMbT9ygxV60PYFYAQCS1KGTg5rYVtObl7Fch
         IEmA==
X-Forwarded-Encrypted: i=1; AJvYcCWys3w8AeoH58AY7VJrgwd/5c9QSOxCbZHCONPdquO7hulXSTEG2NhD9vE/fM/ItQiJzv+6NnaJgK+yqFv5SA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwtBm7YRnRB2YFpk4WUtJ2YusEp1aY/FCwENZvsuwGPMtq8vGHU
	VFEvawmFoe0hCYBQypT5olePxlQBYAJTaDotCdoVbFO0141/d9csfet3
X-Gm-Gg: ATEYQzyF3pJDyQTl5+QCjeL1JNEczg0gPOBRRnjq/AQwxpNioi5R6d/SmkRdXBWef72
	Acc7U5K8q5DepF5Qmc1jTjrK0IY8A7BIX8EHmDouDoR2+SYs9BdBAkX7gxJKQcVhos47rDVsIK2
	B8Jo+3cMMiFGyTrmdVFmLX1GyXUpmhn1wfBiKDAuJyfeOpJB1v3OcBc2vUC0D7SeNPz97piPBY4
	vqjGy5KiySn51y9Fi/HWG07VsrwO4O5eBy+hqZ/LTj2c+/NxeiLI+Lpz82DIlgqY08Ea8Vp72nH
	PJkYsbnwD1TktM+7JP20/9PdgVwER8y/Lz1AYMQFpGrEt0vz/mY2K5k11Obd7W8CihnqfR1J7Vp
	LgqG/49A70cr8mV9+6roAvIUQv8snqWdzEP89pjgL0M4VZPjSwViOGb5V1D9+y3nFPQ27+pl5L6
	Z/vajwjK8T1U0gdHiuLXrTceoCZ4JcBuGoCTk8QFC79t14HJ3E
X-Received: by 2002:a05:6a00:3696:b0:81f:4a06:6f5 with SMTP id d2e1a72fcca58-829f6e71c7bmr133338b3a.4.1773173162881;
        Tue, 10 Mar 2026 13:06:02 -0700 (PDT)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm101660b3a.13.2026.03.10.13.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:06:02 -0700 (PDT)
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
X-Google-Original-From: Sanjay Chitroda <sanjayembedded@gmail.com>
To: jic23@kernel.org,
	m.tretter@pengutronix.de,
	mchehab@kernel.org,
	p.zabel@pengutronix.de,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	pure.logic@nexus-software.ie
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	kernel@pengutronix.de,
	kees@kernel.org,
	nabijaczleweli@nabijaczleweli.xyz,
	marcelo.schmitt1@gmail.com,
	maudspierings@gocontroll.com,
	hverkuil+cisco@kernel.org,
	ribalda@chromium.org,
	straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	lukagejak5@gmail.com,
	ethantidmore06@gmail.com,
	samasth.norway.ananda@oracle.com,
	karanja99erick@gmail.com,
	s9430939@naver.com,
	tglx@kernel.org,
	mingo@kernel.org,
	sun.jian.kdev@gmail.com,
	weibu@redadmin.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	sanjayembeddedse@gmail.com,
	skhan@linuxfoundation.org
Subject: [PATCH 3/7] iio: st_sensors: simplify cleanup using __free
Date: Wed, 11 Mar 2026 01:35:09 +0530
Message-Id: <20260310200513.2162018-4-sanjayembedded@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310200513.2162018-1-sanjayembedded@gmail.com>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_130603_649070_39E57805 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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

From: Sanjay Chitroda <sanjayembeddedse@gmail.com>

Replace manual cleanup logic with __free attribute from cleanup.h. This
removes explicit kfree() calls and simplifies the error handling paths.

No functional change intended for kmalloc().

Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
---
 drivers/iio/common/st_sensors/st_sensors_core.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/common/st_sensors/st_sensors_core.c b/drivers/iio/common/st_sensors/st_sensors_core.c
index dac593be5695..f641b62e692b 100644
--- a/drivers/iio/common/st_sensors/st_sensors_core.c
+++ b/drivers/iio/common/st_sensors/st_sensors_core.c
@@ -501,14 +501,14 @@ static int st_sensors_read_axis_data(struct iio_dev *indio_dev,
 
 	byte_for_channel = DIV_ROUND_UP(ch->scan_type.realbits +
 					ch->scan_type.shift, 8);
-	outdata = kmalloc(byte_for_channel, GFP_DMA | GFP_KERNEL);
+	u8 *outdata __free(kfree) = kmalloc(byte_for_channel, GFP_DMA | GFP_KERNEL);
 	if (!outdata)
 		return -ENOMEM;
 
 	err = regmap_bulk_read(sdata->regmap, ch->address,
 			       outdata, byte_for_channel);
 	if (err < 0)
-		goto st_sensors_free_memory;
+		return err;
 
 	if (byte_for_channel == 1)
 		*data = (s8)*outdata;
@@ -517,9 +517,6 @@ static int st_sensors_read_axis_data(struct iio_dev *indio_dev,
 	else if (byte_for_channel == 3)
 		*data = (s32)sign_extend32(get_unaligned_le24(outdata), 23);
 
-st_sensors_free_memory:
-	kfree(outdata);
-
 	return err;
 }
 
-- 
2.34.1



Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32822C47DDF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jan 2024 09:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sMxRirpa263d6PmLZyC9XRaAp28SbobvUK5ST0uEzHo=; b=TWC9J8DszLxLO0YOElwLfTPRPg
	7X9oqqaSRqp13+8KOytD5goNG2QvUC/bsCO9J4sIPQI8UFR5jovNpEecQC8lHALOyzOdgtG2PeR7N
	TnWHUdOmlqXXOO+FaUupOHJZ2xXL0gbcy4BoKQ2SDengbc4N1kD4QfWVoUXf7hAMH6Sq+taKF8uaw
	GF7iej4G1P/2u1xUWcP3EnLJnNZNQiviXb4GB5iZM3hbcrPZ98mM8VLWMrW3LCXAwdacgKe+GnkJy
	UTEXQ9M4+VLdmVVyJisdY3pNC5S0zMHd1YFUM77jj03yx8jQ5OJl49XgceaZSXymCPHQNU4IDKKiu
	Qsu7XBHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUkrc-0000000G3iK-35S0;
	Tue, 30 Jan 2024 09:57:08 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUkrY-0000000G3eX-1pdw
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jan 2024 09:57:06 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1d8e7df6abcso10590375ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Jan 2024 01:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706608622; x=1707213422; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sMxRirpa263d6PmLZyC9XRaAp28SbobvUK5ST0uEzHo=;
        b=Fm7DidgWtVfQ1I698rhCQEmpYlhfLmjPsVHTUAMDbl1tyTb5nIspNoYpDQnWCeaWW2
         wMFgYMKoWh4S1PJxv098+hzQXXch8Z+tbWa7wBjAgtV1aWP+3JdYFfofRNW0SnsomoDO
         3E9HhC39wegdgLcjoEfTv53OcGcEgty1h8710=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706608622; x=1707213422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sMxRirpa263d6PmLZyC9XRaAp28SbobvUK5ST0uEzHo=;
        b=qfHMTd980MEDwA0xq++z9AK4rYSSwpyTynckeLiJx5UtUeI27P/DBcM1xB+CikQ6Yl
         sAjuKN3/lrK3+O2pEL8x8KaqoHHJh8eeM5FJr1DWderJfLnu3hvKHf1wuhlrgMT8dCf1
         Z8D7775+PsBd3KBICF82piQ5T26w607NH/q14F0idup38fh2mOA2dxsknw4/IwM/MYn9
         0Az5IdjzI4mdNQ4SWMqY7kdkjXR8MjusqikB/0LZeM2DmZdNgc8SxRFsuUqbg2DyUGN9
         IPyVYpCJ1finF17RO7oatWM2nH7bO2ciuzxmQOoI91JuLTFM+fKdPEslB8wKESn5ubpi
         /aaw==
X-Gm-Message-State: AOJu0YxlHu7E90zSWEbW3DBwQnNKI8K8ZMHnddyVfJNeq3oMAYoihv1V
	iR9NgGHj4u45OQ2mhSH2WulSoRxjIllcmf2YuZNdUyrUndEn9HtKLiVNJn0qsA==
X-Google-Smtp-Source: AGHT+IHjRn3nfznyOhQX8l8ftcqqS1VpyZkxitaxKAKHRGb39QcMRCBeDFEsnLCSu5ZRIaRQd6A10w==
X-Received: by 2002:a05:6a20:3f95:b0:199:c8f1:58 with SMTP id ay21-20020a056a203f9500b00199c8f10058mr4049745pzb.41.1706608622688;
        Tue, 30 Jan 2024 01:57:02 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:469:110f:d748:6896])
        by smtp.gmail.com with ESMTPSA id sm5-20020a17090b2e4500b0028ffea988a2sm8069810pjb.37.2024.01.30.01.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 01:57:02 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	William-tw Lin <william-tw.lin@mediatek.com>
Subject: [PATCH 1/3] soc: mediatek: mtk-socinfo: Clean up NVMEM cell read
Date: Tue, 30 Jan 2024 17:56:51 +0800
Message-ID: <20240130095656.3712469-2-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240130095656.3712469-1-wenst@chromium.org>
References: <20240130095656.3712469-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_015704_534414_1AC8FA0E 
X-CRM114-Status: GOOD (  18.37  )
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

The mtk-socinfo grabs the NVMEM device devm_nvmem_device_get(), but then
proceeds to put the device directly with nvmem_device_put() if the read
is successful. If the device fails to probe and goes through the devres
release path, the device would be put a second time, triggering a
use-after-free error from KASAN.

Fix this by dropping the devres part. Since the NVMEM cell data is read
only once, there is no need to keep the reference around.

While at it, clean up the function to directly reference the NVMEM
device node and use that to find the NVMEM device, instead of finding it
by name, which is more fragile. The cell node is always a direct child
of the NVMEM device node, courtesy of the legacy NVMEM cell layout. Thus
of_get_child_by_name() is a better way of finding the cell. Last,
correctly put the device node once its use is over.

Fixes: 423a54da3c7e ("soc: mediatek: mtk-socinfo: Add driver for getting chip information")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/soc/mediatek/mtk-socinfo.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-socinfo.c b/drivers/soc/mediatek/mtk-socinfo.c
index 0094f43e1e08..3909d22062ce 100644
--- a/drivers/soc/mediatek/mtk-socinfo.c
+++ b/drivers/soc/mediatek/mtk-socinfo.c
@@ -9,6 +9,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/nvmem-consumer.h>
 #include <linux/device.h>
+#include <linux/device/bus.h>
 #include <linux/debugfs.h>
 #include <linux/seq_file.h>
 #include <linux/string.h>
@@ -82,25 +83,28 @@ static int mtk_socinfo_create_socinfo_node(struct mtk_socinfo *mtk_socinfop)
 static u32 mtk_socinfo_read_cell(struct device *dev, const char *name)
 {
 	struct nvmem_device *nvmemp;
-	struct device_node *np = dev->of_node;
+	struct device_node *np, *nvmem_node = dev->parent->of_node;
 	u32 offset;
 	u32 cell_val = CELL_NOT_USED;
 
-	nvmemp = devm_nvmem_device_get(dev, "mtk-efuse0");
+	/* should never fail since the nvmem driver registers this child */
+	nvmemp = nvmem_device_find(nvmem_node, device_match_of_node);
 	if (IS_ERR(nvmemp))
 		goto out;
 
-	np = of_find_node_by_name(NULL, name);
+	np = of_get_child_by_name(nvmem_node, name);
 	if (!np)
-		goto out;
+		goto put_device;
 
 	if (of_property_read_u32_index(np, "reg", 0, &offset))
-		goto out;
+		goto put_node;
 
 	nvmem_device_read(nvmemp, offset, sizeof(cell_val), &cell_val);
 
+put_node:
+	of_node_put(np);
+put_device:
 	nvmem_device_put(nvmemp);
-
 out:
 	return cell_val;
 }
-- 
2.43.0.429.g432eaa2c6b-goog



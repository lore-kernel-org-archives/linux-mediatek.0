Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93E8CCA482
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 10:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8FGuAafZHqfrP28YvJIs+zNrzq+lDdIf2d0BaQEypgw=; b=RgQEtxCWsySwJxoapRypBYX2Dz
	V15vrDGZRSOPItRc+bdkDs+RGIkryjUW6S67DioQWEwzolDPzaMoGX4Mn2oRDNvEaMcblIwsTe2++
	rQ6LIs+1N9th6bjFcPuKN6AZUX87qG/3NUS1wEJFdXB0X1+i+lFV3wE1IWpOcgLrx5nW8OAR745Na
	tr/i51xatvv5z37fOMSAK88TGLHW5DhXHnnjkw/75PXa7RdK34VrgnBIFu4Uy0xBkunoaTQm1Udft
	cSPcryz3qAJ1a1++yG8azz0s6bHNrMtzV2jd7ikvQu0GDtFBza4ff+1zRtf984wxgtOtYa0FnUKsO
	syJoJQnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9lUB-003FAY-J5; Fri, 08 Jul 2022 10:45:23 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9lU9-003F8m-Cq
	for linux-mediatek@lists.infradead.org; Fri, 08 Jul 2022 10:45:22 +0000
Received: by mail-pj1-x102b.google.com with SMTP id v4-20020a17090abb8400b001ef966652a3so1514759pjr.4
        for <linux-mediatek@lists.infradead.org>; Fri, 08 Jul 2022 03:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8FGuAafZHqfrP28YvJIs+zNrzq+lDdIf2d0BaQEypgw=;
        b=kAn9QxId/nVRVVDl4BWaJvyUT7nw0/Wj9Dt7rLTYAw6GgnyPkzXbYgoEJmw5Djd/EU
         6ySb21MhRFifBS1Z0bp2RHFXH8ws5efoziPWD2jYhsCxl4Tbuw8CbYQ4sP7LSl/BQ0Q0
         1/c4LLsIslOSV0juwTx1wa9ywgmT915jt8wXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8FGuAafZHqfrP28YvJIs+zNrzq+lDdIf2d0BaQEypgw=;
        b=ygubVsvnwsyj14SNYOK54CEw3Rq1Unyzgyrgs+LEdMcqaqYxBPnEY+M0v6YfYHOUp4
         HCHz/B+hKVbprK1JE/G0ZOHewor61Qxj2tO3F6VWrPXjV1vZ9LfS+yOvIZY/qY4Xl4Hh
         OTlMq7tKaji+uVnFfpmEPQXXRx6P1+eu/0Mg4hw7Dkv8ghI8w+tvlXLxcVtZxl0l0yX5
         fTY0VuApm7kHQ+D7H0OBEobfwNRBE2dBfAr+Uhl45Jzwi48H7sDxIKBiHgUcyG7Wudaw
         PsxLKVJa5upS2j0z08+U3XWMZQGIOBzXWxvm0ksJRyOipPb3zkPhamel3OxFFs7H8Dt0
         Qmrg==
X-Gm-Message-State: AJIora8jjdYai9OXkqWE3kuwxoXNg7S3kC1hczmg9CdiE/yq42sTMaiG
	uBY96kEbP495qRIWV9mfEmEfag==
X-Google-Smtp-Source: AGRyM1vkm3nbZ0roWIsSOm7IfBhet7ILyiwzMy3G/yPRpSMF9I28WxxzEmcHesEkeKJMzES2L1Jf6g==
X-Received: by 2002:a17:90a:e98d:b0:1ef:7863:b7d2 with SMTP id v13-20020a17090ae98d00b001ef7863b7d2mr3256468pjy.101.1657277118450;
        Fri, 08 Jul 2022 03:45:18 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:db98:ad5d:ca9:da58])
        by smtp.gmail.com with ESMTPSA id m6-20020a635806000000b0040c9213a414sm27216187pgb.46.2022.07.08.03.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 03:45:18 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH v2 0/2] media: mediatek-vcodec: Fix capability fields again
Date: Fri,  8 Jul 2022 18:44:49 +0800
Message-Id: <20220708104451.3901064-1-wenst@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_034521_439628_F2D5CBF7 
X-CRM114-Status: GOOD (  15.84  )
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

Hi everyone,

This is v2 of my mtk-vcodec capabilities fixes series.

Changes since v1:
- Squashed 3 patches into one, as Hans recommended

The previous round of changes to the mtk-vcodec driver's returned
capabilities caused some issues for ChromeOS. In particular, the
ChromeOS stateless video decoder uses the "Driver Name" field to
match a video device to its media device. As the field was only
changed for the video device and not the media device, a match
could no longer be found.

While fixing this, I found that the current info used for the fields
don't make a lot of sense, and tried to fix them in this series.

Patch 1 fixes the capabilities for the decoder. The driver name field
change is reverted and made explicit that the field really should match
the driver name. The card name is made a user readable string that
includes the SoC model. The bus_info field is dropped and the default
value from the V4L2 core is used.

Patch 2 does the same, but for the encoder size. And since the last
reference to MTK_VCODEC_DRV_NAME is removed, the macro is removed as
well.

This series is based on next-20220708, and was tested on mainline on
MT8183 Juniper, and on ChromeOS v5.10, on which we have a whole bunch
of backports pending, on MT8195 Tomato.

Please have a look.


Thanks
ChenYu

Chen-Yu Tsai (2):
  media: mediatek: vcodec: Make decoder capability fields fit
    requirements
  media: mediatek: vcodec: Make encoder capability fields fit
    requirements

 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c | 7 ++++---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h | 1 -
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c | 7 ++++---
 3 files changed, 8 insertions(+), 7 deletions(-)

-- 
2.37.0.rc0.161.g10f37bed90-goog



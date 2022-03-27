Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DAFC433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Mar 2022 22:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UeKYrxA26yG6kqEoeoezN3m+ddkiw67vj/tWIUjFFYM=; b=ViG+N7YDkvfDqN
	Z9o6j80fMxzIFGV3tEjuXcZpteCk+sA1DpOIIluu9DODZOTWTxTIIweKRKNwsIFAL/WXjnfyxYloR
	Ox63J/2sTbIrlHBaS4FtuKPRGPeqBYPN38nBZisym9yL7z9t0meUbtoHNDfTY3EHAKpmVyQe5lR0h
	K42fncXu8WDLOzFqsbAyuLFijboGGJMmLcYVvEdMMngR4pIZcvj2I8LVxryu4RLgcVNborfcTVZXp
	Og2mcgyjOMIoKYbt3PV5an5vrL1IOVFPQvutrDSBPrAPv4jXJczaOPWNNWpY1rbvE30Ljs/DPzct+
	JVkWbke4Jos8j/Ih1uPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYbkk-006bIl-E5; Sun, 27 Mar 2022 22:52:54 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYbZn-006VMA-TX
 for linux-mediatek@lists.infradead.org; Sun, 27 Mar 2022 22:41:48 +0000
Received: by mail-wr1-x42e.google.com with SMTP id r7so16789310wrc.0
 for <linux-mediatek@lists.infradead.org>; Sun, 27 Mar 2022 15:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TwcBGQ6dA75HdxpcUCrD8mvsn7/MZTlw7uERAWlwKmI=;
 b=AYDLTANXWRzGnB+sIMp01grvGk/SH+cQkVVSn0Jme+Sp0Hdpav8Wlpi1giPYDpywOB
 f6+XMddOzg//0bbLhJQCLnkfAV0Ch64BSBs9oAbxmdSQ0aFw6LF+1eH4sCXHn+oCWJK9
 HAUXrfbNKPFhPTj2hSbp90b+fYh/KO1rXKZin8vWp75AbJyk6dGaR6kJh+zhJpkys+jQ
 Pk2FkzjQ/WrzkwnRLJGntCY5EY+d50uMvlP3KirJCkkCRn482UEZBSRYDpkR0UJ46DUu
 laMi+vD1+SNfyKxtrkIT5iuFhSooYpFxBbnxJgCDry2m5x5p4qdMYjJqUvDmSn3XsbJm
 bITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TwcBGQ6dA75HdxpcUCrD8mvsn7/MZTlw7uERAWlwKmI=;
 b=2T44Oe0m16lC+QRaZrOPcFlEXjLD9VmXCvcnI0nJmkgk0wcCSQ0gITF7Zs8bNLzowm
 eDRrCSd2xH2npcx+DnqPEwLkuH+0w+k5JPiyXpGiX6+7IiXCO+EmdQpM8Rsc61pMe2f7
 PtNM9N6YBIi60NW0zAdSo9sKqJA83jWrswCl1pEx445GMXZpdq0PLs8rsxkK6+/4LGnY
 koWDsWJwHZJ0tVxH4i6zdYZcEjkeKHf9uh3MDXSOOszo913TsZoVrL0pKhNZ/cW0G0vS
 OCrjEesi+o1DJYwiVhd1UoJrQoV66bSelMKABQ0QJaaOQthOjFkAegbMHsS3rUcLt80i
 oAJw==
X-Gm-Message-State: AOAM532MDwc5TM1jnw9/ftFXF0/yzpIU909MqEHyhoYr4rJu3OGNCwom
 raxNdArHWifVHlqMlvLd/ASetQ==
X-Google-Smtp-Source: ABdhPJysfkYMrMgHwodSSnzMkqerBi1jwSuIF2iefWJ4/FcOg7MYEeM+UjIlCWYlQv0Ck0GULeS7uA==
X-Received: by 2002:a5d:6daf:0:b0:204:12b6:a15 with SMTP id
 u15-20020a5d6daf000000b0020412b60a15mr19676354wrs.340.1648420894641; 
 Sun, 27 Mar 2022 15:41:34 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6341-357e-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6341:357e:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id
 v5-20020adfe4c5000000b001edc1e5053esm10400867wrm.82.2022.03.27.15.41.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 15:41:34 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: airlied@linux.ie, angelogioacchino.delregno@collabora.com,
 chunfeng.yun@mediatek.com, chunkuang.hu@kernel.org, ck.hu@mediatek.com,
 daniel@ffwll.ch, deller@gmx.de, jitao.shi@mediatek.com, kishon@ti.com,
 krzk+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 matthias.bgg@gmail.com, mripard@kernel.org, p.zabel@pengutronix.de,
 robh+dt@kernel.org, tzimmermann@suse.de, vkoul@kernel.org
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, markyacoub@google.com
Subject: [PATCH v9 21/22] drm/mediatek: change the aux retries times when
 receiving AUX_DEFER
Date: Mon, 28 Mar 2022 00:39:26 +0200
Message-Id: <20220327223927.20848-22-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220327223927.20848-1-granquet@baylibre.com>
References: <20220327223927.20848-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220327_154136_010445_EF4771E5 
X-CRM114-Status: GOOD (  12.90  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Jitao Shi <jitao.shi@mediatek.com>

DP 1.4a Section 2.8.7.1.5.6.1:
A DP Source device shall retry at least seven times upon receiving
AUX_DEFER before giving up the AUX transaction.

Aux should retry to send msg whether how many bytes.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index e099491cc6a4..7a197c4a7143 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2016,7 +2016,7 @@ static ssize_t mtk_dp_aux_transfer(struct drm_dp_aux *mtk_aux,
 	bool is_read;
 	u8 request;
 	size_t accessed_bytes = 0;
-	int retry = 3, ret = 0;
+	int retry, ret = 0;
 
 	mtk_dp = container_of(mtk_aux, struct mtk_dp, aux);
 
@@ -2050,14 +2050,21 @@ static ssize_t mtk_dp_aux_transfer(struct drm_dp_aux *mtk_aux,
 	}
 
 	if (msg->size == 0) {
-		ret = mtk_dp_aux_do_transfer(mtk_dp, is_read, request,
-					     msg->address + accessed_bytes,
-					     msg->buffer + accessed_bytes, 0);
+		retry = 32;
+		while (retry--) {
+			ret = mtk_dp_aux_do_transfer(mtk_dp, is_read, request,
+						     msg->address + accessed_bytes,
+						     msg->buffer + accessed_bytes, 0);
+			if (ret == 0)
+				break;
+			usleep_range(500, 600);
+		}
 	} else {
 		while (accessed_bytes < msg->size) {
 			size_t to_access =
 				min_t(size_t, DP_AUX_MAX_PAYLOAD_BYTES,
 				      msg->size - accessed_bytes);
+			retry = 32;
 			while (retry--) {
 				ret = mtk_dp_aux_do_transfer(mtk_dp,
 							     is_read, request,
@@ -2066,7 +2073,7 @@ static ssize_t mtk_dp_aux_transfer(struct drm_dp_aux *mtk_aux,
 							     to_access);
 				if (ret == 0)
 					break;
-				usleep_range(50, 100);
+				usleep_range(500, 600);
 			}
 			if (!retry || ret) {
 				drm_info(mtk_dp->drm_dev,
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958F4C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 15:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/INWwnqNfV5JFEFk/50Rn40gbC8UwpPFfNuMFm7WM+0=; b=4JTNO54ZPk/kfE
	RK6HcRF1ja3t2cgwYIruuc3jexacasoLBavBwS0ZMNPJNgEg83GK2tLs9eUsMw/surPJJOKUfq/GS
	+eS9pmKEW/bTnlvTGL2dROGsI7sCUWCzJyfs/h8hiwLfOU9OYziIHZ1khTs6Vb9NXSmCL970zajFA
	s4CWbVEp9GlfTOkuRkwtIIsyrtRFfQjVX6mzZHyquFwVHl05MzhVmMFdd6o3g5REXAR0xeE56yEyt
	bfwNQJOBgNrwcXRop5/8cdg4snFEgy9Kt5QEf7moLOo5VCQFRrl7hsQJp/l1MjlyFVbqvXFdTz2dA
	ROTTQUbTVnOeCKQUbOIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL4zI-00F1ri-Dy; Fri, 18 Feb 2022 15:16:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL4ge-00EsXN-EQ
 for linux-mediatek@bombadil.infradead.org; Fri, 18 Feb 2022 14:56:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=ShbwZ80LmFKnV7XTCTWddvBgAcwyS+Rlr/cQnWDh+r8=; b=OvJEx1sebE0TW1pmysGmoqNk1m
 yEdfbguR2vQ5xqxKlkB6PrhGw5pRmrHuGf0rxqGxT2mU+NdDDP141L/QV9w8oXJRDUpQeEb6YMv8Y
 PBplc/kyBjPXMGNluzZRhdZLQnXX6sF2VIETuF+KDnj60VTJ//vMniEwGAZOCCL+2Ot33RUmkCI1p
 2sqx+U8D3n+cZj5vUdq4kB2HGEW0TiGlBu0mZ+d1Y3EJEFhvxLz2GV77dhqdqLnWT1bYd/hJlqMtj
 Mi+zog8lutljUbg9pqnfcPSChTcBE4DpmtjbBKwMimUludQE5APGy4AvZP/HaV1AW9EcEHmV83pLF
 KPkfWI2Q==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL4gY-00Aqdx-Fy
 for linux-mediatek@lists.infradead.org; Fri, 18 Feb 2022 14:56:43 +0000
Received: by mail-wm1-x335.google.com with SMTP id w13so4938241wmi.2
 for <linux-mediatek@lists.infradead.org>; Fri, 18 Feb 2022 06:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ShbwZ80LmFKnV7XTCTWddvBgAcwyS+Rlr/cQnWDh+r8=;
 b=TlvVaSawjag5QcCFrxOeydzjezBCwYA71bAh5NjNpv3SHN6mqttytcIZ1ZgpBwKBhm
 rfezW9xKGlKKy1maOF0q0bZ8eb7bdAdt3KImIxdsP4RGbc6xusqEay/AvTrvAJqQFXG2
 dFIYcwHJUnJKRK5mHz9wwLo7pz8tFPX24yMCFluQA8LhYto3jG+pxfhSE4BHc4ydSuYQ
 FWjcKhv99vqLAw5J5Ij9ED2zWsNF0alEUiHfeRsqnM9UnQlIlw1hoP080u7AuNamg0Nc
 /cGm5OlLFhP3l+rDTAT9YHDNeOe/jnE801jLgnj8e3a6tQD+NefNHPIkBSjT29J3iuSe
 Lsxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ShbwZ80LmFKnV7XTCTWddvBgAcwyS+Rlr/cQnWDh+r8=;
 b=coad71Qv2bdwK+hRBRzVq9JRgfmmBhwGbuUASuNFyM4Z/F88zqUCIAB9CPGEJjl0mP
 dXNfqZb3uF8jEhK1gl2kagSrhHzjNjcE8WHo0+LKjXuHqJieX96OVlfktuN1VNOvEBXf
 lfq0rPXpYiBCpI4SH98jsqB0s0aVKBXButu3OkbApacQ1NbdCVaYaMiseA06utHgEPpP
 2OcnWCN6731iAFhTcVlSOwTOTRyEIDpBK26nUpce8DBQXugOS8spGHqkvEVbp6fG+C5f
 iBX8TMrdffPXhb3rojhRSmUPnp6D+RyCnP97ZMaTn7EgiZ9slSr3z6sUkSthwzE3DHT2
 a5mA==
X-Gm-Message-State: AOAM531AtonarmVQo5DsTTo9KnOfdbm+UCLMe349Rxhn5Zsr9507jEXn
 UJAnfGdf/vr1GZjWbJnRI2xUXA==
X-Google-Smtp-Source: ABdhPJxQb+ScIrjd3rfZdwkrYFFMK8Y51NEi9X9M09wLIOSbidtouCx2ztOxoRTCWFl9dttaBKNF5w==
X-Received: by 2002:a1c:4408:0:b0:37b:c7f0:a36e with SMTP id
 r8-20020a1c4408000000b0037bc7f0a36emr7420230wma.186.1645196196839; 
 Fri, 18 Feb 2022 06:56:36 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8440-6241-3b28-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6241:3b28:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id b10sm47431454wrd.8.2022.02.18.06.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 06:56:36 -0800 (PST)
From: Guillaume Ranquet <granquet@baylibre.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, matthias.bgg@gmail.com,
 chunfeng.yun@mediatek.com, kishon@ti.com, vkoul@kernel.org, deller@gmx.de,
 ck.hu@mediatek.com, jitao.shi@mediatek.com,
 angelogioacchino.delregno@collabora.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-fbdev@vger.kernel.org
Subject: [PATCH v8 18/19] drm/mediatek: change the aux retries times when
 receiving AUX_DEFER
Date: Fri, 18 Feb 2022 15:54:36 +0100
Message-Id: <20220218145437.18563-19-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218145437.18563-1-granquet@baylibre.com>
References: <20220218145437.18563-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_145638_775598_321883A8 
X-CRM114-Status: GOOD (  12.25  )
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
 drivers/gpu/drm/mediatek/mtk_dp.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index fe91ab8b2fd89..4e880d8a8a186 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1879,7 +1879,7 @@ static ssize_t mtk_dp_aux_transfer(struct drm_dp_aux *mtk_aux,
 	bool is_read;
 	u8 request;
 	size_t accessed_bytes = 0;
-	int retry = 3, ret = 0;
+	int retry, ret = 0;
 
 	mtk_dp = container_of(mtk_aux, struct mtk_dp, aux);
 
@@ -1913,15 +1913,21 @@ static ssize_t mtk_dp_aux_transfer(struct drm_dp_aux *mtk_aux,
 	}
 
 	if (msg->size == 0) {
-		ret = mtk_dp_aux_do_transfer(mtk_dp, is_read, request,
-					     msg->address + accessed_bytes,
-					     msg->buffer + accessed_bytes, 0);
+		retry = 7;
+		while (retry--) {
+			ret = mtk_dp_aux_do_transfer(mtk_dp, is_read, request,
+						     msg->address + accessed_bytes,
+						     msg->buffer + accessed_bytes, 0);
+			if (ret == 0)
+				break;
+			msleep(50);
 		}
 	} else {
 		while (accessed_bytes < msg->size) {
 			size_t to_access =
 				min_t(size_t, DP_AUX_MAX_PAYLOAD_BYTES,
 				      msg->size - accessed_bytes);
+			retry = 7;
 			while (retry--) {
 				ret = mtk_dp_aux_do_transfer(mtk_dp,
 							     is_read, request,
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

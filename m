Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F77F3D5FC
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Mar 2026 09:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TB/QPugCcb4AdM0Fj/XxB/blX3PBNtkMN7SH+oDhiFA=; b=GnecIu1w7rNBsWFgyorZcE7pah
	XyuTlwIVKkepOsq1JyvDFx9J5AgVsRNg8nP6hESHppJaM4fwtqJ3GjNRIF8ObmBc6f2QyWKuyNbYv
	/AfZai11D1XDZAi9tLuWyUSqocxlYVLjw/jVWA4BauRU/g5NLeJWj6Kdqsnfd49gVuqxs0G0BVmA1
	3MBXsejZM6rDRayqvPtYwPxdTqTJL5MsClrmnF1tH/3c+a4JNSCzy7F3BFfU0f4WCOQ8dGY/9HYcB
	GtnG6AviB+FQytTnbvlSAj0i7aQKRnIVrLBC0i6TgxK/vezAo206qlE9WbUZHJg84HWi30IZ/xTVy
	uX/2SIbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6mCL-00000009m4D-1OJR;
	Sun, 29 Mar 2026 09:12:45 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6mCJ-00000009m3K-14qr
	for linux-mediatek@lists.infradead.org;
	Sun, 29 Mar 2026 09:12:44 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-43b88b7ca76so2897013f8f.3
        for <linux-mediatek@lists.infradead.org>; Sun, 29 Mar 2026 02:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774775560; x=1775380360; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TB/QPugCcb4AdM0Fj/XxB/blX3PBNtkMN7SH+oDhiFA=;
        b=c3KZYfnkjVAhcs1j+5vPk+NF/VTH12UfaL75UKux0nbpQl4pNe3yrOx17UGXx1qyNc
         qs6m85mrmERpw2Ru3xLmQ2ayVhBU0aDjB8wl5uzKBcvzC1YvRIBzm3nXL9PoJRO6fbxB
         KlHpvM4fGI3KRDIZ0Y8AG32Sayvu19BdHJPm4k9DnI3323VxJUetoMEBhFsLcwLLlxWK
         EwH7gM2/dpeT+cJJZSBcz82rP50Nulhhq8guCZmGXAILyJ23t8fb7P5LXS5SvDkgiKA7
         5KeUhxosZR+9KTGl9uf1HeTirKKG9GFhGDclUiA2eNlJTqv5dpzo5SW3j6TanwxgAWcM
         Rdag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774775560; x=1775380360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TB/QPugCcb4AdM0Fj/XxB/blX3PBNtkMN7SH+oDhiFA=;
        b=gnBqwRgbwhJvTcwKly+ikl5qNJOP6K6knLyX4TZceA/s1kND0a3qNPCsdyixsYCvLG
         U9xSOwPhceH4+uFQsPSgHwxMWmNZTZc2f8LhHLjFRnrw4XBIK0sywIRo9UrwrATxOAPy
         HtNFwnnMUwC4cSo/aLN7rRKd2kWSvtZHsVv9kc9nea0Gn2smXa+RMBN4rXmGa18ETtls
         ICwmqjlOKDH0ETHisXzAzQgXB8uSCXLjdalJbc8Cvv8UHW2RftVMXLl43wjky6mRjLvu
         TLu+xbbIKyak9YyFJfALOiQqZk+nroox2ES6WCv91ds0nS47NycLuSogzm4V6jDOvW1o
         Ovbg==
X-Gm-Message-State: AOJu0YzBxd43gwjOMkc7Y+lRkqS7skE7lxP2tcQ8rO9TRJ/aTeP6Mj/Y
	AamZgs8/PDllagFdlj8Vk7IRlJYqZ7B2H2ChceDNodaIsDuJkVzdHgI65vURghP8
X-Gm-Gg: ATEYQzyO1t8JzGmUYVw+kY6iZMB+yq/7ws7TMiH4Qo+Q6N5HYiYwhqeUuCg+ir/ZcTV
	5zlwZDyciSXla6rnCpY7l3bHUCZOcfi3asfzI713iVggFpnYMkGdqQe5eiRdLeHILdttvgwA0aJ
	R/T6gSuO+0O5rCHlBF6xDIAk+PzlOjGwCmtuNWj8Ct1+kYR2JksRF5stVX8ml83apFI1jxx9gTZ
	N17oVjCdy8RDOM3RY2fqJ0QHpnSFrxTvJQhj6H3wYylxUUhJYQhCfUlj/ES5BpmCasZXSBu+MZy
	h2ntquL0XYE4fUlb2fcEvIhRgSu4VnpcgiyrRcUXjYZ66ECS07THy2VSZ9NWEEvz34MPwrVmmFF
	7wdOjUwF8gne0l0Jmv+D86qVTL8lzf8IWOCrkjpRA+fx+fD9J/ie9TfTuHu8Rip7iMcanukXafX
	l1bhx+HqMXV/AsrtbUnsI=
X-Received: by 2002:a05:6000:428a:b0:43b:5b25:67ff with SMTP id ffacd0b85a97d-43b9e9a97e9mr14703306f8f.24.1774775560242;
        Sun, 29 Mar 2026 02:12:40 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf90424fcsm4625813f8f.32.2026.03.29.02.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 02:12:39 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Fabien Parent <fparent@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 RESEND] soc: mediatek: mtk-mmsys: Restore MT8167 routing masks lost during merge
Date: Sun, 29 Mar 2026 10:12:20 +0100
Message-ID: <20260329091225.4530-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_021243_302540_543BA8CA 
X-CRM114-Status: UNSURE (   9.75  )
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

The original patch that was sent to the mailing lists included the values
for the route masks, but they got lost during merge: add back the full
register masks where missing.

Fixes: 060f7875bd23 ("soc: mediatek: mmsys: Add support for MT8167 SoC")
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mt8167-mmsys.h | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/mediatek/mt8167-mmsys.h b/drivers/soc/mediatek/mt8167-mmsys.h
index c468926561b4..eef14083c47b 100644
--- a/drivers/soc/mediatek/mt8167-mmsys.h
+++ b/drivers/soc/mediatek/mt8167-mmsys.h
@@ -10,24 +10,29 @@
 #define MT8167_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL_IN	0x06c
 
 #define MT8167_DITHER_MOUT_EN_RDMA0			0x1
+#define MT8167_DITHER_MOUT_EN_MASK			0x7
+
 #define MT8167_RDMA0_SOUT_DSI0				0x2
+#define MT8167_RDMA0_SOUT_MASK				0x3
+
 #define MT8167_DSI0_SEL_IN_RDMA0			0x1
+#define MT8167_DSI0_SEL_IN_MASK				0x3
 
 static const struct mtk_mmsys_routes mt8167_mmsys_routing_table[] = {
 	MMSYS_ROUTE(OVL0, COLOR0,
 		    MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, OVL0_MOUT_EN_COLOR0,
 		    OVL0_MOUT_EN_COLOR0),
 	MMSYS_ROUTE(DITHER0, RDMA0,
-		    MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_RDMA0,
+		    MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_MASK,
 		    MT8167_DITHER_MOUT_EN_RDMA0),
 	MMSYS_ROUTE(OVL0, COLOR0,
 		    MT8167_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN, COLOR0_SEL_IN_OVL0,
 		    COLOR0_SEL_IN_OVL0),
 	MMSYS_ROUTE(RDMA0, DSI0,
-		    MT8167_DISP_REG_CONFIG_DISP_DSI0_SEL_IN, MT8167_DSI0_SEL_IN_RDMA0,
+		    MT8167_DISP_REG_CONFIG_DISP_DSI0_SEL_IN, MT8167_DSI0_SEL_IN_MASK,
 		    MT8167_DSI0_SEL_IN_RDMA0),
 	MMSYS_ROUTE(RDMA0, DSI0,
-		    MT8167_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL_IN, MT8167_RDMA0_SOUT_DSI0,
+		    MT8167_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL_IN, MT8167_RDMA0_SOUT_MASK,
 		    MT8167_RDMA0_SOUT_DSI0),
 };
 
-- 
2.43.0



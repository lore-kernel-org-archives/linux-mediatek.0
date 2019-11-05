Return-Path: <SRS0=3chi=Y5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB2F1C5DF60
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Nov 2019 21:16:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B820204EC
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Nov 2019 21:16:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fDPyZRgk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=poorly.run header.i=@poorly.run header.b="b7BvNVaq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B820204EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=poorly.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nwRLcXfzHcUcVkxawTzMaT0YEfdwfkvgv94a+31j+00=; b=fDPyZRgkuzJFMg
	uRhvVlZyddOX8olm12jiftMEf10YB25RXNcvKs/0ZVAOjZlToCX6Gsv1bvbgqrwbzJ1opUJ51laVd
	AxbziyjYs5XQvWL4Xm/xwMj9ELeUSov3tx0EbXUCYH6V1xBECsKQq5IiL8hqbgiFk4lIb/rhV+k1E
	PbaoUXvQKUqCe9M+f5RFgaaWbDsiHED2ObD1aYkxsJRKaEjuDBhRndiaZ2Dsdn+la/dpko/hjlmOa
	0zLW4rLPpvLtYvJKfE9XYxSprjAyQ1vsxg6zgylMzCzKLWiN44wSELytwdhOJYTV6jljUCdX+TMfc
	WEZndRnkbN+vAMNsR4aw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iS6Bw-00024k-I5; Tue, 05 Nov 2019 21:16:44 +0000
Received: from mail-yw1-xc43.google.com ([2607:f8b0:4864:20::c43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iS66P-00035E-LL
 for linux-mediatek@lists.infradead.org; Tue, 05 Nov 2019 21:11:08 +0000
Received: by mail-yw1-xc43.google.com with SMTP id r131so2278378ywh.2
 for <linux-mediatek@lists.infradead.org>; Tue, 05 Nov 2019 13:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+WiVxRRU/BsDC4YALJAt3eFqvdwKtmFyjMHuXXIhN00=;
 b=b7BvNVaq55rSQstmyVb7FVPxaDzfpQvfg2LWzAsNLXIw4Zgl5nKJ8oQMM9S+74IlZf
 6evcHrczQNvXo4hfr/qCgBgUU1QXMEibjDd9StKHdtKFZ8/2d2HqLAUO9A0UGR3lsrpn
 HUzkGW8k5Dvge9poGrqF0sURTtUNKfmb4kwUAnaOXEdwRJJVKqRDDS3P8DeScfku51AJ
 xBYemInVm9isbevgdMHl1h6n0R4KLDQ6m+CMiC1pHpmibukZ66lHryHliW1ga6HcwnVx
 mC2RhQ1///qyMnhFQh6+pp/VxcsN1UPACfXKltS0IxDOD9OPpCxKfbtpVGrKHi0jUkDc
 yxmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+WiVxRRU/BsDC4YALJAt3eFqvdwKtmFyjMHuXXIhN00=;
 b=Hmgm7f/O9JVNe8peUJVJlYWVMBT3Wvnd8SGYKDvPjJAaawzg5mlsoyQ04lzMOxdbWY
 PwH+tmFnDDNpH42UXX8Z0yqtN9Mk3raTiXhSl8ecwEJM9keWb/IZq3AIhV6W60Hl1FSf
 N/ttg0ozFosGTuDLifgCdCeyJr2hbHnPLPKTyv1fdTpAFdihKd1sRQmRzbazLBhvisUP
 ZNCldsCWsv7T5ciYFl5orWUqmqRGBqLk4E4ceShyXs0vLVCwDBtIpDsvf8EBJZCx5rq5
 SdtW4Khfdcr8IXTEcqM3sJLMfGp/hiyUkwJ18Em37ipkZjP+riFRhKvSM1H6VbTQUNKr
 NRHg==
X-Gm-Message-State: APjAAAXLkBPG0JFRJiw9RMJMffRVIKoQzaCamXui5/cWAHPHg/TMsrIE
 usXtErwbxo1x0vSnxOn/VvIbg4RstRM=
X-Google-Smtp-Source: APXvYqzqhKbfG6uj0C9QtCsk5hTcg0qnCB5SoNKDWw01NkumaG0mVUCnnbjJ/lO9GqEJnRlx8UxkVA==
X-Received: by 2002:a81:7053:: with SMTP id l80mr23239678ywc.377.1572988260799; 
 Tue, 05 Nov 2019 13:11:00 -0800 (PST)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id j66sm1815216ywb.101.2019.11.05.13.11.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 13:11:00 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 7/7] drm/mediatek: Support 180 degree rotation
Date: Tue,  5 Nov 2019 16:10:24 -0500
Message-Id: <20191105211034.123937-8-sean@poorly.run>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
In-Reply-To: <20191105211034.123937-1-sean@poorly.run>
References: <20191105211034.123937-1-sean@poorly.run>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191105_131101_748747_EE95FEA4 
X-CRM114-Status: UNSURE (   8.88  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: dcastagna@chromium.org, matthias.bgg@gmail.com, mcasas@chromium.org,
 Sean Paul <seanpaul@chromium.org>, p.zabel@pengutronix.de,
 frkoenig@chromium.org, ck.hu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, markyacoub@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Paul <seanpaul@chromium.org>

Now that we support both reflections, we can expose 180 degree rotation
and rely on the simplify routine to convert that into REFLECT_X |
REFLECT_Y

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index f4c4d3fedc5f..4a55bb6e2213 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -143,8 +143,8 @@ static unsigned int mtk_ovl_layer_nr(struct mtk_ddp_comp *comp)
 
 static unsigned int mtk_ovl_supported_rotations(struct mtk_ddp_comp *comp)
 {
-	return DRM_MODE_ROTATE_0 | DRM_MODE_REFLECT_Y |
-	       DRM_MODE_REFLECT_X;
+	return DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_180 |
+	       DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y;
 }
 
 static int mtk_ovl_layer_check(struct mtk_ddp_comp *comp, unsigned int idx,
-- 
Sean Paul, Software Engineer, Google / Chromium OS


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

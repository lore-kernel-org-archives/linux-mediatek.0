Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621DDEFB806
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Feb 2026 06:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AfopHsfGlEfdUUn+Z5Ob2uv5rH6VmacISxBMgn7zNc4=; b=zuUS1xfhrfKuCRLkTi7zPS2tB4
	HUfpmlPapOv+QhzZFXBoDbdoypO5JVBL9w3aXJaQu0Yx/rSnTi5yAoqaN5J2kiUksHbsgND5YYjIC
	SrMTYeVr6koQmXsuw6LZKX0iO7wXN7S5B6lXFHfi5ugerFgz7LBxJVk3o0IWe3wqdvJAzINMYU5KD
	bSwCV7uFPyRbQOXzkPSs1EjPqgwTiNkNZemY0jQBrDOqKi1Y6lwd/AVzNCgpwns/jzhiDOHH5YSrt
	GWIxSs2hMJErRqhr776Rv5jFy7SZFf7ZaKQiIdJQO3I3nAQgo9XhwUXzo3a+xkkBrXF9dUyuZfIE3
	xp5+Ggcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vulg5-00000001VzR-1DWA;
	Tue, 24 Feb 2026 06:13:49 +0000
Received: from mail-oo1-f52.google.com ([209.85.161.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vulg3-00000001Vz7-1otR
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Feb 2026 06:13:48 +0000
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-662f9aeb782so3270834eaf.3
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 22:13:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771913625; x=1772518425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AfopHsfGlEfdUUn+Z5Ob2uv5rH6VmacISxBMgn7zNc4=;
        b=XP6z7og2clLD3aLWj7rpGBDgKePvFeLx8RKrvxKF947VGZhsuvsfvdq2DwdVRzVbIs
         I0oAkE3zILmLqljlT8RCok1Ce3vSQpmIziNfQ2pFXu83HhyQ6r0/8Lg9HU3dl14D6zmj
         9O3n2Oqt8sNJ4gShHrr3JGW2r79IcUOK1FUsRvyTWelW0xS3saqatydhnieFDUpkZw4E
         jZogehlT8NgRuB3YBnnEsVeGhGxx+sprDX8vGcj/bj1B4tNPjSL4zpQaj9ltT44AVI1G
         hyid8KTulXqhYgcvPbYegAVZq/hNOZlmLMxddtEgDIi8MZWaFFQJAMzNtdplSSGxNKx+
         VQkg==
X-Forwarded-Encrypted: i=1; AJvYcCXnZP2vLkPBT4GA14DIcUTJIX/fV0Vfum8ohZawobcvJzcgQ52XAW9XnuZf/yW8eNQVTVlSAGu1L88Ay/yRVw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5FbFPEaeK3O4Km1IErxm6zSkrU9C1q5xhQ8a3XI3II70G+pnm
	z/IQU7Zo3pTd0/yG19qGa5EqigHjd3Xhp2c49YeSgyI4aHdSPWr54o6v/jKAZQ==
X-Gm-Gg: AZuq6aJWvrvHF6bKJI7vJIqGMapy3bsNXOXxjPlEoPE/cOoGZyaw3H5eRAb8Iyvlhxt
	7U1YbiXUVE/KzHR0+rb+hVPhiZvQxWrdcrtkf+OSOx5qtM4/9NzWt3+ou40p7yx6sBC7IUs09Jn
	6CSnpNRyLKgahClsLkEp7FVWjtD3CIfcURwg68mdGU7U56UxLBWXsdgjB7FRGFDrVGpE/btQT51
	keLTf9Ny/Nt7HB7HZGa95tIbmq93MTGm2RALIbc8+JOuvt8S6OnAud+rcQGF0Gzhi1p6kXLNDUP
	YgKV25WcBem33SRshBxyHoMLNPtyL6GVPL8EsOlrurSFAASR2ifTSLCsSl0+YY8fTeNRMOPnL0x
	vfQ2LBVQSkthpfdBgdawd+aVKqM/yIUv80CmAYycTyhnvaSxLzXqYh785jdynHV1MoJIDpCqsUY
	V3RsspREyqtUjMIoVEqC63f/nu/PMqUarTAhYJJwVr1IQ4HIluFn3skLxOREpPgn0=
X-Received: by 2002:a05:6820:61d:b0:679:95da:9752 with SMTP id 006d021491bc7-679c464670dmr6311208eaf.11.1771913625371;
        Mon, 23 Feb 2026 22:13:45 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:8ac2:4fdd:a742:61b8])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-679c56dbde9sm7895306eaf.11.2026.02.23.22.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 22:13:43 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	ulf.hansson@linaro.org
Cc: linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v2 1/8] mmc: sdio: add MediaTek MT7902 SDIO device ID
Date: Tue, 24 Feb 2026 00:13:18 -0600
Message-ID: <20260224061325.20189-1-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_221347_504033_E0F1CC47 
X-CRM114-Status: UNSURE (   8.09  )
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

From: Sean Wang <sean.wang@mediatek.com>

Add SDIO device ID (0x790a) for MediaTek MT7902 to sdio_ids.h.

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2:
1. Sort the MT7902 SDIO ID definitions.
2. Add Acked-by from Ulf. Ulf mentioned this should go along with the other
patches, so Ulf not picking this via the mmc tree.
---
 include/linux/mmc/sdio_ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/mmc/sdio_ids.h b/include/linux/mmc/sdio_ids.h
index 673cbdf43453..dce89c110691 100644
--- a/include/linux/mmc/sdio_ids.h
+++ b/include/linux/mmc/sdio_ids.h
@@ -111,6 +111,7 @@
 #define SDIO_VENDOR_ID_MEDIATEK			0x037a
 #define SDIO_DEVICE_ID_MEDIATEK_MT7663		0x7663
 #define SDIO_DEVICE_ID_MEDIATEK_MT7668		0x7668
+#define SDIO_DEVICE_ID_MEDIATEK_MT7902		0x790a
 #define SDIO_DEVICE_ID_MEDIATEK_MT7961		0x7961
 
 #define SDIO_VENDOR_ID_MICROCHIP_WILC		0x0296
-- 
2.43.0



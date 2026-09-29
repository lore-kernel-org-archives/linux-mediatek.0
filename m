Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76D7CA5FAB
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2026 03:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rChgDG4+9LHVh/7Fh95cpWNAythLuYoy13f8pIwvxIg=; b=Ybhs5QmG//OivI/rd/PQyiZvgc
	Vd8qmwD1DZSQBcy/ZmbtfIxAUc7Y4vtZdK9lZXxigT7eSWxbuxwjWp1nq9l3DO9/rK3+7sph7l4Bg
	D+O0E/A/pi/LXbsKph9NM4wA0iq5xscdrGy3I+deUCvHPgMFBapJT4XA5lcNWDiO6K14nMc5TKruO
	DEJ5axGs2hN3G+WKgfoaWYs8DXhQZV/J4d2snM6EE4jgKbyxPTD5oH6htN5SSeJbOHlaeM8ICgEd8
	3VffFZkr9o8X0zXclkRnj4RGo5PoXsIBmjAhY7OH4ducaiL9kEILUKjji8yJWSG60nSW1Bt/x1biD
	11H/XuiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBON4-00000002CnA-019E;
	Tue, 29 Sep 2026 03:19:10 +0000
Received: from mail-dy2-x0d.google.com ([2607:f8b0:4864:36::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBON1-00000002ClH-0h9V
	for linux-mediatek@lists.infradead.org;
	Tue, 29 Sep 2026 03:19:08 +0000
Received: by mail-dy2-x0d.google.com with SMTP id 5a478bee46e88-3468ec309afso1318101eec.3
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Sep 2026 20:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790651946; x=1791256746; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rChgDG4+9LHVh/7Fh95cpWNAythLuYoy13f8pIwvxIg=;
        b=BZv1aZrH3TXU4fFarck1B3KRfYAqh4zfxE+4K2pSjaAzzvC+ajhzzrOut5wFtvUWsf
         w+vMjk450o9DWSTHeJrb1RRVhljlupA7ghdB8uXy/jj/iPOzC/qcbEOBa97ACP7O/sVW
         SeTHKud20bY7oUDjh2cAk5SE25TGQeCyGXtuh/TcXAyhLgBRKIVZvLs1OBMQfL9fX4qF
         Ycj/n8uKGiNaJHQHirggNJ+acu5aa1n7FFq5CO/9TfZn7JEedkZqaufdPFQASQRRS1YN
         vA5QslacUTlPjT4aTKFYZNfNLEy4bB9Z7ibRDrJWaxwKNTxlVKAYPqPbLCZA9GOjD1vf
         g0Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790651946; x=1791256746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rChgDG4+9LHVh/7Fh95cpWNAythLuYoy13f8pIwvxIg=;
        b=xVk9ddPDCXTuvk03x7fcygV9y4m96YSf2JLLp4fMVDTRf33LrP+nOEfLHNyV7lExbH
         QATCmk5lfEQ9/ScKhedkOMJ3RFJm476ZyFzJIqNSrmFY3zQ12mMTvNQZ3baLdAdL8v3C
         aBySM1JF7j64+IEbX6GCSL1w/HFTMCaFzsBEMpLC1S5NuZyWNhLtlpuJiVwrbLnmA4HL
         yXt/nYSp93QFgJBArq4oDHnp/XuiQRIsbjskvBLJ//J1jAN06qA/i/xTv/JY6mPXtoIL
         nOGQmUcj2jill6O3wtcKulGh3K4k9USr6s8VOLhF+mDxigDevXN07Q+35eCMyescTyQg
         lO4w==
X-Forwarded-Encrypted: i=1; AKwUvBwhUNTUDFO7sY6qsu5K3mRxb+5eCDU1qFudp91UMKWne3hGxp1KeHfzeEHuuMWYVPJA8OAUkFuEehoR5GA6XA==@lists.infradead.org
X-Gm-Message-State: AFq9FYIZIlY1XqzCtnhNwGsNeqez0ppM+1us9r87aKfxHTCOeTimJvQP
	Avrf+8zk7vPCCwroHVgBuvrOnM1XkehWicAU6S4yp5M7Odw1W5FFFj12txnBNUchI38=
X-Gm-Gg: AYBFou3SFMRc392Y8nDeP6sRToqyAW4EDdqobqIulAAi2FhYiNNZGz0esOGAx1prDQB
	Fs9FOYtI64p293TOpe3qljJVyZ7FPIpp+7EpiasiHUwtddIBgYt5QpehOkMDQ1r9Gf/8zA9m5so
	xKi/yX0qv7F0OGvfKHHmHN7PezAlxS5rD8K4dua4pE48sh/v7+spUPex2SYpSR4wwFfajcjZtzt
	Vlv/f25kvzsK+5H4qdQvaH9w7NnkyjyMNnPQJwBn/ybm0vfbjy/zBCXA9EIkpXPKYeeOXehJwUn
	nMdx9sJpuWuwbTth4BhLzvfbgZ4vK2hpHL40ssi1xILS2tPr9hZNu/3P7aY+2FDkNPFdiAtXAds
	vYJPPcprlKLbmRIG4wSH/kLaV3Aua0nYCpTz4pSU2yuw+sAo7L9bpRa3pgoOiiwWNvqT7OazMzA
	HfTov5IizanBGIa58elo1bIw8wc/F4qafHMLZHS4LnRL7IAGfN6WYNzRoezaXG+UEGKhyg0HNj1
	r5MFNGh0BTfym4iZ1axYZoWKWXKubdVpKXaNZEW3NmtcwcoBLeRC/pgRRZ6wcliMw==
X-Received: by 2002:a05:693c:62dc:b0:33b:ef1f:14b9 with SMTP id 5a478bee46e88-34271a92cb8mr10274241eec.15.1790651946136;
        Mon, 28 Sep 2026 20:19:06 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:3481:cbb6:f339:9e4e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34141a4a00dsm33740601eec.1.2026.09.28.20.19.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 20:19:05 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Simona Vetter <simona@ffwll.ch>,
	jason-jh.lin@mediatek.com
Subject: [PATCH 6.6.y] drm/mediatek: Fix potential NULL dereference in mtk_crtc_destroy()
Date: Mon, 28 Sep 2026 23:19:01 -0400
Message-ID: <20260929031902.88182-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_201907_216219_F079D549 
X-CRM114-Status: GOOD (  16.36  )
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

From: Dan Carpenter <dan.carpenter@linaro.org>

[ Upstream commit 4018651ba5c409034149f297d3dd3328b91561fd ]

In mtk_crtc_create(), if the call to mbox_request_channel() fails then we
set the "mtk_crtc->cmdq_client.chan" pointer to NULL.  In that situation,
we do not call cmdq_pkt_create().

During the cleanup, we need to check if the "mtk_crtc->cmdq_client.chan"
is NULL first before calling cmdq_pkt_destroy().  Calling
cmdq_pkt_destroy() is unnecessary if we didn't call cmdq_pkt_create() and
it will result in a NULL pointer dereference.

[ Backport to 6.6.y: used the older Mediatek CRTC file and helper names. ]

Fixes: 7627122fd1c0 ("drm/mediatek: Add cmdq_handle in mtk_crtc")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Link: https://patchwork.kernel.org/project/dri-devel/patch/cc537bd6-837f-4c85-a37b-1a007e268310@stanley.mountain/
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi Greg, Sasha, and drm mediatek maintainers,

I am working through the small CVE backports still missing from 6.6.y.
This one addresses CVE-2024-53056. It skips command-packet destruction when
channel setup failed before packet creation.

The fix is already present in 6.12.y, 6.18.y, and 7.2.y, but not in 6.6.y.
This fix also affects 6.1.y, which will need a separate backport; this
submission contains only the 6.6.y patch.
The target-specific adjustment is recorded in the bracketed note above.

Could you please queue it for 6.6.y?

CVE: CVE-2024-53056
Upstream: 4018651ba5c409034149f297d3dd3328b91561fd

AI assistance: An LLM helped identify, adapt, and validate this backport; I
reviewed the resulting code and validation evidence.

Thanks,
Artem Dinaburg

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 859dffe4513722..1e8052a0425ee5 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -163,9 +163,8 @@ static void mtk_drm_crtc_destroy(struct drm_crtc *crtc)
 
 	mtk_mutex_put(mtk_crtc->mutex);
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	mtk_drm_cmdq_pkt_destroy(&mtk_crtc->cmdq_handle);
-
 	if (mtk_crtc->cmdq_client.chan) {
+		mtk_drm_cmdq_pkt_destroy(&mtk_crtc->cmdq_handle);
 		mbox_free_channel(mtk_crtc->cmdq_client.chan);
 		mtk_crtc->cmdq_client.chan = NULL;
 	}
-- 
2.39.5



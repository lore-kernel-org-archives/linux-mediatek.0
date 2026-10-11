Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C9D7CA9EC7
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Oct 2026 00:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/9++rHuAww9Im2B2wfP7togskszZqup/CYoTLkYiciU=; b=ck1qUFYElXyWySDXZGE3dL+oOd
	Kb/2i/KHymBSKDMRuzQqD1HE01GDpW48OGiTn6AaZoZBtGkq6vjMJNQCc4fMiKNBK3kQ40AQcRowi
	hKuHWdTFr/Yisk+dLPLpWbbCItdYc8M7axFcQGF+dntTvU5Anefv3c77EVCti2Mz+UEts0Vs8pnXz
	uY2DhcX2hmSZPo0/+PuIp14UGlrnVppq4fmSSU5kquKLBUrQYlShf4TeA9ZZ53nEsbfIPAfHU74C5
	YO7VWD+TbdPGE14cxyJ0pD36ob6xP2oJ9DO6CpGHTCklwsVLgo/vvuvYy+mqhDoZEQhIMEM77fjct
	f5+woolQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFhey-00000008abH-1gRT;
	Sun, 11 Oct 2026 00:43:28 +0000
Received: from mail-qk2-x08.google.com ([2607:f8b0:4864:34::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFhea-00000008aXb-2uX6
	for linux-mediatek@lists.infradead.org;
	Sun, 11 Oct 2026 00:43:15 +0000
Received: by mail-qk2-x08.google.com with SMTP id af79cd13be357-9367f27ddcbso81458885a.0
        for <linux-mediatek@lists.infradead.org>; Sat, 10 Oct 2026 17:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791679383; x=1792284183; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/9++rHuAww9Im2B2wfP7togskszZqup/CYoTLkYiciU=;
        b=r9NJElwWhUna8i8DSVaxLknykx+D57F5RGr2N/AXWwAWnZWulnC6FH+YP02zhxM0Ru
         SNJhzC2LUhzYiIJYn4Y+IZJwAiHWIvGtQVuQgsyZN9Pk/C7uVBGcEHQFbGLvWVIyqQnR
         qcXDVZOzU71sSX9lPNA1TbYRRAiwCJBI0pgiypbJtvxAHQz376tncmhPLmRF1ResgEl3
         bbZdl8K6CJTut5BLGNIGTeae11bjuhArxN+dtGw3jSLS2dw9ZkykHXGJommrEtdB+pDt
         KMHxE+zficsZ4Hr+q6LXdE8xjLqqUKc8ikDNHDpIoa4LdLcC67F3uuJolvnkrciBp7F+
         oGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791679383; x=1792284183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/9++rHuAww9Im2B2wfP7togskszZqup/CYoTLkYiciU=;
        b=IrePlJjEsVpGd/f4f47C13TJrSS44jHgzSOsLJcIaS5NEdHOLeEOiUnF8QcpRLMSbv
         h8b9gNvFpRj0cORa800BBYmlbn5RPwC4r+3tkDMT1xR7PUl2R0ToJYQ/mUzHRLhNtN4f
         ZFHTtjRBaXHR3RloRqsnTHE7DKlcefDwc1Oia27PmeQ9JAouqST4/STwt2bTlSC2pmMp
         A6vu0m7n21Vw3znK+m3MjjZUOFzHLqEA8FcSJF2r+8D20Aa2eGQhfNoI7qGT+wHsdql/
         N/o4EoEbMvXT0GdVnAzwvCiwu/R/0KszyjJGzkbwrFWenkQfqPqUtlOYp6VpCrPprTEr
         N78w==
X-Forwarded-Encrypted: i=1; AKwUvBwLclnsY/Ux61b+pwEnWMqNrUyFGzISOg1ZSpJVVaIydlEoGxI4FZvfGbUuPYwxF3TWAmN97WEQfMaqhw9w0w==@lists.infradead.org
X-Gm-Message-State: AFq9FYIEejq2UolQ2dF3J1oapb6Qk0ZYdFIkUnewMx8R3pVX2up+veXE
	F/A3+Gj6tRi9tiux3JzkEv745M3qb/PVFAdibm0qGzJH0tD7NbcZQTFW
X-Gm-Gg: AYBFou2ySpHuUXBTYpS00hFR4kiz7toVs+yCnn8cFoo6Cns9DnK6tdEEWqtAsy6GZji
	XV3FsnivaKvjW/0jGttpPyX2yC7fu/StBivh5fGx0nO+FM0C4UrNsW0A4JKGQ6EcALk090YpTOA
	J488bGSs6L11L5aSJYfrYapd8tJA1/ICw2+vdhs0bJx35uOICZoZsxwPlUSJ5vQFJJCnYF7BGAz
	gyt+YYsf8b3CMOkKl8rbGPZnwyIokBAUzxQaM7UKc/9V1kdJ5ee1V0VcONMWwkDN3J9rwMtoqeB
	np3cF0dA/kGjLQrLig3473y5Y/7BiqIa8Y96IwqLUIQ3gQMOSTzTV4rNG+L78AN688ixKLSypnB
	RTyQXWSGxspr4cuVaJiTLR+GEj0WdxfCaLMT3eMxt0cDWR/WxfrHwmD46bbv8HwqIGpRCGvcG2W
	ThZABuHaafxArZ5AcDNNxpSdTIm1to/6h9HorZnzuJuDz3ZGjr0w+Mnv6YODXZ/BCzKdk=
X-Received: by 2002:a05:620a:444a:b0:93e:c12c:f13d with SMTP id af79cd13be357-93ec12d05e2mr893634385a.71.1791679383533;
        Sat, 10 Oct 2026 17:43:03 -0700 (PDT)
Received: from omarchy ([2601:804:8780:3df1:6ff:277e:31c7:ac13])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb9848702sm532320085a.12.2026.10.10.17.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 17:43:03 -0700 (PDT)
From: zoan37 <agentzoan@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jason-JH Lin <jason-jh.lin@mediatek.com>,
	CK Hu <ck.hu@mediatek.com>,
	Nancy Lin <nancy.lin@mediatek.com>,
	Nathan Lu <nathan.lu@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] drm/mediatek: mtk_crtc: Look up connector routes in the CRTC's own mmsys
Date: Sat, 10 Oct 2026 20:42:46 -0400
Message-ID: <20261011004248.1117649-2-agentzoan@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261011004248.1117649-1-agentzoan@gmail.com>
References: <20261011004248.1117649-1-agentzoan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_174313_622642_D269BDC5 
X-CRM114-Status: GOOD (  18.74  )
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

mtk_crtc_update_output() finds the private data of the display
controller (mmsys) that a CRTC belongs to with

  priv->all_drm_private[drm_crtc_index(crtc)]

but all_drm_private[] has one entry per mmsys (mmsys_dev_num entries),
not one per CRTC. mtk_crtc_create() gets the right entry from its
priv_data_index argument, and the two only agree when every mmsys
drives exactly one CRTC and the CRTCs are created in mmsys order.

When a CRTC with connector routes sits on an mmsys that drives more
than one CRTC, the lookup reads past the end of all_drm_private[] (or
picks another mmsys' data), and the route component taken from that
data's ddp_comp[] array is bogus. On an MT8189 board with connector
routes on the external display path (CRTC 1 on the only mmsys), the
first HDMI hotplug oopsed in the compositor's atomic commit.

With the route tables currently in the tree (only MT8188 VDOSYS0, whose
main path is always CRTC 0 and all_drm_private[0]) the two indices
happen to match, so nothing in-tree hits this yet. It triggers as soon
as routes are used on a path that is not the first CRTC of the first
mmsys.

Remember the mmsys private data mtk_crtc_create() used for the CRTC and
use it in mtk_crtc_update_output().

Fixes: 01389b324c97 ("drm/mediatek: Add connector dynamic selection capability")
Assisted-by: LLM
Signed-off-by: zoan37 <agentzoan@gmail.com>
---

Notes:
    Testing: on an MT8189 Chromebook (Lenovo IdeaPad Slim 3 Chromebook,
    "quigon") running next-20261008 with the not yet merged MT8189 display
    support and a local change that puts the connector routes
    ({1, DVO1}, {1, DSI0}) on the external path. Without this patch the
    first HDMI hotplug oopsed in the compositor's commit; with a
    functionally identical patch (the field had another name), HDMI
    (DSI0 -> IT61620 bridge, 3840x2160@30) and USB-C DisplayPort (DVO1)
    both come up on CRTC 1. Not tested on MT8188, the only in-tree user of
    connector routes, where the looked-up entry does not change. This exact
    patch was compile-tested (W=1) on next-20261008.

 drivers/gpu/drm/mediatek/mtk_crtc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 2920f3198ef6..b54f8565d2fa 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -59,6 +59,7 @@ struct mtk_crtc {
 #endif
 
 	struct device			*mmsys_dev;
+	struct mtk_drm_private		*mmsys_priv;
 	struct device			*dma_dev;
 	struct mtk_mutex		*mutex;
 	unsigned int			ddp_comp_nr;
@@ -696,7 +697,7 @@ static void mtk_crtc_update_output(struct drm_crtc *crtc,
 	if (!mtk_crtc->num_conn_routes)
 		return;
 
-	priv = ((struct mtk_drm_private *)crtc->dev->dev_private)->all_drm_private[crtc_index];
+	priv = mtk_crtc->mmsys_priv;
 	dev = priv->dev;
 
 	dev_dbg(dev, "connector change:%d, encoder mask:0x%x for crtc:%d\n",
@@ -1055,6 +1056,7 @@ int mtk_crtc_create(struct drm_device *drm_dev, const unsigned int *path,
 
 	mtk_crtc->ddp_comp_nr = path_len;
 	mtk_crtc->mmsys_dev = priv->mmsys_dev;
+	mtk_crtc->mmsys_priv = priv;
 
 	mtk_crtc->mutex = mtk_mutex_get(priv->mutex_dev);
 	if (IS_ERR(mtk_crtc->mutex)) {
-- 
2.43.0



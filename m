Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 368C9CA5FDD
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2026 19:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rko1U6OoJC3n7W8qpIuhWiCDlnVmuYaiccHeKEGfF6U=; b=4IfIvtO4Nv1l67B3JR8vOtAqM+
	IJM99GIrYZ6Kp1H+ctMfP7MBDIOjJyGxUR7kgr0JwgWOSDPBYYI0Kx3FC+k4AOcnJZ9gzI/VdeHt2
	Y//8suln+qtl2PnLYBIGv4QyIEv+eDjdDYVDz23vQqCuYfFx+CSAbeB6wprZ2rP+nAhnXE/KyYuhC
	8UzwQeR/UibGhkU09ipz0O6dwGxPlOAJ7sx4BYIbE6Q10EJ+hCR0VfRmC4SYN3ot2Ad+HYwEfnLaA
	m9O5OuGROuvLR9k7hDCSv9BJSEGx/XfDYfx/hHQrqd+WOH6Zzq2HvWxAHg+/QasNAP1vVs8AkS380
	JvLgpNUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCjB9-0000000CQGY-1qkU;
	Fri, 02 Oct 2026 19:44:23 +0000
Received: from mail-dy2-x0f.google.com ([2607:f8b0:4864:36::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCjB5-0000000CQF1-1mLB
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Oct 2026 19:44:21 +0000
Received: by mail-dy2-x0f.google.com with SMTP id 5a478bee46e88-33c24422d4dso9839338eec.2
        for <linux-mediatek@lists.infradead.org>; Fri, 02 Oct 2026 12:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790970258; x=1791575058; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rko1U6OoJC3n7W8qpIuhWiCDlnVmuYaiccHeKEGfF6U=;
        b=SXjXAumYLFaDuvW7/GZ03bYqhhiOnb3izwedX+JDiKcPDHfJZZsjNOVYDqy+OT3k6k
         A6GChqEttYJcidOJfr5wvlsi1uMj/CJJdyz4fuwCa+22TRqf9Y5d8Ozgw6SmSAshI/h4
         shLeRfC4+OMiy4mYwM0T6Dr6BhmhwgqYSo4HfSHfIZLPH5yypy1V1sS1qBXnCI8QEiD6
         DogGPNzz67AQef1DWrfn3bxVXCq6jP8dPC5t4kymLMnExxlnIVcJv2xZmQcJ0i4oJtE4
         qD3gw8TtQUTwU3NLgS/H+k7d2bS+f9TuRh8ie8EGHmvqzkTyt5nO4OPI5fIA/qd03NYt
         8f5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790970258; x=1791575058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rko1U6OoJC3n7W8qpIuhWiCDlnVmuYaiccHeKEGfF6U=;
        b=1c6Trwqr8f5uWonyWlVjmCOwG/v2kkw3JERLpIhSbEB9M4Z3w7Ze/LAdAXdMnjZYTR
         SwXR/f/67JyZBfNITPJMt7GNEWri4U5sJddzUQ5FiNk4G9lxoerUMSXXZP3Y3VhWptl7
         gv6u6/lPoqTsoLdcSd7VmkRoHgco0uLTY35EWbCMsg/wwakugKdtgay0KH/dagB5xF7R
         FmKgM/A25S6C++N1CY7TswcxVKKSeZRPVqh2ai8ycKcupxW8XO5gv3Ub9ycHWbKKYOCk
         0XOveObyoZc7b44kYmwzj93C70z8sM5hCQtPTkQYaWTFk+FGzMY42pAup/xzFcUIui5J
         mcHA==
X-Forwarded-Encrypted: i=1; AKwUvBzMtLTf/96UFMKRsDSjnQkPN0Wwk6dvqZhphND1VOgwLEyYgAfriqxlZlIPSb4q9nXG/4AiK9cOb+nL35AGGw==@lists.infradead.org
X-Gm-Message-State: AFuF++kk0y8pnaYQg1f6l1v5K6fNY4aM6vb6yMGsgyzvUIBpzoPlRDeK
	dCUFbYRdcFpSDInGbKMVI8vrtOSleYgfA5ffyd6WvUgBzE5I+xMY+kO5z3IFRH6jmJVMrpP38cN
	fjXDVllRsSQ==
X-Gm-Gg: AYBFou2rYf+oywj6uI+YvHSRJfGH3+gcNQVPqTE+uDgO6gxGJ9x9orPORNmDmnSSlRl
	/2PDpfO79Zh1Q3TzMudgvDRpVB/TUHsaFO0vEA9gs8/r80t51K1/J7ub1EkBpVwqJBbXVhF9lOV
	e/XPPtSOM9BxzmzgKDA89EFih1UAdFe/QzCMO2NqHZNqIrAzhh8QyXVKN9fInbcAoLkbdmuu2T+
	Xtr5EKrjQD00egjUmKZZBZSsct/Yj2A3hdDwHvzvw8bng6s6dO1eEJgMO18wQU/F82R7I9H4Rnp
	BY2wRAB1yjOyo+TcmYb6rD349ek1ISb6QJm8+hYeRXZgv69qacxB2N0jzGypjiqvSn7dgoyRhd3
	dygU86XSaz84uWvyhSilU4HDq/VNjQeR3biWmX19162J/dVqwedd09xdLNzy7ZdnDUh//4yvbGH
	2D9oseHAF8CThIxJdYmeKi7IqODZIb2Q63nLdBZIUVp9v8qgsp7yyD/iYDgmSEapdWgVBDrZk8D
	k4hH+kX1igXkvWMM8+whj6TCQbJdjif7tJowGip3Y8gVLgvidyn8gk2EIeL5EOeu9Plsys=
X-Received: by 2002:a05:7301:4545:b0:342:94b:aa28 with SMTP id 5a478bee46e88-34f219610a0mr4295623eec.27.1790970257502;
        Fri, 02 Oct 2026 12:44:17 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:bcf9:6140:24a9:d1e7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14fcd065sm7236803eec.19.2026.10.02.12.44.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 02 Oct 2026 12:44:17 -0700 (PDT)
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
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Simona Vetter <simona@ffwll.ch>,
	jason-jh.lin@mediatek.com
Subject: [PATCH 6.1.y] drm/mediatek: Fix potential NULL dereference in mtk_crtc_destroy()
Date: Fri,  2 Oct 2026 15:44:12 -0400
Message-ID: <20261002194413.20810-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_124419_480160_3CEB150B 
X-CRM114-Status: GOOD (  15.29  )
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

[ Backport to 6.1.y: used the older Mediatek CRTC file and helper names. ]

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

I am working through the small CVE backports still missing from 6.1.y.
This one addresses CVE-2024-53056. It skips command-packet destruction when
channel setup failed before packet creation.

The corresponding 6.6.y backport is already in the 6.6.y stable queue.
The fix is already present in 6.12.y, 6.18.y, and 7.2.y, but not
in 6.1.y.
The target-specific adjustment is recorded in the bracketed note above.

Could you please queue it for 6.1.y?

CVE: CVE-2024-53056
Upstream: 4018651ba5c409034149f297d3dd3328b91561fd

AI assistance: An LLM helped identify, adapt, and validate this backport; I
reviewed the resulting code and validation evidence.

Thanks,
Artem Dinaburg

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 59b310f7327c86..8e72b3bb51eb94 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -161,9 +161,8 @@ static void mtk_drm_crtc_destroy(struct drm_crtc *crtc)
 
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



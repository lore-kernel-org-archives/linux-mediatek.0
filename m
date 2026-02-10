Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44405EA3F14
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Feb 2026 07:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aRQqk1UWyia+o/f2Wx8jJCYvaaA9Ax1O1FzsExAGixc=; b=F/+pGviCncykwMstCB8K7faova
	0DnEv/N6OWgzchsgYy1NYV8BWiXlQcokQvepm4oYbTkJs3NgQlEZ8ETSHikr2FdsNWSiN1vJx4tOw
	tLNBVz7mPBkzVRklJyG95o5R0Pp9aXrmAAUg51e1E2I1hAVYqEoEDgW5CR/bStzu95hCSTopa6BDi
	boQl2IHklSBFxJZH123X0wCbBSKTwLIn+NJAYyLl1NXkthtOkoV1tRACsg8/yLW6u27nxNs9Pv/Up
	Nr1HCvGdFrlqrQDeq3C94LPoEbTXEki5srpTovLQAzu/l1m4RwZK9+5tXtkh/PTpk6cAwikEuQSBi
	Ox2ljQIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vphuu-0000000GZyw-1BPL;
	Tue, 10 Feb 2026 07:12:12 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vphuq-0000000GZwD-2SUu;
	Tue, 10 Feb 2026 07:12:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770707525;
	bh=rCvwRJK0W1o4tQMv1YUlAV0iLAot+fdH9pyn8DDPkzU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ollmS416MnF1p+bIkLxzga0hVUTR1dkZ1ZAjfTeIspGzfAhGX9bLJJbEE75CbGmhO
	 HTi0sJC3eartiybLxVcJ1AQvEOlVqCtuJugMoHkVJ0rqNm8o14YgfrwXOjYOBD+zPe
	 hg/5D55WQqb1POGXXPo9NByhmLYU3bU96XBvw9zeGbiSC3gZN2tgVhz3nvEYlJ3z5/
	 ysH4z71Ldlv/Rv8hIJjFbG6S7MH3ZLwStUlFci0/WY877POaUW0AiEg8GcFbwfGHz6
	 D+A7dDTOD0IhiGe6sFv2VFGH2sxpBqZYvwvPtG44AvJjj7kiuuQkxt23leB1l9ux0h
	 dji2hcLrrxiiA==
Received: from vignesh-thinkpad.. (unknown [171.76.81.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0929D17E13A6;
	Tue, 10 Feb 2026 08:12:00 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.fornazier@gmail.com,
	airlied@gmail.com,
	simona.vetter@ffwll.ch,
	dmitry.baryshkov@oss.qualcomm.com,
	lumag@kernel.org,
	robdclark@gmail.com,
	robin.clark@oss.qualcomm.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	valentine.burley@collabora.com,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] drm/ci: reduce sm8350-hdk parallel jobs from 4 to 2
Date: Tue, 10 Feb 2026 12:41:30 +0530
Message-ID: <20260210071138.2256773-2-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260210071138.2256773-1-vignesh.raman@collabora.com>
References: <20260210071138.2256773-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_231208_785857_2754F08C 
X-CRM114-Status: GOOD (  10.29  )
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

The sm8350-hdk jobs are short and each test takes around 2–3 minutes and
the full job completes in about 10 minutes. Running 4 parallel jobs uses
4 devices at once, which is not needed. Set parallel to 2 to reduce
device usage.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---

v2:
  - No changes.

---
 drivers/gpu/drm/ci/test.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 81147e86bfd0..762598c7db25 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -183,7 +183,7 @@ msm:sm8350-hdk:
   extends:
     - .lava-igt:arm64
   stage: msm
-  parallel: 4
+  parallel: 2
   variables:
     BOOT_METHOD: fastboot
     DEVICE_TYPE: sm8350-hdk
-- 
2.47.3



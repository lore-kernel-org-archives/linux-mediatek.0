Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F09CCD18D
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Oct 2025 06:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NvC7w4tBroAZHD999gkeefbWcjLppvoCkVY+6iVARMc=; b=W0J3Y/OAPihrNkxqNT1/ax/Rsp
	lAIfqdfvd92R8+AQc5YKTJ4+hHD+A92T8R+5Vzs/Bj6P+/vKKF94vcgqjGsKOs0TQE6nyUbbZzdrg
	QHoqzPF2bvI4nhYSKT1wmUjXhHiP2LJYqr6yzIQIfL2GTjmGalpD6WHVOEwydroxF816SsLv3BWT2
	vDVb+omwOH8UCL1xv3Ccx2wNyb5KOcvC730dd0JlK1RNCS3YVTP1ph3OaCFmhdpWOVTAQic1J9zWj
	uzxI0S5zVcl4X0D+yKrIJUiy24g0ORapBUS/a3xGZHTbKa6SusneMQIjHPHvq/cxnUKPa8LvoAv28
	yqJTHO+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Bdu-0000000CKSe-3Q1N;
	Mon, 13 Oct 2025 06:02:46 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Bds-0000000CKRk-0WWn;
	Mon, 13 Oct 2025 06:02:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760335360;
	bh=gCTdPchWuc1xiR4tpvlqqw30LOOS9lTJyDFe5on17HM=;
	h=From:To:Cc:Subject:Date:From;
	b=TAFlBh2aNv23DXPQ8OmreZbzQmFTLIEjl9J0KbxvbjC5MtwEDNbXW5ujofaTRW+XL
	 KO2ISTQK6VLqg6gIt8eK01iUC61DOl72IhIbVAd8Uh2RUP0MV+1sbBup1PxcUL3Udr
	 rNFUwfDC3qq0kgUl0qUdx5t3dkfn+cHIOCN7SIWrLYmNfGvL7Dar5Jx6QYWjcHmEpA
	 ZmH/LzM1ZfJ5fjq8ANRpuElYt405PKG/Rru0AscGlyxSihbzvzzmy/vF0/u9uZL1Io
	 7KVmdMeZ3vp1bYNvsFVYPV/gZX1Wn7B/AL6tw4uOItj3wuAmFt97FfOZiW9LFpAlDN
	 ltp9kK/V6HuoA==
Received: from debian (unknown [171.76.80.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BC90217E0CA3;
	Mon, 13 Oct 2025 08:02:36 +0200 (CEST)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.fornazier@gmail.com,
	airlied@gmail.com,
	simona.vetter@ffwll.ch,
	robdclark@gmail.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	valentine.burley@collabora.com,
	lumag@kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] drm/ci: disable broken MR check in sanity job
Date: Mon, 13 Oct 2025 11:32:10 +0530
Message-ID: <20251013060212.14583-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_230244_330944_6BDA8168 
X-CRM114-Status: UNSURE (   9.11  )
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

GitLab recently changed the required permissions for the
are-developers-allowed-to-push-to-my-MR check:
https://gitlab.freedesktop.org/freedesktop/ci-templates/-/issues/81

Until that’s resolved, disable the check - it’s mostly obsolete anyway.

Based on https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/37782

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index d502d146b177..56638814bb28 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -280,7 +280,7 @@ sanity:
     GIT_STRATEGY: none
   script:
     # ci-fairy check-commits --junit-xml=check-commits.xml
-    - ci-fairy check-merge-request --require-allow-collaboration --junit-xml=check-merge-request.xml
+    # - ci-fairy check-merge-request --require-allow-collaboration --junit-xml=check-merge-request.xml
     - |
       set -eu
       image_tags=(
-- 
2.51.0



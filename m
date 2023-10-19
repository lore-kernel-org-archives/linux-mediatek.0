Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05075CDB484
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 07:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KcC9gTfzQZYNe5HSthMfcgp5+FDnKm3bzLNJWeKgODY=; b=jCf3XV9+srrZAECclFHLfXmsyG
	eu/YcDDwnHRDcRjx4b4chVUXqW3HigrQ6VfKKXt92Nt2Fyro1EQyNOj1VS2OJLoe2ibmoNYtuLNEn
	TKvzvGwJFbljSdzctg3JDWrZUjXHYfRVYXd21hYYAyVfpkDt5IgexuhQo7X6vM3f3YHe9aMZWTGdF
	PLq5CnXYK8mGml6hsZp2nwUUbxeJHL45ajFKjaRnw8/IgG3dusoHB2Gy9MErRIIUR/w7wV7VTganp
	v9p+IZLR9W7uOax55xpiqSjdgXt7A1b4nguso/Gqeogs3Ipc293NG5psAJ0eBEFw4QWedEdJ3YdzB
	q15uDIQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtN88-00GZcW-2R;
	Thu, 19 Oct 2023 07:07:40 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtN86-00GZaf-1H
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Oct 2023 07:07:39 +0000
Received: from localhost.localdomain (unknown [103.93.195.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 79A3E6607322;
	Thu, 19 Oct 2023 08:07:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697699257;
	bh=lLB3pfyQ1VdvBiw+7IWoLWuuTQXuXDpNyhFCwCmP2us=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lXA8/q1fpGzZIpdBsE7mvhlMnapbiiCEN3jKHSACj6l9NeU1iKu1sJyPBR2C9GwOk
	 TEYbvwwjQksoHL5v8nsVwfZ4e7H6mqzMx/JYB6v4CQeHnIDXwupKY/IE3wt+oslZQI
	 n/IktgDlfnNueSKOh5CDnQvGZIVnJWxPdi+GBzfGgbwrG0Sw55wQz7t324U0kMtT5v
	 5+ZFCDcsh9UdDHH3K+dAONWO5YRQk3a6nshhBm9EF8JFclalelAT2AoUIVqsdeBZyo
	 ZqrEaapcfSJWtWyUvAcIFWbiVMqYr9BOrCd89jNcRmxyGQghsCHEo9nW2eL10l7i/R
	 EGoEoWiQDxpaw==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Cc: david.heidelberg@collabora.com,
	sergi.blanch.torne@collabora.com,
	guilherme.gallo@collabora.com,
	daniels@collabora.com,
	gustavo.padovan@collabora.com,
	emma@anholt.net,
	robdclark@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	virtualization@lists.linux-foundation.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 6/9] drm: ci: mediatek: Set IGT_FORCE_DRIVER for mt8173
Date: Thu, 19 Oct 2023 12:36:47 +0530
Message-Id: <20231019070650.61159-7-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231019070650.61159-1-vignesh.raman@collabora.com>
References: <20231019070650.61159-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_000738_562787_39FB96F0 
X-CRM114-Status: UNSURE (   9.45  )
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

Expected driver for mt8173 is "mediatek" and for mt8183
it is "panfrost". Set IGT_FORCE_DRIVER to 'mediatek' as
the expected driver for mt8173.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v5:
  - Added a new patch in the series to set IGT_FORCE_DRIVER to 'mediatek' for mt8173.

---
 drivers/gpu/drm/ci/igt_runner.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
index c6cf963592c5..2b9f710438a2 100755
--- a/drivers/gpu/drm/ci/igt_runner.sh
+++ b/drivers/gpu/drm/ci/igt_runner.sh
@@ -30,6 +30,10 @@ case "$DRIVER_NAME" in
         ;;
 esac
 
+if [ "$CI_JOB_NAME" = "mediatek:mt8173" ]; then
+    export IGT_FORCE_DRIVER=${DRIVER_NAME}
+fi
+
 if [ -e "/install/xfails/$DRIVER_NAME-$GPU_VERSION-skips.txt" ]; then
     IGT_SKIPS="--skips /install/xfails/$DRIVER_NAME-$GPU_VERSION-skips.txt"
 fi
-- 
2.40.1



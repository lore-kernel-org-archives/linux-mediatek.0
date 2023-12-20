Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58AFAC46CD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Dec 2023 12:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jbMb3t0zQGFt1m+Joj1ETU8VQbVL/L+TuL3hkTid7oc=; b=IPlYlyDVc+V9IbI33476Lk86N8
	yUDd9PwRh/c2ZptT9AJnsLv8wajujMANdR6OsrPl11/4tbOtl758G4zCgcQ/p8AxmXMOzYJDPBMIU
	A+gqqm8DF6fPRU2froF7f186mCjdQ9vDx1WhW1JE9Hi79ZWki339b+AMI20yGI+xn5BYjdkCFcsYY
	nPmcKWj87D/Xoi4jzgFxL3Ck36kDAGISqYYMMg9IFw/6F2/Bs3TdxQwNK199P7vDgzkV1MEJ9SHmf
	kr/Fpdq0W25JaQnY6ymb8ZU6yvR12uFOKFL2MUKSUhAdm0A8ffhmBz55Bzzp6iBJljJs7Q2g+FwgQ
	V27aA5vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFvQi-00HJTk-0B;
	Wed, 20 Dec 2023 12:12:04 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFvQe-00HJP4-0p;
	Wed, 20 Dec 2023 12:12:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1703074319;
	bh=5JYtuIZuEkvTZxlUYgCyzZRIqd+leW54ZkRZefuebz0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VWFMwSBpYXflgVVjmHkLWkDqTMrLZdeyvBBDlzfjY0Cbfl40+z593xdaFYf20AJXq
	 DYfwdwTCFEXRgf8ICdB5YeklNI3UzQQz8m/k2hXGh1yfm+yaG1Bw2tgpXCIRsKOdCc
	 sbnfuWVGRBv8RI8bhMIvrl1WKibyDteLH8XsQgTuXma4JYwGIfcyvh+S+grfHzOUX5
	 Srot51lVbJlX3Yt/FwUbrTXsBbfIl4zskxlLns1gXTxfwr8AgUQSSB0QqjGuao1PeO
	 hqwyFGZQXt0yXB8tTVDzTRKHyHv1H5P0nHQwlhiHI1M+B/9F/cD0OeSVcTjgOScaEX
	 BKmo9gWCZ9jbA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 412613781FED;
	Wed, 20 Dec 2023 12:11:53 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	daniels@collabora.com
Cc: david.heidelberg@collabora.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	emma@anholt.net,
	robdclark@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/8] drm/ci: Do not set IGT_FORCE_DRIVER based on driver name
Date: Wed, 20 Dec 2023 17:41:07 +0530
Message-Id: <20231220121110.1441160-6-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231220121110.1441160-1-vignesh.raman@collabora.com>
References: <20231220121110.1441160-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_041200_417165_EAA874D8 
X-CRM114-Status: UNSURE (   8.84  )
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

Since the correct driver name is passed from the job to
test gpu and display driver, remove the check to set
IGT_FORCE_DRIVER based on driver name.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/igt_runner.sh | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
index f1a08b9b146f..ce6e22369d4d 100755
--- a/drivers/gpu/drm/ci/igt_runner.sh
+++ b/drivers/gpu/drm/ci/igt_runner.sh
@@ -20,16 +20,6 @@ cat /sys/kernel/debug/dri/*/state
 set -e
 
 case "$DRIVER_NAME" in
-    rockchip|meson)
-        export IGT_FORCE_DRIVER="panfrost"
-        ;;
-    mediatek)
-        if [ "$GPU_VERSION" = "mt8173" ]; then
-            export IGT_FORCE_DRIVER=${DRIVER_NAME}
-        elif [ "$GPU_VERSION" = "mt8183" ]; then
-            export IGT_FORCE_DRIVER="panfrost"
-        fi
-        ;;
     amdgpu)
         # Cannot use HWCI_KERNEL_MODULES as at that point we don't have the module in /lib
         mv /install/modules/lib/modules/* /lib/modules/.
-- 
2.40.1



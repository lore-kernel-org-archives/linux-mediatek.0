Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD15C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 12:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Jpu0in54hH9J2gqj2EBcwuHjspsCuq7JMy1EzDMCAo=; b=MEyrVUo9BcI9ungRODiaC6Cgpd
	k78pyDUxPBvWtQr/tcHvgfhUhBu+oqQmiV9V/ng2aXGr+nT6INC8OwpwuQeEVQhK6He5zuPTw/en5
	f3Diu5MFdEvyks7FTN0ZaR26tCeAGou4d8rG/YCZKdQ2qqMteLjN/bjwDDqQn6jNDd4HpriWKlXNr
	ICLPstRatPWdxQpHpBE6jWrOBpJFPL+ztH3+Hv/GYKtV39siucn5L6KkH0aRtVeHPw84Hw7gMGEBw
	Tz1ihkTcSuLds5gILrCZhRbmdiYKXvvNXLnHBBL3bP1MY8oHpdPHa59ESol9F0feUSyPu2hBQJR1l
	pq3K5fJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8JXS-008Hix-1q;
	Wed, 29 Nov 2023 12:19:34 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8JXP-008HgM-1I;
	Wed, 29 Nov 2023 12:19:32 +0000
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BE0426607326;
	Wed, 29 Nov 2023 12:19:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701260370;
	bh=XPqb5JshYNquGPkJGWY0HezlshvZancOV1Y08nA8CYE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CvOBtgyaHioy9cuADbv5R52hqXzjAP6cvOJry63R7jsCOKHTBGchyto83ojeFKwwc
	 CSN/82xQ6AtamhXf5OZFA1EAQHnxOP8FcDeWA4kZBH9khBgZ159iLfJ/XfQJ4hxDJN
	 vtNHkmeKWkukAUFB9tJyIHES7LevAq0IIjfjABewYpCGeCvAWRqY2Cs6L2f7BCyjRV
	 zBHtJkuY8t78GXfQMKVQZgUC1Fi2l0skQZlm2HgxPjhtBFJ5FBJp/f8MO5N2ZEg1Qa
	 oXV/vJtFK1Y5V5XSFzPVR3RHCpQ2EeLiTa18AXJiiAIwvNics+lU6X+jb9EPXYDfYZ
	 3aGfOJeGQNMyw==
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
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v6 09/10] drm/doc: ci: Add IGT version details for flaky tests
Date: Wed, 29 Nov 2023 17:48:40 +0530
Message-Id: <20231129121841.253223-10-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231129121841.253223-1-vignesh.raman@collabora.com>
References: <20231129121841.253223-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_041931_567857_C2008272 
X-CRM114-Status: GOOD (  11.65  )
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

Document the IGT version in the flaky tests reporting template.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v6:
  - Added a new patch in the series to update drm ci documentation

---
 Documentation/gpu/automated_testing.rst | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst
index 240e29d5ba68..2d5a28866afe 100644
--- a/Documentation/gpu/automated_testing.rst
+++ b/Documentation/gpu/automated_testing.rst
@@ -69,14 +69,15 @@ the result. They will still be run.
 
 Each new flake entry must be associated with a link to the email reporting the
 bug to the author of the affected driver, the board name or Device Tree name of
-the board, the first kernel version affected, and an approximation of the
-failure rate.
+the board, the first kernel version affected, the IGT version used for tests,
+and an approximation of the failure rate.
 
 They should be provided under the following format::
 
   # Bug Report: $LORE_OR_PATCHWORK_URL
   # Board Name: broken-board.dtb
-  # Version: 6.6-rc1
+  # Linux Version: 6.6-rc1
+  # IGT Version: 1.28-gd2af13d9f
   # Failure Rate: 100
   flaky-test
 
-- 
2.40.1



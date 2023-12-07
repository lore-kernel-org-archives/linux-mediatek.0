Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E115C46CA0
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 09:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=evV+Bo/OX5cjE82Zo3pmOLZTfXPBE8ZqQhdSZLnAFbM=; b=ZZqOayVOODT23ddjXq2i+93zqm
	Q4ZXgmbc+TwejBnTlymWGxPSJ8mfYyhoYdVRvQi4sUXEHz9XDl7BBIsIcpQghWujaCF/ytJ96Z/sz
	3Vw+MB5neaLONXXSnQ+AunAtvEJeg+xoGR0KUQzuyGM543F7UCGodexIy3fDjCuCUQEtxj6upU/xx
	2vusQkMNU7ELnXmB0skzvPviUVeKNBg2/PWd8EkdG09xzp3AJzf6pQhu4t5sFHUTjiWFgSMWistWo
	ZeQUJo7Va5NKUHjvNs57KNxfMVHKYnTfHeM5zhINudGe3K3L2IauPLirB54ibHlb68n0qxrjFsvK7
	wBNwX3nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBAXQ-00CKd2-0R;
	Thu, 07 Dec 2023 09:19:20 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBAXN-00CKaQ-1D
	for linux-mediatek@lists.infradead.org;
	Thu, 07 Dec 2023 09:19:18 +0000
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1241C6607393;
	Thu,  7 Dec 2023 09:19:12 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701940756;
	bh=qmAKEwMzQObcjLEImfox96rI8rjtke8mQ615PmXpD6I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lGVnA638sMEQ9HaGHUDUvuHtJ5Xh/906YK6hhJu/GIKx7xqGz7Fojo1t+eMsIo5cq
	 rMm+GieXrh/Zht8XyARJl/XABeOOMRifvopgH/WD0JmvyJQjvWoCbstPi3IE3q6R0D
	 mtTI1ZXW4A+5IuYkMxm8A45j9/BXIyp2rKV5UsbUw24i/os8twuWB91V6u2nfnZiqJ
	 bCV0ox19vmwdGqlYDSkhoCtEG3ZaJ9wi1gCz5uOfEYQBigzgpy6uKGVdRfUKZy665k
	 W1A97teFWuaU3HCzcXXtkaM4EqRU7R+1TCT3LFNHZrwI9fLPxuk89Vg9OIGh1cUcZ1
	 /GNyhEhXCKx2A==
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
Subject: [PATCH v7 09/10] drm/doc: ci: Add IGT version details for flaky tests
Date: Thu,  7 Dec 2023 14:48:30 +0530
Message-Id: <20231207091831.660054-10-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231207091831.660054-1-vignesh.raman@collabora.com>
References: <20231207091831.660054-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_011917_543727_84BF3B66 
X-CRM114-Status: GOOD (  10.75  )
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

Acked-by: Helen Koike <helen.koike@collabora.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v6:
  - Added a new patch in the series to update drm ci documentation

v7:
  - No changes

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



Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D41CDB483
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 07:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U8anOke6BgGHVez1BjG5cz5IJwlxJdUIyUH2BJ2542M=; b=CQDIBiOTyJ7GDuDNnGc0t+U1KV
	H7LIms2saF2QI6z3A8HEIf3SbOhm65DG4jDJgUEZF3a/+L9qzWuyQXrkTPMFqVmRbMhU6Cq+xwjVB
	uIBnMy4hy17vs89x47IfByfdg/8mmdVB1s1RzZYkgwKzQaDZRx1CPLSEUaE3LPdJEu3Q+vkcQa+t6
	ibrx61LWCLBRoL3tX/EKMXQx5o57w8vgsutQJU+CRpISaVB+kdPfS7AQB75cFtp4XqV9WO0yC7tPE
	V0gYabxeoeNaoD4dwKJ4YI5PY+a1P3HS4K7BK81bc5czPjdJ776dpl+2q/Bp24/jzKrd+tklY2wSZ
	7zYNAuTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtN8H-00GZgJ-36;
	Thu, 19 Oct 2023 07:07:49 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtN8F-00GZep-0H
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Oct 2023 07:07:48 +0000
Received: from localhost.localdomain (unknown [103.93.195.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 668C16607323;
	Thu, 19 Oct 2023 08:07:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697699265;
	bh=B1diUinADNXWm3ntdscq3ZHYt8C+cQLYxftrutfyYY4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aI13kLmXBTEgaMQYITB+frLxxPez9d5RjBe2/twup3GoZSM2nKcFccgrd0ZWetqVA
	 o1PtgFu9xcejE39IXb4AkyvDuuFKbI2frmvTSkGJdXI+Sd2paRNq2LV/URNm0vssSP
	 QPmSq/QAyZ+4uFEcqhTNYNBqioxq6uQPlu09aXO21Srq2XEx8igGyEip2zX37yJZDZ
	 R/r/FM9kpYSLpY/PF39dBU68CqfVHofXM7j1UWctuwgOsO+2cMUlLlzE8grqMry1o3
	 3R5ORPsi55ji5NEColzpB/ayzlDJyMlzrd0Izp9HnWaap4hdYmX5uTNNKmjbSxzMiw
	 wP+OMB/LmE/Qw==
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
Subject: [PATCH v5 8/9] drm: ci: Add pipeline url to fails and flakes files
Date: Thu, 19 Oct 2023 12:36:49 +0530
Message-Id: <20231019070650.61159-9-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231019070650.61159-1-vignesh.raman@collabora.com>
References: <20231019070650.61159-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_000747_342684_A4B3863F 
X-CRM114-Status: UNSURE (   8.89  )
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

Add or update pipeline url in the fails and flakes files.
It helps to check the pipeline where the failure was seen
and check artifacts for failure cases.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v5:
  - Added a new patch in the series to add pipeline url to fails and flakes files.

---
 drivers/gpu/drm/ci/xfails/update-xfails.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/ci/xfails/update-xfails.py b/drivers/gpu/drm/ci/xfails/update-xfails.py
index c401004ffd45..651f804721f2 100755
--- a/drivers/gpu/drm/ci/xfails/update-xfails.py
+++ b/drivers/gpu/drm/ci/xfails/update-xfails.py
@@ -63,6 +63,10 @@ def remove_unit_test_if_present(lines, unit_test_name):
         return
     lines[:] = [line for line in lines if unit_test_name not in line]
 
+def add_pipeline_url(lines, pipelines_urls):
+    for url in pipelines_urls:
+        pipeline_url = "# " + url + "\n"
+        lines.insert(0, pipeline_url)
 
 def add_unit_test_if_not_present(lines, unit_test_name, file_name):
     # core_getversion is mandatory
@@ -185,9 +189,11 @@ def main(pipelines_urls, only_flakes):
         flakes_txt.sort()
 
         if fails_txt != fails_txt_original:
+            add_pipeline_url(fails_txt, pipelines_urls)
             save_file(fails_txt, fails_txt_path)
             print_diff(fails_txt_original, fails_txt, os.path.basename(fails_txt_path))
         if flakes_txt != flakes_txt_original:
+            add_pipeline_url(flakes_txt, pipelines_urls)
             save_file(flakes_txt, flakes_txt_path)
             print_diff(flakes_txt_original, flakes_txt, os.path.basename(flakes_txt_path))
 
-- 
2.40.1



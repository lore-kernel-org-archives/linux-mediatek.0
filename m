Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C28C41513
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 07:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=guj45JYCbWePRAWsv1GfXeFnZRS3/INuRSXpl0lPR18=; b=ddrE0jkaBhVD50jzcX4r3bimyJ
	45r6itojYSiX1gzWasWwP+wQjML1+ENuIrmKZzG5D2pkrBvy2Fh29o/U9eadbDGe1lZtkfJ8Toc0d
	wlCbRM8faw4lSWSZ2e28zVZ1PSnuB+8nLyNceY/uE6GnYGB35e5vUKoOzDF9C2xw5fun031Ux+wj3
	zUxxaEXy/cpvwEEIedjJjhlsFMbzILT2g0tXyXD0d+2/Re/JavMPzVTlRdYHhUnsdtJUOkpEDvoih
	37bOLRU9TW9SA28J8plKQZ1LqQP3uq5BxBfaqfXXPGiJbJRjNiExEpqgZuCXYbEdwPNfF400J+StX
	+h4VuYXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtN8D-00GZeW-1c;
	Thu, 19 Oct 2023 07:07:45 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtN8B-00GZdB-04
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Oct 2023 07:07:44 +0000
Received: from localhost.localdomain (unknown [103.93.195.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AC4E666072FF;
	Thu, 19 Oct 2023 08:07:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697699261;
	bh=RJgQxz21dImbmm5s8n/Pq+7A2b9YbO0Q0CfGVQyuiUc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LkKgOZo4pf4TA1zPoNRkgfxTgfiVGgyRmHwUlKaNH7vNeZ7VylTT3T3Xf3qSEYRLD
	 4jQqZ55t/zhyKZWCRh1YzpUDtAB6YHEmCMT8hoi4AT06wna0P4Hp/YpwmIkzV1AJnr
	 xciBtULK276p1s2/4U0UbuI/3O+37SfDZxqi++Zwq4XKo9sNN1FYidcATPCxX0UdY5
	 4vUQpWL342p+lH/Xmg20eAAvHUmbMvvCyOapYvpY7uPp/NEHagA6ckT7MJRzxUvCjE
	 Rhr9A9EpHv0zqPp2VF2XxLzrgACyv94DS6JHUncZXHqbrIbdpv7M4yF8dqg1BxsPG7
	 xpbnISU56J6nA==
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
Subject: [PATCH v5 7/9] drm: ci: virtio: Make artifacts available
Date: Thu, 19 Oct 2023 12:36:48 +0530
Message-Id: <20231019070650.61159-8-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231019070650.61159-1-vignesh.raman@collabora.com>
References: <20231019070650.61159-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_000743_182452_EDBED27E 
X-CRM114-Status: UNSURE (   7.96  )
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

There were no artifacts available for virtio job.
So make the artifacts available in the pipeline job.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v5:
  - Added a new patch in the series to make artifacts available for virtio jobs

---
 drivers/gpu/drm/ci/test.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 763aef28010e..39f5910fdc0a 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -320,6 +320,8 @@ virtio_gpu:none:
   script:
     - ln -sf $CI_PROJECT_DIR/install /install
     - mv install/bzImage /lava-files/bzImage
+    - mkdir -p $CI_PROJECT_DIR/results
+    - ln -sf $CI_PROJECT_DIR/results /results
     - install/crosvm-runner.sh install/igt_runner.sh
   needs:
     - debian/x86_64_test-gl
-- 
2.40.1



Return-Path: <SRS0=jvDT=AA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CB15C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2020 10:41:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBE37207FC
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2020 10:41:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EHwVtk4Y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="OX7jieb3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBE37207FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VfRnkmaUpomLded4iKmbLRKCreo9YE9grqobgICEis0=; b=EHwVtk4YoJJ33iiAwQbY627EJm
	1ECx0uZ24cncJTSlZEOqY/QrEgleSThRgal8mhDZrvCHTAHiedGLulaUGF6ck6V5LrYF0a6ar9UPC
	dU+9RA3rEPSBOctyKdhg7onQxlcZiD8REKBsuZqMXLmWhOtRgHVrF3kwg2yUBJ5GPF+63XZh9ioeo
	KmZhqTGHOy+Ajvj3AU32z7FkK646+WQb8lFxSEzoCnToeJ2NkDC8PObZP6SGdV1nRY1nth0jH8uRa
	xrLlk1uSlkOmZeXkHTEeormyJnu9lUjFmD/8izVBqdOMAmp7iejbdB4S0lR+Chc5snUg64v5h8HYX
	AJ63YjPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmESo-0002uI-W2; Fri, 19 Jun 2020 10:41:39 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmEOM-0005AU-Ml
 for linux-mediatek@lists.infradead.org; Fri, 19 Jun 2020 10:37:05 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200619103701euoutp01b7698275d0e2254864ba01a4afc16967~Z66FOzVaL1836418364euoutp01b
 for <linux-mediatek@lists.infradead.org>; Fri, 19 Jun 2020 10:37:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200619103701euoutp01b7698275d0e2254864ba01a4afc16967~Z66FOzVaL1836418364euoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1592563021;
 bh=bm4jyzGdoL7eueSepHu8xbaOpsUiBlIaWdzcyPajcJ4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OX7jieb3gebPtbLXgAODwGTiBf+gB//lJn/SNq7t2quwq+KBYu0ksFy9Y5Haly12Q
 +5upJzNKbMpNQjmiwSm8EfOeV/sQLyKHDIz4YZPzzXd0ABx02Q8GehXYnxH7ecQvk+
 ks8U6ttt3tUWaSTBnQQCJoxcOin86Vm4M/swAavc=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200619103700eucas1p210606f47e47dd8c0a7957d061536c8d7~Z66E8A1TQ1708817088eucas1p29;
 Fri, 19 Jun 2020 10:37:00 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id CC.9C.06456.C459CEE5; Fri, 19
 Jun 2020 11:37:00 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200619103700eucas1p13747c6a4d1a89f3cfc94a585ada9be4b~Z66Elhjc53246432464eucas1p1n;
 Fri, 19 Jun 2020 10:37:00 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200619103700eusmtrp1f54d2514c097471ad94ad6a38c2f2689~Z66Ek1T4M0949709497eusmtrp1G;
 Fri, 19 Jun 2020 10:37:00 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-47-5eec954c5907
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id C6.0B.06017.C459CEE5; Fri, 19
 Jun 2020 11:37:00 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200619103659eusmtip2629802219f1f405c43dad435fee3e389~Z66D08j7L0302303023eusmtip2M;
 Fri, 19 Jun 2020 10:36:59 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 11/36] drm: mediatek: use common helper for a scatterlist
 contiguity check
Date: Fri, 19 Jun 2020 12:36:11 +0200
Message-Id: <20200619103636.11974-12-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200619103636.11974-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSa0hTURzv7N5td+bstqSOWgkDLQN1ksWBqVkJ3aKgb0GQtdxFrW3alpp9
 KF9F2VY+KnVFmUS+M5es8pHN1Bmab0zxnfuQOrHUWZpau16tb78n/x+HQ2AiM9eViFRdptUq
 mULMc8CNjQut3scfWEMlbV/2IV3rJw4qzy7jojydDkd/jOkY6rZN81BhcQMH5dZK0Vz3KAcZ
 xnq4qKvyMQ91JXcAVFo/yEdJKXvR4FATjkzfLdzgTVTJkxJA1czn4tQ7/SCfMhTd5lFv5ke4
 1PAdM4d6/fw61b8yhlGZvfmAqupL4FH3liXU3YoiQM0adp4UnnYIkNOKyFha7Rt0ziGiUbvE
 j05yuvIsMxNLAN0bU4GAgKQ/LGi0cFOBAyEiCwAseDHOYckcgPcXJnGWzAJYpdNz1ivLVgPG
 GvkAZhhqAGOsVmqWLjKYR/rB1KlUHoOdyRsANukcmQJGVmMwr3IRZ4wt5FlYof9tDxEETnrA
 9vfBjCwkg+B0bS+XPeYOi199wBgssOuTKabVrZAc4sNvtpm1RSHQaLXwWLwFTpgr+CzeDpsz
 tThbSAZwtLWUzxItgF1J2YBNSeFA6+LqCoz0gmWVvqx8EDa0f8QZGZJOsHdqMyNjdphhzMJY
 WQhv3RSxaU+oN7/8d9bU3rkWoWBFywn2rdIBLGwsx9KAu/7/rVwAisA2OkajDKc1fio6zkcj
 U2piVOE+YVFKA7B/r+YV88xbYOs8XwdIAogdhcGnJkNFXFmsJl5ZByCBiZ2Fhz43h4qEcln8
 VVoddVYdo6A1dcCNwMXbhHvzxs+IyHDZZfoiTUfT6nWXQwhcE0DYVlNiYJP0h2GXy1LksXg3
 naJfEL3d5dqA9YS85ZIEeph/0dbCvghhW9DRrxsE39p3Tyw8Ujx2RqoLTg9HHuUcOLzbUqb1
 3PEzbcDXuzokwH9/dkhgT2WAl+SYvH6gQZt88ohXR076cHmOTfrU9lxy5UWiOyQGs+S6rDgS
 WTLEuCZC5rcHU2tkfwEfS4bLWgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFIsWRmVeSWpSXmKPExsVy+t/xe7o+U9/EGSzZJWvRe+4kk8XGGetZ
 LRb19rJY/N82kdniytf3bBYrVx9lsliw39riy5WHTBabHl9jtbi8aw6bxeXmi4wWa4/cZbdo
 ajG2uHvvBIvFwQ9PWB34PdbMW8PosffbAhaPnbPusntsWtXJ5rH92wNWj/vdx5k8Ni+p97j9
 7zGzx+Qbyxk9dt9sYPPo/2vg0bdlFaPH501yAbxRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpG
 JpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehnHev6wFzTxVSycPJm5gfEKdxcjJ4eEgInE3zeb
 mLsYuTiEBJYySsybcoINIiEjcXJaAyuELSzx51oXG0TRJ6CiC//BEmwChhJdbyESIgKdjBLT
 uj+ygzjMAseYJTY+fs8MUiUsECuxsL0JqIODg0VAVeLCPgeQMK+AncT7/TegNshLrN5wAKyc
 Eyj+uuUgWFxIwFZi+YL3zBMY+RYwMqxiFEktLc5Nzy020itOzC0uzUvXS87P3cQIjKdtx35u
 2cHY9S74EKMAB6MSD++LkNdxQqyJZcWVuYcYJTiYlUR4nc6ejhPiTUmsrEotyo8vKs1JLT7E
 aAp000RmKdHkfGCs55XEG5oamltYGpobmxubWSiJ83YIHIwREkhPLEnNTk0tSC2C6WPi4JRq
 YBQTiWiOev+EUc/faqErIyfv2y3Lu29EcB+bW1a3fOGM2Uezffie9v3bMqG0fy7/wZ7ZB+IE
 DXn36OuuWnzv1KNFKXdep7VuPtt4OFenQzFz9soc92e736RpCR+aVMIWqynU/6j+zU9HCdO9
 zgl8D/ryVkW+DDj8d6rUmu2tVy48q7bn9fu4R1GJpTgj0VCLuag4EQDn01XAvQIAAA==
X-CMS-MailID: 20200619103700eucas1p13747c6a4d1a89f3cfc94a585ada9be4b
X-Msg-Generator: CA
X-RootMTR: 20200619103700eucas1p13747c6a4d1a89f3cfc94a585ada9be4b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200619103700eucas1p13747c6a4d1a89f3cfc94a585ada9be4b
References: <20200619103636.11974-1-m.szyprowski@samsung.com>
 <CGME20200619103700eucas1p13747c6a4d1a89f3cfc94a585ada9be4b@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200619_033702_895329_51DFEDED 
X-CRM114-Status: GOOD (  13.84  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use common helper for checking the contiguity of the imported dma-buf and
do this check before allocating resources, so the error path is simpler.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 28 ++++++--------------------
 1 file changed, 6 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index 6190cc3b7b0d..3654ec732029 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -212,37 +212,21 @@ struct drm_gem_object *mtk_gem_prime_import_sg_table(struct drm_device *dev,
 			struct dma_buf_attachment *attach, struct sg_table *sg)
 {
 	struct mtk_drm_gem_obj *mtk_gem;
-	int ret;
-	struct scatterlist *s;
-	unsigned int i;
-	dma_addr_t expected;
 
-	mtk_gem = mtk_drm_gem_init(dev, attach->dmabuf->size);
+	/* check if the entries in the sg_table are contiguous */
+	if (drm_prime_get_contiguous_size(sg) < attach->dmabuf->size) {
+		DRM_ERROR("sg_table is not contiguous");
+		return ERR_PTR(-EINVAL);
+	}
 
+	mtk_gem = mtk_drm_gem_init(dev, attach->dmabuf->size);
 	if (IS_ERR(mtk_gem))
 		return ERR_CAST(mtk_gem);
 
-	expected = sg_dma_address(sg->sgl);
-	for_each_sg(sg->sgl, s, sg->nents, i) {
-		if (!sg_dma_len(s))
-			break;
-
-		if (sg_dma_address(s) != expected) {
-			DRM_ERROR("sg_table is not contiguous");
-			ret = -EINVAL;
-			goto err_gem_free;
-		}
-		expected = sg_dma_address(s) + sg_dma_len(s);
-	}
-
 	mtk_gem->dma_addr = sg_dma_address(sg->sgl);
 	mtk_gem->sg = sg;
 
 	return &mtk_gem->base;
-
-err_gem_free:
-	kfree(mtk_gem);
-	return ERR_PTR(ret);
 }
 
 void *mtk_drm_gem_prime_vmap(struct drm_gem_object *obj)
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

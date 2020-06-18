Return-Path: <SRS0=U17p=77=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F33EBC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2020 15:44:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 953C2206FA
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2020 15:44:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HBgobD3b";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="LHn85sMe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 953C2206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=q+03bLg5Tq2KD4eJkBeH3X+qRSy0hc4Q4CpYNGJNQpg=; b=HBgobD3bPqoSimne/4u/oBz4+y
	478P1sAkfCfVPOoIUCmNJN9g8uBFLDzTm2FCsa7NGeuoJ0OusOUSXOnVClNLTkSntw8B9D3FBPtgr
	4WZdWGN1er19U4BjhaT9zsALePpjcy+iiomqj3+pBm4Us37YOrcj059+/R5CFR911u7Eau6JLQ7aC
	mu+PNLeCv26VpQNsnTe7wT1o0tFINxKdidpbw5BnkBvQx3Kh3b62oI2smZ8Ibxwa0Ig3KOT5eNUu4
	qyAH+6NU7JwcjqGKIklVqRE5rzaQJ1LDGRSzNKH/izbrA1HcwMtSy4doqgfQci7felKfwz3as5Ftj
	Tmwnz2rw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlwhz-0007DJ-Ta; Thu, 18 Jun 2020 15:44:07 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlweR-0004Dv-PK
 for linux-mediatek@lists.infradead.org; Thu, 18 Jun 2020 15:40:31 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200618154022euoutp017ccd3d9245b448e01bda4a5efcbe3ab7~ZrZqd4AbH1835418354euoutp01C
 for <linux-mediatek@lists.infradead.org>; Thu, 18 Jun 2020 15:40:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200618154022euoutp017ccd3d9245b448e01bda4a5efcbe3ab7~ZrZqd4AbH1835418354euoutp01C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1592494822;
 bh=dgA8N0ViLqnC/QZEgzrc3l/K0+XnEV3AJx7m2vhhZ9o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LHn85sMeOO4rmyR3Hovjkzb7mH+Rj8Cgl1aUWkKSKUkFmRhqzylAo1GfJWXu5Sj3P
 J5IsGY75/GDOxtAN6qedWvEV2RZyROny6xiO8OGxfjMdc3sxU5DknBiFga3LrzoZPa
 WzcsL9Y6ASWmVO9xXxfh/zIV7BPHBw/QoeWOyl7k=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200618154022eucas1p1cc2c3555a8b3a71e30ddd163b7e2b4df~ZrZqLudAu1755717557eucas1p1G;
 Thu, 18 Jun 2020 15:40:22 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id E2.1F.61286.6EA8BEE5; Thu, 18
 Jun 2020 16:40:22 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200618154022eucas1p1a8136b9677ac6a98ac47a3154ab0c763~ZrZp8yY471545815458eucas1p1S;
 Thu, 18 Jun 2020 15:40:22 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200618154022eusmtrp29f126925ca53016633b0dde40b5af358~ZrZp8GBKM0370403704eusmtrp2h;
 Thu, 18 Jun 2020 15:40:22 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-cb-5eeb8ae62003
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 79.EE.08375.6EA8BEE5; Thu, 18
 Jun 2020 16:40:22 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200618154021eusmtip160203d7d536539124d9640b161f7055a~ZrZpQHKd80744107441eusmtip1z;
 Thu, 18 Jun 2020 15:40:21 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 12/36] drm: mediatek: use common helper for extracting
 pages array
Date: Thu, 18 Jun 2020 17:39:33 +0200
Message-Id: <20200618153956.29558-13-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200618153956.29558-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBKsWRmVeSWpSXmKPExsWy7djP87rPul7HGXR+lrXoPXeSyWLjjPWs
 Fot6e1ks/m+byGxx5et7NouVq48yWSzYb23x5cpDJotNj6+xWlzeNYfN4nLzRUaLtUfusls0
 tRhb3L13gsXi4IcnrA78HmvmrWH02PttAYvHzll32T02repk89j+7QGrx/3u40wem5fUe9z+
 95jZY/KN5Yweu282sHn0/zXw6NuyitHj8ya5AN4oLpuU1JzMstQifbsEroyuvzuYCx5wVtyY
 8Jq5gXEKRxcjJ4eEgInEqrZ/7F2MXBxCAisYJY60L2WGcL4wSlyZOw/K+cwoMfPaXcYuRg6w
 lj+7xEG6hQSWA8X/qsI1zDqykx0kwSZgKNH1tosNxBYRaGWUONHLA1LELLCHWWLRrl8sIAlh
 gXCJbwf2MYPYLAKqEjfvzgGzeQXsJN41bmGFuE9eYvWGA2BxTqD46eOtrCCDJATusUu8WdnP
 BFHkIrGxeysLhC0s8er4FnYIW0bi/875TBANzYwSD8+tZYdwehglLjfNYISospa4c+4XG8hv
 zAKaEut36UOEHSXmru1gh3iZT+LGW0GQMDOQOWnbdGaIMK9ER5sQRLWaxKzj6+DWHrxwiRnC
 9pDo27OKBRJCExkl+n/OY53AKD8LYdkCRsZVjOKppcW56anFhnmp5XrFibnFpXnpesn5uZsY
 genr9L/jn3Ywfr2UdIhRgINRiYfXIfx1nBBrYllxZe4hRgkOZiURXqezp+OEeFMSK6tSi/Lj
 i0pzUosPMUpzsCiJ8xovehkrJJCeWJKanZpakFoEk2Xi4JRqYFR8cF6nkPvzhOVht76vNyvP
 7nZbX6W+pya7Vdjoe+Qvr+aJ982Mcy2UuC7+3cRW8ex3T8upF9sYzPTWWOy0zjf/F2ywIF9X
 TfHKpCUP6mLCpm0+Gpu+dI9Pg/k3lyeGNb/0d54wafpht2TPW6WVZ+S0BDcc8S/Vv3dtwoOy
 NtMl0lcZf+ckvFFiKc5INNRiLipOBAB33GSmWwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJIsWRmVeSWpSXmKPExsVy+t/xu7rPul7HGfS957XoPXeSyWLjjPWs
 Fot6e1ks/m+byGxx5et7NouVq48yWSzYb23x5cpDJotNj6+xWlzeNYfN4nLzRUaLtUfusls0
 tRhb3L13gsXi4IcnrA78HmvmrWH02PttAYvHzll32T02repk89j+7QGrx/3u40wem5fUe9z+
 95jZY/KN5Yweu282sHn0/zXw6NuyitHj8ya5AN4oPZui/NKSVIWM/OISW6VoQwsjPUNLCz0j
 E0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYyuvzuYCx5wVtyY8Jq5gXEKRxcjB4eEgInEn13i
 XYycHEICSxklDrwvBbElBGQkTk5rYIWwhSX+XOti62LkAqr5xCgxcTWIw8nBJmAo0fUWIiEi
 0MkoMa37IzuIwyxwjFli4+P3zCBVwgKhEk/mHgPrYBFQlbh5dw5YnFfATuJd4xaoFfISqzcc
 AItzAsVPH29lhTjJVuL5hza2CYx8CxgZVjGKpJYW56bnFhvqFSfmFpfmpesl5+duYgRG07Zj
 PzfvYLy0MfgQowAHoxIP74uQ13FCrIllxZW5hxglOJiVRHidzp6OE+JNSaysSi3Kjy8qzUkt
 PsRoCnTURGYp0eR8YKTnlcQbmhqaW1gamhubG5tZKInzdggcjBESSE8sSc1OTS1ILYLpY+Lg
 lGpgtLr0dOdTd/EVLFnJyjVRC/5uXLvcdPKfH9+Wuy2cZnp/m4VsBpuLwFox7rn/e9/Ye/8z
 y5f/+SP3iut55ssvnd+xOezSmPm+JIv3srOC8PlzSjfueS1zXt2yYkHB78cGXvs1k1++fNnz
 6Yb6RkELZ501u85LlTeZNW7zSwu4oX1K5lNk7s3LykosxRmJhlrMRcWJAI8Nqhm8AgAA
X-CMS-MailID: 20200618154022eucas1p1a8136b9677ac6a98ac47a3154ab0c763
X-Msg-Generator: CA
X-RootMTR: 20200618154022eucas1p1a8136b9677ac6a98ac47a3154ab0c763
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200618154022eucas1p1a8136b9677ac6a98ac47a3154ab0c763
References: <20200618153956.29558-1-m.szyprowski@samsung.com>
 <CGME20200618154022eucas1p1a8136b9677ac6a98ac47a3154ab0c763@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200618_084028_058192_4D7C7F4E 
X-CRM114-Status: GOOD (  10.93  )
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

Use common helper for converting a sg_table object into struct
page pointer array.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index 3654ec732029..0583e557ad37 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -233,9 +233,7 @@ void *mtk_drm_gem_prime_vmap(struct drm_gem_object *obj)
 {
 	struct mtk_drm_gem_obj *mtk_gem = to_mtk_gem_obj(obj);
 	struct sg_table *sgt;
-	struct sg_page_iter iter;
 	unsigned int npages;
-	unsigned int i = 0;
 
 	if (mtk_gem->kvaddr)
 		return mtk_gem->kvaddr;
@@ -249,11 +247,8 @@ void *mtk_drm_gem_prime_vmap(struct drm_gem_object *obj)
 	if (!mtk_gem->pages)
 		goto out;
 
-	for_each_sg_page(sgt->sgl, &iter, sgt->orig_nents, 0) {
-		mtk_gem->pages[i++] = sg_page_iter_page(&iter);
-		if (i > npages)
-			break;
-	}
+	drm_prime_sg_to_page_addr_arrays(sgt, mtk_gem->pages, NULL, npages);
+
 	mtk_gem->kvaddr = vmap(mtk_gem->pages, npages, VM_MAP,
 			       pgprot_writecombine(PAGE_KERNEL));
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

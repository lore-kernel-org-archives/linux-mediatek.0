Return-Path: <SRS0=mrrP=63=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEA6EC2D0FA
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 May 2020 13:38:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA889223C7
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 May 2020 13:38:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hsSr1WMj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="oEHGq0mf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA889223C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5pB14jvDu9jHHnIpL0tt2sOXAzhJj7fr2IqhhmjZIpM=; b=hsSr1WMjN7KL5kYLQqWzu5ocxP
	lLJDdXntR14MADOxmd89bSC4NEHsPxFWo8U00HCZXOmPQG6V1RE1fyMS7xZhu6+Vxjyh+t8CUzqnm
	7sBaYdj1sMs0QJOUUZ4XVqZsA1iDkyEBuHOl8LfWojfQ49Zzw1IZF/Zux+8mxBTaURYFonvhZ+ZwL
	MXjnGIh0hEM1iN99t9bBDL13kYyR3xoe0N7Pz5YNEvPBX/YAvo1MKP7nYcJEd99eWqk1yKWn2Yn43
	WbpL5fwWD80dNiIV9Nz0hXBM+XxFzDvyANauoLcrxJ8tA0laxzIdPUzUgknNwvcg+syZpPa5HCggq
	quuFZxRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYrao-000098-JU; Wed, 13 May 2020 13:38:38 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYrVV-0001Td-Lo
 for linux-mediatek@lists.infradead.org; Wed, 13 May 2020 13:33:18 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200513133308euoutp02cca9a750f1c958d7e6e2eb86caab03f8~OmcSPrnvA3110131101euoutp02g
 for <linux-mediatek@lists.infradead.org>; Wed, 13 May 2020 13:33:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200513133308euoutp02cca9a750f1c958d7e6e2eb86caab03f8~OmcSPrnvA3110131101euoutp02g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589376788;
 bh=8EZIcd9uOIKS70E4LE4yaht4Uu6+JPLIomKkdRO0ILA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oEHGq0mft05gVvJchVPaM8BpWiQ25cl5ozj/VQfNJTtU2jACbTTUiVxzfjZB2CtC1
 kntdEbyxWLX/VhGfftgHmYUNyoloykEU2Oaejj6MW7oosdHug1Lp+JuzoRa2HFKVoK
 jn4uFTCkxSaTtjKpv05y2kadV1a5QHdy7Kma5BAY=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200513133307eucas1p104b4da5b5f18f98423f9c0a468132794~OmcR5XWO02350723507eucas1p12;
 Wed, 13 May 2020 13:33:07 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id D8.C5.61286.317FBBE5; Wed, 13
 May 2020 14:33:07 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200513133307eucas1p1da70ed30775467792f4898ccce829d02~OmcRiFtgT0876608766eucas1p12;
 Wed, 13 May 2020 13:33:07 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200513133307eusmtrp19f5dcafe20553ece9c41755c6d7ad7f9~OmcRhUAn11049110491eusmtrp1N;
 Wed, 13 May 2020 13:33:07 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-4b-5ebbf71310ff
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id B3.1A.08375.317FBBE5; Wed, 13
 May 2020 14:33:07 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200513133306eusmtip108436382068676e558ded1ef25b74614~OmcQwsTUP0698906989eusmtip1q;
 Wed, 13 May 2020 13:33:06 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 15/38] drm: mediatek: use common helper for extracting
 pages array
Date: Wed, 13 May 2020 15:32:22 +0200
Message-Id: <20200513133245.6408-15-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200513133245.6408-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSe0hTcRTut3u33ZnL2zT8YZExKkzKB1ZeMCUj6oYQ/tEQsrSlFxV1yuYj
 g8j3Y2mlUopkLh/5TlPT2sxX6czJSKf52iw1wwQtdJoJaV7vsv++853vO9/hcDBEoGbbYCGS
 KEoqEYcJOWZoc89v7QnLXyo/p97BQ0SW9gOLeJlfxyaKs7JQYrM5GyGGVn5wiMrqbhahaHcj
 jENTLKJh5hOb0CmfcAhd0gAgat8buERisgthmOxFic6fX9lnLciapzWAfLuqQMk3BQYu2VCV
 wSFbVr+wyc/31CyysfQuObExg5C5o+WAVI3Fc8gHf5zI+01VgFxuOOjNv2p2JpAKC4mhpI4e
 N8yCp4YG0cjC3beSx5eReKDiyQGGQfwkXDP6yYEZJsArAOzo3uAyhRHAkZ48wBTLAFYrVSw5
 4G07Vtqec2kswMsB7C/x2HFU9BWx6QYHd4byBTmHxlZ4CoC9Wea0CMFbEVisXEfpbEvcB6YN
 naY1KH4EtmzGbw/l4+5QMVOOMGG2sLq+Yxvztvh5fTtKz4H4JBfOligAIzoP5xNWTQZLOK9u
 4jL4ANTkZpoMSQBOaWu5TJEJoC4x3+R2g3rtOofeCMGPwTqlI0N7QuPkAMocaQ8cXdhL08gW
 zGnOQxiaD9NTBYz6KCxQv9iJ7fw4aFqHhJq0RdNJ3wE4Nm5kPwS2Bf/DFABUAWsqWhYeRMmc
 JVSsg0wcLouWBDkERIQ3gK330myol16DlcGbXQDHgNCcT4yr/ARscYwsLrwLQAwRWvEv121R
 /EBx3G1KGuEvjQ6jZF1gP4YKrfkuxd+vC/AgcRQVSlGRlPRfl4XxbOJBkcela4r0pSBK7xDw
 LHSuZrSvzEk0XNhVPy2dy/AO9G19xddMtBxGgpdih/sfiewsmy6KEtwbd5WeEz+24+lmw+x1
 x129dsUUbhRFF1Tvs3DVrGX7jvnd0U/HLGpXDZU5IeTcQuA3r0q5p6gt1T/d/YohRXtKohy5
 UMZL1vsIhagsWOxsj0hl4r+hIHpGWgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRmVeSWpSXmKPExsVy+t/xu7rC33fHGZzt5rToPXeSyWLjjPWs
 Fot6e1ks/m+byGxx5et7NouVq48yWSzYb23x5cpDJotNj6+xWlzeNYfN4nLzRUaLtUfusls0
 tRhb3L13gsXi4IcnrA78HmvmrWH02PttAYvHzll32T02repk89j+7QGrx/3u40wem5fUe9z+
 95jZY/KN5Yweu282sHn0/zXw6NuyitHj8ya5AN4oPZui/NKSVIWM/OISW6VoQwsjPUNLCz0j
 E0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYyHVy6xFMzlrmi59Zm5gXE3ZxcjJ4eEgInE133L
 2LsYuTiEBJYyShzf8Z4RIiEjcXJaAyuELSzx51oXG0TRJ0aJgzMPsIMk2AQMJbreQiREBDoZ
 JaZ1fwQbxSxwjFli4+P3zCBVwgKhEo/O/wDrYBFQldj+vwHM5hWwlVjweDkzxAp5idUbDoDZ
 nEDxV3f2s4DYQgL5EnsX72ObwMi3gJFhFaNIamlxbnpusaFecWJucWleul5yfu4mRmBEbTv2
 c/MOxksbgw8xCnAwKvHwWtzaHSfEmlhWXJl7iFGCg1lJhNdvPVCINyWxsiq1KD++qDQntfgQ
 oynQUROZpUST84HRnlcSb2hqaG5haWhubG5sZqEkztshcDBGSCA9sSQ1OzW1ILUIpo+Jg1Oq
 gdFqk46vx6KDCntX1y14c0vXapqt5aGeGd4d6j7OLtaPprDy71NYKSFauWXq5FW/VjO5zY5Q
 mvRu57/M/Ue4jxzY2pcSwfTVIUBGWo6l8elWZdYzE7ZezuiZzrclZRbrrYlp/y/YzPjXvrjW
 8+an4Ac8P4omtleu9N3+mY1VoTZDr26B3e/dvoeUWIozEg21mIuKEwGWZXHbvgIAAA==
X-CMS-MailID: 20200513133307eucas1p1da70ed30775467792f4898ccce829d02
X-Msg-Generator: CA
X-RootMTR: 20200513133307eucas1p1da70ed30775467792f4898ccce829d02
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200513133307eucas1p1da70ed30775467792f4898ccce829d02
References: <20200513132114.6046-1-m.szyprowski@samsung.com>
 <20200513133245.6408-1-m.szyprowski@samsung.com>
 <CGME20200513133307eucas1p1da70ed30775467792f4898ccce829d02@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200513_063309_916795_A69D5778 
X-CRM114-Status: GOOD (  12.13  )
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
For more information, see '[PATCH v5 00/38] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread:
https://lore.kernel.org/linux-iommu/20200513132114.6046-1-m.szyprowski@samsung.com/T/
---
 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index 6c34c06..14fcd48 100644
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
1.9.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

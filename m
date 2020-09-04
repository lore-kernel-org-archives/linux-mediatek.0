Return-Path: <SRS0=heX2=CN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0F12C43461
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 14:00:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D35D20665
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 14:00:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ONcaojXt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FyJX5MlD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Swn//sbH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D35D20665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z5KuZkFBz29cUje1r0kecyc9/YWJvJ+qEs3rXnRe05o=; b=ONcaojXt11zuwc8ye4MWIfLvor
	R3TGugmevcSxXloY9s8mCAWt8EN60pIFiOndgbCsErYa0B/kM8ff7tKB+s+7rJkDr7OGuTLZ30cKG
	/NgHiTlQkwueCw12mmlS67g8PNVAhIk4Kn3MDo9JjyqZAdAGeoGS6ky5IRvw1TtHpNfmXZXoulORs
	zVpfuSwgVdINRxeT217TmM8/ZrAIzLKMbL2emUKhdZW3ndfCWOCZyIAqWBqhGv+Z0VfuPtW0Kauw6
	ZNTQPvoP+h0a/Bi+EfxD6fE0HfOnHrYbhOokBBWEFgjaj33UBV+Gytxkwbfkf79SikkNgcs9jHVC/
	Y6vePyMg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kECGT-0003oY-5w; Fri, 04 Sep 2020 14:00:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kECGE-0003cT-QM
 for linux-mediatek@merlin.infradead.org; Fri, 04 Sep 2020 14:00:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=References:Content-Type:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=8ianEPGg4Fj0mBOrYoviW1eRvGacK64D5+qLvfqX6cs=; b=FyJX5MlDiIsYtbl5ERIm1wSC/C
 r53jKzbmctSxw2TZriRo1vQm7AsHYYWMFlAXCpDuaJhnoZPZ5RjZZCBsgo41BL7VguOrxyig7pClI
 y5XBkR1FMIXenXLaDSdmikKG8WwsmUUBGOuO71Y0CYiUydU8t4QnxRHG3ShzBG+meYdNFdklXSeSk
 1hm8hUTVaG+sGqmW5GJp0gR8l/8LMMM07qc/+Y+V1b1hRwRN7BcahZm9sbm62mPYT5k2lGqwrGU+n
 Izh18V2AjqOp2IcLLXdqERAkAXifkZCsWc+60TtVz90JqRkcbZGYPZU2ywPXmwQqGYi6sWSgePufC
 ju1BGtrg==;
Received: from [210.118.77.12] (helo=mailout2.w1.samsung.com)
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEBsP-0004H9-W7
 for linux-mediatek@lists.infradead.org; Fri, 04 Sep 2020 13:35:49 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200904133501euoutp027ea9f82809ab3352c0e9c99815a4f6e9~xmAeXgzdH2890028900euoutp02f
 for <linux-mediatek@lists.infradead.org>; Fri,  4 Sep 2020 13:35:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200904133501euoutp027ea9f82809ab3352c0e9c99815a4f6e9~xmAeXgzdH2890028900euoutp02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599226501;
 bh=8ianEPGg4Fj0mBOrYoviW1eRvGacK64D5+qLvfqX6cs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Swn//sbHJE7MhmY8WgRnLTnPYgtFyPKP7Gp80rduiRYurtlCt4Ruq4dB7KJqAsPX6
 bvJ7j8HzASO1leb5zRB19P9JM0IEpZBoTrdlhw+z8KZpTM2W5e9fBuAU0ivFAqRNjZ
 daEQmauqnd0aY80f3MCupr1fkTuv5l0FUyGhQ0hw=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200904133500eucas1p1ae41c3c4948f784f6d3a773b51c1cd27~xmAeGUcdR0117201172eucas1p1s;
 Fri,  4 Sep 2020 13:35:00 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 8D.01.06456.482425F5; Fri,  4
 Sep 2020 14:35:00 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200904133500eucas1p231e3d2b7de8bca0f52339ac520b8acc6~xmAd086oh0694006940eucas1p2i;
 Fri,  4 Sep 2020 13:35:00 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200904133500eusmtrp2113c0e9f6e103ab5048de0d1726d3b03~xmAd0KCpP0977009770eusmtrp2B;
 Fri,  4 Sep 2020 13:35:00 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-3f-5f52428412b4
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 54.A0.06017.482425F5; Fri,  4
 Sep 2020 14:35:00 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200904133459eusmtip17d41314ad1ec08748b7c67e79b4bd95d~xmAdHYUiq1888418884eusmtip1S;
 Fri,  4 Sep 2020 13:34:59 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 11/30] drm: mediatek: use common helper for extracting
 pages array
Date: Fri,  4 Sep 2020 15:16:52 +0200
Message-Id: <20200904131711.12950-12-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904131711.12950-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSa0hTYRj22zk7Oy5Xx6n5YRdpaaKQd+qAoikGByqK/RApUpeeVNqmbGqp
 RKLLaqVmGcmwJSJ4z5y3vKzyrplWTnSR84L+SEWMvNVIzdNR+/fc3u95eflwRNjPdcDj5Im0
 Qi6RijA+2tjze+ikKlgc4akpdCezh/o5ZG1BDZcszs5Gya3GPIQcWV3CyPLKbg5Z9M6PXBmZ
 5pC6mVEuaWgpxEhD5hdAVneZeGSGyoc0TfShZPuPWe6ZA1SVtgpQ+rUilGrWmHiUruIBRjWt
 TXGpyYe9HKqu5A71bXMGoZ4aSwHV+jUdo3I3PKmc+gpALeuOXhJc5vtH09K4ZFrhERDJjx1f
 q0ETuvm3MtbVWDpYwtXAEoeEL9TOf+CoAR8XEmUALpiMGEtWAFRpJwFLlgFsHcvh7o7MjW0g
 rFEKYKluEOyNDJdt8pgURnhB9aIaY7AtcRfAvmwrJoQQbQgsbjGjjGFDhMGGthHAYJRwhi9y
 s7Y3wXEBEQBVTSFsmyOsfP0eYbDlttxQMMtl3oHEBA+ul5TvrBQC1yo2EBbbwPneeh6LD8Ot
 5pccdiATwOmhah5LHgFoyCgAbMoPjg+ZMaYZIVxhTYsHKwdBQ/HbfzIk9kPjojUjI9vwSeNz
 hJUF8H6WkE2fgJreV3u17Z+Hd9ahoEHfuHPTPADnykY5j4Gj5n9ZEQAVwJ5OUspiaKWXnL7p
 rpTIlEnyGPeoeJkObH+wgc3en2/A6vC1DkDgQGQlsAgURwi5kmRliqwDQBwR2QqCBwfChYJo
 SUoqrYiPUCRJaWUHOISjInuBT/HcVSERI0mkb9B0Aq3YdTm4pUM6SLXr6rAzBU+XfIzUwx77
 +piDLk7eTqrU/HMzeJvr1ML1iwu2oaeLys+KNQ7HLC3EF8L77Af1znHexitp3k2hfjpFoh+d
 bJVS4hHYXjt827zvV35WpDbNeA/vXPK3MZutwwQeIZ2nsvhudv7Hocun83+k6JEo37pn38WI
 LjZIL0KVsRIvN0ShlPwF/3/fkVwDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFIsWRmVeSWpSXmKPExsVy+t/xu7otTkHxBhtWi1r0njvJZLFxxnpW
 i0W9vSwW/7dNZLa48vU9m8XK1UeZLBbst7b4cuUhk8Wmx9dYLS7vmsNmcbn5IqPF2iN32S2a
 Wowt7t47wWJx8MMTVgd+jzXz1jB67P22gMVj56y77B6bVnWyeWz/9oDV4373cSaPzUvqPW7/
 e8zsMfnGckaP3Tcb2Dz6/xp49G1ZxejxeZNcAG+Unk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6R
 iaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsadb+tZCo5yVTR972JrYHzP0cXIySEhYCLx8vpf
 5i5GLg4hgaWMEo2Pn7BBJGQkTk5rYIWwhSX+XOtigyj6xCix/c8kRpAEm4ChRNdbiISIQCej
 xLTuj+wgDrPAMWaJjY/fM4NUCQuESbSvnsIEYrMIqErM7W8Dsjk4eAXsJFq2u0BskJdYveEA
 WDknUHjrjCdgm4UEbCU+zFnMMoGRbwEjwypGkdTS4tz03GIjveLE3OLSvHS95PzcTYzAeNp2
 7OeWHYxd74IPMQpwMCrx8DLYB8ULsSaWFVfmHmKU4GBWEuF1Ons6Tog3JbGyKrUoP76oNCe1
 +BCjKdBNE5mlRJPzgbGeVxJvaGpobmFpaG5sbmxmoSTO2yFwMEZIID2xJDU7NbUgtQimj4mD
 U6qBcZJv3OajVXatrlKJHTE5R24bz9FYxf7X+Mi50sClz1+s51FctnSvR5x2ycbHc2zEBebM
 Vn7HKnttTuEGhewddr90klKfxM8KiLU5wxLln7BXblNk+NHcms/v8pdtYYgLvizVNvHHFD4W
 67X6vhkPZU5e94tSZOnzmTs5/0PBLNUv376JzI3WVGIpzkg01GIuKk4EAOitNhO9AgAA
X-CMS-MailID: 20200904133500eucas1p231e3d2b7de8bca0f52339ac520b8acc6
X-Msg-Generator: CA
X-RootMTR: 20200904133500eucas1p231e3d2b7de8bca0f52339ac520b8acc6
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200904133500eucas1p231e3d2b7de8bca0f52339ac520b8acc6
References: <20200904131711.12950-1-m.szyprowski@samsung.com>
 <CGME20200904133500eucas1p231e3d2b7de8bca0f52339ac520b8acc6@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_143539_305033_E8D87729 
X-CRM114-Status: GOOD (  12.67  )
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
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
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

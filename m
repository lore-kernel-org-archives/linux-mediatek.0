Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA31CD98F9
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 02:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J8O/pXXJ//moyFh/7MLx1Wt0Gv3Nz0eHoldtSppYnyw=; b=eOJB1bGFm78iy29A/3WxtCgxqx
	1lthj9qvRWYwW+6DcFXkmh/1aNAHUAqF557Jx4Uujy3hbee5YjazhEJHocX2KlgEHrSSP/vwV6v0i
	h/aSRmf8aiRSJ6Qsu3QsNs6DVheSOe1MKxa7BlIy31nBI9iB9APgOvxGaYcA+jwHRkDRG6Cj1AftR
	ABtX7KtamTshhyGC/j6BzjwLp1GWedTtsoelH7rPvPx21KE+btiF4nGCtcJzXQYrWfEws5lWCv1hO
	G8crJtI8Qz57U1pX9jq5ujpxX3s9rmYyrywAsmY2UWenIh9BN0My2yy4Sgy9frobYrWZMUcHvqDFn
	0B1F3DIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZfsV-0000000GURE-2s4i;
	Wed, 17 Jun 2026 02:19:43 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZfsS-0000000GUKK-3yVC
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 02:19:42 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-9159f631656so66007185a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Jun 2026 19:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781662780; x=1782267580; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J8O/pXXJ//moyFh/7MLx1Wt0Gv3Nz0eHoldtSppYnyw=;
        b=eTvf4u1/bU01at0Sb6OzZe14KUREGInUYxf8QmfWrB1c6JjYOnLgjvNcs11Ueeva/C
         093WN439ysHEcMfDoqcodxmErpencsyYpIpOk89MJUTLVZnETRkU21rRsGQor3nVBSin
         /WtGRnzcNkVdwnuCK2FIDrf55AG855pdqozoajdbyl28mV9PP7B8eRPhJrGhqR5jSBu6
         D6NciELSpvVzrL+V0a/PbSvXi4HqWxYktq65UgNVZauFgfVYhpprtGjZEbl68UH/QecM
         MZgHov5eXlrPUzCqfKuyFeEVWY5rvkJxM8l7w4x4Ig5cV7LfAF6eEtaPXtGGLmockvZF
         A6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781662780; x=1782267580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J8O/pXXJ//moyFh/7MLx1Wt0Gv3Nz0eHoldtSppYnyw=;
        b=IxPY3KHx/qWSvHfJFyk8waQzvuKoQKr+s7HHybsS6rRgvVVcuCgjdtsv6pEe3NhqCY
         CEhc606ismeP1OAUUQP5sqDAB8tO2umruQAnnd0+qmsU2sbpkVALOFjIIlXHNcq0R40a
         iPliFh3uqA5BnF7i5hwxjwfFl7Os7fmLC91BonXDVe1A8DpldjMewlvbAmQWYSu8kEe8
         osE3MrM/+eVvXNfSP4swfSnPLgfFuJqf29swmyGZth1i4Iz3a1KHOofglJJ5PLOqskf9
         8/40Ob7nXV/fNPdv6ybFwHJWSEdzdmcMWMqsMAoBS+ENalY+yM4BInS2bM9jV/HxTjgK
         FlYA==
X-Forwarded-Encrypted: i=1; AFNElJ+9kVleanApnwQdvKZVwyommctwgkun4Ii51Yq82stmCwHtTC6BZ77W6PQagSF2x1shps2A9ujqwaX6xfLkRQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywbd/iRSCrGbab5mUysjiHrGzuJFy0Lm917jbQNAQ5OJo+Qc1QI
	GUg66RNygLfTdRZQnu7ou6HR1m+uol8ntOC9IjT6YF7dblQTcKD4Ey34
X-Gm-Gg: Acq92OH7axr/JjVosLUlFQz1Ij9cH6bzlF2JhthySM1EIvwnLRRZOxgD10SAra7QIvv
	E4iFXLkIIlXSXEL/YspTT1aoOrVScb+okj6M8B8zIkEQjY4nhCA+TvfbPSlBQ1KwyCnSteZ6GD8
	QLb6fvoLk+wApt2F27QIsggtr2lNkTpR59NtKcqchQLV6kJ8GaEdgfRiGpTrectt9M9VZqsZrup
	9lOzuHe2mynm2yLZagxlQbzK9EPRxtKQQu47WpsG1kg/HRNKiySdbUzZR7kgbjBhDCONDtmiQgT
	wL1F8f/ZUtYHi+49U1bHJ/bF3268cl86KWWEvWlCwyB3dvJSBxCjibRUGWgZkhfsEKC3OwurcF2
	CqAfRgMyXiOGYvhdYEd4F5B5CWdDYoSrfhGQAAEDqKkS/HX24PfapiqpMfEAC5etfDaT8C+Vegh
	KIs5BbwW3hG7Cz30SJBS9FogUYsNo6KSt71GQby7VKWipm/tXrykTVxR8EHD/06EHxMP3/J4LE8
	7NeoPjs7jfd38bSXljHH4tdAlCv1E1p
X-Received: by 2002:a05:620a:2948:b0:8cd:d688:7aef with SMTP id af79cd13be357-91dcd160370mr170783785a.19.1781662779948;
        Tue, 16 Jun 2026 19:19:39 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a006e35sm1657646285a.28.2026.06.16.19.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 19:19:39 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Heiko Stuebner <heiko@sntech.de>,
	Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 8/9] media: mediatek: vcodec: bound AV1 tile-start copy to the array capacity
Date: Tue, 16 Jun 2026 22:19:05 -0400
Message-ID: <20260617021906.2746743-9-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260617021906.2746743-1-michael.bommarito@gmail.com>
References: <20260617021906.2746743-1-michael.bommarito@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_191941_008252_AA0A56B1 
X-CRM114-Status: GOOD (  11.67  )
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

vdec_av1_slice_setup_tile() copies tile_cols + 1 / tile_rows + 1 entries
into mi_col_starts[] / mi_row_starts[] from the bitstream tile_info. Bound
the copy to the array capacity.

Fixes: 0934d3759615 ("media: mediatek: vcodec: separate decoder and encoder")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 .../mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c       | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
index 2d622e85f8271..49d9b4a72387e 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
@@ -1299,11 +1299,12 @@ static void vdec_av1_slice_setup_tile(struct vdec_av1_slice_frame *frame,
 	tile->uniform_tile_spacing_flag =
 		BIT_FLAG(ctrl_tile, V4L2_AV1_TILE_INFO_FLAG_UNIFORM_TILE_SPACING);
 
-	for (i = 0; i < tile->tile_cols + 1; i++)
+	/* Bound the copy to the mi_col_starts[]/mi_row_starts[] capacity. */
+	for (i = 0; i < tile->tile_cols + 1 && i < V4L2_AV1_MAX_TILE_COLS + 1; i++)
 		tile->mi_col_starts[i] =
 			ALIGN(ctrl_tile->mi_col_starts[i], BIT(mib_size_log2)) >> mib_size_log2;
 
-	for (i = 0; i < tile->tile_rows + 1; i++)
+	for (i = 0; i < tile->tile_rows + 1 && i < V4L2_AV1_MAX_TILE_ROWS + 1; i++)
 		tile->mi_row_starts[i] =
 			ALIGN(ctrl_tile->mi_row_starts[i], BIT(mib_size_log2)) >> mib_size_log2;
 }
-- 
2.53.0



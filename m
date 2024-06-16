Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A16EC27C6E
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Jun 2024 06:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BZdNCJale1sAYar/lNgv7jhcbE0JwVL5zwO6Cn6gmyw=; b=cbtetCjgdStH/vbmJIl/Y+hek3
	ca+jQgMbziwATrxWGRa4YS3zVW4fU/fxOAiqeLkiSmxGP85ipnKVziStT6/awpVQenG9hYDfAtJnG
	dBRgIHiblKRJIyDMa+pBijgkKPF1ui8phZYcUJ9vtJLH/VwF2l5QhySceMSvm8oe2BEbR2N7z3n5w
	rXSn0GD9I9OoJV/TtB5rYxT1KRbMNuoFQURNs7badhDjwgFkHOGVulPrXwwWCu7GZw5R39WV/bNHs
	8CFzBdxxAPmhUT3Av2INy1IaY7fTwTJl1uIXB7JR/2nydJK6S1LQifwqNTRjtsB1E9fnQSQRUbv2k
	A/PyuRbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIjP2-00000006vEd-0sRy;
	Sun, 16 Jun 2024 06:30:12 +0000
Received: from smtp-76.smtpout.orange.fr ([80.12.242.76] helo=msa.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIjOy-00000006vDd-1vaE;
	Sun, 16 Jun 2024 06:30:10 +0000
Received: from fedora.home ([86.243.222.230])
	by smtp.orange.fr with ESMTPA
	id IjOnslpBNuDOGIjOosKnZ7; Sun, 16 Jun 2024 08:30:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1718519401;
	bh=BZdNCJale1sAYar/lNgv7jhcbE0JwVL5zwO6Cn6gmyw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=rg2EbreWAr3rwLbSKWM2aGPQ27F5BU/0+zACNx0m/u13ozGipFNEyUPcfuWV3L4he
	 Pls145IPvwru3XhizaxUCF6g5yFSPHHQG30mmSLo1goKcyoV4e+Iy9stoHkWEOZLS1
	 nCdJuZWWH4xF1mOxIutvve7MVUKuFiy4cxamXz3x3yqmm0M28Pru6qIPUG4DItIBlc
	 TJfC+E/OFDVWOVJEiMVhTMrz+WYSOE9B5K6q/+sF5U/EnYkbLmqdZizL+kyh9GL2p/
	 QGyakLA48LlJdSXyopgKfcMG+CMT0ZRpKRN/ZwOxHOlgdHCDp4HcLxOjayYE0n7N0d
	 +qreeYd83Xo/w==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 16 Jun 2024 08:30:01 +0200
X-ME-IP: 86.243.222.230
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] media: mediatek: vcodec: Constify struct vb2_ops
Date: Sun, 16 Jun 2024 08:29:53 +0200
Message-ID: <fc20e4271a4c98c6106d01eb1ada3f4da217e56b.1718519365.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240615_233008_941701_2ADEF4E9 
X-CRM114-Status: GOOD (  11.49  )
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

"struct vb2_ops" are not modified in this driver.

Constifying this structure moves some data to a read-only section, so
increase overall security.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  18059	   3096	     16	  21171	   52b3	drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  18171	   2968	     16	  21155	   52a3	drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c  | 2 +-
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
index 11ca2c2fbaad..e62c1c18758b 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
@@ -595,7 +595,7 @@ static void mtk_init_vdec_params(struct mtk_vcodec_dec_ctx *ctx)
 	}
 }
 
-static struct vb2_ops mtk_vdec_frame_vb2_ops = {
+static const struct vb2_ops mtk_vdec_frame_vb2_ops = {
 	.queue_setup = vb2ops_vdec_queue_setup,
 	.buf_prepare = vb2ops_vdec_buf_prepare,
 	.wait_prepare = vb2_ops_wait_prepare,
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index b903e39fee89..3307dc15fc1d 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -854,7 +854,7 @@ static int vb2ops_vdec_out_buf_validate(struct vb2_buffer *vb)
 	return 0;
 }
 
-static struct vb2_ops mtk_vdec_request_vb2_ops = {
+static const struct vb2_ops mtk_vdec_request_vb2_ops = {
 	.queue_setup	= vb2ops_vdec_queue_setup,
 	.wait_prepare	= vb2_ops_wait_prepare,
 	.wait_finish	= vb2_ops_wait_finish,
-- 
2.45.2



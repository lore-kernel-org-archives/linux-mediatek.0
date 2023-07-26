Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B0CC04A6A
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jul 2023 16:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ObpI3zj6Xl6C0CBu+Oy2cnCWLWyG0w8ErsnM9u7VILU=; b=QWO+JDssbiqtUanC81Ynqe5hoQ
	V2UFCERXbR2t/JrAOAwXiyH12nTtdT2AnlxnHZ9yISkvdVKzZGyPcHoUBTozYB/Ogddk9Yo+9dwnl
	OKuZaTaiYu1RR6hVe6jdun7FlbhjMHPQ5kjRGHOFAvbMjyrLnUXLAObtFG+iL0+qLuswkaz8yv3Yy
	rY12CB16AdEMbwk5h1JwOPOB8BelrajsaAA09wPMrxlk3HfRE/FAB0mwsadPie099/1bZx3wKt/4N
	RhTWJj2IYWh1YzMeI0Gy5GO6UdLFnvoS8F7FvkqwwqC3eGInWbJtwrGDsvCJndL2BHJKCru3S35M/
	Q7N8s3Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOhpp-00B5KO-1V;
	Wed, 26 Jul 2023 16:58:01 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOhpl-00B5IO-2B;
	Wed, 26 Jul 2023 16:57:59 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A2852660709C;
	Wed, 26 Jul 2023 17:57:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690390672;
	bh=GlSb/Bi4XjuFoQXGAU8G64f+6li+1Qu1vQWug/7FS4g=;
	h=From:To:Cc:Subject:Date:From;
	b=Y6BeWLgMrfIcehv5Ih0vL+HDn+bwY/cr2pesUVlIOakGBv2jPOsnhgCHHMoLQfonw
	 5n4dnGMiYpWm+DJEToZmn1iUqHIazQJ+WEd/rw+B+dfxnwttftEpKYYlNEPJ0LMRQZ
	 VElt4B1JoxD92zSWdD+vcjJ+2YsvEIIU1IYifPCyJwU4AIioe/JWHJuzFLZgjqUlev
	 NNQ2KRAiCa7f6K6uLij5Wmpwc3soLAoXy+3WAhTpIhu5OAzqUhSMVL42Ih4y5iQpcu
	 s8ce4GJ9a53q2gZBYUU40Jxg9qfwG1DGNgCWS3jn2WjigPEfwMHdHZMAhSj/Vx29E1
	 Y2VVSGXhTgy8g==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2] media: mediatek: vcodec: Consider vdecsys presence in reg range check
Date: Wed, 26 Jul 2023 12:57:39 -0400
Message-ID: <20230726165742.614248-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_095757_837504_7741BFCD 
X-CRM114-Status: GOOD (  13.78  )
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

Commit fe8a33978383 ("media: mediatek: vcodec: Read HW active status
from syscon") allowed the driver to read the VDEC_SYS io space from a
syscon instead of from the reg property when reg-names are supplied.
However as part of that change, a smatch warning was introduced:

drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c:142 mtk_vcodec_get_reg_bases() error: buffer overflow 'mtk_dec_reg_names' 11 <= 11

With a correct Devicetree, that is, one that follows the dt-binding, it
wouldn't be possible to trigger such a buffer overflow. Even so, update
the range validation of the reg property, so that the smatch warning is
fixed and if an incorrect Devicetree is ever supplied the code errors
out instead of causing memory corruption.

Reported-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Closes: https://lore.kernel.org/all/b5fd2dff-14a5-3ad8-9698-d1a50f4516fa@xs4all.nl
Fixes: fe8a33978383 ("media: mediatek: vcodec: Read HW active status from syscon")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

Changes in v2:
- Tidied logic by moving number of maximum regs to separate variable
- Rebased on top of Hans' for-v6.6i branch

 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
index 6cf5f88a3a8e..f5b8c37f32f5 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
@@ -96,6 +96,7 @@ static int mtk_vcodec_get_reg_bases(struct mtk_vcodec_dev *dev)
 	int reg_num, i;
 	struct resource *res;
 	bool has_vdecsys_reg;
+	int num_max_vdec_regs;
 	static const char * const mtk_dec_reg_names[] = {
 		"misc",
 		"ld",
@@ -122,10 +123,13 @@ static int mtk_vcodec_get_reg_bases(struct mtk_vcodec_dev *dev)
 	else
 		has_vdecsys_reg = true;
 
+	num_max_vdec_regs = has_vdecsys_reg ? NUM_MAX_VDEC_REG_BASE :
+					      ARRAY_SIZE(mtk_dec_reg_names);
+
 	/* Sizeof(u32) * 4 bytes for each register base. */
 	reg_num = of_property_count_elems_of_size(pdev->dev.of_node, "reg",
 						  sizeof(u32) * 4);
-	if (reg_num <= 0 || reg_num > NUM_MAX_VDEC_REG_BASE) {
+	if (reg_num <= 0 || reg_num > num_max_vdec_regs) {
 		dev_err(&pdev->dev, "Invalid register property size: %d\n", reg_num);
 		return -EINVAL;
 	}
-- 
2.41.0



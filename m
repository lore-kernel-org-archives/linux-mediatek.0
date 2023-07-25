Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6115C001DE
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jul 2023 20:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KeHiYwDUMYfCKwxyU7pvurAIeuJQCvlwl13Xex3hWWI=; b=PNVe//zoeKRzxL4VlkQligRl6B
	k0/xONb9DfHUBV9mkxFmJsaxU0nsXLg1DBmPCocLAZ+LF/wi3ykoHmDehm+9Hh3fYI4fOH4lUWRb5
	9gcL1gi1noF27Fb0t9H69gdv6EKQ2kKppj6B5an+qDcwxt/PUz3e8ozpn4d4MBPMjvYjIykWWxJAM
	iJKUBdPHMxFnFe4q6qdWpGfu4FZB6uDYy2tGSD7o/n+5Pe7twPirAFEbB9DbzG4S7J9N5B3nJclbz
	mRHzwEhUdADmNauG9MjtIWjbKZrZxLYCSgST8IROvFmK/661sLLU16iF90JiJLdp/VKjNBglWy6o5
	lyVAC/+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOOq7-008Scp-2t;
	Tue, 25 Jul 2023 20:41:03 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOOq4-008Sbn-0A;
	Tue, 25 Jul 2023 20:41:01 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 83EEB66003AA;
	Tue, 25 Jul 2023 21:40:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690317653;
	bh=iMBQ+s+wbpCm8QUbxfi+mfkOxoIlRyEKgUUo7g7/1i0=;
	h=From:To:Cc:Subject:Date:From;
	b=Cx3GrVj1e1Yf45KTfHj6nGdGPQwkfC3ZGbMopZLX6d+wmXEe1nUa0jxLgNGbS5soN
	 mufw/QA1mUdaewY1A0DPSBvDbuMK9TGGIdm2CTUcuJckYGHZWDQtal+lspXcc74Kfz
	 F6wSs1M7e5tKpWvgQF+3x/qEwvomKgU3uslCF5WAYcgsnxKSmp1PfIWNDYmXQrp66h
	 CkvL7tDh0R5JwSBqKu+cs5nL6YoaZ/n9msdvVuV0vG5+ANjmlGSSqpMpdGwS1n8ia5
	 AjUGAhWHbAN1+KjI70aaiaChZPlJwLT5K0nLsLIkBaL3rCuTSOqR5RU3kSsUTT+hfY
	 BR8+sbXOms5HQ==
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
Subject: [PATCH] media: mediatek: vcodec: Consider vdecsys presence in reg range check
Date: Tue, 25 Jul 2023 16:40:39 -0400
Message-ID: <20230725204043.569799-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_134100_242345_DA105785 
X-CRM114-Status: GOOD (  12.72  )
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
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
index 742b6903d030..cd62b3f68072 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
@@ -124,7 +124,8 @@ static int mtk_vcodec_get_reg_bases(struct mtk_vcodec_dev *dev)
 	/* Sizeof(u32) * 4 bytes for each register base. */
 	reg_num = of_property_count_elems_of_size(pdev->dev.of_node, "reg",
 						  sizeof(u32) * 4);
-	if (reg_num <= 0 || reg_num > NUM_MAX_VDEC_REG_BASE) {
+	if (reg_num <= 0 || reg_num > NUM_MAX_VDEC_REG_BASE ||
+	    (!has_vdecsys_reg && reg_num > NUM_MAX_VDEC_REG_BASE - 1)) {
 		dev_err(&pdev->dev, "Invalid register property size: %d\n", reg_num);
 		return -EINVAL;
 	}
-- 
2.41.0



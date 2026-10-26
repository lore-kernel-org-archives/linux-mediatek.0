Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A03E606C23D
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2026 09:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Kz9EwmES;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=scKA6ZLx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LjTeBwZfLj61tdlg9QM+luzkf0OxdymEDqLC72F5nSQ=; b=Kz9EwmESmBDavD
	63kZT3bxcJRTVUrTH0V5Tc8Mi7MLU/Z5ELbv23SrQRd44hG4QYX3bwxNJv672ilFhuhMYgYelSvrp
	BJMw3amBhWWfttm16y0nJjs0l6JgDzg2n7/qsq+881VaHgsJckTsE+U1mec1RRaxoR0850SgBLsFB
	L503MqyYr7mqPo+TZD3qg9t2VAy3tCHZFbYYXvL1JzMz4YdZuJiU2U/VzbwWKYhmNhkGXxX4bVx/h
	CYUuFLSKSipyjr5vYDLUMaZCzOthIHxYn3d2dJfXEwSV41jjGYh+MgrhX97+vyKsSrYv/zZvUBo3S
	ry5zKUKIL68lPvd0sZVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHSv-00000002A0n-0N7M;
	Mon, 26 Oct 2026 09:58:05 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHSo-000000029nV-2ng6
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Oct 2026 09:58:01 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8a070781f63so986128b3a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Oct 2026 02:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008678; x=1793613478; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LjTeBwZfLj61tdlg9QM+luzkf0OxdymEDqLC72F5nSQ=;
        b=scKA6ZLxuqCrfxTdBXH8fgVynCPY13YVe3QV4RcTOV6qvlTIvz/xCLuN5C6T7oLMw0
         ssfuiYW09OSnSP+BsjSCjxpn6zgB4bDiBepohs6jGJ//fVH9cSbRoebDue8J5PM473k7
         c1DH12zu/JhSs26pxnAWmXu6wPeDvqS4lpYE0zwUKCqU3/l+GGvNcjmaNabyxhzQP/PQ
         p8BWCw2Km7N8kh30jpO0P/E82sXqMlq9j1xc2mKu57+7Y7Uvx6Ak5rY/dBqEQuqUCrpX
         IaeFhn0GWUCGWA2dMl2oqdv85DihfR9J+7ysSbZcgoruyYfQJojYR7DPN/vnRRlI1HgD
         MX0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008678; x=1793613478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LjTeBwZfLj61tdlg9QM+luzkf0OxdymEDqLC72F5nSQ=;
        b=lgtzB9v5kvDymWZlUJyrJHg+cHY1r2ay79jmXOj9ANsuFbqMxZSYr/3k2QGh9AlagW
         D1uhBmQGlTArjZacqWmEHogZ3WqsR7MXAEKYr53FJusGwKKv2lu3aXcrR0uEo3UfFPhw
         OIDxdCuD0LBaZbLaNfTVagCgZY7jOCE7rdqmL6u0XsE/heORe/b2Deqxq6NOta9+UfZ+
         UfAY6hwCVfPp/ptxCRJV7wQzXmsbHhTGRk9rhkXKL88Z1TP5pBsp1p3kdGQAUDDQoB9W
         MWl5DdLImTYeK6hzsED59FQvXWa+8lKDeezQQuUxyXiZPCH8MkjBkP2xFxQigp3+N/8T
         kc1A==
X-Forwarded-Encrypted: i=1; AKwUvBwV94jQX964Et1O88JxMCMKiAYpFCGrJc+Dbju0Wl1pIJz46C0jbVDjbel5P+dpEue8QJO0xhsKkqmApKszqg==@lists.infradead.org
X-Gm-Message-State: AFq9FYLjRRexjlpROUqw5OD2FDChiTlnpB1IEE8V81HCEUaVCumFG6OR
	U5W/9chaIGFZIFJwX3Su1s048cUt4tdCmW0vTdFZSbaA5bZecwri2Px8RgxtbR3L
X-Gm-Gg: AYBFou3oiIsDlu8I28lwKtBwavEaRhW0DszljLiZl74PDXiCq3x4I51PCR8HsuVyTtl
	ul+31GLuweACnQCDdnC+7Sz+cX00raIsIdn8r69Bi4KXq2nh0iR/AA3uAP2EmFhD7A+NrN3xSNm
	FHVlvzph7/HO6PFokGHUDaBBpT5lwfgim8hP0Gwl8pW6TwiWjZLLzez3jgY6phVxC9vibYwy1WX
	STQd3ShByCy41vavzJ54v7xR2a0G9ceF9JOmos831jxaOI82mcI/I3QSwNDX6kj6FoZ47lH3jwb
	Tv8I9ljk5hi5P50FaPXVl2e7dggjXNgxE3zWuuGCbFsD1427SkMi0QZQvZEVKhCzrwJDHsaX7Sr
	8z9n12Bo4T+25qTiQ9o4/K6elsXEUFMSz6yXWkXUQVloEMJlbo8mhLau3LPeYADwU/R+iBONejL
	s+StyvUCX4k48BPoE1W34quexZ5CuME8m+yeD8FJvYEOIaFr+nxksCX922iv3LJ53iDjfy5iMNj
	GvUBCPfPB06IybmkzGoILkR/2jkdcUPCDCrQ30UzmwxXZ+wuJRCNNlFXa7U62867tICrJnJiwCp
	rspaCN88ag==
X-Received: by 2002:a05:6a20:9c16:b0:3e2:8fdc:a6cf with SMTP id adf61e73a8af0-3e7bfab8c31mr5045545637.30.1793008677695;
        Mon, 26 Oct 2026 02:57:57 -0700 (PDT)
Received: from [127.0.1.1] (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36bf0f4dcsm1095577b3a.44.2026.10.26.02.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:57:57 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
Date: Mon, 26 Oct 2026 17:57:28 +0800
Subject: [PATCH net v6 1/4] net: ethernet: mtk_wed: skip ring reset in
 wdma_tx_ring_setup for WED v3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-wedfix-v6-1-a52f6b15d2fc@gmail.com>
References: <20261026-wedfix-v6-0-a52f6b15d2fc@gmail.com>
In-Reply-To: <20261026-wedfix-v6-0-a52f6b15d2fc@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>, Rex Lu <rex.lu@mediatek.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Sashiko <sashiko-bot@kernel.org>, Zhi-Jun You <hujy652@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793008668; l=1333;
 i=hujy652@gmail.com; s=20261026; h=from:subject:message-id;
 bh=8HcC/sQ6Padav5RauewUundESxCJLuNyI/jOB6FPbeM=;
 b=R5SprU2ynkzohGH0ikExaLYx4+eF5xyVGdW5pS1EiVbSfrSOVQZkSRDrh4OMF2weeFfeqLWGL
 ZcrEU0rxM1SCaaLklufzqHafB/m9GBLE0QH7+amfullCkw11RjQdxO6
X-Developer-Key: i=hujy652@gmail.com; a=ed25519;
 pk=uXjqvnRsKEfHEyUr63sOg4fEJIDs4AmiW/rB1cWarXg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_025758_807971_1E61D086 
X-CRM114-Status: GOOD (  11.31  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Currently WED v3 tx wdma ring, ring reset happens in a separate code
block unconditionally.

Moreover, v3 has double the size of wdma_desc and has different init
values. mtk_wed_ring_reset doens't deal with that and would corrupt the
wdma_desc.

Fix this by skipping mtk_wed_ring_reset in mtk_wdma_tx_ring_setup for
WED v3.

Fixes: e2f64db13aa1 ("net: ethernet: mtk_wed: introduce WED support for MT7988")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260711112128.971-1-hujy652@gmail.com?part=1
Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 53d3b7e00e1c..d55042ccaff1 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -1938,7 +1938,7 @@ mtk_wed_wdma_tx_ring_setup(struct mtk_wed_device *dev, int idx, int size,
 	wdma_w32(dev, MTK_WDMA_RING_TX(idx) + MTK_WED_RING_OFS_CPU_IDX, 0);
 	wdma_w32(dev, MTK_WDMA_RING_TX(idx) + MTK_WED_RING_OFS_DMA_IDX, 0);
 
-	if (reset)
+	if (!mtk_wed_is_v3_or_greater(dev->hw) && reset)
 		mtk_wed_ring_reset(wdma, MTK_WED_WDMA_RING_SIZE, true);
 
 	if (!idx)  {

-- 
2.55.0



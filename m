Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC0D606A31A
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2026 04:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eXpqtR6l;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=m4vYM6NG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=vsYzKlYUxjQ8b2ns7gpXlBY/1SUDj1EiftmKZurRAuk=; b=eXpqtR6lUnA9C5EzAuWIWjHAYR
	tuWyLw/2euG2F0w1/W9kqJ+UsCh89Ow+BUH8+CaDAS6JT0WPSuzfKOBbAXSyFVm2f7JIxy5MZnbK6
	TKSglDH5/J4K59ZOCijtHGDC0bFoOeY/0D+NRLp3YLp7HBq0PNizNRUJA8EC+SY4fSP2Lul8K8Yaw
	Nm5b86EOswISpvR7vZDO0a+B3uuFKn5peOYw07OWq3/zEWK3iC+zxrfYCg0sNVviLFOk8xj+wWymJ
	2cGj0qH9rz7VzrfB9aR493EeepXDre3VLAp5bUreeBPWZo3/dKuTxq3mvwTyHUd85592UIHUrhxAP
	/1iMXW/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLv6Q-00000006Gbp-0wdX;
	Wed, 28 Oct 2026 04:17:30 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLv6N-00000006Gat-2IwL
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Oct 2026 04:17:28 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so468859a91.1
        for <linux-mediatek@lists.infradead.org>; Tue, 27 Oct 2026 21:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793161046; x=1793765846; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vsYzKlYUxjQ8b2ns7gpXlBY/1SUDj1EiftmKZurRAuk=;
        b=m4vYM6NGzrOeYYtod5TKMZnbjp+tmGsAHLLd7eWvtgji6+Nq0Dqc7Qb8ATROfwKUDS
         h89lRnhFEq5XY2i81Yvetgur+CPzZECRgczbs0HIHmQzC4KHaYw32JcjVxtaggLc61Q3
         ebLSzcPSWkeMOcMzH2aD2RFguA+GNilvM3cDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161046; x=1793765846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vsYzKlYUxjQ8b2ns7gpXlBY/1SUDj1EiftmKZurRAuk=;
        b=dCYb1P9IOvzcmlDvRLUfttwRcvcdhsUUXtyW0oAXhW3d/+HP3cOnEU58NXS4uKyKD9
         EtZdwN+Lx4AMSgnDFQ4KhpER2bl/nU7FAkPA4TLp/U9JimoI76T5+Z3f+P1cIMqgaiH2
         T6oTq2b2xzjMg4RgycGdkM8k2j6Bv8vRL4UNCcUh4vNmpoaOlriZ8OEwRKaAqcoK9/Y7
         u1jTOsEJF1OnLds/kqMA8PgOYe7hJm3pkthxbhQAW3u9okDYaHnDvZxOV5xiuPUlPFQp
         qpjPtEJyEUzy5Oy5lBeLF33DB1CW3htW+RGyxXE9YYNsHpb9ACW/80fDByF7IZKIbuXo
         hTHA==
X-Forwarded-Encrypted: i=1; AKwUvBx+2OFPmGHzn1JGBsjl16b8YNiI1jpeXF9RSB+ieRyrK/EUvWE7rfK6aSFTBdZ27eAjR/7oc7Hh6u8pw2XtxQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYIkxUCoUkxR9n1Bv5vC71iDWXKyPqOc2klpl2NkdCz14OxzdO6X
	hPxlSBh2+XqelmD9/gY6lwIev5v/767nefKraZteDh7s1pI8x5hW5XDqgQ65hNd8bLNmNZCAT6h
	KjvE=
X-Gm-Gg: AYBFou17VInk4n0zCPhLpNZ9l6BdXIJO8rl9kwN6bPHW3Xp7OMrvrpMVv7CspchZ29v
	UWPPNaCTbNHQctKxj/ebQKzFOtQN8j4AG+4D4W5ePFKZwlo+HrWFYYGM7/lLVkBD2IY8r/LLeVZ
	Dvmn+Iy7m113xfjAF6rU/2xcf3QvW2Z7axN4orR6sN0ukQJADUp1oIui8g9Kz7oh/HmkQbEcGvq
	eeydnoTJkPT6R+yNmtQ8Yv7dBqB6oxIVyLXdW87GEesUiFMVlH6yP0qT6GPmdL56BuuZnK+BhZi
	7S3XWRgsrHX4GLZBOAWF8fyCKm5RyhYCMc01X1ll7JAAwyHPYSQYzWfTB1GL0QN2/8kNgQd/CkM
	5yVTwA2H7/GKE4oFpwtkvygx/GXit1SSMpEag7CDuecHXt1uZToYT49M3OOKZ7VlfYBXt02hRXp
	rRjIYs9zUzEW2oWwN/PojyC3PiPn3akvIcbyNwnbCeRIgXRLiK1VLL2gV9uhD3E0tJ3Sv5BTuGY
	ciFmWZLoRhudHOVHHtxhAc6bB6mxzFT9kypKT0Qx6MVCzD6ZHOuvuG6d4642vSvcJQprP0JaF8y
	DDEQFvMLzdPHBsYBj4ji0aa6UQyhiZckV4bnpJe6QwoNOigltzP0sYCho9Yp3BTsDEkG0fhtBMR
	DlzJt1zIJ5COT
X-Received: by 2002:a17:90b:3b8c:b0:3ac:d79f:8229 with SMTP id 98e67ed59e1d1-3ae58145332mr944428a91.61.1793161046607;
        Tue, 27 Oct 2026 21:17:26 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:56ed:2655:ea09:addc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a586662sm969836a91.14.2026.10.27.21.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:17:25 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Yong Wu <yong.wu@mediatek.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	iommu@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] iommu/mediatek: Track first resume with a dedicated boolean flag
Date: Wed, 28 Oct 2026 12:16:50 +0800
Message-ID: <20261028041651.3201911-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_211727_594923_11DF3018 
X-CRM114-Status: GOOD (  15.01  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In mtk_iommu_runtime_resume(), the driver checks `!reg->wr_len_ctrl` to
detect the initial runtime resume before mtk_iommu_runtime_suspend() has
saved the hardware registers.

As described in commit 35c1b48d27da ("iommu/mediatek: Add
REG_MMU_WR_LEN_CTRL register definition"), `REG_MMU_WR_LEN_CTRL` has a
non-zero hardware reset default (containing the default write command
threshold and throttle-disable bits) and mtk_iommu_hw_init() only clears
`F_MMU_WR_THROT_DIS_MASK`. While checking `!reg->wr_len_ctrl` therefore
works in practice, relying on an implicit hardware register default to
track runtime PM state is obscure and easy to misread.

Add a dedicated `has_resumed` flag to `struct mtk_iommu_data` to track
whether the first runtime resume has completed directly.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/iommu/mtk_iommu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index b52e16b06760..3be1edd30861 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -260,6 +260,7 @@ struct mtk_iommu_data {
 	struct mtk_iommu_suspend_reg	reg;
 	struct iommu_group		*m4u_group[MTK_IOMMU_GROUP_MAX];
 	bool                            enable_4GB;
+	bool				has_resumed;
 
 	struct iommu_device		iommu;
 	const struct mtk_iommu_plat_data *plat_data;
@@ -1529,8 +1530,10 @@ static int __maybe_unused mtk_iommu_runtime_resume(struct device *dev)
 	 * Uppon first resume, only enable the clk and return, since the values of the
 	 * registers are not yet set.
 	 */
-	if (!reg->wr_len_ctrl)
+	if (!data->has_resumed) {
+		data->has_resumed = true;
 		return 0;
+	}
 
 	base = data->bank[i].base;
 	writel_relaxed(reg->wr_len_ctrl, base + REG_MMU_WR_LEN_CTRL);
-- 
2.56.0.307.g5fe7bd680c-goog



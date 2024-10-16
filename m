Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5E0D1AD48
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 11:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=leMIz+S2hdMoCIQxXqMQsph8MlFS4sT6v52ga1WkYdE=; b=s7l8gHr/Zfno7cgwjgBBhuwgEu
	thm7z52qlJrW2YbhNILoL7R2H68FRKUZq2K3ONU5EaXhORf28t381FkSjOE408HyBk8n3DxrbKaXE
	AKqMwe9cTPRao+YUttIQPcA3vJ+PgLQd6292dM4zOr1VSWRMgUYX1t6ma7p5ZCkUn9UweTl4hDEal
	K7wBfoiV3ig5vo2rujLl4M2JGpKJIa+GGpIDGgxC7x8kM6KKxa86g1q9JLws8vP/Y8OKBgkYf55AE
	3CIa9dVZiq5EojHkwl5tPk05XKZgxCVCVgMQCchUUbH1HJhri6NjRNNBOmQhXqLXUuvUkygtP4CTN
	t3jVomJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t12Nr-0000000Bc5x-2c8L;
	Wed, 16 Oct 2024 11:40:07 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t12MP-0000000BblW-2TSV;
	Wed, 16 Oct 2024 11:38:38 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-71e8c0bd2c3so28616b3a.2;
        Wed, 16 Oct 2024 04:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729078716; x=1729683516; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=leMIz+S2hdMoCIQxXqMQsph8MlFS4sT6v52ga1WkYdE=;
        b=mqxclBmJZRR4TrfUKfAZfqzV74qOJ92HDXMVrqyT96dqxpIVkaGcTKbrx5R/WaZ0z+
         T++yPEm3WnhCBZ6wep7x9JZcAA0RnMmHHom3sbALoaQ/O2V7bKfJzR3bZqwGhzsmCxCt
         JsH1EVSKqy1LcsT+pgqc49NJr1neDDxcpd0oASBcFiJdkRUnmY5gH8irJnO4VHaH3w4D
         d9b44dRqF563lZ8SN5lgKYkIOu+hlyG3MVDrjAbkY8wnQ4bA5FnYnnwQKqCpjVrKqQCL
         u3ytMYqx1zH538yyeVR1WGkewBmK25FHDDgdKjj3PhanjytZ2hC8ZbvBZ1h0CQdHW0li
         f6fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729078716; x=1729683516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=leMIz+S2hdMoCIQxXqMQsph8MlFS4sT6v52ga1WkYdE=;
        b=VBHpsoCbVouOmdX+u5/Z5KoAqQ/FQugiu/f6yrZ2kAZtpt5RImIJcpTIoh3eVSvTeN
         jfP35giF93gZFqn52a58AaMKesCgGY1eXtmLYVFr+49tkmohhCYLI3Vza0bsvedm83qd
         lI2AIWiQ0cVf0devPxpnHLxNmStKO0+tKguufGHNu5p9GpZqBiPNYHRbTDJp/0Mn9LvV
         ZebkSbgphG3OvZnYugC3c/9AVcpLG7lOUIEnYmUhIUpMJndLFmsdbAabphHg0hCUC9M4
         qc49ApkFGXp5E9zUIIeQZRe+oYIC5nAh+1kBTLEVGTfAXQBqhsrf1ZV7ciJJqKRxE0BZ
         gA3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUf3DQX4QJ3IDq5WF4DGLna/PcmZ1XANQjZReDk7fujanFVwrTeWfc/rvGiaakcau23TDy6BxxC9qYEr1fnWOE=@lists.infradead.org, AJvYcCVfArdtO1CyBkZHDBnBHh70VkMevMJqotr/ckSmbXpjHnj64LVxtb0hJdsWPjTWVTmDRRvXev+gyEziJh3v5KD3@lists.infradead.org
X-Gm-Message-State: AOJu0YxA7tYjEqhKnlYyK20u2nJw9Xmo6sT17YNSjYBlgKTyYRKAq5KT
	IksPiA3uFPrOUlFwsPRb+5bCeqDgZqmFJoOuk0KE7/qrqaHOuTVH
X-Google-Smtp-Source: AGHT+IFlTJEDuRawJmNHK9InnAgh+iHuDxeBCY8ZpQR+u0AgCari149kEVX4ecjZSxAciJY7lw309Q==
X-Received: by 2002:a05:6a20:e94:b0:1d9:ee1:3bfe with SMTP id adf61e73a8af0-1d90ee13cecmr2012870637.13.1729078715892;
        Wed, 16 Oct 2024 04:38:35 -0700 (PDT)
Received: from archlinux.. ([2405:201:e00c:517f:5e87:9cff:fe63:6000])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71e77518a76sm2883040b3a.220.2024.10.16.04.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 04:38:35 -0700 (PDT)
From: Mohammed Anees <pvmohammedanees2003@gmail.com>
To: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Moudy Ho <moudy.ho@mediatek.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Mohammed Anees <pvmohammedanees2003@gmail.com>
Subject: [PATCH] media: platform: mtk-mdp3: Remove unwanted else in mdp-cmdp-prepare()
Date: Wed, 16 Oct 2024 17:08:08 +0530
Message-ID: <20241016113808.4311-1-pvmohammedanees2003@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_043837_649704_B12A33F5 
X-CRM114-Status: GOOD (  11.89  )
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

Since platform compatibility is already verified, the
additional else branch is unnecessary and will never
be executed. To fix, remove this else condition.

Signed-off-by: Mohammed Anees <pvmohammedanees2003@gmail.com>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
index ea2ea119dd2a..168beed4155a 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -624,14 +624,11 @@ static struct mdp_cmdq_cmd *mdp_cmdq_prepare(struct mdp_dev *mdp,
 	if (ret)
 		goto err_free_cmd;
 
-	if (CFG_CHECK(MT8183, p_id)) {
+	if (CFG_CHECK(MT8183, p_id))
 		num_comp = CFG_GET(MT8183, param->config, num_components);
-	} else if (CFG_CHECK(MT8195, p_id)) {
+	else if (CFG_CHECK(MT8195, p_id))
 		num_comp = CFG_GET(MT8195, param->config, num_components);
-	} else {
-		ret = -EINVAL;
-		goto err_destroy_pkt;
-	}
+
 	comps = kcalloc(num_comp, sizeof(*comps), GFP_KERNEL);
 	if (!comps) {
 		ret = -ENOMEM;
-- 
2.47.0



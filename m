Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86EB6C04A6A
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Aug 2023 12:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tyXMRhOdLAsflsZxbsHhFbM6pTunAygx9wUZGK4+va4=; b=WPgJ1HhCVCUj+zDw0S6ujifKlp
	Sa0896hHy7ZkLrNQtf94rtMQFhVc/a9J2bBpN8IrPtrhNcGN8m591Y/3GC2ib81jSTUZ/iAh2Siew
	x4E4SQyOD92H2Fza7NRspm1kh1nqBhcK960dxH55ekgPdJdXi5X87O93ctCKnSxB3jp8WKkJqbnRy
	3GRU5ojEUgvVTjYNwUbB+q4oCVW59WBY07o1dRmePhWsCsSoZm5OhmqSj45BNbnDvj3h+DEN8Kfcr
	z6On6Pa3owPFw7cAfNeJdl4rwz5I9aNu3lBmq0HfjpZ+/717fQHRtguxYDMZ06f156XKSTziaK4Bd
	yfUO8OGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVswp-001afW-0x;
	Tue, 15 Aug 2023 12:14:55 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVswm-001aeL-0j;
	Tue, 15 Aug 2023 12:14:53 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-313e742a787so3127014f8f.1;
        Tue, 15 Aug 2023 05:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692101688; x=1692706488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tyXMRhOdLAsflsZxbsHhFbM6pTunAygx9wUZGK4+va4=;
        b=cDfuUZCgemlPICUotl9bXplDlFIT8Js96e3xxyay4LerLktDGKE65nSJp2VcKmtFd+
         y9z8GsltSobQ1/vXuZoc45l+lQDcjzQnMbDk3jvhWagXVlEKTYJJZNTXzCkmG9K2oPKT
         m2ZVs8o9DIW1exS7ixATKr4s7xPO1R+qbmGYfZlFyZg4zmMTiWggRutp8j41InW/yytL
         IVQAiYyhviYQZphveamqbRx6txd64xjktC4eLoblcXWmIv47pTirPEKuNaB4nKOWD5x8
         s2RmV4ClSaZRgtlV6lt5L0ISjD/mYEoTDmPcXXwfrpIQpKAkqxNeYOYwP3Z/ss9Jf8bs
         zsPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692101688; x=1692706488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tyXMRhOdLAsflsZxbsHhFbM6pTunAygx9wUZGK4+va4=;
        b=Me9cEK4viwmGAD7ZvpFkj1xXB750Wg7mU1srHqd6ExqD030maJJVjiu4TsP/Q3gtpf
         5SMZD2SSLOBcuwJoXvjFqsOdOnrmDf1NSgPv9nZRf6C3LLDI2zQ2CtyfNW35RSG5lTjm
         CN2nxJd54mXBxocYMuDl7oIP5mpmaVV+TGm9eKh4Sh9rxGG8+nmcrXO/6Y7lRI6nbOsr
         3oxIceb47E+If4kbpldUtEX2y2klWytaNW7EnZ+SdZeax20wpMTCY0aMx1rjB+1CAzXw
         OZC6iod5Hb2glmULwMQv7AmEKar5xHCIDqZYnU87p4rNcaYCC8su6LMbqsA2xdCPJo4k
         JdbA==
X-Gm-Message-State: AOJu0YyTqpwkaTwVgvqHWOm3wygsH2h67qwo50pQaExN4nERr8yQXzyr
	BNVLmVkwQlB6CJyXkf44II8=
X-Google-Smtp-Source: AGHT+IEwMuqs1Ttrj7d7T5WLLsuOk7IcerlFOkms3rb9c6fPo6crXQko9+9C8C7o/m8iOzB7ZLRmew==
X-Received: by 2002:a5d:5292:0:b0:315:a235:8aa8 with SMTP id c18-20020a5d5292000000b00315a2358aa8mr1497503wrv.2.1692101687680;
        Tue, 15 Aug 2023 05:14:47 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id 8-20020a05600c228800b003fbcf032c55sm20631723wmf.7.2023.08.15.05.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 05:14:46 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH][next] media: mediatek: vcodec: fix spelling mistake "resonable" -> "reasonable"
Date: Tue, 15 Aug 2023 13:14:46 +0100
Message-Id: <20230815121446.742742-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_051452_287490_0D64F7FD 
X-CRM114-Status: GOOD (  11.63  )
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

There are a couple of spelling mistakes in pr_err error messages. Fix them.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 .../media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c   | 2 +-
 .../media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
index 9e744d07a1e8..6bbe55de6ce9 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
@@ -68,7 +68,7 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(void *priv, enum mtk_vcodec_fw_use
 
 		plat_dev = dec_dev->plat_dev;
 	} else {
-		pr_err("Invalid fw_use %d (use a resonable fw id here)\n", fw_use);
+		pr_err("Invalid fw_use %d (use a reasonable fw id here)\n", fw_use);
 		return ERR_PTR(-EINVAL);
 	}
 
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
index 5e03b0886559..9f6e4b59455d 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
@@ -109,7 +109,7 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_vpu_init(void *priv, enum mtk_vcodec_fw_use
 		plat_dev = dec_dev->plat_dev;
 		rst_id = VPU_RST_DEC;
 	} else {
-		pr_err("Invalid fw_use %d (use a resonable fw id here)\n", fw_use);
+		pr_err("Invalid fw_use %d (use a reasonable fw id here)\n", fw_use);
 		return ERR_PTR(-EINVAL);
 	}
 
-- 
2.39.2



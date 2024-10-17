Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D002D3C530
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 20:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pLuLB8ZqbIpBpx1ND1vbb+62qdXEaSB4nVeZdMJrGZc=; b=A0kRhDlyRqW7DfX+solc7oe+81
	KShRMDJ9L4Objiz8UwF4W6syWPRcdoQbZOq/XgoLog3FjeBe9qmN6XjywowsNzlhgHPSoxTHNT7jq
	iK0ZkQUJhXBV6SP00pjBwull3O6UhrCT5j5gsPOEVTFZw0Qc+A+9OUWVJEPur6umDfB5RP5Sv4S/q
	scX2zj1CCF218w60BJiW2S336enQho3kKJmEgcvBPKsWi9MSYBi8Kxq1FtrAanojvJjZF53qjdZkv
	BGiqjDzJW0m/MucChGEXneMmyPmOO7COAWxVy0GSSZOkdBWDSZ+AGsaDnbGyW15kBpM1r8oNopbw0
	CFbkgRLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Wz9-0000000G6gB-0OJp;
	Thu, 17 Oct 2024 20:20:39 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Wxg-0000000G6X3-0xBo;
	Thu, 17 Oct 2024 20:19:09 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-7eab7622b61so1141010a12.1;
        Thu, 17 Oct 2024 13:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729196346; x=1729801146; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pLuLB8ZqbIpBpx1ND1vbb+62qdXEaSB4nVeZdMJrGZc=;
        b=gkrD2WokgAWzasaow1xwC/kvuGJTHzVZg5016woNVz34gkhWBGn5Vk+xUk1PBmNFpb
         d88xH4L7RA6KXeOOhI3dDt0yRjncQGjJYqybFzHfJ9NMUhEghtGOJaX1CFCI/LYBGbKq
         Fdf8Io3A0P5vz3O73vTsr1ARWNFPDORY8sDrQ3ehaNW3c3nb8JUGxgqp//zy7oDVtl/f
         Z1JJMhghIYTxh/T1YJs/bvYZYCnGjguHCHpXXHmc75QbPnEMiAQ8LMq6Ia+ObDIlBG5J
         dLy/ubFw7j10dMniG9uJP4/I/D/Eri4j+F4GsBKLcVrSxH2yPk9nVXVmK1nenr4BnXC4
         GQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729196346; x=1729801146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pLuLB8ZqbIpBpx1ND1vbb+62qdXEaSB4nVeZdMJrGZc=;
        b=eW83KQZz80Uo+rwHMxcBfnmR98Zwgui+YiMDDcroQ4GzyKuDeRF15+AcNl3F04so/4
         tooCGnKC3iiPG3xtEBJaDbZj84cVGHCc2Ym/tfOaCvd6xkv+aCQUiSytt8QsKvFbiLSP
         IMF5uUTXlJI/Z+bZE4klmzUyGBtf/EurWhtZDRTtIdXPTIZwiCAojn709q8qNFIlIMJp
         zmqNtOB+mvJerhVonfaYX/LstPO2ydor9DjgNWgSDiGAhG6mW42GUA4GWIW6onNVRgjo
         WLZHsxzAIT+MCim9INTGqnSZrf2GGXBijVAzgZS5jSgVXCvLC6hSPTqBYIlCnmfw4W3l
         k6vg==
X-Forwarded-Encrypted: i=1; AJvYcCUl0QoaQyu0FRB9aVbxTL4oF/YUyOW6r+r3RnXVFjE8xKwshW7lHQWZRyQ1SNZ4lXJ2p9Pc+edgBxWSnKp7B+k=@lists.infradead.org, AJvYcCVPFDWqNOdGU83CpsNpx4+f8hxUj+8KXrDvlBjjo8Rh/PwTGr5XkNXGTjBUMJr04UG0ZQtpz6GKxC71aZRGmVgm@lists.infradead.org
X-Gm-Message-State: AOJu0YwFqoiorhrrElMGBcgJtjdsesu034B+HOruZywH+lummxGjgyj2
	oHBJi+esuGDvQSn/00el3U3PFCZhAFhxqzTDUF+CDYHD0M3cxoUX
X-Google-Smtp-Source: AGHT+IHAshLs1c4PMHir3QhIZHAZUUg/NgBSZeGahxS7a6BaavGEOXnUpiPvqGX4ruCodcMKaJ/XpA==
X-Received: by 2002:a17:90a:dd93:b0:2e2:bb32:73eb with SMTP id 98e67ed59e1d1-2e561a012camr226188a91.31.1729196346330;
        Thu, 17 Oct 2024 13:19:06 -0700 (PDT)
Received: from archlinux.. ([2405:201:e00c:517f:5e87:9cff:fe63:6000])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2e5610b59b0sm133201a91.7.2024.10.17.13.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 13:19:05 -0700 (PDT)
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
Subject: [PATCH] media: platform: mtk-mdp3: cmdq: Remove duplicated platforms checks
Date: Fri, 18 Oct 2024 01:46:12 +0530
Message-ID: <20241017201612.2607-1-pvmohammedanees2003@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_131908_290816_DE3F1080 
X-CRM114-Status: GOOD (  13.20  )
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

The platform compatibility checks for MT8183 and
MT8195 in mdp_cmdq_prepare() are redundant as they are
done in __get_config_offset() itself. Furthermore
there are two if-else branch in __get_config_offset()
which have similar conditions and are redundant.
To address this, remove the check in mdp_cmdq_prepare()
and combine the two if-else branch into one in
__get_config_offset().

Signed-off-by: Mohammed Anees <pvmohammedanees2003@gmail.com>
---
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 24 ++++++-------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
index ea2ea119dd2a..6eb5affb0366 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -114,19 +114,15 @@ static struct img_config *__get_config_offset(struct mdp_dev *mdp,
 	if (pp_idx >= mdp->mdp_data->pp_used)
 		goto err_param;
 
-	if (CFG_CHECK(MT8183, p_id))
+	if (CFG_CHECK(MT8183, p_id)) {
 		cfg_c = CFG_OFST(MT8183, param->config, pp_idx);
-	else if (CFG_CHECK(MT8195, p_id))
-		cfg_c = CFG_OFST(MT8195, param->config, pp_idx);
-	else
-		goto err_param;
-
-	if (CFG_CHECK(MT8183, p_id))
 		cfg_n = CFG_OFST(MT8183, param->config, pp_idx + 1);
-	else if (CFG_CHECK(MT8195, p_id))
+	} else if (CFG_CHECK(MT8195, p_id)) {
+		cfg_c = CFG_OFST(MT8195, param->config, pp_idx);
 		cfg_n = CFG_OFST(MT8195, param->config, pp_idx + 1);
-	else
+	} else {
 		goto err_param;
+	}
 
 	if ((long)cfg_n - (long)mdp->vpu.config > bound) {
 		dev_err(dev, "config offset %ld OOB %ld\n", (long)cfg_n, bound);
@@ -607,13 +603,6 @@ static struct mdp_cmdq_cmd *mdp_cmdq_prepare(struct mdp_dev *mdp,
 		goto err_uninit;
 	}
 
-	if (CFG_CHECK(MT8183, p_id))
-		num_comp = CFG_GET(MT8183, config, num_components);
-	else if (CFG_CHECK(MT8195, p_id))
-		num_comp = CFG_GET(MT8195, config, num_components);
-	else
-		goto err_uninit;
-
 	cmd = kzalloc(sizeof(*cmd), GFP_KERNEL);
 	if (!cmd) {
 		ret = -ENOMEM;
@@ -631,7 +620,8 @@ static struct mdp_cmdq_cmd *mdp_cmdq_prepare(struct mdp_dev *mdp,
 	} else {
 		ret = -EINVAL;
 		goto err_destroy_pkt;
-	}
+	}
+
 	comps = kcalloc(num_comp, sizeof(*comps), GFP_KERNEL);
 	if (!comps) {
 		ret = -ENOMEM;
-- 
2.47.0



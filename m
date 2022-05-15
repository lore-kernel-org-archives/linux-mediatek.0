Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49AFC433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 May 2022 12:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wUH/TFlMfCLkpsedk9zbY3HQf8tvCZkVmjKqz6t3yGQ=; b=anqkzFLBZXlPag
	ATOmwuLfo2HzgNbMKWYPTbxyTHoIRDGLRtuRHfH7dKuiunEVKSUfkXY7fBoO9W3T5PYEZaCLNagiy
	LAcZ2s5FFUayDTLhC51jtQpifKy0ba0OghW3y8X17TEZ7BkBRWP/m+kIAavt6YoTjUsEuN1Oj4gP/
	1yB2MwL0gtbELWuQbux07tooxhfkbo5rZKh+dzzNfbw419pzDsq5Boc5cXScA82vKzIJmFgUoQktP
	2DCTXlb0Oy6FoFzcPurE72l4RgoOP8wq85CxL/6rN8jZlM0hZ6AxHfWHupCMX+Y8WIm25Szrw8Ms1
	fWK2nFkt4MVgd4e0yRqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqDIR-003zL0-JL; Sun, 15 May 2022 12:24:27 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqDIF-003zHA-41; Sun, 15 May 2022 12:24:16 +0000
Received: by mail-lf1-x12e.google.com with SMTP id h29so21636670lfj.2;
 Sun, 15 May 2022 05:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SUYig9sC8leaYOCWOdsNI+HlvuAaX37oi9lRYpsx+P8=;
 b=iiOULWswBYpK90JecBC9nc/knvuCpa1b6yQplA2pSGWDfTpf6U33KTLWFFk1ormmAM
 mgn3612DFjZpvY3q8R9gcQxuHrK6gQcSTZxKCqI+2JrWANkh23v0omtIQjutDebbEpHB
 iCD7cQQ6PHQ07YdTj7LxnlqDvxFfEd8BUC5IMwI0ytw9ZaeMZ5BnNZRj3eFKJOTHkwAD
 VyPciobVHOg4BY4jtVfmZEyUGnO/V+EDVUlzvb4UC6gvop2/aBvkQGFBuBnmNunI6d/1
 kIGeRcjPbrcU1xPyiRLB4EWs+2HzcW/23263gYNeIvnRVLfGerfzVMDRtmGfL8UeNiJE
 ku+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SUYig9sC8leaYOCWOdsNI+HlvuAaX37oi9lRYpsx+P8=;
 b=ya0easG1G/EAIgjxgSxzockrEJaePQFDkjZoEFtlii6rHX6V/Y/s86kGYhmL80J8Ea
 KsQUdvNEK0W1wmu1DLVl/epFIDCT/sQVs+RhR9YiR6UfDKphYXoGt6ezag08FMM/UQwf
 ZzOIgvRErLf2opSJDh2/blvi4lCPz06nQwWTuQb70ASfKv/Z/E3MetuX2iQ1GCRH+jdW
 Yfx79WMeKbN5+XzE7/IRa3N6lmdxZdEBqFZ026z8KHN7bl/ozuz5c7uR88R315lhJi1C
 fBlS5GBUnpGTX56xRn31MGViDqiuzYDiUdzbiisNJ846CreLm3dj0YfNhXEWjbwEkSnZ
 DjIA==
X-Gm-Message-State: AOAM533VgTVBB/Eph4F8H/90VWeC/Lmy8uagbWjHrkhvpe7NM92Ylp4H
 clD/J15WzJIHNO6RJQxYtbvC3PBnQz1YeP0K
X-Google-Smtp-Source: ABdhPJxueo7UdkBUCiG7xkIxGrbVht2IPsYta1UK+q2vDQr9FAab+n0M0AQ2er67IN7IQerFev5Htw==
X-Received: by 2002:a05:6512:3042:b0:473:b1e0:5667 with SMTP id
 b2-20020a056512304200b00473b1e05667mr9843775lfb.516.1652617450856; 
 Sun, 15 May 2022 05:24:10 -0700 (PDT)
Received: from localhost.localdomain ([104.28.198.246])
 by smtp.gmail.com with ESMTPSA id
 1-20020a2e0f01000000b0024f3d1daea2sm1172501ljp.42.2022.05.15.05.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 May 2022 05:24:10 -0700 (PDT)
From: Boris Lysov <arz65xx@gmail.com>
X-Google-Original-From: Boris Lysov <arzamas-16@mail.ee>
To: arzamas-16@mail.ee, mturquette@baylibre.com, sboyd@kernel.org,
 matthias.bgg@gmail.com, wenst@chromium.org, miles.chen@mediatek.com,
 angelogioacchino.delregno@collabora.com
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] clk: mediatek: Fix unused 'ops' field in mtk_pll_data
Date: Sun, 15 May 2022 15:24:09 +0300
Message-Id: <20220515122409.13423-1-arzamas-16@mail.ee>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220515_052415_204887_CF4C342C 
X-CRM114-Status: GOOD (  13.48  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Boris Lysov <arzamas-16@mail.ee>

Allow to specify optional clk_ops in mtk_pll_data which will be picked up in
mtk_clk_register_pll. So far no already supported Mediatek SoC needs
non-default clk_ops for PLLs but instead of removing this field it will be
actually used in the future for supporting older SoCs (see [1] for details)
with quirky PLLs.

This patch depends on series "clk: mediatek: Move to struct clk_hw provider
APIs" [2] by Chen-Yu Tsai.

[1] https://lists.infradead.org/pipermail/linux-mediatek/2022-February/035093.html
[2] https://lists.infradead.org/pipermail/linux-mediatek/2022-May/040921.html

Signed-off-by: Boris Lysov <arzamas-16@mail.ee>
---
 drivers/clk/mediatek/clk-pll.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index cabdf25a27f3..509959a325f0 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -347,7 +347,10 @@ static struct clk_hw *mtk_clk_register_pll(const struct mtk_pll_data *data,
 
 	init.name = data->name;
 	init.flags = (data->flags & PLL_AO) ? CLK_IS_CRITICAL : 0;
-	init.ops = &mtk_pll_ops;
+	if (data->ops)
+		init.ops = data->ops;
+	else
+		init.ops = &mtk_pll_ops;
 	if (data->parent_name)
 		init.parent_names = &data->parent_name;
 	else
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

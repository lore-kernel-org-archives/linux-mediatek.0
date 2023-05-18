Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E030EC7EE22
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 May 2023 08:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vw6xt/y7AkFMPkBEKOtYpyNZ0+8RMoG8PhpY+gjYbQY=; b=zknUiXZggopRkJX4Bnp4G8kRoK
	o3iM8BA0exBYaaaRyaYqL5zz843gyylBr+uy4CFeTHjcAH6/+2wWUT2uNTWhf2/MBRN2Ike7HBiVH
	C1Ty8ByaU/Chh5dJ8fX/TLGq2a+KHwI3kgW+FZEnSaswCuQBppuUzPyyccNqD2ikwKOcl6e7lKlRn
	jDYMez8Hf0OJPbOrzSokn7u2bZfKb2l6y6SFiEudgLuPYKwcoJ9OwvI24SWvdL9Jz/q7o6naXONEv
	dHjpJehoYTYE4mgfRI1aEd/6jblJl2NNXnPk1jD5bW9arHuMX6osUJ50qACBgjoKAaxNHKly2VXhX
	nBqW+GPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzZBr-00CMpl-0c;
	Thu, 18 May 2023 08:40:51 +0000
Received: from mail-pj1-f49.google.com ([209.85.216.49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzZBo-00CMon-1l;
	Thu, 18 May 2023 08:40:49 +0000
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-253504c84aeso952652a91.3;
        Thu, 18 May 2023 01:40:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684399247; x=1686991247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vw6xt/y7AkFMPkBEKOtYpyNZ0+8RMoG8PhpY+gjYbQY=;
        b=jxIhyjcTgFC/VC5QfnrU2CZRz1CFwbJwKr9bc9hX5G/aH60TfFdTNZMHaGjcCQqOuR
         Ww8zmQAIDHhdyvJ7LXycuh5emqe+NX+L82D5VI8wUic3MVwouBh563vccnNLDE46lOh2
         9sGCZF43vLrKbxNB75qpPPH8yIBwYfT1mjSXYewGRqmZHGjw7sUSHeVFudZ9UUvApTnr
         yklzPnVZpeuveGTb25FHzFcOZ6yxkT9SHX4gBZ88vfky8Niovcbji113d0IuTeD30bMH
         gBnHFwFUbYGqXuJdYQjiqewLKfNNTStSnoXUFtms6WLEl2gRMznUlN1AdwTiVBPXlOLH
         ivWA==
X-Gm-Message-State: AC+VfDxn3QuS7NIuyhLhmktbs1boiD0b7kaXP5QxKN8N4aa6AFTAJHIa
	X85WqcZTQ6dGXFcfPCXaxLA=
X-Google-Smtp-Source: ACHHUZ6vsmiXjXFwyKM5gSEb2mIhlorpplmKrEeHCicuDLzKL9PpRqXmtu4/cLEmy8KkytUqs1myJw==
X-Received: by 2002:a17:90a:1481:b0:24e:102e:edbf with SMTP id k1-20020a17090a148100b0024e102eedbfmr1660044pja.13.1684399246734;
        Thu, 18 May 2023 01:40:46 -0700 (PDT)
Received: from dev-linux.lan (cpe-70-95-21-110.san.res.rr.com. [70.95.21.110])
        by smtp.gmail.com with ESMTPSA id t6-20020a17090ad50600b0024dee5cbe29sm889946pju.27.2023.05.18.01.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 01:40:46 -0700 (PDT)
From: Sukrut Bellary <sukrut.bellary@linux.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Sukrut Bellary <sukrut.bellary@linux.com>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH5b51a54ae2fa1cc8459b68a28b3c8ca7b7203994] PM / devfreq: mtk-cci: Fix variable deferencing before NULL check
Date: Thu, 18 May 2023 01:40:33 -0700
Message-Id: <20230518084033.508711-1-sukrut.bellary@linux.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_014048_590066_67C09484 
X-CRM114-Status: GOOD (  11.55  )
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

smatch warning:
drivers/devfreq/mtk-cci-devfreq.c:135 mtk_ccifreq_target()
warn: variable dereferenced before check 'drv' (see line 130)

This is based on static analysis only. Compilation tested.

Signed-off-by: Sukrut Bellary <sukrut.bellary@linux.com>
---
 drivers/devfreq/mtk-cci-devfreq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/devfreq/mtk-cci-devfreq.c b/drivers/devfreq/mtk-cci-devfreq.c
index e5458ada5197..6354622eda65 100644
--- a/drivers/devfreq/mtk-cci-devfreq.c
+++ b/drivers/devfreq/mtk-cci-devfreq.c
@@ -127,7 +127,7 @@ static int mtk_ccifreq_target(struct device *dev, unsigned long *freq,
 			      u32 flags)
 {
 	struct mtk_ccifreq_drv *drv = dev_get_drvdata(dev);
-	struct clk *cci_pll = clk_get_parent(drv->cci_clk);
+	struct clk *cci_pll;
 	struct dev_pm_opp *opp;
 	unsigned long opp_rate;
 	int voltage, pre_voltage, inter_voltage, target_voltage, ret;
@@ -139,6 +139,7 @@ static int mtk_ccifreq_target(struct device *dev, unsigned long *freq,
 		return 0;
 
 	inter_voltage = drv->inter_voltage;
+	cci_pll = clk_get_parent(drv->cci_clk);
 
 	opp_rate = *freq;
 	opp = devfreq_recommended_opp(dev, &opp_rate, 1);
-- 
2.34.1



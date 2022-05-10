Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BF1C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 10:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jWTl4V5Z5LCc+LRunq2EAb8LBHD4svXCXGhhxXWAvtw=; b=oDf2ihri6WutMB
	NX0orhlFxWl3VMzX69Ag3eq3mL66GdnYR/xitvKeo9kl13/lr2B7LKYS7azSgbPr6i8eILDEeAtXN
	COOmVfm48YGAAsF/5Wodnde5El+gMUoyGyExbrPBiY/QnYnbR/0p6FggUy9FYOYGokEwOcmU8MN6v
	sC5gDTQo1jn1+NrCyehscovagGcvd5iOY6ZXT+6a1dfxJRAtJ8RsR58Fhf8B1B5I9gSAjHtppI3Tj
	p/DJRx+2WTBiQy/A7/eN2xQZIImWcUbMf+HtFTXjveXhkGh4QMklNvTwZV22NXwH+Zr8Pp9JS6Lap
	Q+2qEH1gsAvPbYPfmVpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noNQJ-001JC4-OJ; Tue, 10 May 2022 10:48:59 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noNPj-001Iv0-B6
 for linux-mediatek@lists.infradead.org; Tue, 10 May 2022 10:48:25 +0000
Received: by mail-pj1-x102c.google.com with SMTP id n10so4452117pjh.5
 for <linux-mediatek@lists.infradead.org>; Tue, 10 May 2022 03:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BgslsEogXlKVS6YgmGBau7rB/PozAnQ9JbNWL5WvtzQ=;
 b=eeegiiDyg8zBjp+38Ak4S2h+TENIgN+Wg1Ah92NtPSt0rViIon6zR1UebJEsrRsADM
 HfuuLtPXcMZ2L0ggIUZqyRVeiAQcyLUBZVP778kiDr0O07iJEp3aLviSLwffxd+ddLL3
 l5EhZeuxz/BxsbOAyGC/n5hoY4aK15q8NFlkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BgslsEogXlKVS6YgmGBau7rB/PozAnQ9JbNWL5WvtzQ=;
 b=JLDy57+M+Ll6lBLqIr5HCGxq3jDNmzMh3WDuOkFnY370svKCCoIATdya8lqj7FBMPW
 T8sDHq/yIBMwKiXMUhq9Lei2a8PWhuzcoHbLIw5sL7ZoynyonXrVTHcgVOn6giotrb5j
 OhpQnzjypZImI1t4sm1w81U5fFN4UJrAsBpexcXQ+xno0EO+o6ZPevhtTPhCeI0agRkp
 QwYyXuwuplbnQZqsMPAaeeDxn48bK5fHFL7RRnXH9QT9ktbldiwOoVCE4H1CupWoxUdK
 9i4sYE0/agUuLAhowzFRW0uWUFyt8WMi9e68u5h1lu9stjNHHhLqgZekUQGPqlOnOqR/
 c24w==
X-Gm-Message-State: AOAM532C4ZqD6qi3nUyAsISHe/0zbv5Ct2R5f7eMs39/h/5ZjgkQy1L7
 GtzUeq90SkCkDwqxxYICFbxLmg==
X-Google-Smtp-Source: ABdhPJw10UwOLp67CjDtkNkfRua2MKhIRejC2gaM1vRRb/MptjwBoEt6lU0qbuOUEwpl9bnJ0cubyw==
X-Received: by 2002:a17:902:d896:b0:15e:fb07:ba92 with SMTP id
 b22-20020a170902d89600b0015efb07ba92mr14461409plz.148.1652179698922; 
 Tue, 10 May 2022 03:48:18 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:6dcd:8578:55cf:2b12])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a170902e30900b0015e8d4eb21esm1659691plc.104.2022.05.10.03.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 03:48:18 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/11] clk: mediatek: Convert mtk_{alloc,
 free}_clk_data to struct clk_hw
Date: Tue, 10 May 2022 18:47:56 +0800
Message-Id: <20220510104804.544597-4-wenst@chromium.org>
X-Mailer: git-send-email 2.36.0.512.ge40c2bad7a-goog
In-Reply-To: <20220510104804.544597-1-wenst@chromium.org>
References: <20220510104804.544597-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_034823_491348_18E7B447 
X-CRM114-Status: GOOD (  17.54  )
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

As part of the effort to improve the MediaTek clk drivers, the next step
is to switch from the old 'struct clk' clk prodivder APIs to the new
'struct clk_hw' ones.

Instead of adding new APIs to the MediaTek clk driver library mirroring
the existing ones, moving all drivers to the new APIs, and then removing
the old ones, just migrate everything at the same time. This involves
replacing 'struct clk' with 'struct clk_hw', and 'struct clk_onecell_data'
with 'struct clk_hw_onecell_data', and fixing up all usages.

For now, the clk_register() and co. usage is retained, with __clk_get_hw()
and (struct clk_hw *)->clk used to bridge the difference between the APIs.
These will be replaced in subsequent patches.

Fix up mtk_{alloc,free}_clk_data to use 'struct clk_hw' by hand. Fix up
all other affected call sites with coccinelle scripts in the next patch.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mtk.c | 23 ++++++-----------------
 drivers/clk/mediatek/clk-mtk.h |  4 ++--
 2 files changed, 8 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 52bacce5dadd..554c6a128460 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -18,40 +18,29 @@
 #include "clk-mtk.h"
 #include "clk-gate.h"
 
-struct clk_onecell_data *mtk_alloc_clk_data(unsigned int clk_num)
+struct clk_hw_onecell_data *mtk_alloc_clk_data(unsigned int clk_num)
 {
 	int i;
 	struct clk_onecell_data *clk_data;
 
-	clk_data = kzalloc(sizeof(*clk_data), GFP_KERNEL);
+	clk_data = kzalloc(struct_size(clk_data, hws, clk_num), GFP_KERNEL);
 	if (!clk_data)
 		return NULL;
 
-	clk_data->clks = kcalloc(clk_num, sizeof(*clk_data->clks), GFP_KERNEL);
-	if (!clk_data->clks)
-		goto err_out;
-
-	clk_data->clk_num = clk_num;
+	clk_data->num = clk_num;
 
 	for (i = 0; i < clk_num; i++)
-		clk_data->clks[i] = ERR_PTR(-ENOENT);
+		clk_data->hws[i] = ERR_PTR(-ENOENT);
 
 	return clk_data;
-err_out:
-	kfree(clk_data);
-
-	return NULL;
 }
 EXPORT_SYMBOL_GPL(mtk_alloc_clk_data);
 
-void mtk_free_clk_data(struct clk_onecell_data *clk_data)
+void mtk_free_clk_data(struct clk_hw_onecell_data *clk_data)
 {
-	if (!clk_data)
-		return;
-
-	kfree(clk_data->clks);
 	kfree(clk_data);
 }
+EXPORT_SYMBOL_GPL(mtk_free_clk_data);
 
 int mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks, int num,
 				struct clk_onecell_data *clk_data)
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 9577084790dc..787fdeb1bd93 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -181,8 +181,8 @@ int mtk_clk_register_dividers(const struct mtk_clk_divider *mcds, int num,
 void mtk_clk_unregister_dividers(const struct mtk_clk_divider *mcds, int num,
 				 struct clk_onecell_data *clk_data);
 
-struct clk_onecell_data *mtk_alloc_clk_data(unsigned int clk_num);
-void mtk_free_clk_data(struct clk_onecell_data *clk_data);
+struct clk_hw_onecell_data *mtk_alloc_clk_data(unsigned int clk_num);
+void mtk_free_clk_data(struct clk_hw_onecell_data *clk_data);
 
 struct clk *mtk_clk_register_ref2usb_tx(const char *name,
 			const char *parent_name, void __iomem *reg);
-- 
2.36.0.512.ge40c2bad7a-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

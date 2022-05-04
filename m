Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCD3C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 12:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+fQVP8SaIAs7hh2AFRs81X4PAVE7r6y73zEt5F1rhUI=; b=Jaa4AN+O8saCQG
	Tu7C9cAF5NWL05utoWnAfRQSq8lTMDcVCE5q05J0VrhnOpDleA2WP4Q20xzcB7ZOccN+FS5gXr9uu
	Ebiiqmk+KDjihyZBIkhqAlzVGvijSOdsziHd9Gn0IbMY/D1oC/gT1j/iRQ/l/AZGJgQMyLHlXxqi7
	EGrAP8LsY4XNXROQQjnevXEUJ16AM28pnijLenQL18QNzZpSlBKsWuro9+fx7+2h+2N0fIOvLNHyl
	UCfDcMr/AA3jl/1VtBL4ggRhxYBqkHl56WYuw37iPRwsgO0O/wMD1uZzpjo7LlWWBfZ6ECDARI7XC
	IcacrBDWF0a8iJ1UUYIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmEE4-00Akvy-2d; Wed, 04 May 2022 12:35:28 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmEBg-00AjT9-Lp; Wed, 04 May 2022 12:33:02 +0000
Received: by mail-ed1-x530.google.com with SMTP id z19so1511489edx.9;
 Wed, 04 May 2022 05:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aPFSi/mWYMYdcINHgbvPpjSUWnzyR9p2rv5umtn3cjI=;
 b=UEFVed+rgiC1aLFETWO3cJXmKIhCocpF3HO/nI8utDBVg39ruLl5QFVsv4iuKvsveR
 5qATWQ8FXfIGg/WmYfD4hppEDR+bjU9R2cpZK2b80cZj7hMm+DyQg4GkyCqvOrn9a6Hn
 Jf33IeqUyVSd18068d9DNkH5Ci1mOYNBziuQ4Kaaevxnfjp8ORdU3Y25YF4pBNcjVqPh
 K8jQg1FaR/BuZ27aXWahyAQCbLO6jopxmHRzaaxQPMilhwrwlBSIB0tsiMLKv1NQ4Njf
 ekXwbKBISFCg5eZx9ktY6Ge82DA4gMnJYoZ6k/x/ApvaQftQjfV5cP8tDj0Y4xVYp4Jy
 sDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aPFSi/mWYMYdcINHgbvPpjSUWnzyR9p2rv5umtn3cjI=;
 b=l4QrNsUek6lND0OLYyrAgOr5OpJRU7bmEDfoz6gVknRm0lnUIphmXQghpUPbrwVUtr
 6MYdmLZu1PCdlXvPmRQ5xkphu7j26Q2JFjySqRPWCBpIwgYl94ncDeJ67+pCDIkxh30Z
 Kos4AkHNqZiM/qouRXCjIpSo9NeErCrhOtXGu86WwA/5ZKM5po+8hJOi5Xv5U3qXg+UD
 dXpyU8uO69oPJpcayUt8hwQvlr8mmgLn6sT2LKhzoP94dkUwhfh8uFTvEH8Wd/c38PUD
 5mv9Ijnn/KKQrMSGzMZCLn8+OEq2TDu4UPx7NH+O34QM3gVWKHOrwDDLn8cHxo3RWwkv
 VtVQ==
X-Gm-Message-State: AOAM531cKPdvSX7Rfv6Ls0IZEheP/zFioV5QMbRlwDrZ5r+ArJWymgn0
 Kf6QdVW+LqoLLgF0vcFUSWA=
X-Google-Smtp-Source: ABdhPJw1ji77MznXPOLUih012rHNfyRY1v0DSI/u5kQreEXOVa6/qDVm+wA0fswuDakV4xVmX1s1FA==
X-Received: by 2002:aa7:c318:0:b0:426:4aae:de6d with SMTP id
 l24-20020aa7c318000000b004264aaede6dmr22660856edq.208.1651667578090; 
 Wed, 04 May 2022 05:32:58 -0700 (PDT)
Received: from localhost.localdomain
 (185-177-124-12.hosted-by-worldstream.net. [185.177.124.12])
 by smtp.gmail.com with ESMTPSA id
 ig1-20020a1709072e0100b006f3ef214e7asm5688693ejc.224.2022.05.04.05.32.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 05:32:57 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 Yassine Oudjana <yassine.oudjana@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Weiyi Lu <weiyi.lu@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>,
 Miles Chen <miles.chen@mediatek.com>, Sam Shih <sam.shih@mediatek.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 09/13] clk: mediatek: reset: Export
 mtk_register_reset_controller symbols
Date: Wed,  4 May 2022 16:25:58 +0400
Message-Id: <20220504122601.335495-10-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220504122601.335495-1-y.oudjana@protonmail.com>
References: <20220504122601.335495-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_053300_808934_0115F1CE 
X-CRM114-Status: GOOD (  10.59  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Export mtk_register_reset_controller and
mtk_register_reset_controller_set_clr to support building reset
drivers as modules.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 drivers/clk/mediatek/reset.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
index bcec4b89f449..6c2effe6afef 100644
--- a/drivers/clk/mediatek/reset.c
+++ b/drivers/clk/mediatek/reset.c
@@ -129,6 +129,7 @@ void mtk_register_reset_controller(struct device_node *np,
 	mtk_register_reset_controller_common(np, num_regs, regofs,
 		&mtk_reset_ops);
 }
+EXPORT_SYMBOL_GPL(mtk_register_reset_controller);
 
 void mtk_register_reset_controller_set_clr(struct device_node *np,
 	unsigned int num_regs, int regofs)
@@ -136,5 +137,6 @@ void mtk_register_reset_controller_set_clr(struct device_node *np,
 	mtk_register_reset_controller_common(np, num_regs, regofs,
 		&mtk_reset_ops_set_clr);
 }
+EXPORT_SYMBOL_GPL(mtk_register_reset_controller_set_clr);
 
 MODULE_LICENSE("GPL");
-- 
2.36.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

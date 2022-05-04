Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A59C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 12:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IeE49rvGaOY6c5j7waP8b9xp/7l/bDlc2kukvHmoAc8=; b=rJnNu9O89xnIhZ
	JGxex4APDK0wDUzQqWRrUex6h2EW2G7IA3rfyZI8o+WQ8ffLudTyQzVm0eyhsEVxKl4rYmBAOFIIh
	KLR6WurzH3OwfvoIGBvxHH4LB7CxfHJoXrglVpc3XR3Cd3jBBcyPi+buYPHfV6XxA0/MsD+R2PpHX
	BMK6Q9H/3bVlnE0l4UlY1Onss3/Cv2H0iXZdChzPOicQMxSgyUfbjruqFoWTM3Wpr7+xu79kXgZa4
	xjHh97VJiVPu3HnlSaPz97Njh/+vvkNs1Osr9QRWdBEblRk7YJt9sZSvlpaXq2RILMVYGE1xyLnPC
	g6KzlU7HQPEmAMahARow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmEBl-00AjY1-VI; Wed, 04 May 2022 12:33:06 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmEBJ-00AjA8-16; Wed, 04 May 2022 12:32:38 +0000
Received: by mail-ed1-x52c.google.com with SMTP id g20so1520721edw.6;
 Wed, 04 May 2022 05:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UYV9WwfLVrhrjjukDe9qosCTrZP5yItzO2ZQyMR1lZc=;
 b=clzbEqsXQv/9j5beNysVRxnHh7EbfdL42WEK+sogVY160hfxT5oK2+IR1IBBklte5t
 ljb7kUC16gyqCia6Y1DO9VfnKQsmElv94rsEBhm5/71Ump62UeGSLcIRqAhZNNoIcDrj
 /d2+1GCvvxljr4i4IwSxzd+zN7RmCWZwPgTid2EQU7r4zlXhXfOVzt4oK/5ZrDB6/15V
 LI78hx3bZppBPCqu/mae/VXn0rWFnZwnac5Mc3eTK4HJ1KKYp/ut3KogNLUhyHK16mSc
 WsdMo1j0Ep4IrzcvMfA7hofu9ZE4xpIeqaz9iFbXt7Vh+BMyk8g4n2fje+1RsfQgxg4e
 OPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UYV9WwfLVrhrjjukDe9qosCTrZP5yItzO2ZQyMR1lZc=;
 b=5+h0jZj7XcIBI0OJ26UPpGwDwxGGHaTB1bPqugaRS5PC9MK8OjSWUE8pcO7yBrmWdW
 dWiBVa4sj4IAKrRerCHHykzdi2L44cGZblayrcHdiP/aOssEWsx699R0PRs4CAd2uOQt
 PEAftcDeyHoSs1e+it6Z8zm7S+daEuhWcTl3jwBc8VzXxzOn3MqRYLa1iZb3/n+rdOEB
 Px9h38iclPTm+XcjWH4FO6q24CZOopM0qktxrE94KH3w0A9tqiYX+/ben9MlVMXx3A8p
 82sGSFW+4BSkALNSI6KK0R345BwXWRWC4CAk2JMFN3i1ldDPffEyCfodC7nqJlQZ5aLU
 EKSA==
X-Gm-Message-State: AOAM532n7/kiExGJDryzA7ydHeW4BSWdTmiBWUbcKp4w2DYlVjgT6Yhu
 o2D2ggIA0Xqtc3hb0ggYRhs=
X-Google-Smtp-Source: ABdhPJz9W/mMV44IrVK/27fYXrCOAHDuuLtFYy0c/F+TRA1NVYOwalt2veeTybfEqPXiQUKHfnL3eg==
X-Received: by 2002:a05:6402:d05:b0:425:b7ab:776e with SMTP id
 eb5-20020a0564020d0500b00425b7ab776emr23169472edb.142.1651667549307; 
 Wed, 04 May 2022 05:32:29 -0700 (PDT)
Received: from localhost.localdomain
 (185-177-124-12.hosted-by-worldstream.net. [185.177.124.12])
 by smtp.gmail.com with ESMTPSA id
 ig1-20020a1709072e0100b006f3ef214e7asm5688693ejc.224.2022.05.04.05.32.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 05:32:28 -0700 (PDT)
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
Subject: [PATCH 04/13] clk: composite: Export clk_unregister_composite
Date: Wed,  4 May 2022 16:25:53 +0400
Message-Id: <20220504122601.335495-5-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220504122601.335495-1-y.oudjana@protonmail.com>
References: <20220504122601.335495-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_053237_093060_F825D6BA 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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

This is required to build the Mediatek clock core as a module.
Doing so currently fails:

ERROR: modpost: "clk_unregister_composite" [drivers/clk/mediatek/clk-mtk.ko] undefined!

Fixes: cb50864f6cee ("clk: mediatek: Implement mtk_clk_unregister_composites() API")
Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 drivers/clk/clk-composite.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
index b9c5f904f535..0935a54c9d81 100644
--- a/drivers/clk/clk-composite.c
+++ b/drivers/clk/clk-composite.c
@@ -425,6 +425,7 @@ void clk_unregister_composite(struct clk *clk)
 	clk_unregister(clk);
 	kfree(composite);
 }
+EXPORT_SYMBOL_GPL(clk_unregister_composite);
 
 void clk_hw_unregister_composite(struct clk_hw *hw)
 {
-- 
2.36.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

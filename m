Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F99C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 14:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8fCSoUX1G06o8K7Vg4QPIMYP04W4UcksNo8hbismHDs=; b=fYZYwka9wWTuPb
	YIusxtHOEJPnLNSHXM3hBN0ko/lwmM2IW7Zui3+IgAAfYOuQWXq1z2sZNCY5pQ9pXAATaYggYYs62
	GCv5AsFLvm9/ty+Ijrj5fdggTokb4uX93kjXACzr7oSBu+hn4cSVKw3xRffcjVkqVCfoxLfgG88Z2
	kXPonUdqydcGqiNEcFloip82EdR8OwVNzMAkhl5R0P/6RUHQoBt3qofF7vGA/0swGi1MHT7P3XuXF
	mwo7N/hi1zGkEx/Dy2jORNuZjWfLuYGGb8hyRuEX8jtt/KLSxHAcuMfc/NGqVOdE+1YHveaavwHbD
	l1GoWtzlYIGe240M1pMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrhVM-007ba5-2j; Thu, 19 May 2022 14:51:56 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrgWr-0078Oo-Gm; Thu, 19 May 2022 13:49:27 +0000
Received: by mail-qv1-xf31.google.com with SMTP id ej7so4590934qvb.13;
 Thu, 19 May 2022 06:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0XR4ztzwAfmurkh92tXKLFkllUmpZEqqatJbPeBbcOM=;
 b=m+kywaRl9XQL9PMsizCVDjVI4pa4msSwSGHHkLzTxeizpWwebWTLOtp0fGGy7zcdA3
 JNUQc3vk1MYM56qDik0bw+s1rFMdPA5/2s5l7IdzpbBj1Nno28ggt0dM2M84iU4cW+ba
 7mtzTUMAGu0K/k8LTaw9Cz27HE6mHrCe32yDTj5h3kXfwxm0rPqC+v7p4u8PacpXGYLQ
 vgR6fF+OG3mt4jYAZGiESEB3mqlZLGN6vFHJ5yJZLJpB+bAXjxGF5cvaZ68tNTt5pRfo
 8mMnPQIy0Dqtei/2DeV72q+PmDLnmTUtuUYlYtdB25xJ7LryAD8n08vvKC00fnOz31H5
 rwIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0XR4ztzwAfmurkh92tXKLFkllUmpZEqqatJbPeBbcOM=;
 b=xE5kC3H8cyvrD12XevMBOh44bN1ag6WHoTOCCzzkiPCcAvIqKRCl3kVfIGxNUi179g
 s6+P4ClqTZfIseHP04KH3ek69RAA8ZOV/MOYJ5ssRdNEaS8MIQZs6y4E6OscW85FbLDs
 f/MVthvxp2KEuLHKuu72UwykpIo3EmJ1kn6ZWroEqGYwUeYTjKcCRlihEgUelGJTxLmH
 LrcEtJmq5yHU9zK5JxiZfuR07eayE55Z3FjSQfqKLrm8QwLT9NhRFRlsTXCM42UKpcsf
 z74wQAeCMlyr8EWGs2cUPTW95xtLqscrzsSd41RWSbhal1/YswJ+ayuEBypj6lbOqt8g
 1J/Q==
X-Gm-Message-State: AOAM532WTw71fPdkSSnmU9eqoZ4r/dySxZbCf6BdCQ5QuWGBDq2rLiG2
 xcRWnO2A42Ue+TW8psQ7V0icmMwjYLonYtJe4GY=
X-Google-Smtp-Source: ABdhPJz3B+e46dXhNUkl2WT1y31axELp3CqGKGpHA3AN7h3CTzl9SjS7mKx+1xlBV234PR20g/oMdw==
X-Received: by 2002:a05:6214:e4a:b0:45a:dfa5:404a with SMTP id
 o10-20020a0562140e4a00b0045adfa5404amr3973844qvc.126.1652968163004; 
 Thu, 19 May 2022 06:49:23 -0700 (PDT)
Received: from localhost.localdomain ([217.138.206.82])
 by smtp.gmail.com with ESMTPSA id
 i186-20020a3754c3000000b0069fc13ce23dsm1315024qkb.110.2022.05.19.06.49.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 06:49:22 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Miles Chen <miles.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Yassine Oudjana <yassine.oudjana@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 1/6] clk: mediatek: gate: Export
 mtk_clk_register_gates_with_dev
Date: Thu, 19 May 2022 17:47:23 +0400
Message-Id: <20220519134728.456643-2-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220519134728.456643-1-y.oudjana@protonmail.com>
References: <20220519134728.456643-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_064925_590560_5C3AF940 
X-CRM114-Status: GOOD (  10.05  )
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

This allows it to be used in drivers built as modules.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
Dependencies:
- clk: mediatek: Move to struct clk_hw provider APIs (series)
  https://patchwork.kernel.org/project/linux-mediatek/cover/20220510104804.544597-1-wenst@chromium.org/ 
- Cleanup MediaTek clk reset drivers and support MT8192/MT8195 (series)
  https://patchwork.kernel.org/project/linux-mediatek/cover/20220503093856.22250-1-rex-bc.chen@mediatek.com/
- Export required symbols to compile clk drivers as module (single patch)
  https://patchwork.kernel.org/project/linux-mediatek/patch/20220518111652.223727-7-angelogioacchino.delregno@collabora.com/

 drivers/clk/mediatek/clk-gate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
index 421806236228..0c867136e49d 100644
--- a/drivers/clk/mediatek/clk-gate.c
+++ b/drivers/clk/mediatek/clk-gate.c
@@ -261,6 +261,7 @@ int mtk_clk_register_gates_with_dev(struct device_node *node,
 
 	return PTR_ERR(hw);
 }
+EXPORT_SYMBOL_GPL(mtk_clk_register_gates_with_dev);
 
 int mtk_clk_register_gates(struct device_node *node,
 			   const struct mtk_gate *clks, int num,
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

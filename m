Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B10C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Dec 2021 19:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QlDTRPO1BEgbGexAAFNmEXt4BSqnpuX7OxEHINmSuo8=; b=lMDdVaiMRd4YMN
	DqqvPKEcFuuPbThvvio9b/Gzdc49gG+gWQT8Zp/b3fxXdXUpCsZk4I6YYxhHPEkolbg/ya2+Bl7MP
	k6A3B7W+ykraA7YlwbPg3dwksFv5sGbIJDRMK376v/BJC5i976Ertn6+NjVYu/YZRPRUJTLP7qQ5J
	4XoZJi1mxeCJLnwRS9foU0SU1jX1mUF2cRf+C50aVBXBA0mrLO3IePkJxKdBdXtPPpqCOVDKaC+r0
	mqW2g6+s3XTNU+CUW2KiJaYUE8QkXpsVA6ALHRwmhgg/shPs2pOYueEvnfhfiT8DlGn/mPJEiJQcv
	f1GRs6Fr5C+E8mcL6oeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1vJ8-00HM5I-Ii; Mon, 27 Dec 2021 19:05:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1vIw-00HM19-34; Mon, 27 Dec 2021 19:05:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A87C161175;
 Mon, 27 Dec 2021 19:05:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3635BC36AEC;
 Mon, 27 Dec 2021 19:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640631905;
 bh=6fG/y6fFgYC/n6uFlQXSelvuYn77cmuHtBGrfaLuPxA=;
 h=From:To:Cc:Subject:Date:From;
 b=IEe0ReczKkDMB4g7U8PB4nxW+ge7s8MQORxs5rG6hIQHOlF4pnu9QbFutFPOJHvPv
 C3YevZOQEGZUAzw8x7m4NJjulfcfxmg7DyF+oQqE+QdDmF+Pd+zjG23DSHkXkykkPx
 luT8eTNKDs9tE+HBdR/aj9TZ6ls3iNqtx0EJ7N+23A5dPxQqwyzjJHakHSarEeUYNP
 bXTp4OsHk8A65fFW015QyGxXMABBKKUUaQwRZ2mb9o17AxeSC7c0MEzeRFJYJ4s36j
 kUq+EuUvtGlitAUcmW3iOOKSTEyo1mxo/x7mBpJeHPZX4+AhS9dikuf4p/XmVGhYYk
 vzdMLQqC7zZdg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Linus Walleij <linus.walleij@linaro.org>, Sasha Levin <sashal@kernel.org>,
 sean.wang@kernel.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 01/14] pinctrl: mediatek: fix
 global-out-of-bounds issue
Date: Mon, 27 Dec 2021 14:04:39 -0500
Message-Id: <20211227190452.1042714-1-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_110506_202300_C51F65BC 
X-CRM114-Status: GOOD (  12.44  )
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

From: Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>

[ Upstream commit 2d5446da5acecf9c67db1c9d55ae2c3e5de01f8d ]

When eint virtual eint number is greater than gpio number,
it maybe produce 'desc[eint_n]' size globle-out-of-bounds issue.

Signed-off-by: Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>
Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Link: https://lore.kernel.org/r/20211110071900.4490-2-zhiyong.tao@mediatek.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 10002b8497fea..fbb7807e0da29 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -280,8 +280,12 @@ static int mtk_xt_get_gpio_n(void *data, unsigned long eint_n,
 	desc = (const struct mtk_pin_desc *)hw->soc->pins;
 	*gpio_chip = &hw->chip;
 
-	/* Be greedy to guess first gpio_n is equal to eint_n */
-	if (desc[eint_n].eint.eint_n == eint_n)
+	/*
+	 * Be greedy to guess first gpio_n is equal to eint_n.
+	 * Only eint virtual eint number is greater than gpio number.
+	 */
+	if (hw->soc->npins > eint_n &&
+	    desc[eint_n].eint.eint_n == eint_n)
 		*gpio_n = eint_n;
 	else
 		*gpio_n = mtk_xt_find_eint_num(hw, eint_n);
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

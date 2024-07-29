Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7321FC3DA61
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jul 2024 07:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ncHefQXhdwDQ4/RjlVuwMUNr+QfPDTUajV9Yds65PcU=; b=PHEvxO7//g5TK9lcqYVejfjb4t
	1P+DGNoVKBDOEqHilTQAI+C3ldUS42ByfmPsTUr/iIegJbZFjFGkeW9pzoEB5eOjpI1oEI1PwNOPq
	VpC7P0zZ/kubyRv2FdZl2QtyC+Jq24sDcrWQcfLkRFtuW4alKbCStsmjAaCW/qu1tysm9VElkkyXI
	mJwQaSr7OvTnUBbq9nV70X7ZL5yYXRV0O1caLeKJ0s+9fLAfDTJGSiRyt7cGiVw0dmkWdc2HmC3rL
	xF+2k1FND5OTyLNr7fV+r1s05UmZjz6pYSGHSZnYqqrIBLa3DJPVGwidz0UfFrJlSZGT/DwS/vgov
	R1dipNHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYKwK-0000000AMu2-0B6p;
	Mon, 29 Jul 2024 07:37:04 +0000
Received: from smtp36.i.mail.ru ([95.163.41.77])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYKvI-0000000AMU8-3mgx;
	Mon, 29 Jul 2024 07:36:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=adomerle.xyz; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References
	:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=ncHefQXhdwDQ4/RjlVuwMUNr+QfPDTUajV9Yds65PcU=; t=1722238560; x=1722328560; 
	b=nT0uq/7Yh9bIMCvQr3AuSe3iqYub3+jhNRForf92r2MiQdEklHLLcC+JVtQ7iLBwYVWpvX6Glpa
	LQqcAPom+vgMXWK3kn4AUmnEMOe66DfYCi9D2I9tQ90R6DaBc478PPnyJATP4oRWktI0o6q1KBJ01
	NsWHv5h4l3LEZEqhG4Y=;
Received: by exim-smtp-868bf69f6c-zg7fr with esmtpa (envelope-from <me@adomerle.xyz>)
	id 1sYKvC-00000000275-2D1y; Mon, 29 Jul 2024 10:35:54 +0300
From: Arseniy Velikanov <me@adomerle.xyz>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sean.wang@kernel.org,
	linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	frank.li@vivo.com,
	jiasheng@iscas.ac.cn,
	mars.cheng@mediatek.com,
	owen.chen@mediatek.com,
	macpaul.lin@mediatek.com,
	zh.chen@mediatek.com,
	argus.lin@mediatek.com
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	Arseniy Velikanov <me@adomerle.xyz>
Subject: [PATCH 3/5] pinctrl: mediatek: mt6765: Add virtual GPIOs
Date: Mon, 29 Jul 2024 11:34:26 +0400
Message-ID: <20240729073428.28983-4-me@adomerle.xyz>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240729073428.28983-1-me@adomerle.xyz>
References: <20240729073428.28983-1-me@adomerle.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: exim-smtp-868bf69f6c-zg7fr; auth=pass smtp.auth=me@adomerle.xyz smtp.mailfrom=me@adomerle.xyz
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9000B6812E77BE1C6F0D221D1B7CB84E2160E2B5FE815AD3B182A05F53808504070ED64680FE505633DE06ABAFEAF6705569D5C545E49AD31303324A9B5BFDD32B323337538F1B82C
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE70EEC24FFE855BCBBC2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE74CC7A12EE14DE72EEA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38B043BF0FB74779F36D7040FD6C795E0D58B0FA825F8A708479DF002D5AC07DD35A471835C12D1D9774AD6D5ED66289B5278DA827A17800CE7212612128AA291179FA2833FD35BB23D2EF20D2F80756B5F868A13BD56FB6657A471835C12D1D977725E5C173C3A84C3CF36E64A7E3F8E58117882F4460429728AD0CFFFB425014E868A13BD56FB6657D81D268191BDAD3DC09775C1D3CA48CF043DDA2F55BC478EBA3038C0950A5D36C8A9BA7A39EFB766D91E3A1F190DE8FDBA3038C0950A5D36D5E8D9A59859A8B6A44FC0728E0BEE5076E601842F6C81A1F004C906525384303E02D724532EE2C3F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CB23BE56FCC6FEFED43847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 0D63561A33F958A57D5381FE4AFA73195002B1117B3ED696AEADDBF43329A05C715D9AB585B0EB04823CB91A9FED034534781492E4B8EEAD9CFA8CFAC159CE19C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF9917B871B94905D69EECD606C3E2E4C9B2A5DCBF1DDA7D096B07566F282BD1DACBE0296D7E8D7E7C67C7AAC6E25A208654E82B7864EB9E77FEDD108130C0427CA650E05A2CE5F5DC22BA058254B804A102C26D483E81D6BE44BE0F8B58F75087CBB04030989F1EE011FE023E09B2D9C0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX2k8aL79D6WItejNFuIZdQ==
X-Mailru-Sender: 5DE64BD8B4008F63F32F89B2E510BB54953AE6F1ABEFA2EDB951B70A5BD4BD8EAAC38112D6C17A550D95629463F16A6A3B9265ADAFE7D7E06F53C80213D1719CA6FC796F43705345A9EF9D9C6A90DD94D3D6663D5D4272A7B4A721A3011E896F
X-Mras: Ok
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_003600_960386_94C5D864 
X-CRM114-Status: UNSURE (   7.48  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add EINT-only virtual GPIOs as done for MT6735
These pins are needed at least for PWRAP

Fixes: 477fecee7ca9 ("pinctrl: mediatek: add MT6765 pinctrl driver")
Signed-off-by: Arseniy Velikanov <me@adomerle.xyz>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6765.h | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt6765.h b/drivers/pinctrl/mediatek/pinctrl-mtk-mt6765.h
index 772563720461..070af420333b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-mt6765.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt6765.h
@@ -1749,6 +1749,72 @@ static struct mtk_pin_desc mtk_pins_mt6765[] = {
 		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO179")
 	),
+	MTK_PIN(
+		180, "GPIO180",
+		MTK_EINT_FUNCTION(0, 144),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		181, "GPIO181",
+		MTK_EINT_FUNCTION(0, 145),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		182, "GPIO182",
+		MTK_EINT_FUNCTION(0, 152),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		183, "GPIO183",
+		MTK_EINT_FUNCTION(0, 153),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		184, "GPIO184",
+		MTK_EINT_FUNCTION(0, 154),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		185, "GPIO185",
+		MTK_EINT_FUNCTION(0, 155),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		186, "GPIO186",
+		MTK_EINT_FUNCTION(0, 156),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		187, "GPIO187",
+		MTK_EINT_FUNCTION(0, 157),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		188, "GPIO188",
+		MTK_EINT_FUNCTION(0, 158),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		189, "GPIO189",
+		MTK_EINT_FUNCTION(0, 159),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		190, "GPIO190",
+		MTK_EINT_FUNCTION(0, 147),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
 };
 
 #endif /* __PINCTRL_MTK_MT6765_H */
-- 
2.45.2



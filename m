Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D2EC3DA61
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jul 2024 07:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qXpGTjMyqiCD0RIX+JF9xtfahmenrVdxwgP0rFdhRew=; b=S0bm/lIEkDUsN+suvzNhv/kc0c
	wkG0uSXE9DOQHoCNFDH5lZbdu7c5w+a3DwGoBTVLQo8glFjVAYobHnCPQtqoX8TAowjXSAtNNAKxA
	OrvDTddZVU+8x1RwXAShfeWiayVP08ULv/zrjBlff+ESEAlo1wfhTlbcroxCAz2Nl/v3Bk7LfPvrg
	GlDc2PoJl48IwshCGMpDYLKZcF/1lpx+eB81ttifSXLJA/9DWlMe4ud8Vb9LVhdZ2jJarHzUQK2lk
	/Ksvra3fpG3lJIB9dy2CaUTzO37oMl19pzl3hXb97Pz9xPi2DN1kme+kVyulAnfbpvgcqi0BgpoGo
	pGNkLXkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYKx8-0000000ANE7-2xhi;
	Mon, 29 Jul 2024 07:37:54 +0000
Received: from smtp52.i.mail.ru ([95.163.41.88])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYKvd-0000000AMcn-0eVz;
	Mon, 29 Jul 2024 07:36:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=adomerle.xyz; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References
	:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=qXpGTjMyqiCD0RIX+JF9xtfahmenrVdxwgP0rFdhRew=; t=1722238580; x=1722328580; 
	b=GKJv08rIKfvUGUja08UFTz517+5xr+9g8ftxvynPSzzWzrsVzRDDq5EdsOnkerFyAPIaIZwFaKF
	3jfvm8gHsB7zgqtfEmXrAXTdBe+S94jX/Jjt+Ox2tVm3Lrk05Ix4TSIE/OL3KY/Ipf/RSJxPg8BFB
	9/n+xgrslwGydBdLFcM=;
Received: by exim-smtp-868bf69f6c-zg7fr with esmtpa (envelope-from <me@adomerle.xyz>)
	id 1sYKvY-00000000275-1lNf; Mon, 29 Jul 2024 10:36:16 +0300
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
Subject: [PATCH 5/5] soc: mediatek: mtk-pmic-wrap: Drop CAP reset in MT6765
Date: Mon, 29 Jul 2024 11:34:28 +0400
Message-ID: <20240729073428.28983-6-me@adomerle.xyz>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240729073428.28983-1-me@adomerle.xyz>
References: <20240729073428.28983-1-me@adomerle.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: exim-smtp-868bf69f6c-zg7fr; auth=pass smtp.auth=me@adomerle.xyz smtp.mailfrom=me@adomerle.xyz
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9000B6812E77BE1C65A930543BBC4734D0FBBE5E356D8E6EF182A05F538085040258FA13FC4598E4F3DE06ABAFEAF67050194B3CBFFCED927303324A9B5BFDD32A5CBAC82CA3D0FCF
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE760302A529BCAAAFCEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637B28E90C11C329EF18638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D82570FCA53F16511A83832EE758E1DF5414DF00F3BD1EAAA9CC7F00164DA146DAFE8445B8C89999728AA50765F79006374F374FBCC9EDB495389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8D2DCF9CF1F528DBCF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C643FE6A0CAC512C72D242C3BD2E3F4C64AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C3E4A64BF2429643C8BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166A417C69337E82CC275ECD9A6C639B01B78DA827A17800CE77F095E679B220E0C731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A5905487F9E6F6BD445002B1117B3ED696151B13FE362816443D2BBC1EF78EDEBE823CB91A9FED034534781492E4B8EEAD69BF13FED57427F1C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF92F0962FFBA62BF51607CC140B3088954361740219701A828057699EB7BCCB91EEB2523CC0526E3F67C7AAC6E25A2086B57C1B32712EB477FEDD108130C0427C97E10C581ADD9E9322BA058254B804A102C26D483E81D6BE44BE0F8B58F75087CBB04030989F1EE011FE023E09B2D9C0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX2k8aL79D6WzePG3zjDDEw==
X-Mailru-Sender: 5DE64BD8B4008F63F32F89B2E510BB5456122DE473CB4F5AB951B70A5BD4BD8EDDDCE20488194853C479C2914A57FB1F3B9265ADAFE7D7E06F53C80213D1719CA6FC796F43705345A9EF9D9C6A90DD94D3D6663D5D4272A7B4A721A3011E896F
X-Mras: Ok
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_003621_215909_BE6534CA 
X-CRM114-Status: GOOD (  10.14  )
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

None of the MT6765 reset-controllers have PWRAP reset,
so remove the requirement of it

Fixes: 12b079b0fe8b ("soc: mediatek: pwrap: add pwrap driver for mt6765 SoCs")
Signed-off-by: Arseniy Velikanov <me@adomerle.xyz>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index efd9cae212dc..30d74279e27f 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -2288,7 +2288,7 @@ static const struct pmic_wrapper_type pwrap_mt6765 = {
 	.int_en_all = 0xffffffff,
 	.spi_w = PWRAP_MAN_CMD_SPI_WRITE,
 	.wdt_src = PWRAP_WDT_SRC_MASK_ALL,
-	.caps = PWRAP_CAP_RESET | PWRAP_CAP_DCM,
+	.caps = PWRAP_CAP_DCM,
 	.init_reg_clock = pwrap_common_init_reg_clock,
 	.init_soc_specific = NULL,
 };
-- 
2.45.2



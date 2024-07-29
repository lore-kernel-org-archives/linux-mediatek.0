Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BEBFC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jul 2024 07:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BGScZYwNYRzn1E4n5sia8NhWakfQ03pdvYwsdDQdjJg=; b=mF7lwuPngOFA4l3wCv7zS0HeSB
	exhLIaJwHkZcRmndu4vMri7j2ERuL+cPEee/QSWk+DpuhdfHLDOeSs3cLDBftwXAp/gcjtrGilpaG
	k4HPVEsDlLiQQl1KEUgn7SFwxEPLRXecO1AGMka6+LS/y+KYWY9s3xT2WT12Rh9LmURYRP3F5uUT2
	T2C/mqNjs9FAkXgsGd+Y4/YmJx1D/Rv0Xg8R3b8m4OPOuWaT4K8o+yL4Bn6bVrKQwX4/rtAAJVlYG
	1kpZfpM1LHJOcVRS/LbfCqFEX0Qy07EcBYuQ/CtC2KxG9RsjMKLB00FqWVWhFpwGaSTCIR65JSBUU
	wVfJjMnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYKvv-0000000AMjz-0fkh;
	Mon, 29 Jul 2024 07:36:39 +0000
Received: from smtp47.i.mail.ru ([95.163.41.85])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYKux-0000000AMMX-2OYF;
	Mon, 29 Jul 2024 07:35:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=adomerle.xyz; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References
	:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=BGScZYwNYRzn1E4n5sia8NhWakfQ03pdvYwsdDQdjJg=; t=1722238539; x=1722328539; 
	b=aUv5P05jSSyi+OYj3CZhKDRK2iZ9wm3bMrg7qO7bJEAtlykjz4NqVO8bTh0NzpILrsb/J6Xhc9c
	8lxxP9/OD42Jz6U5EsGzlFAz/TY/qQo41z0W82/q7SSw3mZ9LFfe5ncgKM7SzZRDHqr68Q2T7b+G0
	hBNj7XwDTK5sPmIgYt4=;
Received: by exim-smtp-868bf69f6c-zg7fr with esmtpa (envelope-from <me@adomerle.xyz>)
	id 1sYKur-00000000275-3PYN; Mon, 29 Jul 2024 10:35:34 +0300
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
Subject: [PATCH 2/5] clk: mediatek: mt6765: Add missing PMIC clock
Date: Mon, 29 Jul 2024 11:34:25 +0400
Message-ID: <20240729073428.28983-3-me@adomerle.xyz>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240729073428.28983-1-me@adomerle.xyz>
References: <20240729073428.28983-1-me@adomerle.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: exim-smtp-868bf69f6c-zg7fr; auth=pass smtp.auth=me@adomerle.xyz smtp.mailfrom=me@adomerle.xyz
X-Mailru-Src: smtp
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD9000B6812E77BE1C61A13D99F4944E7212A013F29C7F5C920182A05F5380850404D53ABDB57B21B8F3DE06ABAFEAF6705BAD916B310CA54E9303324A9B5BFDD325DA98F1BEDE0FAFA
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7956F10FFCC7409BAEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006373103A56A89D9083FEA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38B043BF0FB74779F364D9CEBC3CFD6B8DC8B0FA825F8A70847059FB8DEF563170EA471835C12D1D9774AD6D5ED66289B5278DA827A17800CE71DD432BB81541BCF9FA2833FD35BB23D2EF20D2F80756B5F868A13BD56FB6657A471835C12D1D977725E5C173C3A84C3BD39A56654533F91117882F4460429728AD0CFFFB425014E868A13BD56FB6657D81D268191BDAD3DC09775C1D3CA48CF8C9B7DB6C49B7CEFBA3038C0950A5D36C8A9BA7A39EFB766D91E3A1F190DE8FDBA3038C0950A5D36D5E8D9A59859A8B69D9A99123495817A76E601842F6C81A1F004C906525384303E02D724532EE2C3F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CB23BE56FCC6FEFED43847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 0D63561A33F958A5975FF99ACDBD4C1C5002B1117B3ED6961C112C838BE192DA69995D676B7B4CBE823CB91A9FED034534781492E4B8EEAD69BF13FED57427F1C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF339F6C03A655D4025E4C9CB6EC7E2D2E0436D35C90D4EF0AFEBB18B2B510D9E0ECCBE4C437D6579C67C7AAC6E25A208678E18BF391248B5AFEDD108130C0427CFAB615D4A583E39522BA058254B804A102C26D483E81D6BE44BE0F8B58F75087CBB04030989F1EE011FE023E09B2D9C0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX2k8aL79D6ULtCaxUqIPEQ==
X-Mailru-Sender: 5DE64BD8B4008F63F32F89B2E510BB542337E882BFF2C65DB951B70A5BD4BD8E8E87E983BFFB9F4DB9A8FEFFB5F7F2D53B9265ADAFE7D7E06F53C80213D1719CA6FC796F43705345A9EF9D9C6A90DD94D3D6663D5D4272A7B4A721A3011E896F
X-Mras: Ok
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_003539_628886_F6EC7FD0 
X-CRM114-Status: UNSURE (   7.66  )
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

Add PWRAP gate

Fixes: 1aca9939bf72 ("clk: mediatek: Add MT6765 clock support")
Signed-off-by: Arseniy Velikanov <me@adomerle.xyz>
---
 drivers/clk/mediatek/clk-mt6765.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/mediatek/clk-mt6765.c b/drivers/clk/mediatek/clk-mt6765.c
index d53731e7933f..4f03a0df4ff0 100644
--- a/drivers/clk/mediatek/clk-mt6765.c
+++ b/drivers/clk/mediatek/clk-mt6765.c
@@ -559,6 +559,7 @@ static const struct mtk_gate ifr_clks[] = {
 	/* INFRA_TOPAXI */
 	/* INFRA PERI */
 	/* INFRA mode 0 */
+	GATE_IFR2(CLK_IFR_PMIC_AP, "ifr_pmic_ap", "axi_ck", 1),
 	GATE_IFR2(CLK_IFR_ICUSB, "ifr_icusb", "axi_ck", 8),
 	GATE_IFR2(CLK_IFR_GCE, "ifr_gce", "axi_ck", 9),
 	GATE_IFR2(CLK_IFR_THERM, "ifr_therm", "axi_ck", 10),
-- 
2.45.2



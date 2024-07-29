Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2205C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jul 2024 07:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/TbXQBlgqQSjOPeeAx6Ru67Uzek8is2joDRzfe4Rs1c=; b=AT/3maspMUY3XDo6V8DsN1yLuX
	9kNrzFEmbbC55FEdOIGp7vIBjZnC8N3lL1A0SY7BUQwuer5YbZ+sFDf2RQsHMLSyNP8wml+2+Ofk2
	48ow+zN3JfS5QDutbYKdh7tkDJ52y/T3UIvi7ZPevHcBs0u8X44KV03qXOi1fRCL0Mwns8WiZbTSM
	PsheCTSMOZ5btXMK0gR45+QBtc3P5O1k0Cub33jAeHq718ressKo9XaUyZKPaDDRgLqol9PwjDmkL
	mj8jbLmAyQAYYIWi/njCoiQoWGQtgclYh1gboy62YpOfpzX5tXwfeeBqFpi600355C1ByODJfwiIY
	UXNPYygA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYKuc-0000000AMHI-05c9;
	Mon, 29 Jul 2024 07:35:18 +0000
Received: from smtp44.i.mail.ru ([95.163.41.82])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYKuB-0000000AMEF-1c51;
	Mon, 29 Jul 2024 07:34:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=adomerle.xyz; s=mailru; h=Content-Transfer-Encoding:MIME-Version:Message-ID
	:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=/TbXQBlgqQSjOPeeAx6Ru67Uzek8is2joDRzfe4Rs1c=; t=1722238488; x=1722328488; 
	b=a9p6o1iPPcqgfuL+BGdeFHTUZST3gyO+SLSnHHEZbjeppgrLWCKpNe33Gxqu9ksT9i2LmlEGwVh
	EXcxh/RL5wbNvLxG7Vw2s0F7eEL5GLvGy453OxIGYJ0IDytXwTxiDaE0UycdG3sihffQFJUKtVt1p
	HP+9ukXSoZVMX/M1rOI=;
Received: by exim-smtp-868bf69f6c-zg7fr with esmtpa (envelope-from <me@adomerle.xyz>)
	id 1sYKu2-00000000275-19Zy; Mon, 29 Jul 2024 10:34:42 +0300
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
Subject: [PATCH 0/5] Initial preparations for MT6765
Date: Mon, 29 Jul 2024 11:34:23 +0400
Message-ID: <20240729073428.28983-1-me@adomerle.xyz>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: exim-smtp-868bf69f6c-zg7fr; auth=pass smtp.auth=me@adomerle.xyz smtp.mailfrom=me@adomerle.xyz
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9000B6812E77BE1C669BA6703360678607962ACE7A38F93F0182A05F5380850404A6EBD8EB87EDCD13DE06ABAFEAF6705D991A35C54BC5450303324A9B5BFDD32AE205DC559FE8AC1
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE71BDE6A359BD5B800EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006372521E7C1CE72986C8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D82A521D5026967AC283832EE758E1DF54C02766D67BBD0307CC7F00164DA146DAFE8445B8C89999728AA50765F7900637F3E38EE449E3E2AE389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC85FF72824B19451C6F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C89DDFE3E282F3DD103F1AB874ED890284AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C3318E5214BBCD6382BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166A417C69337E82CC275ECD9A6C639B01B78DA827A17800CE7A3CCBC2573AEBDE1C4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A53B5360BC74C387B05002B1117B3ED69692B8EDD8BD57A116715D9AB585B0EB04823CB91A9FED034534781492E4B8EEAD47A3109F1ACFD409C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADBF74143AD284FC7177DD89D51EBB7742DC8270968E61249B1004E42C50DC4CA955A7F0CF078B5EC49A30900B95165D34C5CF6F4B28551E3FCFCDB6F81F4ABBC6AFBE35CFF15CE9124750DE6FE30A1E071C782815521A7D1E1D7E09C32AA3244CF66988C60A0257E477DD89D51EBB7742CA0EC8289D0F426EEA455F16B58544A2F3B462F4D52ADD1F5DA084F8E80FEBD3FBC589A3B60A97D065BEEC70984F910843082AE146A756F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX2k8aL79D6V7K7+CihZ7+g==
X-Mailru-Sender: 5DE64BD8B4008F63F32F89B2E510BB54FBA398EA2A28809EB951B70A5BD4BD8EE2C593C39D5A9F6C0D95629463F16A6A3B9265ADAFE7D7E06F53C80213D1719CA6FC796F43705345A9EF9D9C6A90DD94D3D6663D5D4272A7B4A721A3011E896F
X-Mras: Ok
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_003451_455833_1424A965 
X-CRM114-Status: UNSURE (   8.21  )
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

Hi!

This is first series of patches that fixes MT6765 upstream drivers
(mainly PWRAP), just a preparation for sending the rest
of the patches (there were too many of them, so I splitted them
into several series). More patches can be found here[1].

The pinctrl patch (virtual gpios) can be confusing.
I did the same thing as on MT6735 (see[2]), these are
EINT-only pins that are not linked to any, so "virtual"
ones were added.

Also, there were no MT6765 pinctrl bindings in the upstream,
so I decided to attach them to this series of patches too.

Thanks, Arseniy.

[1] https://github.com/adomerle/linux-mt6765/tree/mt6765-next
[2] https://gitlab.com/mt6735-mainline/linux/-/commit/c4b988b2bea231e9175fd1d78f7602de1931e4d0

Arseniy Velikanov (5):
  dt-bindings: clock: mt6765: Add missing PMIC clock
  clk: mediatek: mt6765: Add missing PMIC clock
  pinctrl: mediatek: mt6765: Add virtual GPIOs
  dt-bindings: pinctrl: mediatek: Add bindings for MT6765 pin controller
  soc: mediatek: mtk-pmic-wrap: Drop CAP reset in MT6765

 drivers/clk/mediatek/clk-mt6765.c             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6765.h |   66 ++
 drivers/soc/mediatek/mtk-pmic-wrap.c          |    2 +-
 include/dt-bindings/clock/mt6765-clk.h        |  131 +--
 .../pinctrl/mediatek,mt6765-pinfunc.h         | 1025 +++++++++++++++++
 5 files changed, 1159 insertions(+), 66 deletions(-)
 create mode 100644 include/dt-bindings/pinctrl/mediatek,mt6765-pinfunc.h

-- 
2.45.2



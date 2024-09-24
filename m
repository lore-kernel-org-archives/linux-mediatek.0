Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01422CF9C69
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Sep 2024 18:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tb3KCJ7UtG4RaoStvN8TpIKynQN8TtiZMldU1UU/2uc=; b=f2zRjBt3ryfyY1KaK0MIT76BA9
	85iFTczIIaqMj93jKfcc9r+EDSDQ7fYC6vJC92RDS+ayOCBk8HgoYsAViyfXsOLxvQiB7iOlS/HgU
	voQ5nUn3WN55z0ihn0Jw3kRhObDCwggge22X6EL11YoPT30WcTMhyDJf3RPjVk2i88GagjxzDLZ4U
	IIwHSl7bH9A5eU1IT4fIt7PM1UgpFPrASUCmVZIA2/O1W4dcsNl01bFo02EECqz3HVVOnrHhjcBdl
	6UeXAzfCv3iWD+uEF691uPfDjXmTCHFgKsIeizw6u4aV6CJ127lum8BqUul2+gRQKQqb3BcE0dCtH
	cWw4B9MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st9xh-0000000313s-0S0h;
	Tue, 24 Sep 2024 18:08:33 +0000
Received: from mout.web.de ([212.227.17.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st9xd-0000000312q-3qPr;
	Tue, 24 Sep 2024 18:08:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1727201299; x=1727806099; i=markus.elfring@web.de;
	bh=tb3KCJ7UtG4RaoStvN8TpIKynQN8TtiZMldU1UU/2uc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=dIQ49qPdXiGGwS8BcWZzXMBgBmyPX8DxtkXO7j3X/B9OV83o0gASjKTG9YiEj2UH
	 MWKtWvahbOS6PePwO0nN7ceD/SgAzriTrtCtSV9Wrv9o7pZsdhtNQAWD7pzBtNHL1
	 l70vmLwL+q6JYVypVExC2YedZzlZDbun6gOdrpjVNaywlKXvz/jtywTX/TerAi8J6
	 eYJwWXfa774mSDWA2UQGbr0OKpPncAEwta67aBE0sHH1ycVgp1WhzzVuf4iBwTORR
	 7UGLE8HwZlwp7pLbV+JbdnF1FPvtsppoZrSVVA2yO2Ge3P15d3cmfqR2wkKjIkd9t
	 4fmW5nMGGn/QIMmHzw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MP3CA-1saYm71l2i-00T3fP; Tue, 24
 Sep 2024 20:08:19 +0200
Message-ID: <884f0a5d-e6d3-47dc-8a9e-201bb86b271f@web.de>
Date: Tue, 24 Sep 2024 20:08:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Roger Lu <roger.lu@mediatek.com>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] soc: mediatek: mtk-svs: Call of_node_put(np) only once in
 svs_get_subsys_device()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EG8pZS8okf7sA8Mkc7K62W2aLChHa5ZpPf6CfVkaDFvCwxohSu+
 zYb+1rHF+6cQPZ1oCupOCYZN9HPbD510gkzzjjrMt7XpghBiVpqyNNPOMrrnXmO3OmH2193
 7Hp4rYOeomZz5gO4PaChonxRPGKf5BBxo/0nW/epQvhCm537Ng1Qpss0EltYSI1Sa4JhwkJ
 L3NPCpxMnstcZDfv1XSrQ==
UI-OutboundReport: notjunk:1;M01:P0:w/gSIH+UxEQ=;AxxBLvTjcfLw8tPDXdVfU6WnMQc
 WfTrgtp44ZqQUbExVQmLfQE1utxF3sgWyetgAwWF9JVmcGpu6a/Vi93645Lde5kL5hrkCf8KO
 b0e2VwszaT2JiQ3wwlxLG5Xuiy9NhPD9dl/TFQoZwRei9ZZatF451hqqwsxFOshYlScMTMD39
 EoO//7nZvAWX1if//Jh+KI7eC7m0i+soWbSI0/aYNnA2O7Uwch8SPVSs/haOj9YAJ13QaJhsj
 AQ4w+OEDGgyjwWAcJTMW+7VZTOUZaet4VmmljRJ7jBZ1W5pb3ADvCoNG0JHnRzyez/3d//6rf
 +ewmUwW4yZsgaLt5YJwYNqG7Arzo0p5snAbTeTao8COjE+9Q7iPGAUGDb+QxUQczGflVKf8pm
 kZmoU/0vGdP8tbqJlk0NmV8XPb5ytonAuITyTugwSdrxSVx7b+pd/66dr3ncHSnFa/zzgOXvh
 9h9+13sDYKoQZgEJBvXwNIhj5tYeaf4xJ6gsfxg1OTsu3ccSv7DkPi8st6ixdUFRx5FeaKEi7
 Uf2wx5NSP82TPbkSK7Bq8sZNzWfl1VixByGsGi5kCuB23CEjQbjfZfkoL/icdAs3BtMbRmoxr
 yiq0dSDWUQcJ5J103j7n+2qW5lhEA11VmqwGti4CI2WMkVPZ7Rkf7NbnSSyiXRFqKNWRCgEok
 HwNlwVogkfPPf4KI+m1NEmIH0PdJZrlvfbq82mjRcSR8ebqVIbueYwqFeUQjDDJGNO1FwSKad
 igf+xXKn+SOkFAdTTKH4QDPjV5F0WGU4p/wN/DRC03W4RDqTy+4FVnwMWSP9/u8IJwvEChhG7
 KRiJgS6KwGGiNpzDqYCNGisQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_110830_276426_DC3E2418 
X-CRM114-Status: UNSURE (   7.91  )
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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 24 Sep 2024 20:00:09 +0200

An of_node_put(np) call was immediately used after a pointer check
for a of_find_device_by_node() call in this function implementation.
Thus call such a function only once instead directly before the check.

This issue was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/soc/mediatek/mtk-svs.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs=
.c
index 9a91298c1253..7c349a94b45c 100644
=2D-- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -2133,14 +2133,12 @@ static struct device *svs_get_subsys_device(struct=
 svs_platform *svsp,
 	}

 	pdev =3D of_find_device_by_node(np);
+	of_node_put(np);
 	if (!pdev) {
-		of_node_put(np);
 		dev_err(svsp->dev, "cannot find pdev by %s\n", node_name);
 		return ERR_PTR(-ENXIO);
 	}

-	of_node_put(np);
-
 	return &pdev->dev;
 }

=2D-
2.46.1



Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E746C54E4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Feb 2024 12:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kSBsRt0NXPsUeMqmPi8SIUs59D+7ZfQPxDhaWoAUI+w=; b=uWa/5CIb0/qq56QVvrXDcikvu9
	05wAH3R9XQLIRgCy/3HmJgaPPznePH+pFq6NxGfv6q03CbgQCcEAEa9GR6W4n5uM9OPY3ObZmDOuB
	qZezmwzILnmCMZFKkS3N7ofYOphIjdoXdM2TNqYzRtiL9Oy7tBwsgngl5fZgGJS8IuWuyCyIXGBWv
	Y7b8ElYKXslHeJuJKQfIHXuPdkMtPQMJtVIctdUI/YSUTmrPLrR+uNRzhsswgzR9QpgPL5mfQzL5v
	Q2qzVbSUYbb+nM2x4j3bzEOX+ULfwrpNVcwi9X6lLrg3PhaC/FgL2FtwJdlPcU0woIaedtqp4v6KX
	5CYececg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rea4E-00000000Z8l-3uec;
	Mon, 26 Feb 2024 12:26:46 +0000
Received: from mout.web.de ([212.227.15.3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rea49-00000000Z64-2nWt;
	Mon, 26 Feb 2024 12:26:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1708950388; x=1709555188; i=markus.elfring@web.de;
	bh=AiTob3EyomDbHqxrhBdROP9px/lXNwdwN0SwFHxSlRo=;
	h=X-UI-Sender-Class:Date:To:Cc:From:Subject;
	b=WVEnr1VOy9OmqfLrLvzSiPG79RUIqy3RDn3/9N/rX1b449uEfGtRSLXr+gwfWGxJ
	 Is7Mn4cgexiHpp88XYNL78IGqifZFQMxLYAd0bWNepUIw5cT68Bfk0RU67rebLrwf
	 FL+tn/aIZ/gCvqxas0FCAy3sKaeS0ehvVmtfj8gyoojas6MJYbP70HVOniAVniDDp
	 dt7sMFDcYpCMKE90qhEIET8JUt74sr2inkGjLSnQEgNkjfucsmTuU2Id/9I+qTjPq
	 JOfgv46V7CozGVawvowwQCtBc65QjnjusFVMbw2v4f8zuKV3U+fDWj9b9W3p9Dbac
	 T1PhxUnwiqWGMkexLA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.86.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MyO0u-1qg2v21sjc-00yjfO; Mon, 26
 Feb 2024 13:26:28 +0100
Message-ID: <6a64e7b3-b1ce-46c4-9c85-89f731aee592@web.de>
Date: Mon, 26 Feb 2024 13:26:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] clk: mediatek: clk-mt8173-apmixedsys: Use common error
 handling code in clk_mt8173_apmixed_probe()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bm+GNw6iiB1HHEoqFeJwVo62AjB7FYz+H2KwR+YJafiQRiiUoxa
 daeyxI3TEr2cZRMFWSuX14vUsAto6LdUYXx20Gdp7oWXW1CnxcTpVPNuvGhWQ1/MZs80v4A
 UTmHhV+XZuBgnK/Q59kxJzrSOujRBIJwEWp/TeA/wAPC18hM1r1tizN3bGYjEKPLX2o9rbm
 vx3rgUlR53vh1gPCSgW8Q==
UI-OutboundReport: notjunk:1;M01:P0:mVXFJr6Rark=;DtHOcRN9Q898fo0ZyCJ9xyhJV0o
 qk60ihFXfSrxr7lunJN7IITYBYhL1HPLwyQz9UeOovSxg5PG0daQynupiTbx5Z3GiPegFG0B2
 O1WPXl41/Yowd+Zrh3RCrliLcZOmHSI708p1Ao+t5apXwX7lYAzuKi7vprrwQG7dT7eQnKx/Q
 /xxC9tvFyfXiJB9JcUmSVxNFFakzYbsbyJMI1nxKfQMaHBsB3wC6Ghy0XUrJrmLTpqpwVJQAO
 rGkcYCmBCQLAS/NY6m0JTBdjMe2FoauWcG9E7Surgsd/Bz4eeFMKfn2HD6CryGyTM7O7giGdf
 do+kFBMY9ixbXux5doJl5YClyG5VtHOuE26KPq4tUsKueMHLc6z1ikkKJzS2/QihnGLkQNIXm
 QYeHk+JdSdEjdaom56lomznxv9/FJQjA6EfYnhKwKgpaBma7KWaMkcNKcmV2z4SOA8Yqx7bCj
 khNCe+ZGacs9GKwSUf98VHN0mGRgQywnbsclVLM4QhIY5irpv1yIPeuyEPygtba93Tl+a66ge
 eJkdY22ZMFm8uLO9tjkaanIEOVsF+ndhVnyXOpKGmbBDzbeLF3gzhGQ28IK5/kxbJ/bclya7c
 YWFrNVU21pKGbvvjjtpL9oI1xzT4R4hU0WCDO1Gjfj4Spdqx2f98Qmc5l2wgUka16ORM55xDK
 uIJiEuOibfgbKy6fnD+nrnmo6ZlEs8MIBIvSwp82/8kaDPaW9I0oyGKRzArrbyZvl18/RjsPT
 OQbmVR6fXcol3ggDMn6iKLK7a3Efk07c9LB5WOfGBENmkwCxXf6eAMbmZuEbs6GAPnke4k2pQ
 CiWvTSkD9IaXIlHb+EtrNqPSIGoHhUzENnhF8a/UAnnFs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_042642_168686_4DEDE72A 
X-CRM114-Status: UNSURE (   8.27  )
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
Date: Mon, 26 Feb 2024 13:10:37 +0100

Add a label so that a bit of exception handling can be better reused
at the end of this function implementation.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/me=
diatek/clk-mt8173-apmixedsys.c
index 1bbb21ab1786..6cab483b8e1e 100644
=2D-- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
@@ -152,8 +152,8 @@ static int clk_mt8173_apmixed_probe(struct platform_de=
vice *pdev)

 	clk_data =3D mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
 	if (IS_ERR_OR_NULL(clk_data)) {
-		iounmap(base);
-		return -ENOMEM;
+		r =3D -ENOMEM;
+		goto unmap_io;
 	}

 	fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
@@ -188,6 +188,7 @@ static int clk_mt8173_apmixed_probe(struct platform_de=
vice *pdev)
 				  ARRAY_SIZE(pllfhs), clk_data);
 free_clk_data:
 	mtk_free_clk_data(clk_data);
+unmap_io:
 	iounmap(base);
 	return r;
 }
=2D-
2.43.2



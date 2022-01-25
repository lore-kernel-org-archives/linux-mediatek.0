Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2502DC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jan 2022 22:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aZUY6mokOU2sBhg2fsAvDtBO3VQudmX2zAztDADb+fg=; b=AvtpHmuLIc2Ch1
	40iqZtHrUhVGv546xkvDU+OFhqbTJONwXY8KykGa15D2QJTqCk9pZtxE8Z3YaOvuaPzikiggacuMJ
	tZwcla2KW9/8YkekLN1WfRWXi1/eO1WB+B0e8H+vGKB95wwT5Iceay3nAAaYLZ95RdIcJ0q1vPQ8W
	3cfxHbYeMBZHeHfa+9IX6WA1nr6pj+9AW5soooYe7Vqn2og9IFt8WFx7yqlsOUwKmQS8JCUCgu3BF
	UMX0Q2CXLwYwqooJiFvl7YanIRDkquNLitD04LgrZGxKPR3lmFWv1CVWwgVX+d3iHOab3q0y6fACb
	Js6KZRyN+vUuS+7oNTPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCU8I-009cBc-0n; Tue, 25 Jan 2022 22:17:46 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCU8F-009cAh-8l
 for linux-mediatek@lists.infradead.org; Tue, 25 Jan 2022 22:17:44 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-64-8G7QQxJmMpexI7aZc5095w-1; Tue, 25 Jan 2022 22:17:40 +0000
X-MC-Unique: 8G7QQxJmMpexI7aZc5095w-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Tue, 25 Jan 2022 22:17:39 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Tue, 25 Jan 2022 22:17:39 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Miles Chen' <miles.chen@mediatek.com>, Lakshmi Sowjanya D
 <lakshmi.sowjanya.d@intel.com>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Kiran Kumar S
 <kiran.kumar1.s@intel.com>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>
Subject: RE: [PATCH] pinctrl: fix a discarded-qualifiers build error
Thread-Topic: [PATCH] pinctrl: fix a discarded-qualifiers build error
Thread-Index: AQHYEhUH+MbwXf5NQkuzulFLQ312/qx0Tidg
Date: Tue, 25 Jan 2022 22:17:38 +0000
Message-ID: <693a71e17b364afd987f2d2178b7e5cb@AcuMS.aculab.com>
References: <20220125175457.23728-1-miles.chen@mediatek.com>
In-Reply-To: <20220125175457.23728-1-miles.chen@mediatek.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_141743_636082_E5E27F2F 
X-CRM114-Status: GOOD (  12.13  )
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

From: Miles Chen
> Sent: 25 January 2022 17:55
> 
> Fix COMPILER=gcc ARCH=arm64 DEFCONFIG=allyesconfig build:
> 
> log:
> drivers/pinctrl/pinctrl-thunderbay.c:815:29: error: assignment discards
> 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
> 
> Fixes: 12422af8194d ("pinctrl: Add Intel Thunder Bay pinctrl driver")
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> ---
>  drivers/pinctrl/pinctrl-thunderbay.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-thunderbay.c b/drivers/pinctrl/pinctrl-thunderbay.c
> index b5b47f4dd774..4e6d718c03fc 100644
> --- a/drivers/pinctrl/pinctrl-thunderbay.c
> +++ b/drivers/pinctrl/pinctrl-thunderbay.c
> @@ -812,7 +812,7 @@ static int thunderbay_add_functions(struct thunderbay_pinctrl *tpc, struct funct
>  				}
>  			}
> 
> -			grp = func->group_names;
> +			grp = (const char **)func->group_names;

You should change the type of 'grp' not add a cast.
The compiler can warn about casts removing 'const' as well.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

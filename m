Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B47C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Feb 2022 09:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TgRgl3KB4nHNc3CAWw4W/aBQtv08sX8g5nuvA0B1oYk=; b=rBKGk41n5uTNlw
	3F2HWIjSzQcwMdiMyDGeE+QBYo2OanfO6cjsIqcumd5tBvlxdQFxtc5+9ZDWRjFL8iZ5z8cZfWRSd
	58fwMEzJYd89ssBFVzAJ2Nd7Xc9bCUTWLxxXI+Cb+3gr4w3deI4h3PpdHxODyG4QhezBzkX3Jl9Xk
	78bEO9MjVPzH+lk538/9r6issfAFtbJm9NaCIKyjYeHUmLC+B0ZnEzG6BY4E79/VJ4cjf4i48Q9+6
	fNHzSWnm8NyVJ/GSPy+xwccXbYgtXXhpxiNvJnDINzQYyuT5oGKncgRCOxt428hqyvH6SbQVew0rb
	Xi1yyDkdoSYEOoCMYvTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMoQW-00DaHh-8E; Wed, 23 Feb 2022 09:59:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMoQR-00DaGj-IS; Wed, 23 Feb 2022 09:59:15 +0000
X-UUID: 4dfe72c094684e4eafff71214584a789-20220223
X-UUID: 4dfe72c094684e4eafff71214584a789-20220223
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <johnson.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2020936289; Wed, 23 Feb 2022 02:59:08 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Feb 2022 01:59:07 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 23 Feb 2022 17:58:53 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Feb 2022 17:58:53 +0800
Message-ID: <d12511c6d1ae317b317229fc78df818840153853.camel@mediatek.com>
Subject: Re: [PATCH 2/4] regulator: mt6366: Add support for MT6366 regulator
From: Johnson Wang <johnson.wang@mediatek.com>
To: Mark Brown <broonie@kernel.org>
CC: <lee.jones@linaro.org>, <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 23 Feb 2022 17:58:53 +0800
In-Reply-To: <Ydbno0JM8YP9NhNh@sirena.org.uk>
References: <20220106065407.16036-1-johnson.wang@mediatek.com>
 <20220106065407.16036-3-johnson.wang@mediatek.com>
 <Ydbno0JM8YP9NhNh@sirena.org.uk>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_015911_622722_C9629773 
X-CRM114-Status: GOOD (  12.74  )
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

On Thu, 2022-01-06 at 12:59 +0000, Mark Brown wrote:
> On Thu, Jan 06, 2022 at 02:54:05PM +0800, Johnson Wang wrote:
> > The MT6366 is a regulator found on boards based on MediaTek MT8186
> > and
> > probably other SoCs. It is a so called pmic and connects as a slave
> > to
> > SoC using SPI, wrapped inside the pmic-wrapper.
> 
> Reviwed-by: Mark Brown <broonie@kernel.org>

Hi Mark,

Thank you for review.

Do these regulator patches need some improvement?
If yes, please give me your advices.

Otherwise, is it possible to apply these patches in the future?

Thanks.

BRs,
Johnson Wang 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

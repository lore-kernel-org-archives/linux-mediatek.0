Return-Path: <SRS0=pZ6D=MU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36B06C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 10:21:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0727E60524
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 10:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0727E60524
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t8wO47gZfQ10/70hcSw0OTxiBcHGybBaGnkb4hjSpj8=; b=GaRhZGHtdXRgJN
	BlQfYxXCiN9WTQByEG0UHpOanyzlJGQRDmLsiwyTrihvLXn8WZQJruteLrT3n4zqlIV17dQ6XCGj2
	zyi6Ns0LdBW0Eng1cJc3t4/S0icse1f9AgiEKl1omphoINrH+5HCZlnL47stHmfprOTTiqzYNikGz
	g9UqoPT6CijnbEEuWC8/+uciilXeHYX9MxH2KMKrt56LxPMwsqwPAYXjm+vUdOS/hNFI23fbvNwyD
	OKnqCek1oHE/czmx3keI4u+Hl0acEC20/FNTY2ETdtYeg+C1yiWC44jFMY3O/n9uSnZHLkVi+C5oB
	EyB+2UdIv5LE6lYYk5bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8ggb-000N1l-Ug; Wed, 28 Jul 2021 10:21:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8ggY-000N0n-Mm; Wed, 28 Jul 2021 10:21:12 +0000
X-UUID: c29694affcdb4836b0edc0e33a511cb9-20210728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=pOtzGqpNSphuXXqUkv0xXxPPYQqKavCRJjR/ns5nsaE=; 
 b=Tk67lpeXIABoys/9Twvsix2+Lwo8zk+DjnM/l9dkiKzn2GuVvg+PCvD0fUfprX9MtTgXBrY2FFTB7U8E/ud0vAkzBL/K03r4+meFtJiYyMpCXUJi3cYC20NOeKfKpbnB+6tma5f6fnJ/4NYiNLvL+ufbbgXZ0lHYQYP2aoF8e+w=;
X-UUID: c29694affcdb4836b0edc0e33a511cb9-20210728
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1416631870; Wed, 28 Jul 2021 03:21:07 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Jul 2021 03:21:05 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Jul 2021 18:21:04 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 28 Jul 2021 18:21:04 +0800
Message-ID: <fd1a7b95ea63296e350aa04dce1dbb4f8c84092c.camel@mediatek.com>
Subject: Re: [v14 02/21] dt-bindings: ARM: Mediatek: Add mmsys document
 binding for MT8192
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>, Stephen Boyd <sboyd@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Boichat
 <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>, devicetree
 <devicetree@vger.kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 28 Jul 2021 18:21:04 +0800
In-Reply-To: <CAFqH_51D0A_Oht785cxvWjuNFYgLL25-qX1QEpLhWBARtTgVMA@mail.gmail.com>
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
 <20210726105719.15793-3-chun-jie.chen@mediatek.com>
 <162740843452.2368309.13157283201271440368@swboyd.mtv.corp.google.com>
 <CAFqH_51D0A_Oht785cxvWjuNFYgLL25-qX1QEpLhWBARtTgVMA@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_032110_794327_A5BEF3C6 
X-CRM114-Status: GOOD (  13.96  )
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

On Wed, 2021-07-28 at 10:47 +0200, Enric Balletbo Serra wrote:
> Hi Chun-Jie and Stephen,
> 
> Missatge de Stephen Boyd <sboyd@kernel.org> del dia dt., 27 de jul.
> 2021 a les 19:54:
> > 
> > Quoting Chun-Jie Chen (2021-07-26 03:57:00)
> > > This patch adds the mmsys document binding for MT8192 SoC.
> > > 
> > > Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> > > Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > > Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> > > Acked-by: Rob Herring <robh@kernel.org>
> > > ---
> > 
> > Applied to clk-next
> > 
> 
> This will conflict in linux-next as the binding was already converted
> to yaml. See
> 
> 
https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml?id=63e1125e6bb8eae3cd20292f6a10ee421dd574ae__;!!CTRNKA9wMg0ARbw!1l9IyuzzydUJmGaERPLcaL2pSdzbuBStMR4_jqW1aVyVwBGdUU_g22jyDhqbClx4DaNT$
>  
> 
> Thanks,
>   Enric
> 

I will resend mmsys binding document singly based on [1].

[1] 
https://patchwork.kernel.org/project/linux-mediatek/list/?series=485165


Best Regards,
Chun-Jie

> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > 
https://urldefense.com/v3/__http://lists.infradead.org/mailman/listinfo/linux-mediatek__;!!CTRNKA9wMg0ARbw!1l9IyuzzydUJmGaERPLcaL2pSdzbuBStMR4_jqW1aVyVwBGdUU_g22jyDhqbCpKYlq6I$
> >  
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

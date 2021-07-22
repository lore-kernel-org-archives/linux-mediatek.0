Return-Path: <SRS0=Khw4=MO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D623EC6377D
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 08:23:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A0FE61283
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 08:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A0FE61283
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EaV5Zn2TwAD5yt8wM7SmZcR2p7Z0Y84hrVbbuPllFoU=; b=u+OeUYZp9qoAUq
	P6Jg0r9O04tBinJidbd7zwFyKqMdOt+ayqzh/i+gSj93x1hx6Kxz0KEDicUuOTBq84cpPBm5g74tB
	32Maxvf7B4azJPBokXYIij+/iRmA70RrTfrNpnl2K/njrAdQZHAHl6c/9KovdjYwOT2Qy74MvTkzj
	dV87X8I2HrshcyML71QwHbOo0qTiya3hSqJPFxbYJDquup6J9vZrkuF8qe/rZ7XjhWqmHggrsvuLP
	UHcjxWJD2zbtJdGSoBG/EkhcxIpwIUx1FQ7h7DmFk0nosC9ZuXICUe9LLb6nUIO+sqNYxv1kb4501
	9gJ6ppbjy/zlIB9aHSvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6Tys-000g2K-VI; Thu, 22 Jul 2021 08:22:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6Tyq-000g1B-Fj; Thu, 22 Jul 2021 08:22:57 +0000
X-UUID: bd34938356c548ac81858c4a0223c2f5-20210722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=5+hzzyeXUQlK2hAeXOhUZfTEQ0t4mME0kH96rJ249Jc=; 
 b=QZrMvF4VuwrP3hB//r51tVKuJwhuEp2nmx9hYi7vUsF5CrLLEd5pTGgPS2NtkRKoBWG1p70dWMfVRyzqaNHPtV/WC07AQ9MamcsHKaOtns8VsaaUL1dWIlkl8KLilJi+2B5+AkFTzUlqLArQ3Lr/CKbsThNtPoMj6yiv3m+7L5c=;
X-UUID: bd34938356c548ac81858c4a0223c2f5-20210722
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 780598766; Thu, 22 Jul 2021 01:22:54 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Jul 2021 01:22:53 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 22 Jul 2021 16:22:47 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 22 Jul 2021 16:22:45 +0800
Message-ID: <1626942165.29611.17.camel@mhfsdcap03>
Subject: Re: [PATCH v7] pinctrl: mediatek: add rsel setting on MT8195
From: zhiyong tao <zhiyong.tao@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>,
 <srv_heupstream@mediatek.com>, <hui.liu@mediatek.com>, zhiyong.tao
 <zhiyong.tao@mediatek.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, "Sean
 Wang" <sean.wang@mediatek.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, "open list:GPIO SUBSYSTEM"
 <linux-gpio@vger.kernel.org>
Date: Thu, 22 Jul 2021 16:22:45 +0800
In-Reply-To: <CACRpkdaLhR9HgYNPZ_SQ-wi7RfpeT7iapXUfqf=bAwo05MBZqA@mail.gmail.com>
References: <20210426024533.20840-1-zhiyong.tao@mediatek.com>
 <20210426024533.20840-2-zhiyong.tao@mediatek.com>
 <CACRpkdaLhR9HgYNPZ_SQ-wi7RfpeT7iapXUfqf=bAwo05MBZqA@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: FD208813C2939D2AA3715660C393E7492A1D559EFF2C8FCF13F766B5C5BEA8F92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_012256_584755_18B47CD4 
X-CRM114-Status: GOOD (  15.63  )
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

On Wed, 2021-05-19 at 02:09 +0200, Linus Walleij wrote:
> On Mon, Apr 26, 2021 at 4:45 AM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
> 
> > This patch provides rsel setting on MT8195.
> >
> > Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> 
> I am suspicious about this patch, sorry for taking so long to answer.
> 
> First explain what "rsel" means, because with no explanation I
> suspect it means "rail select" which is what we already have the
> existing generic property PIN_CONFIG_POWER_SOURCE
> and power-source = <> in DT for.
> 
> Also add the custom properties to:
> Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> (separate patch)

> Yours,
> Linus Walleij

==>
Hi Linus walleij,

Thanks for your suggestion.

rsel: resistance selection, we can set rsel from 0 to 7 to set different
resistance. such as:

MTK_PULL_SET_RSEL_000:75K in PU, 75k in PD;
MTK_PULL_SET_RSEL_001:10k in PU, 5k in PD;
MTK_PULL_SET_RSEL_010:5k in PU, 75k in PD;
MTK_PULL_SET_RSEL_011:4k in PU, 5K in PD;
MTK_PULL_SET_RSEL_100:3k in PU, 75k in PD;
MTK_PULL_SET_RSEL_101:2k in PU, 5K in PD;
MTK_PULL_SET_RSEL_110:1.5k in PU, 75k in PD;
MTK_PULL_SET_RSEL_111:1k in PU, 5k in PD.

It seems can flow bias-pull-up/down property. we change it in v10. 

Thanks


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

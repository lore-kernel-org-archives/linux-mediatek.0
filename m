Return-Path: <SRS0=Khw4=MO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D4EC6377D
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 08:04:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E376B61221
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 08:04:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E376B61221
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/RyWsV5pWsOh7yA3REuzMSwQulD+k2nWaOQ5gPCDlnE=; b=NIePQr+cySxCsp
	R4R8z7aiVYmt2iV/hK4MvJmV+aGYhnJ/4spoWPqgNKF013c00A2OHElEKPcyjsU/TDSz7YdAo2NK4
	WWaHaFXZcgpaVUYdZ3ZGtwun5U66rVxyRROR0Y2zcGpJuETPokavGC49W9S6A0j1crfMcTBXtgs8+
	/UgOAW8ZSdSlZ9uLHWyBaZqPXef+UDfhJNct7ZvqO4i48I9EQIWRUoo2pO4HMh47/XpVkBpyU3ECn
	OzmWmobZTqj7zVX7DEsCjt5parDePkFBPR7WNmJnQTF9l9BF86+2piQKLblln2+rnidpS9m0QXZMv
	UoBA/fFwx5umUyDfIwng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6ThE-000dei-79; Thu, 22 Jul 2021 08:04:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6ThA-000dck-5J; Thu, 22 Jul 2021 08:04:42 +0000
X-UUID: 8b514c142e2e409e89e393b5ac607dbe-20210722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=s5IrH6wDMnuu5SjP/U4zZycyP9tIDwwTmZ6+1/spWp4=; 
 b=C+TcI3toRstt2f3wGjn/WLTHgMjDIYha/xcL0cUl0l9Ra+rmBzSkG1/YPau7FNMQi7443oTPjKkEqUZ6M3a6f3t91rq5y+oXv4fYQvir4RUUvw9QORtMb8M19Q6wZjBSKbfmT61juuZBxCrhTJ4ckIdvwxGSYZOKILpnKVhVd4o=;
X-UUID: 8b514c142e2e409e89e393b5ac607dbe-20210722
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 466439895; Thu, 22 Jul 2021 01:04:33 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Jul 2021 00:54:43 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 22 Jul 2021 15:54:31 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 22 Jul 2021 15:54:31 +0800
Message-ID: <1626940470.29611.9.camel@mhfsdcap03>
Subject: Re: [PATCH v10 1/2] dt-bindings: pinctrl: mt8195: add rsel define
From: zhiyong tao <zhiyong.tao@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>
CC: Rob Herring <robh+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, <mark.rutland@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, srv_heupstream
 <srv_heupstream@mediatek.com>, <hui.liu@mediatek.com>, Eddie Huang
 <eddie.huang@mediatek.com>, <light.hsieh@mediatek.com>,
 <biao.huang@mediatek.com>, <hongzhou.yang@mediatek.com>,
 <sean.wang@mediatek.com>, <seiya.wang@mediatek.com>,
 <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-gpio@vger.kernel.org>
Date: Thu, 22 Jul 2021 15:54:30 +0800
In-Reply-To: <CAGXv+5GXg0RuOQkh4vaRmcLpehZiXnEUXBvEaObiatAa1sXvaA@mail.gmail.com>
References: <20210710081722.1828-1-zhiyong.tao@mediatek.com>
 <20210710081722.1828-2-zhiyong.tao@mediatek.com>
 <CAGXv+5GXg0RuOQkh4vaRmcLpehZiXnEUXBvEaObiatAa1sXvaA@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: FB56F3738648FD7331E8824085C280CA7BCABA8C103A164B942B52B347ACF8C22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_010440_255495_D60C9CF1 
X-CRM114-Status: GOOD (  24.04  )
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

On Tue, 2021-07-13 at 15:17 +0800, Chen-Yu Tsai wrote:
> Hi,
> 
> On Sat, Jul 10, 2021 at 4:17 PM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
> >
> > This patch adds rsel define for mt8195.
> >
> > Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> > ---
> >  include/dt-bindings/pinctrl/mt65xx.h | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/include/dt-bindings/pinctrl/mt65xx.h b/include/dt-bindings/pinctrl/mt65xx.h
> > index 7e16e58fe1f7..f5934abcd1bd 100644
> > --- a/include/dt-bindings/pinctrl/mt65xx.h
> > +++ b/include/dt-bindings/pinctrl/mt65xx.h
> > @@ -16,6 +16,15 @@
> >  #define MTK_PUPD_SET_R1R0_10 102
> >  #define MTK_PUPD_SET_R1R0_11 103
> >
> > +#define MTK_PULL_SET_RSEL_000  200
> > +#define MTK_PULL_SET_RSEL_001  201
> > +#define MTK_PULL_SET_RSEL_010  202
> > +#define MTK_PULL_SET_RSEL_011  203
> > +#define MTK_PULL_SET_RSEL_100  204
> > +#define MTK_PULL_SET_RSEL_101  205
> > +#define MTK_PULL_SET_RSEL_110  206
> > +#define MTK_PULL_SET_RSEL_111  207
> > +
> 
> Instead of all the obscure macros and the new custom "rsel" property,
> which BTW is not in the bindings, can't we just list the actual bias
> resistance of each setting? We could also migrate away from R1R0.
> 
==>Hi Chenyu,
The rsel actual bias resistance of each setting:

MTK_PULL_SET_RSEL_000:75K in PU, 75k in PD;
MTK_PULL_SET_RSEL_001:10k in PU, 5k in PD;
MTK_PULL_SET_RSEL_010:5k in PU, 75k in PD;
MTK_PULL_SET_RSEL_011:4k in PU, 5K in PD;
MTK_PULL_SET_RSEL_100:3k in PU, 75k in PD;
MTK_PULL_SET_RSEL_101:2k in PU, 5K in PD;
MTK_PULL_SET_RSEL_110:1.5k in PU, 75k in PD;
MTK_PULL_SET_RSEL_111:1k in PU, 5k in PD.

The rsel actual bias resistance is different between PU and PD.

> Then we can specify the setting with the standard bias-pull-up/down
> properties [1].
> 
> Also, please ask internally if Mediatek could relicense all the header
> files that Mediatek has contributed under include/dt-bindings/pinctrl/ [2]
> to GPL-2.0 and BSD dual license. These files are part of the DT bindings
> and we really want them to be dual licensed as well, and not just the
> YAML files.
> 

==> We will confirm it internally and reply it later.

Thanks.
> 
> Regards
> ChenYu
> 
> 
> [1] https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml#L37
> [2] Note that a few files were contributed by other people
> 
> >  #define MTK_DRIVE_2mA  2
> >  #define MTK_DRIVE_4mA  4
> >  #define MTK_DRIVE_6mA  6
> > --
> > 2.18.0
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

Return-Path: <SRS0=Fikf=MV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76571C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 08:33:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3491160FE7
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 08:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3491160FE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oV7Yv6MIEpITyZtZjKcA9RsHtzm/Vq2JmB8ogZ5D4pU=; b=POiav1lu4/NZFW
	JW8newi9ifcPKcWlhuUPRlOfHEGdjib3LrOtOHNUoihOKgLFwMjKEEj/TuagTGBLwCh6f4nSYLKro
	m2eGHlqGGenKHmOVTjCdhllF3CuKQXz817M0ucs5yg8SLWbkVP+uYhQAmPineeaJ7q4Nln4b76x7m
	/mSs5MXwZSQ4j5DmCoEonZtt/tfNfqal7P7LGhvBryOExfj167Rz4GkxbmcU9bIf0LYgxOKQU1wKN
	FlfxYCLCY7OsomOfM9VsqUoeHVY9jni+nKPzRS70lEosFtwo9RzPJWf6uKXd+srw5Cy5cx5gZ4kYV
	S8CATa6ROgMZrPBVmrgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m91Tx-003WpA-G6; Thu, 29 Jul 2021 08:33:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m91Th-003WnU-6M; Thu, 29 Jul 2021 08:33:20 +0000
X-UUID: d11bf2ed731d42bbb1c6f8122053bd5a-20210729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Bmb665geLbBv6mOwX4+ETO+MhVEjWAVq5RPIU7nUITE=; 
 b=V6bp4N6MxvYjsu9vjM5Tu3mWNrVYdJ887jBtLNadp21xeoZPpHsafvOLRBQx3uvVkRp0HG7ZWfmA4AN0FJhkeRYbqaSmyyfiCpCqSim+TxUZqM69G4f4mBOHvroh4skcLj1vP5r5e6H3l5vkhKqZkZYOeEC4lvh68d4/8gacH7w=;
X-UUID: d11bf2ed731d42bbb1c6f8122053bd5a-20210729
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 41758638; Thu, 29 Jul 2021 01:33:13 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Jul 2021 01:23:11 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Jul 2021 16:23:10 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 29 Jul 2021 16:23:08 +0800
Message-ID: <07388dac4e25e0f260725e8f80ba099d5aa80949.camel@mediatek.com>
Subject: Re: [PATCH v10 1/2] dt-bindings: pinctrl: mt8195: add rsel define
From: zhiyong.tao <zhiyong.tao@mediatek.com>
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
Date: Thu, 29 Jul 2021 16:23:08 +0800
In-Reply-To: <CAGXv+5F_-W4aNt0WVSDBGLo_t8orNUq59GMKk_4xVr+hMb9Ctg@mail.gmail.com>
References: <20210710081722.1828-1-zhiyong.tao@mediatek.com>
 <20210710081722.1828-2-zhiyong.tao@mediatek.com>
 <CAGXv+5GXg0RuOQkh4vaRmcLpehZiXnEUXBvEaObiatAa1sXvaA@mail.gmail.com>
 <1626940470.29611.9.camel@mhfsdcap03>
 <CAGXv+5F_-W4aNt0WVSDBGLo_t8orNUq59GMKk_4xVr+hMb9Ctg@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_013318_691384_97EE45DE 
X-CRM114-Status: GOOD (  45.54  )
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

On Mon, 2021-07-26 at 16:02 +0800, Chen-Yu Tsai wrote:
> On Thu, Jul 22, 2021 at 3:54 PM zhiyong tao <zhiyong.tao@mediatek.com
> > wrote:
> > 
> > On Tue, 2021-07-13 at 15:17 +0800, Chen-Yu Tsai wrote:
> > > Hi,
> > > 
> > > On Sat, Jul 10, 2021 at 4:17 PM Zhiyong Tao <
> > > zhiyong.tao@mediatek.com> wrote:
> > > > 
> > > > This patch adds rsel define for mt8195.
> > > > 
> > > > Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> > > > ---
> > > >  include/dt-bindings/pinctrl/mt65xx.h | 9 +++++++++
> > > >  1 file changed, 9 insertions(+)
> > > > 
> > > > diff --git a/include/dt-bindings/pinctrl/mt65xx.h b/include/dt-
> > > > bindings/pinctrl/mt65xx.h
> > > > index 7e16e58fe1f7..f5934abcd1bd 100644
> > > > --- a/include/dt-bindings/pinctrl/mt65xx.h
> > > > +++ b/include/dt-bindings/pinctrl/mt65xx.h
> > > > @@ -16,6 +16,15 @@
> > > >  #define MTK_PUPD_SET_R1R0_10 102
> > > >  #define MTK_PUPD_SET_R1R0_11 103
> > > > 
> > > > +#define MTK_PULL_SET_RSEL_000  200
> > > > +#define MTK_PULL_SET_RSEL_001  201
> > > > +#define MTK_PULL_SET_RSEL_010  202
> > > > +#define MTK_PULL_SET_RSEL_011  203
> > > > +#define MTK_PULL_SET_RSEL_100  204
> > > > +#define MTK_PULL_SET_RSEL_101  205
> > > > +#define MTK_PULL_SET_RSEL_110  206
> > > > +#define MTK_PULL_SET_RSEL_111  207
> > > > +
> > > 
> > > Instead of all the obscure macros and the new custom "rsel"
> > > property,
> > > which BTW is not in the bindings, can't we just list the actual
> > > bias
> > > resistance of each setting? We could also migrate away from R1R0.
> > > 
> > 
> > ==>Hi Chenyu,
> > The rsel actual bias resistance of each setting:
> > 
> > MTK_PULL_SET_RSEL_000:75K in PU, 75k in PD;
> > MTK_PULL_SET_RSEL_001:10k in PU, 5k in PD;
> > MTK_PULL_SET_RSEL_010:5k in PU, 75k in PD;
> > MTK_PULL_SET_RSEL_011:4k in PU, 5K in PD;
> > MTK_PULL_SET_RSEL_100:3k in PU, 75k in PD;
> > MTK_PULL_SET_RSEL_101:2k in PU, 5K in PD;
> > MTK_PULL_SET_RSEL_110:1.5k in PU, 75k in PD;
> > MTK_PULL_SET_RSEL_111:1k in PU, 5k in PD.
> > 
> > The rsel actual bias resistance is different between PU and PD.
> 
> Thanks. Somehow I missed this when looking through the datasheet.
> This
> encoding is interesting. Since it doesn't make sense to have both
> pull-up and pull-down, even though the hardware seems capable of
> doing
> so, I suppose the intent is to support 75k or 5k for pull-down, and
> (75k, 10k, 5k, 4k, 3k, 2k, 1.5k, 1k) for pull-up?
> 
> We could add these values to the binding so we could check for
> misuse.
> 
> The range of values seems to also cover those supported by the
> alternative R0/R1 settings. The values for kprow[01] and kpcol[01]
> seem to be different though.
> 
> We should get rid of the MTK_PUPD_SET_R1R0_* macros at the same time.
> They seem to be some magic values used with bias-pull-*, which is not
> how the properties should be used. At the same time, they overlap
> with
> mediatek,pull-* properties.
> 
> It would be great if we could standardize on the generic pinconf
> properties, and also use real values that fit the requirements of the
> properties, i.e. using real resistance values. I'm not sure if it
> would make sense to enumerate which pins support which configurations
> though.
> 
> 
> Thanks
> ChenYu
> 
> 
The rsel actual bias resistance of each setting is different in
different IC. we think that the define "MTK_PULL_SET_RSEL_000" is more
common for all different IC.

Thanks.

> > > Then we can specify the setting with the standard bias-pull-
> > > up/down
> > > properties [1].
> > > 
> > > Also, please ask internally if Mediatek could relicense all the
> > > header
> > > files that Mediatek has contributed under include/dt-
> > > bindings/pinctrl/ [2]
> > > to GPL-2.0 and BSD dual license. These files are part of the DT
> > > bindings
> > > and we really want them to be dual licensed as well, and not just
> > > the
> > > YAML files.
> > > 
> > 
> > ==> We will confirm it internally and reply it later.
> > 
> > Thanks.
> > > 
> > > Regards
> > > ChenYu
> > > 
> > > 
> > > [1] 
> > > https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml#L37
> > > [2] Note that a few files were contributed by other people
> > > 
> > > >  #define MTK_DRIVE_2mA  2
> > > >  #define MTK_DRIVE_4mA  4
> > > >  #define MTK_DRIVE_6mA  6
> > > > --
> > > > 2.18.0
> > > > _______________________________________________
> > > > Linux-mediatek mailing list
> > > > Linux-mediatek@lists.infradead.org
> > > > http://lists.infradead.org/mailman/listinfo/linux-mediatek
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

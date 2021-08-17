Return-Path: <SRS0=tEpm=NI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CA4AC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 03:09:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC9CE60551
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 03:09:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC9CE60551
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IPzvXzs7aXmBfnxn/PzgLwliFHIJsg+px58uzF0m1Ks=; b=LtTii0Rn19h15R
	EsjOWx37OU2onmehD9jDoArcJ56KXp0EqvTs4AJiTnRVhlMAuJPy15vCR8V0jtfIqeG67Hr21qVTd
	ceR5awdYnrrJEEPOvx/GyWjwckNpMUsof2B0A4T+iCtwjsrduYJoTw5t4+TK9CtTae2nZHOgIQ4gN
	omYR3ovEN1FN+zwnx76IGVrDEXSGDlYppeBCF827WzQrlB4/r3zx0wc0xncndG86iN8RXNf94DViq
	w8EBBOaLO6P3n9X9iGZx4EWQk2SZQxJ0vujDwi+JRdKlQMY1P7+eabya/jh7mq/GDzL2lYVMfobwS
	7GvUU3ZvBM2BWygzm00Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFpTU-000uAL-9e; Tue, 17 Aug 2021 03:09:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFojB-000oWe-JY; Tue, 17 Aug 2021 02:21:26 +0000
X-UUID: b15cb09c269b4784b17a60cefbe9b013-20210816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=h+u5vOm3MZAY7/OPAnnj5TmKd+xktNAcITcm1Xp0v+o=; 
 b=cuuC3eFyAGn115Fg/x7O8cE+rjwckxZXHfaI9bHQvJm0u6HuezJbqq4PqDzgel3JYjG3OY+ttR/JnUFjajgBTXpfKjOl6pym1s9DTArXt7IMe4C3TF5EZmJdfjOPCYAOahSK7NdOhVzI2pWqMs7cNQnuOV9rDl0JIEUdumf591E=;
X-UUID: b15cb09c269b4784b17a60cefbe9b013-20210816
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 644523539; Mon, 16 Aug 2021 19:21:19 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Aug 2021 19:21:17 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 Aug 2021 10:21:16 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 17 Aug 2021 10:21:15 +0800
Message-ID: <a7c8ab68ac3513865698cde27e665bdd554f459e.camel@mediatek.com>
Subject: Re: [PATCH v10 1/2] dt-bindings: pinctrl: mt8195: add rsel define
From: zhiyong.tao <zhiyong.tao@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>
CC: <zhiyong.tao@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, "Sean
 Wang" <sean.wang@kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>,
 <hui.liu@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>, Light Hsieh
 <light.hsieh@mediatek.com>, Biao Huang <biao.huang@mediatek.com>, "Hongzhou
 Yang" <hongzhou.yang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 "Seiya Wang" <seiya.wang@mediatek.com>, Devicetree List
 <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "moderated
 list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, "open list:GPIO SUBSYSTEM"
 <linux-gpio@vger.kernel.org>
Date: Tue, 17 Aug 2021 10:21:16 +0800
In-Reply-To: <CACRpkdbZKh8cqqiDRUik6Ooo33e+feGwYsLjcLRvBQnT3x5M3A@mail.gmail.com>
References: <20210710081722.1828-1-zhiyong.tao@mediatek.com>
 <20210710081722.1828-2-zhiyong.tao@mediatek.com>
 <CAGXv+5GXg0RuOQkh4vaRmcLpehZiXnEUXBvEaObiatAa1sXvaA@mail.gmail.com>
 <1626940470.29611.9.camel@mhfsdcap03>
 <CAGXv+5F_-W4aNt0WVSDBGLo_t8orNUq59GMKk_4xVr+hMb9Ctg@mail.gmail.com>
 <07388dac4e25e0f260725e8f80ba099d5aa80949.camel@mediatek.com>
 <CAGXv+5EagmhYYpri+nzo6WgGz8A=oiU3Vy+2AVjho=eo6Z+DLw@mail.gmail.com>
 <CACRpkdZ4k9Km3vBtdN6AnBM89c4355GtPMzCQ0_YHaTb4V5cKA@mail.gmail.com>
 <CAGXv+5HohMwU8jow5QXO5MK1tO+u=5YsfhArBWCP4Dgm1Q8igg@mail.gmail.com>
 <4fd12d5c53f6492e5fa3ba94a78b9a149f5b6ed9.camel@mediatek.com>
 <CAGXv+5GCuNK=-z9VAOjkpJdZLUSZFPfUsQ09m1FhfTsbCYLLRw@mail.gmail.com>
 <CACRpkdbZKh8cqqiDRUik6Ooo33e+feGwYsLjcLRvBQnT3x5M3A@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_192123_124904_2C592E75 
X-CRM114-Status: GOOD (  24.73  )
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

On Tue, 2021-08-17 at 01:00 +0200, Linus Walleij wrote:
> On Mon, Aug 16, 2021 at 5:38 PM Chen-Yu Tsai <wenst@chromium.org>
> wrote:
> > On Mon, Aug 16, 2021 at 6:48 PM zhiyong.tao <
> > zhiyong.tao@mediatek.com> wrote:
> > > > I'll take that as "use SI units whenever possible and
> > > > reasonable".
> > > 
> > > ==> so It doesn't need to change the define, is it right?
> > > we will keep the common define.
> > 
> > Actually I think it would be possible and reasonable to use SI
> > units
> > in this case, since you are the vendor and have the resistor values
> > to implement the support. Having different sets of values for
> > different
> > chips is nothing out of the ordinary. We already have to account
> > for
> > different number of pins and different pin functions. That is what
> > compatible strings are for.
> 
> I fully agree with Chen-Yu's analysis here.
> 
> Zhiyong can you make an attempt to use SI units (Ohms) and see
> what it will look like? I think it will look better for users and it
> will
> be less risk to make mistakes.
> 
> Yours,
> Linus Walleij

Hi Linus & chen-yu,

The rsel actual bias resistance of each setting is different in
different IC. For example, in mt8195, the rsel actual bias resistance
setting like as:
MTK_PULL_SET_RSEL_000:75K in PU, 75k in PD;
MTK_PULL_SET
_RSEL_001:10k in PU, 5k in PD;
MTK_PULL_SET_RSEL_010:5k in PU, 75k in
PD;
MTK_PULL_SET_RSEL_011:4k in PU, 5K in PD;
MTK_PULL_SET_RSEL_100:3k in
PU, 75k in PD;
MTK_PULL_SET_RSEL_101:2k in PU, 5K in PD;
MTK_PULL_SET_RSE
L_110:1.5k in PU, 75k in PD;
MTK_PULL_SET_RSEL_111:1k in PU, 5k in PD.

but in mt8192, the rsel actual bias resistance setting like as:
MTK_PULL_SET_RSEL_000:75K in PU, 75k in PD;
MTK_PULL_SET_RSEL_001:3k in PU, 5k in PD;
MTK_PULL_SET_RSEL_010:10k in PU, 75k in PD;
MTK_PULL_SET_RSEL_011:1k in PU, 5K in PD;

Can you help me to provide a suggestion common define for the all
different IC?
It seems that we should add a new define, if we upstream a new IC
pinctrl driver in the future.

Thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

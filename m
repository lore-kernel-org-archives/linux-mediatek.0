Return-Path: <SRS0=ZvcN=NH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF344C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 10:48:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A25AE61BE1
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 10:48:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A25AE61BE1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f8uj6mqhCpQk61DRg8O5j4THuVuoQ98SsFV/pM5RE9g=; b=nhEGqsCbG3VYgv
	/5V1UJc9Bj+MmqaaZmjMjS7ngPVn4Q1Ld1COCV85s1BOcZrPIFn1nbCZ8yMDQS5dtERIMlw3KZhk8
	WuBiSMxchJXnK7AYA4ZB2X+HWwPSMqxeVvbznt1ZPy1Bc5mUERPCr2PX9MO0Yzord95PeIc5EHiAL
	BqaoVtXc4kCe9CERhErfhmids0+FeaFolyKNn3BU3HaxtqrZ+v8xDQ8bF1j4soqzRuNAhZ5FZchVt
	4tV9zOoAXCOpTQyxwtzpFwghnpJgmpsVRqDJ1YiOHMgaZ+FgCPVFdy01vzOaH43V68m3nCy6IVJQy
	4pmA9XzNxj17kCsSxt6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFaAI-00Gig8-6R; Mon, 16 Aug 2021 10:48:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFaAB-00GifK-4l; Mon, 16 Aug 2021 10:48:20 +0000
X-UUID: d091d64b773a4af3b1cec45e899e3af3-20210816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=a4ZpdwjABtIwFXGc1N+9N7fDlciYnUZLET4/Bm4QbGA=; 
 b=Tp2a87iG4H2f7uZGCxhJ/8s/4g4JvXyD4xUz+T5UIat8TdM34FP1YbVj9SCG9nQ41iIdl01cUGGeyqwaOBMJv5hNTxucmvapWMVEaEntfP5rtsO6Wn2m/Boi9RRt7/PzPPiOo2x2wZIelLyi4ibMm78gIjujsMFI93dyLjqLvt0=;
X-UUID: d091d64b773a4af3b1cec45e899e3af3-20210816
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1777977397; Mon, 16 Aug 2021 03:48:08 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Aug 2021 03:48:06 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Aug 2021 18:48:05 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 16 Aug 2021 18:48:04 +0800
Message-ID: <4fd12d5c53f6492e5fa3ba94a78b9a149f5b6ed9.camel@mediatek.com>
Subject: Re: [PATCH v10 1/2] dt-bindings: pinctrl: mt8195: add rsel define
From: zhiyong.tao <zhiyong.tao@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Linus Walleij <linus.walleij@linaro.org>
CC: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, <hui.liu@mediatek.com>, "Eddie
 Huang" <eddie.huang@mediatek.com>, Light Hsieh <light.hsieh@mediatek.com>,
 Biao Huang <biao.huang@mediatek.com>, Hongzhou Yang
 <hongzhou.yang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Seiya Wang
 <seiya.wang@mediatek.com>, Devicetree List <devicetree@vger.kernel.org>, LKML
 <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "open
 list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Date: Mon, 16 Aug 2021 18:48:05 +0800
In-Reply-To: <CAGXv+5HohMwU8jow5QXO5MK1tO+u=5YsfhArBWCP4Dgm1Q8igg@mail.gmail.com>
References: <20210710081722.1828-1-zhiyong.tao@mediatek.com>
 <20210710081722.1828-2-zhiyong.tao@mediatek.com>
 <CAGXv+5GXg0RuOQkh4vaRmcLpehZiXnEUXBvEaObiatAa1sXvaA@mail.gmail.com>
 <1626940470.29611.9.camel@mhfsdcap03>
 <CAGXv+5F_-W4aNt0WVSDBGLo_t8orNUq59GMKk_4xVr+hMb9Ctg@mail.gmail.com>
 <07388dac4e25e0f260725e8f80ba099d5aa80949.camel@mediatek.com>
 <CAGXv+5EagmhYYpri+nzo6WgGz8A=oiU3Vy+2AVjho=eo6Z+DLw@mail.gmail.com>
 <CACRpkdZ4k9Km3vBtdN6AnBM89c4355GtPMzCQ0_YHaTb4V5cKA@mail.gmail.com>
 <CAGXv+5HohMwU8jow5QXO5MK1tO+u=5YsfhArBWCP4Dgm1Q8igg@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_034816_639405_8ACEAC51 
X-CRM114-Status: GOOD (  23.97  )
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

On Mon, 2021-08-16 at 14:10 +0800, Chen-Yu Tsai wrote:
> On Thu, Aug 5, 2021 at 7:02 AM Linus Walleij <
> linus.walleij@linaro.org> wrote:
> > 
> > On Thu, Jul 29, 2021 at 11:43 AM Chen-Yu Tsai <wenst@chromium.org>
> > wrote:
> > > On Thu, Jul 29, 2021 at 4:23 PM zhiyong.tao <
> > > zhiyong.tao@mediatek.com> wrote:
> > > > The rsel actual bias resistance of each setting is different in
> > > > different IC. we think that the define "MTK_PULL_SET_RSEL_000"
> > > > is more
> > > > common for all different IC.
> > > 
> > > I see. I personally prefer having things clearly described. I can
> > > understand this might be an extra burden to support different
> > > chips
> > > with different parameters, though this should be fairly
> > > straightforward
> > > with lookup tables tied to the compatible strings.
> > > 
> > > Let's see if Rob and Linus have anything to add.
> > 
> > Not much. We have "soft pushed" for this to be described as generic
> > as possible, using SI units (ohms). But we also allow vendor-
> > specific
> > numbers in this attribute. Especially when reverse engineering SoCs
> > that the contributor don't really have specs on (example M1 Mac).
> > 
> > The intent with the SI units is especially for people like you
> > folks working
> > with Chromium to be able to use different SoCs and not feel lost
> > to a forest of different ways of doing things and associated
> > mistakes because vendors have hopelessly idiomatic pin configs.
> 
> I'll take that as "use SI units whenever possible and reasonable".

==> so It doesn't need to change the define, is it right? 
we will keep the common define.

Thanks.
> 
> Thanks.
> 
> ChenYu
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

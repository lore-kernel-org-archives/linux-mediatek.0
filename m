Return-Path: <SRS0=6VVk=OM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDE76C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Sep 2021 01:52:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76F3C61107
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Sep 2021 01:52:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 76F3C61107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LrXGYDFyh4J6jrRY37zpBodjZwvFlHc2+JkjeJyVP1k=; b=Be6dzFJ9qFMYmH
	103w0AYuB7Deb8hWf+WF7970RGyGT1yIUW0c7t/RmFMfsyCcIkpUKaGlAXfrsDwqX0qmBeDHN20n4
	Y5I17i8IypKYyCQdnXjC7yj2vjJc6AfkJffq1H4xzt/f4cyD0yuSVoJIXZG2EKHm0WXS0Ear0FEWT
	4x2K0lHiGQ91vq/FhwNO7jem19v7fZcKg5oi3FI3y2HLyvSQm2sWJKinSKnf9I0r2Oz11TGFsY/TS
	IrRENAYFxi04V5XkZhS7/QDbx4oyU6DR7WfrpJ/efFBrSbYRTeR5UjJrVQEAJcDqa1I+1c9ah2cUJ
	wWpSY/vYOQJapr+CvLWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSrQd-006Ymt-Bv; Wed, 22 Sep 2021 01:52:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSrQY-006Ykp-K8; Wed, 22 Sep 2021 01:52:05 +0000
X-UUID: ad9ccc84048d457ebbacb0b5e2103f86-20210921
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ycj5VeTxUeo1nCAiVHycYdJNa00pcZSEDTIsBrjF7Dc=; 
 b=Esv7flzBzcKo7Z7DwxqCsssEiwFnnvLuFPmRj0aXHPZkX70srcjMhOThoqYDk3Hwzn5kR3tAJ7Va2n3iwwY5dPmYiXzzTUm9d138qWOW6s7xKMD+cyJnoBq75c/+OpfP9EsWh/bKkbeFV75hf6gs1jSgDlLovBl6ZySORtV/FZ8=;
X-UUID: ad9ccc84048d457ebbacb0b5e2103f86-20210921
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 881142789; Tue, 21 Sep 2021 18:51:57 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Sep 2021 18:47:46 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Sep 2021 09:47:45 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 22 Sep 2021 09:47:43 +0800
Message-ID: <973137c1330588517592be475e75be75067e66dd.camel@mediatek.com>
Subject: Re: [PATCH v11 4/4] pinctrl: mediatek: add rsel setting on MT8195
From: zhiyong.tao <zhiyong.tao@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh+dt@kernel.org>, "Mark
 Rutland" <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, srv_heupstream
 <srv_heupstream@mediatek.com>, <hui.liu@mediatek.com>, Eddie Huang
 <eddie.huang@mediatek.com>, Light Hsieh <light.hsieh@mediatek.com>, "Biao
 Huang" <biao.huang@mediatek.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>,
 Devicetree List <devicetree@vger.kernel.org>, LKML
 <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "open
 list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Date: Wed, 22 Sep 2021 09:47:46 +0800
In-Reply-To: <CACRpkdZjqMk_gVpeZ2SqCijuOiiGfPOXHhBOdyL9Y+j750cGsQ@mail.gmail.com>
References: <20210830003603.31864-1-zhiyong.tao@mediatek.com>
 <20210830003603.31864-5-zhiyong.tao@mediatek.com>
 <CAGXv+5H5KnskzBYuqniBGQWBLriyFkBvVXEk1Cyg6XSmKMWP8w@mail.gmail.com>
 <b82ae857d8a3acf117721bb83d4dbbc44f612565.camel@mediatek.com>
 <CAGXv+5F=H3C9mB+uYJDmk8vPiKjWixFs8DF3Pk_Xh3x6Jpq6iA@mail.gmail.com>
 <74a3a96745e93c5a2392b8a39822c872fd468466.camel@mediatek.com>
 <CACRpkdZjqMk_gVpeZ2SqCijuOiiGfPOXHhBOdyL9Y+j750cGsQ@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_185204_115631_FD380693 
X-CRM114-Status: GOOD (  26.17  )
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

On Sun, 2021-09-19 at 21:33 +0200, Linus Walleij wrote:
> On Thu, Sep 16, 2021 at 11:31 AM zhiyong.tao <
> zhiyong.tao@mediatek.com> wrote:
> > On Mon, 2021-09-06 at 18:09 +0800, Chen-Yu Tsai wrote:
> > > > > > +       if (!found) {
> > > > > > +               dev_err(hw->dev, "Not support rsel value %d
> > > > > > Ohm
> > > > > > for
> > > > > > pin = %d (%s)\n",
> > > > > > +                       arg, desc->number, desc->name);
> > > > > > +               return -EOPNOTSUPP;
> > > > > 
> > > > > I believe ENOTSUPP is the correct one. EOPNOTSUPP seems to be
> > > > > network
> > > > > related.
> > > > > 
> > > > 
> > > > if we change it as "ENOTSUPP", it will report warning"ENOTSUPP
> > > > is
> > > > not
> > > > SUSV4 error code, prefer EOPNOTSUP" when checking patch.
> > > 
> > > The context surrounding this warning seems to be that ENOTSUPP is
> > > hard
> > > for userspace to understand. AFAIK the return code here does not
> > > get
> > > passed to userspace? And the pinctrl core does check for EINVAL
> > > or
> > > ENOTSUPP, so I think this is a valid use case.
> > > 
> > > Linus?
> > > 
> > 
> > Hi Linus,
> > 
> > Do you have some suggestion for the warning issue?
> 
> Ignore the warning. We use this code in the pinctrl subsystem.
> 
> The pinctrl subsystem has no userspace API so that is certainly
> not a problem.

> Yours,
> Linus Walleij

Thanks for your suggestion,

we will change it in the next version.

Thanks
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

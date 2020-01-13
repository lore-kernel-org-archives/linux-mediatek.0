Return-Path: <SRS0=6pE3=3C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24DC4C33CAA
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2020 09:42:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E934E2075B
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2020 09:42:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LG3bOV1E";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GoFdUuDx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E934E2075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Bmg+EA7mmex6mGKD03NxAD8O9Wiv0P+T9FJNs8yEnc=; b=LG3bOV1E8NJCkh
	dzwEzNpbF54zrHN+Y5L0/5WNb0ph+Bp02jPzxl+Ze5yS1OKnBlL0dChInq4NEaOn/RV3mFaNaxCnS
	YoA3yofG1l3oBJ1OnlW5TKLJjytWHUyRZRmaM9E+ojCzVcUyG13orZEjUk575mUxO/1hVwpLXu3XV
	8YDv7SpItwYcJYsEEtp1d/3ZhesmVnPBeyAPZPCVetDDXQFc35JCJ+L1LYRHNMfTiIENqVHhqWhjJ
	ldkMvYh4e6brlHh3+JVBMm5jiBkk3uVkrSySiYqIELSS2WQ+g97l/JXCB9HJst7uZyp83G8ECbygu
	1KfYJtWynFnK1SIA/N1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqwEe-0007w9-57; Mon, 13 Jan 2020 09:42:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqwEN-0007k2-T2; Mon, 13 Jan 2020 09:41:57 +0000
X-UUID: 99f725488d314470a0ed94b774719282-20200113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=S0IU+IlcBs9/Y/kx+XkqovfN2BvG7GbCFGZg+SIoQY8=; 
 b=GoFdUuDxf6ZePGlRa9Ume0doVpfMw1s5gYrZHzoqWXjEa/xWS6BxUH/FkNeRWGWqfNWlKpQQV+XTozXD/GopKX2ihcpuEABYJ48eNEr5YB9AjHyDfdMiZy0jiPSXJx2u3fMFxpW1gbwTfQoTnfMReUHrisFwCmZtqG8do4XrVak=;
X-UUID: 99f725488d314470a0ed94b774719282-20200113
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yong.liang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1421079059; Mon, 13 Jan 2020 01:41:53 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 13 Jan 2020 01:42:38 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Mon, 13 Jan 2020 17:40:36 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 13 Jan 2020 17:41:10 +0800
Message-ID: <1578908504.20923.25.camel@mhfsdcap03>
Subject: Re: [PATCH v3 1/2] amr64: dts: modify mt8183.dtsi
From: Yong Liang <yong.liang@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 13 Jan 2020 17:41:44 +0800
In-Reply-To: <CANMq1KCLGx2K5qSVJLFkFqYjghVk40HaZcBeUmSxpBSJQAMOzg@mail.gmail.com>
References: <20191227141405.3396-1-yong.liang@mediatek.com>
 <20191227141405.3396-2-yong.liang@mediatek.com>
 <CANMq1KD=jAPn4Y7zQZrsg9FB7Cq6tNX0R8OF4qX21Sjy2=0Naw@mail.gmail.com>
 <CANMq1KB4PzAUdp03go0Ur_khi2bM3+oNUhHtMK=--V6DmGXiDA@mail.gmail.com>
 <2bbd8f47-fe68-574c-cbe9-bcc680dd4c84@gmail.com>
 <CANMq1KCXMUP=5ijqLsZ67MvO2ROFkG0vSX64KqmWtYKm7w8f2g@mail.gmail.com>
 <CANMq1KCLGx2K5qSVJLFkFqYjghVk40HaZcBeUmSxpBSJQAMOzg@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8790C72DB21B4EEB78AB1FFA7DCBD2718DE0EE4272E3427235AA391B91F06AFE2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_014155_943341_3081FEBF 
X-CRM114-Status: GOOD (  17.42  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 Jiaxin Yu =?UTF-8?Q?=28=E4=BF=9E=E5=AE=B6=E9=91=AB=29?=
 <Jiaxin.Yu@mediatek.com>, Sj
 Huang =?UTF-8?Q?=28=E9=BB=83=E4=BF=A1=E7=92=8B=29?= <sj.huang@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-01-13 at 14:27 +0800, Nicolas Boichat wrote:
> +Jiaxin +Sj Huang
> 
> On Mon, Jan 13, 2020 at 12:44 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
> >
> > On Fri, Jan 10, 2020 at 6:09 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
> > > [snip]
> > > That's all a bit confusing, I thought we are fine to add the reset cells to
> > > infracfg as we have the resets defined in
> > > 64ebb57a3df6 ("clk: reset: Modify reset-controller driver")
> >
> > You're right, we're fine. But at least in theory, we should still have
> > the binding documentation that I linked above.
> >
> > I will try to pick up all the required patches, split them across
> > 8183/2712 and resend as one series.
> 
> Okay, summary of the patches, there are 2 series:
> 
> https://patchwork.kernel.org/patch/11311237/
> [1.1] [v3,1/2] amr64: dts: modify mt8183.dtsi
>   => Partially applied to Matthias' v5.5-next/dts64
>   => Other part depend on [1.2], needs to be applied
> https://patchwork.kernel.org/patch/11311241/
> [1.2] [v3,2/2] dt-bindings: mt8183: Add watchdog dt-binding
>   => Pending Guenter/Wim
> 
> https://patchwork.kernel.org/cover/11326757/
> [2.0] [PATCH v11 0/3] ASoC: mt8183: fix audio playback slowly after playback
> [2.1] [PATCH v11 1/3] dt-bindings: mediatek: mt8183: Add #reset-cells
>   => IMHO adding mt2712 compatible should be another patch
>   => Depends on [1.2]
>   => Tags should be all dropped
> [2.2] [PATCH v11 2/3] watchdog: mtk_wdt: mt8183: Add reset controller
>   => Issues about tags
> [2.3] [PATCH v11 3/3] watchdog: mtk_wdt: mt2712: Add reset controller
>   => Issues about tags
> 
> Jiaxin/Yong Liang/Matthias: Please let me know, I'm happy to pick up
> the patches, clean them up and resend them, if you think that helps.
> 
  [1.2] [v3,2/2] dt-bindings: mt8183: Add watchdog dt-binding
  -> It is no use, I will send 8183 in jiaxin's patch
     We want to send jiaxin's patch prioritily. So you can merge
jiaxin's patch firstly.
> 
> > > That's why I took this part from:
> > > https://lore.kernel.org/linux-mediatek/20191226093930.22413-1-yong.liang@mediatek.com/
> > >
> > > Please let me know if I'm wrong and I'll drop it.
> > >
> > > Regards,
> > > Matthias
> > >
> > > >>> 2. Add watchdog device node
> > > >
> > > > Can we have a patch with just this change instead, since you're
> > > > sending the binding with it.
> > > >
> > > >>>
> > > >>> Signed-off-by: yong.liang <yong.liang@mediatek.com>
> > > >>
> > > >> Tested-by: Nicolas Boichat <drinkcat@chromium.org>
> > > >>
> > > >>> ---
> > > >>>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 8 ++++++++
> > > >>>  1 file changed, 8 insertions(+)
> > > >>> [snip]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

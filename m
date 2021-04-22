Return-Path: <SRS0=s7tg=JT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5698EC433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 02:11:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99419613C3
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 02:11:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99419613C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sjDW2iVvJw6SfGG9rBTsjoRPW2lAUf9WHfQEZg500RY=; b=HoPCw7+GPA78VhdBUUjqf5SCF
	57PFF39wzFqf5jRyV6HpDp69A+yW4s2urXyr2LxbXR9lSmWPd5/rOCw2gxV6krbJCovUw8C5t6HQM
	CEnilnglcNMUyjtaPMVesm+HkJBPbtYTIhR+AdXdA3HHjD1In3P3BywaXIK0TiKLWMO7xnbCARzZ8
	0TidZeSV7MNVqwXXzoX9DAANjiUQHk8Ibw24gU/EQNbd+4jiIu0sEyzB6PEDWQYM5R2Y7vjk+QDDb
	Ieq1DzfLU+Yjtl2eQctVio7twbmhMuqq1LuHAM1iK6lUyjcAYFIP3npp96gmp+F195WCMnwRGQAyW
	r02J32Mfg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZOo8-00FbCK-K4; Thu, 22 Apr 2021 02:11:08 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZOo1-00FbBt-OY; Thu, 22 Apr 2021 02:11:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=NWZUJCNxO3pM4ccYtxmcJrgXOTaZ34GcudHZtUurBwQ=; b=dZiG0L1eRjpy0F1uNLnmGFh5sa
 i02UfaK0seb7OgRz4kAy3+LuttrZrPWRpiPsbylcoVSX3mBTacbYGORa9VEe0jpTPbBB9gYSDmkC6
 wbOBh5hBh1e0aoO4xClNRPWFW3oeP3FcsU1itjPkBnjrLHzrGbrrlViOHFIc1ZEXyDRJWoKjRfpgK
 oFAcRC5+lRtp4JsegD8VrOk1kEpibPhNAsiJkM0xr54uL6KHB7kH4vjESDkVDqK3NWi5LXZRZj4yz
 YVfE6ONNrvMeJQacuzpmBdcN5icL3AOdlM1i3nd2lYBBYTP4bWrz4j9pP2TORwUlmA6q39EcxegvK
 aZmhljlw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZOnv-00DJx1-Cy; Thu, 22 Apr 2021 02:10:58 +0000
X-UUID: 0155fc916fae407894960554bdbad5b7-20210421
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=NWZUJCNxO3pM4ccYtxmcJrgXOTaZ34GcudHZtUurBwQ=; 
 b=QpxVoY7crM4Omh2K//m/QGiYLWVudIeSBa5V2uu3unm9glzcBn3QIP8l71JxtCUy9N6Q+1J0cuBt84Da0xrPvvbMmlZa71z4rnJsLMA1s7sVgI8aqdSEbNsPqLs9jP4BJNVA/UtJZcUt3C6udlkD1nGfjuQu5eD+vIGUVWuohzg=;
X-UUID: 0155fc916fae407894960554bdbad5b7-20210421
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1077060309; Wed, 21 Apr 2021 19:10:51 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 21 Apr 2021 19:10:50 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 22 Apr 2021 10:10:47 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 22 Apr 2021 10:10:46 +0800
Message-ID: <1619057446.27999.2.camel@mhfsdcap03>
Subject: Re: [PATCH v4 4/4] pinctrl: add rsel setting on MT8195
From: zhiyong tao <zhiyong.tao@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, srv_heupstream
 <srv_heupstream@mediatek.com>, Hui Liu =?UTF-8?Q?=28=E5=88=98=E8=BE=89=29?=
 <Hui.Liu@mediatek.com>, Eddie Huang
 =?UTF-8?Q?=28=E9=BB=83=E6=99=BA=E5=82=91=29?= <eddie.huang@mediatek.com>, "Po
 Xu =?UTF-8?Q?=28=E5=BE=90=E5=9D=A1=29?=" <ot_po.xu@mediatek.com>, Biao Huang
 =?UTF-8?Q?=28=E9=BB=84=E5=BD=AA=29?= <Biao.Huang@mediatek.com>, "Hongzhou
 Yang" <hongzhou.yang@mediatek.com>, Sean Wang <Sean.Wang@mediatek.com>,
 "Seiya Wang =?UTF-8?Q?=28=E7=8E=8B=E8=BF=BA=E5=90=9B=29?="
 <seiya.wang@mediatek.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS" <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 "linux-arm Mailing List" <linux-arm-kernel@lists.infradead.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "open
 list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Date: Thu, 22 Apr 2021 10:10:46 +0800
In-Reply-To: <CAGp9LzoM=9v5mLxtAN9sQm_2f+66xc7G4YqfUF1Mwvr4K_wz5w@mail.gmail.com>
References: <20210413055702.27535-1-zhiyong.tao@mediatek.com>
 <20210413055702.27535-5-zhiyong.tao@mediatek.com>
 <CAGp9LzoM=9v5mLxtAN9sQm_2f+66xc7G4YqfUF1Mwvr4K_wz5w@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D12B029E0DF7614013281B6D52E7723B0881247E94195CE17C8D141C4811031E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_191055_464594_3A66F731 
X-CRM114-Status: GOOD (  13.38  )
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

On Tue, 2021-04-20 at 11:50 +0800, Sean Wang wrote:
> On Mon, Apr 12, 2021 at 10:57 PM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
> 
> <snip>
> > @@ -176,6 +180,12 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
> >                 else
> >                         err = -ENOTSUPP;
> >                 break;
> > +       case MTK_PIN_CONFIG_RSEL:
> > +               if (hw->soc->rsel_get)
> > +                       err = hw->soc->rsel_get(hw, desc, &ret);
> > +               else
> > +                       err = -EOPNOTSUPP;
> 
> I think that should want to be -ENOTSUPP to align other occurrences.
==>Hi sean,
Can you give me some suggestion? -ENOPARAM or -EBADTYPE?

Thanks.
> 
> > +               break;
> >         default:
> >                 err = -ENOTSUPP;
> >         }
> > @@ -295,6 +305,12 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
> >                 else
> >                         err = -ENOTSUPP;
> >                 break;
> > +       case MTK_PIN_CONFIG_RSEL:
> > +               if (hw->soc->rsel_set)
> > +                       err = hw->soc->rsel_set(hw, desc, arg);
> > +               else
> > +                       err = -EOPNOTSUPP;
> 
> Ditto
> 
> > +               break;
> >         default:
> >                 err = -ENOTSUPP;
> >         }
> > --
> > 2.18.0
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

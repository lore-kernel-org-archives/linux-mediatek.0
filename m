Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B886C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Nov 2021 04:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FGgZt1TJTmE4jHHedHgPsEXa/d1ncl61sgu5lhiWi6I=; b=L4ylHY87/ro825
	CGkInatDT3L8FMZmNuKVxSNdIGHZ5TU/5n/TQhEbY1i2q+ZLohjz5rZ2EgAoFXbNDP4lx+4yKHyo3
	uPDIcDrMEqX6cyFIEAhGkQJjf9+u62nRdyGt0AJ2u6FREb7u0IJ0RrQ3dJHGlihPBRTnFO77USqtF
	ykHNIGD5TEqhP1jcHrlqI9csYKpfCY8KMKgueTzr7D1KrUvycVZ/f6AwjMaRrBI4VyJAq5Y+iaju4
	0/Btl6aKAWBOcbsBkaDSTUlj7BJj7PTVjxSrRRHeP0YHpxA0npo/HhMpJ1EEqXEEgX6jtsvLKSuy9
	plLpvI4Zu0lathENLgYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mp0aj-00En1Y-02; Mon, 22 Nov 2021 04:06:05 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mp0aV-00EmzE-EY
 for linux-mediatek@lists.infradead.org; Mon, 22 Nov 2021 04:05:54 +0000
Received: by mail-lf1-x131.google.com with SMTP id k37so74630555lfv.3
 for <linux-mediatek@lists.infradead.org>; Sun, 21 Nov 2021 20:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MEXpnLmyGEfL4QdZ+Rfyk6e7ekko34wkUVL3dw83Htw=;
 b=b3q40qxxvL/hojnrO+JRZoj+SZs3pclT654cL7B40cuKPhHA/oR6ivlykIgcXsDQU6
 alcQaelnfqp+CVGgQvc1d0D7Av0HkD+qG9cT31KMXbb5qCMldUdL07jopwZWqsHzENdt
 DRvTRZGQg6Dq8O2AOBHe0Ey0WDF9zXMJv+mJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MEXpnLmyGEfL4QdZ+Rfyk6e7ekko34wkUVL3dw83Htw=;
 b=Qv8Ug/PxdmDlHD0ifq2WKEtGmAtMTbrri+Z7hcyNd1N20GybzV5Lufv336LPckByhj
 vHjZYDutkH0DURYu5zQcahdQ88a51Q4i0jtSJZCrqUAlctb0X3J+YLU0t3wQ0bZ4iMND
 TWPNtGULE8RPxF+WOYzoR63hoI2eHl+XxE3rr+jWcOh5ebniXtK1m7a0ECiAQq7kaW0g
 9vhb3WfYAnZNEhGp7lvVGjcvbOk+csBAd2J7Z/jxbicxn2ycV/x6F87h6wXu+mFaW82f
 KIMq+m/4voRbRb9GOtmx83TE9Z+TLcPkwIiusWCKb8S5sEzJhY+RhVNJ7fnZ+qh33hYC
 Mkfw==
X-Gm-Message-State: AOAM5305MfYNuqL9QkU/4nkp3hM+FSu2Dl+YxzDdDsKxojco0LD65QoR
 GAr02E9cW7NHXbIA5j+cghNBYJ6t2gOmesDnEDuGDw==
X-Google-Smtp-Source: ABdhPJwi59W/Iebbn0+AUvtuYczG7cqI5vz1jJFcFkBoqjmIZWr7SxCmBZd9hholFHZChanwij52WsOGMVexUaabt1I=
X-Received: by 2002:a2e:a5c5:: with SMTP id n5mr40217324ljp.457.1637553949722; 
 Sun, 21 Nov 2021 20:05:49 -0800 (PST)
MIME-Version: 1.0
References: <20211107075646.4366-1-chunfeng.yun@mediatek.com>
 <20211107075646.4366-4-chunfeng.yun@mediatek.com>
 <71f83770-b12f-2452-d24b-ae1be9b5b075@linaro.org>
In-Reply-To: <71f83770-b12f-2452-d24b-ae1be9b5b075@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 22 Nov 2021 12:05:38 +0800
Message-ID: <CAGXv+5GzP1SXi2ihhifK_Ui8Rt04UgeFyjivzHc532yvPFo3OA@mail.gmail.com>
Subject: Re: [PATCH 4/6] dt-bindings: phy: mediatek: tphy: support software
 efuse load
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 Eddie Hung <eddie.hung@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yz Wu <yz.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211121_200551_501082_1F172B2E 
X-CRM114-Status: GOOD (  19.85  )
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

On Sat, Nov 20, 2021 at 1:19 AM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
> On 07/11/2021 07:56, Chunfeng Yun wrote:
> > Add optional property nvmem-cells and nvmem-cell-names to support
> > software efuse load, this helps to fix the efuse bit shift issue
> > on mt8195 etc.
> >
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
>
> Applied thanks,

This is a PHY DT binding change. Shouldn't it go in with patch 5, the
phy driver patch, through the PHY tree instead?

ChenYu

> --srini
>
> > ---
> >   .../devicetree/bindings/phy/mediatek,tphy.yaml | 18 ++++++++++++++++++
> >   1 file changed, 18 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> > index 9e6c0f43f1c6..05ee274b4b71 100644
> > --- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> > @@ -160,6 +160,24 @@ patternProperties:
> >                   - PHY_TYPE_PCIE
> >                   - PHY_TYPE_SATA
> >
> > +      nvmem-cells:
> > +        items:
> > +          - description: internal R efuse for U2 PHY or U3/PCIe PHY
> > +          - description: rx_imp_sel efuse for U3/PCIe PHY
> > +          - description: tx_imp_sel efuse for U3/PCIe PHY
> > +        description: |
> > +          Phandles to nvmem cell that contains the efuse data;
> > +          Available only for U2 PHY or U3/PCIe PHY of version 2/3, these
> > +          three items should be provided at the same time for U3/PCIe PHY,
> > +          when use software to load efuse;
> > +          If unspecified, will use hardware auto-load efuse.
> > +
> > +      nvmem-cell-names:
> > +        items:
> > +          - const: intr
> > +          - const: rx_imp
> > +          - const: tx_imp
> > +
> >         # The following optional vendor properties are only for debug or HQA test
> >         mediatek,eye-src:
> >           description:
> >
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

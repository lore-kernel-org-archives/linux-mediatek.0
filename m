Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E004CC43460
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 16:44:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A1BB61042
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 16:44:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A1BB61042
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gylRqoaAitguhlDSqjl+n/Z5MMGTb5JBMLv4ZxE7+pc=; b=rJFM/dFcfiU1Uh12SF6sBCA3R
	qFicbcAq/XU/xDbvAYcVFYik/F0E3Kg0WZC/tsBpcmOLTcSBbDCBZz4fr3VPmOrTN6Z5l8CqwxB6S
	2vMEKnP6xybKD7fBOGmiKGIBHaHdpUfvuBMgmJ4DnJH695260Edakwx+JHsVRTLNyLBsjDvtUYLtO
	7ZFG0VNvqLNxM10lRdONbuj48NnAcIfoS97h1LsgAw3iiGnxtHCH7+9zrOJEym9YAEhB3g9yZ+lom
	wC/pEPL1ZsBBphbm9ClOOHa6auryws94jnHTVXZU915YDvOLQH3h3KCL3615J6TGct2+JriXzAmL0
	cYjmV+3qA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXRZM-002pYD-5Y; Fri, 16 Apr 2021 16:43:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXRXo-002omj-S8
 for linux-mediatek@desiato.infradead.org; Fri, 16 Apr 2021 16:42:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=j/densIO6lCILTUh7jZlg51NGZKmxtij9vX0sZYjwcE=; b=GuM497Ok/WWnY3HRUtVzxXRO+0
 sHqSVWnBBi3RoM7Xb7FyZ82Dc4hAhKbpCimMyx0hM7eaUqQOjr9enA8dZYfFLuInXQy58F+m+1Jd+
 5IRoW7YZhm82sGgdT0N+8S0XWnSbQB7zenzyq7cvyEe8mEHVXW4TdAZUBqhOmDCfDesGppw11G2E6
 he5iHvf/BnXR72Rnwn+cX/2ZWyEXGh/6UmCjszgag1KhSZ4ozlcWqf2RhvKJn0SLgs4CJwI8uItMA
 BNawgcZ7En53oKnr+wZrOfbPm53oKQumN4gf4PoUHVa9v+VGcmiNcnBxNTlEQ8Yhc3N8TlhQt/yhJ
 GbXLmzlg==;
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXRXm-009Z3p-B9
 for linux-mediatek@lists.infradead.org; Fri, 16 Apr 2021 16:42:11 +0000
Received: by mail-il1-x130.google.com with SMTP id 6so23602177ilt.9
 for <linux-mediatek@lists.infradead.org>; Fri, 16 Apr 2021 09:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j/densIO6lCILTUh7jZlg51NGZKmxtij9vX0sZYjwcE=;
 b=LOZ1xRvrz74oNLkm8XDgr9wAn6JTWPzg6eD+JHp2eH42LMlp+nRnewmfrhrpjFjhy8
 b8qGp94HHe0XusF6ja9l6oPVaQm9/0tm+q4tH0IYlPy57OaMKrrXrCRB9C360XCq5R7M
 iBasaHODg/O3/TW+dEMVcA+cI8lVUhpdEwrBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j/densIO6lCILTUh7jZlg51NGZKmxtij9vX0sZYjwcE=;
 b=HOhd3b05sU4UtnmHAK/X4BVAGV/bx0aV/THBUglOlKgQvEThFkRgRdPCkJLARs7MrO
 dqeK3bqFQGWXO6xIjE5sttCF2BS0E73DPtSjaQLqm0y1KWJL4H1lJ9GOH4/r5Tb2uT7I
 sGlRhycG7IBpmN7NPBOtTEgTx0/Iud0bmfkZUHFlNpildvDBVuIB9MB49jP04AN9zOH1
 mg/9mZ+0Ze0adOvcUEKRBnxNhiTrxO7/8H2bUCLd/NZ4/Qi+PIqq2NM/6wWYLSG0sJN2
 16YRj4JE8mHZVH4OtCJaTHbDPCWQUmn45X1FBqFjHvjyTHuy5Vq+F9JekY4SvuGrXLRW
 GpCA==
X-Gm-Message-State: AOAM530i0RW+1dh6YjMxrYt6dsdqZ4xL1nP2nsGRG8BDcm6LxZfLOXiv
 NhI0DRdkq0BNAvii+nnCnkpQZ2P4YwuDmHHH0FESeA==
X-Google-Smtp-Source: ABdhPJxQLf+jzir4sF3vsmzfF2bdFIPUsjz8/woIId3VEBsUgBTg+HLcA+FeFoGMzcjnrrN4jHxA2FcjKw6WoiaAfSQ=
X-Received: by 2002:a05:6e02:1282:: with SMTP id
 y2mr7713435ilq.308.1618591328870; 
 Fri, 16 Apr 2021 09:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210415093519.1920877-1-hsinyi@chromium.org>
 <20210415093519.1920877-4-hsinyi@chromium.org>
 <face0af7-8630-31fa-4975-a80311257d13@gmail.com>
In-Reply-To: <face0af7-8630-31fa-4975-a80311257d13@gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Sat, 17 Apr 2021 00:41:43 +0800
Message-ID: <CAJMQK-h9YGmuDU5r+Ook=OODLK_n75+1o_Bs1KWrZOgMmyX0=Q@mail.gmail.com>
Subject: Re: [PATCH 4/8] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-kenzo
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, 
 Sean Wang <sean.wang@mediatek.com>, Ben Ho <Ben.Ho@mediatek.com>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_094210_404567_FB953593 
X-CRM114-Status: GOOD (  13.45  )
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

On Fri, Apr 16, 2021 at 10:42 PM Matthias Brugger
<matthias.bgg@gmail.com> wrote:
>
>
>
> On 15/04/2021 11:35, Hsin-Yi Wang wrote:
> > Kenzo is known as Acer Chromebook 311.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >  Documentation/devicetree/bindings/arm/mediatek.yaml | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> > index 0870490aa350..39e4a99ebb37 100644
> > --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> > +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> > @@ -137,9 +137,11 @@ properties:
> >          items:
> >            - const: google,damu
> >            - const: mediatek,mt8183
> > -      - description: Google Juniper (Acer Chromebook Spin 311)
> > +      - description: Google Juniper (Acer Chromebook Spin 311) / Kenzo (Acer Crhomebook 311)
>
> Crhomebook -> Chromebook :)

Thanks. Fixed in v2.
>
> >          items:
> > -          - const: google,juniper-sku16
> > +          - enum:
> > +              - google,juniper-sku16
> > +              - google,juniper-sku17
> >            - const: google,juniper
> >            - const: mediatek,mt8183
> >        - description: Google Kakadu (ASUS Chromebook Detachable CM3)
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58576C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 06:24:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA7AA2310F
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 06:24:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA7AA2310F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=w0FNO+LBUyQzNk4flqKdH84e+tavZNfkeJ8cg3U0PfY=; b=ZomOTjt4O3U0M8SDrpI1BrBlD
	ywQ2jWLaMqVTfLmAbiItFviuy8M0JZJv0Fw91+pn2T61qr94Qza5r6VEzrfuJbZQhjbAnh1to7GTl
	2YgIrHu51r0v03qAgzp9zAEBsLj4c5TajLDHK5CJMv2AZZ5gcgoKMARt8Yeuva/wbAqoPDIIEW1S7
	Uv6NPE2z+ds9KRjWggO9jmavYy03JPn1aImTngiu5j9iVq08tUeEFBX0yjEJB+LWjDzxSEiG7iTnu
	QILse1T55nedJ8C9KF6qrpG3v3xR+QlJl9B/PsAEC//vNbEdjZthmWv0DEUxiYQJevlvRIGWRHSGC
	j7c28ZpTg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzZa4-0005bO-G0; Wed, 13 Jan 2021 06:24:32 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzZa2-0005aL-Ji
 for linux-mediatek@lists.infradead.org; Wed, 13 Jan 2021 06:24:31 +0000
Received: by mail-io1-xd32.google.com with SMTP id q1so1954941ion.8
 for <linux-mediatek@lists.infradead.org>; Tue, 12 Jan 2021 22:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r+rZiUxa75DfhWXq44OmQ1F4tGpkEw8ORSHsmTicRcE=;
 b=JFiM8RG8XSRrW3ab5ySv6OUatFOSMbi4lIYeEvkiXzdyt0r1apGzkX8fgX4vLhsLI8
 33ZsFUslMW96hwjMxILosImy5w7xdCSmtqPtrH8ttZNXNAYGOOgyrnGD5RVHvGyLrrrQ
 yp+8Sva32JoVhQkBmqKTqKjRH0WUyfDxTosVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r+rZiUxa75DfhWXq44OmQ1F4tGpkEw8ORSHsmTicRcE=;
 b=dKoCcX7iLGRNgH+Mgtp7IE+BlSeI3z03t2upvef4cTYbLX4xPdHWsRn7bcOPv0JDaK
 lAlkjd28DJZZMA3ADm/NESxcrQkwt5mBrb86BTF1HzYJA1M7ZOx+gjC6CfPrMrSj03vS
 JTeyVmfsb62g9l/6p3DbgIvnd7r2AYsfGHhXy+Cc56asbnn5/GXtvO/Mzs+F692RZy7T
 otONMuJTG1nXsTSNeCBB0MijAZfiY1SxhVh3KDsdhonPtRzzeY1u6DIDEcwlSe+R9fTA
 1m+KihFTN8Y941R6Jf4gXzr7rll+49Poas0Z1WS7QZ5Xi19HMh77OsRmB1tg/FLFF5HL
 3bSA==
X-Gm-Message-State: AOAM532OR0cw9UrEGvuB+3m1KLq75bsS4/IWvBUzAfDp1ehd3UZA/BnT
 pyy2MgchONtdcjQtObGd3GnV+Jb8yTTPpHmXXOyRlbcj9/w=
X-Google-Smtp-Source: ABdhPJzuXlWioU2zuqVGBTa282fKGBg3oC954Gq+TfvFlg9O3kQD3IBPji7bWo5ogwmPozPDO873J/3usf8A4vnbL1A=
X-Received: by 2002:a6b:f810:: with SMTP id o16mr621066ioh.20.1610519066015;
 Tue, 12 Jan 2021 22:24:26 -0800 (PST)
MIME-Version: 1.0
References: <20210107052206.2599844-1-hsinyi@chromium.org>
 <20210107052206.2599844-2-hsinyi@chromium.org>
 <20210113032031.GA1460993@robh.at.kernel.org>
In-Reply-To: <20210113032031.GA1460993@robh.at.kernel.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 13 Jan 2021 14:23:59 +0800
Message-ID: <CAJMQK-hCm05S6QCWz6i-vuJKj8GKcaQFYPBYYAd4B8NBL8q5Yw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: mt8183: Add krane-sku0 board.
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_012430_739944_A2B24277 
X-CRM114-Status: GOOD (  17.43  )
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
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, lkml <linux-kernel@vger.kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jan 13, 2021 at 11:20 AM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Jan 07, 2021 at 01:22:06PM +0800, Hsin-Yi Wang wrote:
> > Similar to krane-sku176 but using a different panel source.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> > Change:
> > v2: move compatible to board dts
> > ---
> >  .../devicetree/bindings/arm/mediatek.yaml     |  1 +
> >  arch/arm64/boot/dts/mediatek/Makefile         |  1 +
> >  .../dts/mediatek/mt8183-kukui-krane-sku0.dts  | 23 +++++++++++++++++++
> >  3 files changed, 25 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dts
> >
> > diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> > index 53f0d4e3ea982..3276f7a2ce672 100644
> > --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> > +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> > @@ -120,6 +120,7 @@ properties:
> >            - const: mediatek,mt8183
> >        - description: Google Krane (Lenovo IdeaPad Duet, 10e,...)
> >          items:
> > +          - const: google,krane-sku0
> >            - const: google,krane-sku176
> >            - const: google,krane
> >            - const: mediatek,mt8183
>
> This says you must have all 4 compatible strings in the order listed.
> That doesn't match your dts. I assume you want the first 2 under an
> 'enum' so there's 3 strings with the first one being sku0 or sku176?
>
Right. I'll fix in the next version. Thanks
> Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

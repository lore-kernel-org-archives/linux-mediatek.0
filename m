Return-Path: <SRS0=Y38d=MP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC047C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 23:36:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A458D601FC
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 23:36:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A458D601FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c+Byd0jFd6jm7wyV7I3DRW7iuYVFnlb+hOWPXAhBSF0=; b=32numt1nj+k238
	omYHulstxx60hnWGmSwqOPW7agWo4PUA+L+yo1GfDlDYvL8p33U9YurYXMLv0Ulx3Agc9uHsbNxZ+
	Mnjg0VK8qCVgQ1654ysDjwjNVPcYxRTWrBkVsZ+w3YEuyVjEeUiCV1waD+6umojoU7JXW0wHpgtVV
	xeZuZvUG4pUQGP923uJs9tJ/X546WCsx56NBmr5Dmbv01jIAVfLqwIDvodH55ne25KWqNzGKj3DkL
	vPt8whEWHTnDWjeUHvFh/c45UHSh7eaOULMJrmfLzLUq2BPZrX2iWREWtMO5261sreHMQUV4GNJGK
	hRs7xqoSLo31K+AQJYMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m74ia-006Oxb-NE; Fri, 23 Jul 2021 23:36:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m74iN-006Ouz-5f; Fri, 23 Jul 2021 23:36:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1F32360F23;
 Fri, 23 Jul 2021 23:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627083382;
 bh=OgmN047jAuLjM5BKQ46Fip2OTLJSsCLtOO5/JwB+VY4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=V4B/bP/wttZGa5Bpb/JMdmDYR5VzCb55h2j420M50J8Q6G6hPHSDONKZuj6yUBk03
 1ZV+N+YappLmblGOhO0bPuh1iVbWNj2iEVKFcKb5uq+JOCIDOrup2ZqpRqlPOrX6bY
 iQFQ7zgXOV3dIsKmA9SsckWbH5ws7YidrLQ0FeucDjUUCcG/7xnIqrQJ7a7icGatoz
 OvZxoXxoBHIPSNOYqBRrifCl2lwCVoBtOt82bKmVOBoPCiKI2wZGjs75FbGkUDGNDQ
 hKrSQqnoKch/3to6VNf/GIipqXUWg3G/NXQE/aRg20fJlY2cwwv88ieQsjYOW8Ox6V
 AvpZoLx2cLiWA==
Received: by mail-ed1-f53.google.com with SMTP id l6so1753876edc.5;
 Fri, 23 Jul 2021 16:36:22 -0700 (PDT)
X-Gm-Message-State: AOAM533cNhpStYCfkHi3J5TEBnzIPjY0wVFn2m8F0M/kYjLJs4Fd7iqI
 Hj9ocvzfSATptmH7/hBt/+QB8sVYOgu50xgciA==
X-Google-Smtp-Source: ABdhPJyZST6mg5GShwdylESiCi8iKzOx7W2m4QuplhuIQas0YRkQ2/nGFg4qa+gkYWbLK8bEZZVxgJWR002O9d1/BlQ=
X-Received: by 2002:aa7:df12:: with SMTP id c18mr8438913edy.62.1627083380778; 
 Fri, 23 Jul 2021 16:36:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210519161847.3747352-1-fparent@baylibre.com>
 <20210521014815.GA2476751@robh.at.kernel.org>
 <CAL_Jsq+HWxQwFuKM==g-PBROxGN_xoWCc060U0pDpsDdfWJWPg@mail.gmail.com>
 <CAFqH_50rKvYZGeRMoaqtYZ6Hdbm6tjLTHB3N9JGsFai1ad0Dzg@mail.gmail.com>
In-Reply-To: <CAFqH_50rKvYZGeRMoaqtYZ6Hdbm6tjLTHB3N9JGsFai1ad0Dzg@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 23 Jul 2021 17:36:08 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKyA+Br=44gvK66VX_Ardx7QOgkqCZ5Xv=5+enn4vZtsQ@mail.gmail.com>
Message-ID: <CAL_JsqKyA+Br=44gvK66VX_Ardx7QOgkqCZ5Xv=5+enn4vZtsQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: arm: mediatek: mmsys: convert to YAML
 format
To: Enric Balletbo Serra <eballetbo@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 devicetree <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_163623_280758_8138EF86 
X-CRM114-Status: GOOD (  19.23  )
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

On Fri, Jul 23, 2021 at 3:45 AM Enric Balletbo Serra
<eballetbo@gmail.com> wrote:
>
> Hi Rob,
>
> Missatge de Rob Herring <robh+dt@kernel.org> del dia dv., 21 de maig
> 2021 a les 3:51:
> >
> > On Thu, May 20, 2021 at 8:48 PM Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Wed, 19 May 2021 18:18:44 +0200, Fabien Parent wrote:
> > > > Convert the mmsys bindings to the YAML format.
> > > >
> > > > Signed-off-by: Fabien Parent <fparent@baylibre.com>
> > > > ---
> > > >  .../bindings/arm/mediatek/mediatek,mmsys.txt  | 31 ----------
> > > >  .../bindings/arm/mediatek/mediatek,mmsys.yaml | 57 +++++++++++++++++++
> > > >  2 files changed, 57 insertions(+), 31 deletions(-)
> > > >  delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
> > > >  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> > > >
> > >
> > > Applied, thanks!
> >
> > Actually, should go with patch 3. So dropped and:
> >
>
> I think that this patch can be applied alone through your tree, patch
> 2 and 3 can be applied later for the maintainers when they are fine.
> There are other patches in the ML that depend on having this meged, so
> it would be really nice to have it. Although it has already your
> ack/review if it help I also took a look and I know the hardware so:
>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Okay, patch 1 and 2 applied.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

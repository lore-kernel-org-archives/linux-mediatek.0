Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77241C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Mar 2022 13:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sl1gZTZ4sNMK/c3vOGiJTJeJ0LtvyRBrDadf2QuuxRw=; b=GUVPgZwaMlIO+q
	wMApLw8FQr7ahibpQFdcsUIHGTG5uzMi4Z0ctq7jO4+syg+OlajqkVlt7CVY2bhXhMhJzXo2tY3EG
	3JsDdXrWus7n97mt9OCUukaTVapM7cSukSs+KN8LBZFG0tqkxFigv+qsNs7wDmvK7J6iz81po2YnN
	DfFKkX3yfLRdYPrMzBrH54ApHkM4j+MYuGYqTIrHgOr+Bzu/FmHvBu4ztu8tY1gGhKUNQo483TvlB
	15VSAnlAEOdGSU+xIAiLqh7XkflhTgsWfqx6bDAZv5yINLjnvLk97dezDrUKi7ycRvqn0GFQ5YNhY
	B5ljbbD8uKKLx1jONFdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYpPN-008nFn-TH; Mon, 28 Mar 2022 13:27:45 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYpOu-008n6D-Cr; Mon, 28 Mar 2022 13:27:18 +0000
Received: by mail-ed1-x529.google.com with SMTP id x34so16893924ede.8;
 Mon, 28 Mar 2022 06:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=PJXGZlpigjTh6H9JMMa18nQ2vBOjy1Eubx2lpLSUCN4=;
 b=P+Xah39W4u3PaDSAqPLufO5/H/K2gU2w/d2wFaGX2dVMn3ptW0NhEHGwzIdwRpRl/0
 z1FSOdPVtx96dA5F7FeFqr/xM+E7aaBMX+Jrr4ATSqkcDJ6ByLiqoci0ikB8zblEPzRr
 AgfVgEhpKJPDuyJpnsbMs0owuaCWieQCxknWTP5AisVim3x2oWgpvZspTe1rCjJ71yEY
 k1XEvY3EOHeoQH9GnIpyLgDu0KacloeGCU6qlaS6y84XNz0XNDoFZ24ZhfgNJ0IJhypy
 Itw+T2ZDe09wzSYH9OizIncV+P60OAXYspmhj2dwWHF5nT/b4EcIUOf1ZGBuS6ErOxv8
 XOvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=PJXGZlpigjTh6H9JMMa18nQ2vBOjy1Eubx2lpLSUCN4=;
 b=B0whUTp56mIWSbLCy9yjgBRQNJ/1jvMWFiZo44KP2YOYoUIkVjAn0YGbCoN8H6+oYC
 CdFTy78PLeWtPjK1Z9CfXZESLe5UAu0pDYgQeR4OzyvMkKSrb0cktJ3f9GIppFZE6o8z
 nBJ99bUBZ1n1tA0aZWfc0YbtXASTuFZnZmyYFGcvr5aEdUfxZuW6zE51RGIyuP32feX5
 5Libt4aFJqc/SHq+bOW5K7pzfiM95jD+4bDd1NSrRut1yL1+1rbFLNJVUVbYFVK9mGPx
 zrVnDWp9RHNaRYqrD4ZusypFjlUa68UnMjWmVQbP4Hs4i9lax4ooeRNtBPC7bwUov4aJ
 X/3Q==
X-Gm-Message-State: AOAM531QcEPUh+sxJcNznzh/vmfXAOXgvYETQx724D1L2CrnEiTrmeb7
 JALJcf2VYj40xGEXOAfkI6I=
X-Google-Smtp-Source: ABdhPJzfZMouNxSUPChSrobO0DmZY1dpjyjoJXynXzykI+ox1dAeHmzyb365QAjutoruA3M7o01bCQ==
X-Received: by 2002:a05:6402:27d0:b0:419:5184:58ae with SMTP id
 c16-20020a05640227d000b00419518458aemr16315076ede.314.1648474034597; 
 Mon, 28 Mar 2022 06:27:14 -0700 (PDT)
Received: from Ansuel-xps.localdomain (93-42-69-170.ip85.fastwebnet.it.
 [93.42.69.170]) by smtp.gmail.com with ESMTPSA id
 y16-20020aa7d510000000b004197c1cec7dsm6986648edq.6.2022.03.28.06.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 06:27:14 -0700 (PDT)
Date: Mon, 28 Mar 2022 15:27:13 +0200
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-omap@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@axis.com,
 linux-aspeed@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org,
 chrome-platform@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com,
 linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-tegra@vger.kernel.org, linux-oxnas@groups.io,
 linux-arm-msm@vger.kernel.org, linux-unisoc@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-realtek-soc@lists.infradead.org
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
Message-ID: <YkG3sQ3MDhVoW8l4@Ansuel-xps.localdomain>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <YkG2RPrtPaBNXb7a@latitude>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YkG2RPrtPaBNXb7a@latitude>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_062716_481287_FF861473 
X-CRM114-Status: GOOD (  24.30  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Mar 28, 2022 at 03:21:08PM +0200, Jonathan Neusch=E4fer wrote:
> On Mon, Mar 28, 2022 at 02:09:14AM +0200, Ansuel Smith wrote:
> > Hi,
> > as the title say, the intention of this ""series"" is to finally catego=
rize
> > the ARM dts directory in subdirectory for each oem.
> [...]
> > [1] https://gist.github.com/Ansuel/47c49925ee7ef4b1dd035afc74679ab5
> > [2] https://gist.github.com/Ansuel/19f61f1e583c49407ce35c10e770fbe0
> =

> Nice idea, thank you!
> =

> A few notes on categorization below.
> =

> =

> >  create mode 100644 arch/arm/boot/dts/broadcom/Makefile
> >  rename arch/arm/boot/dts/{ =3D> broadcom}/bcm-cygnus-clock.dtsi (100%)
> =

> Or maybe bcm instead of broadcom. Not sure which is preferred by
> Broadcom people.
> =


In arm64 they used broadcom so i assume the full name looks correct.

> >  create mode 100644 arch/arm/boot/dts/dove/Makefile
> >  rename arch/arm/boot/dts/{ =3D> dove}/dove-cm-a510.dtsi (100%)
> =

> Arguably part of Marvell.
> =

> >  create mode 100644 arch/arm/boot/dts/edac/Makefile
> >  rename arch/arm/boot/dts/{ =3D> edac}/ecx-2000.dts (100%)
> >  rename arch/arm/boot/dts/{ =3D> edac}/ecx-common.dtsi (100%)
> >  rename arch/arm/boot/dts/{ =3D> edac}/highbank.dts (100%)
> =

> Why edac?
> The most obvious name I can see here is calxeda.
> =

> >  create mode 100644 arch/arm/boot/dts/freescale/Makefile
> =

> Freescale has been part of NXP for a while, so it might make sense to
> merge the freescale and nxp directories. I can't speak for
> NXP-the-company, so that's just my view as a bystander.
> =

> >  create mode 100644 arch/arm/boot/dts/kirkwood/Makefile
> =

> The Kirkwood family should probably be sorted into Marvell.
> =

> >  create mode 100644 arch/arm/boot/dts/layerscape/Makefile
> >  rename arch/arm/boot/dts/{ =3D> layerscape}/ls1021a-moxa-uc-8410a.dts =
(100%)
> >  rename arch/arm/boot/dts/{ =3D> layerscape}/ls1021a-qds.dts (100%)
> >  rename arch/arm/boot/dts/{ =3D> layerscape}/ls1021a-tsn.dts (100%)
> >  rename arch/arm/boot/dts/{ =3D> layerscape}/ls1021a-twr.dts (100%)
> >  rename arch/arm/boot/dts/{ =3D> layerscape}/ls1021a.dtsi (100%)
> =

> The Layerscape family is part of Freescale/NXP.
> =

> >  create mode 120000 arch/arm/boot/dts/nxp/armv7-m.dtsi
> =

> armv7-m.dtsi is a bit confusing, because it contains a few devices at
> fixed addresses, so it looks vendor-specific at a first glance into the
> file. However, if it is actually as vendor-neutral as the name implies,
> I think it should live dts/ directly, rather than in vendor
> subdirectories.
>

Considering it's really just 3 binding IMHO it should be just dropped
and merged in other dtsi... But lets not extend this too much.
This is really just a simplic link and armv7-m.dtsi is placed in dts/
I create links in each oem that includes it to skip any changes to the
dts.

> >  rename arch/arm/boot/dts/{ =3D> nxp}/lpc18xx.dtsi (100%)
> =

> Here we have the NXP LPCxxxx family, which is AFAIK unrelated to the
> i.MX family (and thus the bulk of the Freescale legacy).
> =

> >  create mode 100644 arch/arm/boot/dts/vybrid/Makefile
> =

> Vybrid is another chip family of NXP, with a good deal of Freescale
> legacy in it as evidenced by the "fsl," prefix in the devicetrees.
> =

> =

> =

> Thanks,
> Jonathan

Thx for the hint hope to get more comments about the dubious
categorization about nxp and freescale.

-- =

	Ansuel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

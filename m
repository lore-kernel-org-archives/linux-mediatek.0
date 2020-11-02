Return-Path: <SRS0=vtlS=EI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D7E8C00A89
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2020 07:53:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37B6421556
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2020 07:53:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GTe0vPfC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="l2iXFvJ5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37B6421556
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5Sue3On/yzf06dzyOAYB5pohX9YwGuSeBhgu2YvpxCw=; b=GTe0vPfCSNSMj+an/+bU/EVLU
	8PTlclC1MTioC9FSJ30OqeOUBEiGJZ1I12FT7rGlCqTuChdHk1nqvsRFnEb5VF1zrBTzAZh/LdhmO
	+gRS23VfmmUMTtlKADpvRIFgLV0mZfQLiC/Mm04MJSqZM9VtPtzN7/0eldvK4qkdUP7RKwYT+P1Wx
	9vJpOpWMIRCdBy7xIJBosAORDDwGVcpbwPseuDH4sj9khcyv7Za4W9EcLaVwC3Z4lZBrcBBTrfg3c
	cbxjKW588nBbfGHJO6yjG0hRzGpgZwBqlONqdNrWZTO6Aorba7uB816uc+PG4GyOO1Pm67htZ3ZJz
	FGFMMF77w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZUey-0002Pf-C9; Mon, 02 Nov 2020 07:53:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZUes-0002OE-R2; Mon, 02 Nov 2020 07:53:44 +0000
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 41BE4223AC;
 Mon,  2 Nov 2020 07:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604303620;
 bh=iXFXlIxzo6mEuRbhfEI2cZTIEJwsOtvvLLIzi+xj3k4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=l2iXFvJ5TKiHGm2H2qhJ8UZhLfu+xl8wgP1683sivUlrippNMVG1tuFu3l+DOyNhk
 wACruFfQljRDZ2RQC2pgMo1x3MC4+4AaG9/rEPqSEBT5WqwH0X13fS3h9b3XrwBdpH
 QB8PXdcWoJ7NZXPCV3Fqs/T+UMfcgO2Qf5gXJt7s=
Received: by mail-ej1-f50.google.com with SMTP id p5so17609150ejj.2;
 Sun, 01 Nov 2020 23:53:40 -0800 (PST)
X-Gm-Message-State: AOAM531kULjzrY8ALaAm8kjeSJabdK/1Ox1Crz85NxfzqeL2BM+5qK8Q
 wWA2A4y2SdRgkRwr6t7/i3lE3ZrxKo9rapCprZs=
X-Google-Smtp-Source: ABdhPJwrevmNFDi1+ho8xYZZMC8Zs02UNBVWMPiQlQWPrCoMlPylk2aWDQx4j1s/36cKVA0piAyvfZef46tp+4IihZ4=
X-Received: by 2002:a17:907:d1e:: with SMTP id
 gn30mr1374045ejc.148.1604303618691; 
 Sun, 01 Nov 2020 23:53:38 -0800 (PST)
MIME-Version: 1.0
References: <20201030091254.26382-1-yong.wu@mediatek.com>
 <20201030091254.26382-2-yong.wu@mediatek.com>
 <20201031113623.GA4019@kozik-lap> <1604295074.26323.107.camel@mhfsdcap03>
In-Reply-To: <1604295074.26323.107.camel@mhfsdcap03>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Mon, 2 Nov 2020 08:53:26 +0100
X-Gmail-Original-Message-ID: <CAJKOXPfTmXuBOWgrmgCfQcqhXxoVjE=9T=m1weRS=H4hV0bYog@mail.gmail.com>
Message-ID: <CAJKOXPfTmXuBOWgrmgCfQcqhXxoVjE=9T=m1weRS=H4hV0bYog@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: memory: mediatek: Convert SMI to DT
To: Yong Wu <yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_025343_068344_15028301 
X-CRM114-Status: GOOD (  19.20  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Tomasz Figa <tfiga@google.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Fabien Parent <fparent@baylibre.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com,
 anan.sun@mediatek.com, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2 Nov 2020 at 06:31, Yong Wu <yong.wu@mediatek.com> wrote:
>
> On Sat, 2020-10-31 at 12:36 +0100, Krzysztof Kozlowski wrote:
> > On Fri, Oct 30, 2020 at 05:12:52PM +0800, Yong Wu wrote:
> > > Convert MediaTek SMI to DT schema.
> > >
> > > CC: Fabien Parent <fparent@baylibre.com>
> > > CC: Ming-Fan Chen <ming-fan.chen@mediatek.com>
> > > CC: Matthias Brugger <matthias.bgg@gmail.com>
> > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > ---
> > >  .../mediatek,smi-common.txt                   |  50 -------
> > >  .../mediatek,smi-common.yaml                  | 140 ++++++++++++++++++
> > >  .../memory-controllers/mediatek,smi-larb.txt  |  50 -------
> > >  .../memory-controllers/mediatek,smi-larb.yaml | 129 ++++++++++++++++
> > >  4 files changed, 269 insertions(+), 100 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.txt
> >
> > +Cc Honghui Zhang,
>
> As comment [1], Honghui's address is not valid now. I will act for him.
>
> >
> > Your Ack is needed as you contributed descriptions to the bindings and
> > work is being relicensed to GPL-2.0-only OR BSD-2-Clause.
>
> "GPL-2.0-only OR BSD-2-Clause" is required when we run check-patch.
>
> If I still use "GPL-2.0-only", then the contributors' Ack/SoB is not
> needed, right?

That would be one solution but I was thinking to proceed with only
your agreement. You were the main contributor to these files. Honghui
added a few descriptions. Other developers added only compatibles.
Since we cannot reach Honghui, I would assume that your agreement
(Sign-off) is enough.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

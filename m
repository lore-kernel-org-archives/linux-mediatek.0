Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9363FC07E98
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 08:09:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54A8E613BD
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 08:09:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54A8E613BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l1wSDJRCf8AQ692laJLAIU5X5R9C80tBKgJbZjWaIug=; b=vr/2E3Y5qfE4ZR
	kDLwBGxiupf8Nt+ZElbIMYQ0asy+NOwUPyUKui7E1FJHglcCOb8b/fDx8gDwiNjnpc594H4aoWApj
	p47jFNRl8KjXWWPfYGbtSRUBplJkihltUL+KMWbXr/O9U+O5paAzeL8ErACZ4ONvtuavNQwlsSGP8
	KG5j1uysnjg4TOnezH4j2CLfHcipcmDA2H7olIcOkPdqjmGLOuKEX0WpNcqzKkAKJPCXiwiMrTJAy
	MD8dzqqVzZQcG72XyU3/sAV4mjBinGejsNfPIITUu6ue72ITNMv19W9CQ02m4y+xOyqVLRrSXvi39
	EI1D74Szpg5dlHB04jrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0Jfb-008AcM-QI; Mon, 05 Jul 2021 08:09:35 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0JfY-008Aao-No
 for linux-mediatek@lists.infradead.org; Mon, 05 Jul 2021 08:09:34 +0000
Received: by mail-io1-xd2d.google.com with SMTP id v3so19970928ioq.9
 for <linux-mediatek@lists.infradead.org>; Mon, 05 Jul 2021 01:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6ZBH9ykzeoMrqSlrgZpvseA7xgJC3UHZbKlTJSyxYYE=;
 b=vMJVUcrQnNHyGr1e2E/BBoCJ6Ml9vmYjG8w3y4ezQrmHEogj/M4Ky5n/R11b3OUHP+
 GA0To8jdS+EcmI5/P9/WIwMSOKXzdcpQ56ciPZXsLuzhCebjrvgAjKMVj0ZSx/Rh9bv+
 oXlnbv/La5iOfvDexZJU47ZVPg07ff2LAUCfOgs6Y1t84ZdmUZwHHXcFdMnDGr08ohIi
 jAg4g2iJ6DEwZqa8bdRZInOXHa9ciiu9rr19zEl8/2xix+m5y77dPZvww9IhHTwvkUIg
 fume5Bf4qhsquNTGV8+6wI8MJW55gP3FMqs1E+rG3ZTrB4s3NzG7t1aErBKD70HBEFdZ
 dY8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6ZBH9ykzeoMrqSlrgZpvseA7xgJC3UHZbKlTJSyxYYE=;
 b=poA6ZMWIBthdsroh1gfhOsQfOYYZg9O5ABDoA5jT7oVr0Yhn2I+5ty9XXNogJ4Rkh1
 13Ln65LFl1SIUkMKfGA+tlkKtnHF06tQNlGoB+X93uDARLKhadT9dN3fqgeY+uJCIVPa
 RMBojxtg1N+LfyjCVunD6cXjNVECJDuv11l5YB948T0V0bYLX9QiNIShoENb10N7s7qO
 azaSQRTWMMzKUsICKFnncNuz7vHZ2lQ1r+1cQ4k59u+0UHyVhQmVkj2UEm+CsDFguqyY
 aeVvmVEu0z9DTjQOsogdZxzMNyqOJPNcP67efscdkxW8I17HwSFRBReUSlFSZgpP+e3u
 LSqg==
X-Gm-Message-State: AOAM531asKJE3PeXzFB9GbYYYdZjjqdACgH8V/doMcJJdo3fAJnWz6nC
 Js9OKCRuXyYiD9bSKxXn7G5/xihe6GrerQ27bt1dSA==
X-Google-Smtp-Source: ABdhPJwhLvFCwfzhhvvHGLbA3HvWk2qBShYvoOt9KTiT7lVNLd4KXAYWkrfEYA95oI9qjWhL1m8bENMubRJRcwBEMEc=
X-Received: by 2002:a5e:a612:: with SMTP id q18mr10954029ioi.76.1625472569703; 
 Mon, 05 Jul 2021 01:09:29 -0700 (PDT)
MIME-Version: 1.0
References: <1624428350-1424-1-git-send-email-kyrie.wu@mediatek.com>
 <1624428350-1424-2-git-send-email-kyrie.wu@mediatek.com>
 <CA+Px+wW6PrYihYo8F2Op8XPfVHMmO7ODRQrF75DQxc4gRM-qfg@mail.gmail.com>
 <1625039759.22769.3.camel@mhfsdcap03>
In-Reply-To: <1625039759.22769.3.camel@mhfsdcap03>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 5 Jul 2021 16:09:18 +0800
Message-ID: <CA+Px+wUXK2t42S0HgcOj7_kbkSskHGris5LBquTS3d+hi8kCaQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: mtk-jpeg: Add binding for MT8195 JPG
To: "kyrie.wu" <kyrie.wu@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Rick Chang <rick.chang@mediatek.com>, 
 Bin Liu <bin.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Tomasz Figa <tfiga@chromium.org>, 
 xia.jiang@mediatek.com, maoguang.meng@mediatek.com, 
 srv_heupstream@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_010932_829919_7C66A3AD 
X-CRM114-Status: GOOD (  16.41  )
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

On Wed, Jun 30, 2021 at 3:56 PM kyrie.wu <kyrie.wu@mediatek.com> wrote:
> Mt8195 has two hardwares, "mediatek,mt8195-jpgenc0" for hw0 and
> "mediatek,mt8195-jpgenc1" for HW1. These two nodes will register
> hardware interrupt, initialize clock, power domain, remap register base
> addr and other operations. But the device node is not registered.
> "mediatek,mt8195-jpgenc" will register the device node to represent jpeg
> encode device. Then the component framework is used to manage the above
> two hardwares.
Please don't top-posting.  Inline your replies so that people can
easily follow the discussion.

I still don't quite understand why it needs to introduce 2 compatible
strings.  If hw0 and hw1 are different from interrupts, clocks, power
domain, and etc, couldn't you use the same compatible string (e.g.
"mt8195-jpgenc") and provide them different DT attributes?

> On Fri, 2021-06-25 at 17:18 +0800, Tzung-Bi Shih wrote:
> > On Wed, Jun 23, 2021 at 2:06 PM kyrie.wu <kyrie.wu@mediatek.com> wrote:
> > >  Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt | 3 +++
> > >  1 file changed, 3 insertions(+)
> > Note: the patch won't apply after [1].
> >
> > [1]: https://lore.kernel.org/patchwork/patch/1445298/
> >
> > >  Required properties:
> > >  - compatible : "mediatek,mt2701-jpgenc"
> > > +- compatible : "mediatek,mt8195-jpgenc"
> > > +- compatible : "mediatek,mt8195-jpgenc0"
> > > +- compatible : "mediatek,mt8195-jpgenc1"
> > Why it needs 3 compatible strings?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

Return-Path: <SRS0=2T+p=G6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E99C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 19:09:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9F4E60C40
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 19:09:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9F4E60C40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EBQBOOLoZBhn9SijvC8FPV8GlFS3XYHre8Db8y5RdTI=; b=MMrHLA3520syRScrD3CwWLAb9
	hP1Dx8GuMeDjSjy666Y7fS+CXX4/nIi9MQz6kHnl0hckPxYsUxWlGWKs8pBs8v9uBqD1P0o47vbkS
	Vai1P5i9mSUHajfmavksGmetZtZfTIFTz3f80VeGvcgrV+MXD25MTRzdBw4O+EyLHwUfU5rlSGfFX
	wiVUtm3o9VBGOEQ/Yar8AGUGQDcexcMAdZ2bsy/TVe4aAm8eLvOCI1XSlFcFdahG2Q/7VvDBFnekU
	0u4X+1gHckMLyPhjYwPSGjRUPjgFH4l4/Ypv3T01EfJ8Uhs8w81gWm81BtkLXOho4LMBkj5hACSko
	Bdo1qlG9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4qCG-0008EN-Jx; Wed, 27 Jan 2021 19:09:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4qCB-0008Cs-Us; Wed, 27 Jan 2021 19:09:40 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C63EF64DC7;
 Wed, 27 Jan 2021 19:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611774579;
 bh=CxVDcZVJbTgcZjdsMfJhxJ/yjKbh0SkOEhIy1FhN6KI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dMLi9XGhBP7sr8rYS8BJ6RsXQgysILPqv1nJNJw5qZ2DyBAUhNdQHjQzvgV8VDl5V
 i9ALC6nJBeYrDal6V0wxRS4Oj1rRdlQYA2H+6vx80Ni8//ZnxbR84eJSWfwHwrfZ+m
 huSnvJCgYsqg1ZdsYmI36XpPssTAyzZXC+4+K+R4HGTQDEa3D+1wQRcxlMx60l4siq
 AfiYedGDWYh3rdmwOf3EskK8mgLe27CYkM02ik5LmlsDCtLrT6rKv/7dbdltGG8jZf
 /EYeZUc7HMTHGMwYIun5xzt1qfY9eHYEiUSksWtwoi1uycXl8bbKrxFsjyJ+0QBHbZ
 W+EkVBD/JX9uw==
Received: by mail-ed1-f43.google.com with SMTP id d22so3807608edy.1;
 Wed, 27 Jan 2021 11:09:38 -0800 (PST)
X-Gm-Message-State: AOAM533WnIScTJNkAAj5pxhnk/KqA11F1hbxQKm5dh2Uxwk94HiAR8JY
 V5GDQ8SEGd5ZFgUZfLfi02KBH561oGCWrZ0xfw==
X-Google-Smtp-Source: ABdhPJxDhEsE7SeDYEXoCEJP81XWI54Z2K7fxKs16oNcCLHvf630uv8EyH4cluj/eac/SPi55kJ7fCq1wMrnsmcwKMs=
X-Received: by 2002:a05:6402:1751:: with SMTP id
 v17mr10650676edx.289.1611774577245; 
 Wed, 27 Jan 2021 11:09:37 -0800 (PST)
MIME-Version: 1.0
References: <20210119105203.15530-1-yong.wu@mediatek.com>
 <YBFj9whLvqlV2erm@aptenodytes>
 <159d4486-bb7e-249d-2bad-f5bba839041d@arm.com>
In-Reply-To: <159d4486-bb7e-249d-2bad-f5bba839041d@arm.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 27 Jan 2021 13:09:25 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKgGOAe-ZSw9qJ7POVv5nJuX+UoJE-MS3drKrM119pw-w@mail.gmail.com>
Message-ID: <CAL_JsqKgGOAe-ZSw9qJ7POVv5nJuX+UoJE-MS3drKrM119pw-w@mail.gmail.com>
Subject: Re: [PATCH v2] of/device: Update dma_range_map only when dev has
 valid dma-ranges
To: Robin Murphy <robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_140940_117953_088F1F24 
X-CRM114-Status: GOOD (  18.57  )
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
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Frank Rowand <frowand.list@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Tomasz Figa <tfiga@google.com>, Linux IOMMU <iommu@lists.linux-foundation.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yong Wu <yong.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jan 27, 2021 at 7:13 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> [ + Christoph, Marek ]
>
> On 2021-01-27 13:00, Paul Kocialkowski wrote:
> > Hi,
> >
> > On Tue 19 Jan 21, 18:52, Yong Wu wrote:
> >> The commit e0d072782c73 ("dma-mapping: introduce DMA range map,
> >> supplanting dma_pfn_offset") always update dma_range_map even though it was
> >> already set, like in the sunxi_mbus driver. the issue is reported at [1].
> >> This patch avoid this(Updating it only when dev has valid dma-ranges).
> >>
> >> Meanwhile, dma_range_map contains the devices' dma_ranges information,
> >> This patch moves dma_range_map before of_iommu_configure. The iommu
> >> driver may need to know the dma_address requirements of its iommu
> >> consumer devices.
> >
> > Just a gentle ping on this issue, it would be nice to have this fix merged
> > ASAP, in the next RC :)
>
> Ack to that - Rob, Frank, do you want to take this through the OF tree,
> or shall we take it through the DMA-mapping tree like the original culprit?

I've already got some fixes queued up and can take it.

Suggested-by doesn't mean you are happy with the implementation. So
Acked-by or Reviewed-by?

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

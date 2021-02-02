Return-Path: <SRS0=G+wW=HE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 095A6C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 01:07:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A443764ED6
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 01:07:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A443764ED6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nL0IOeJtjqRdhxEqCfAchI65iweCChAGHCEIr8/HSrw=; b=XG9d1x8B9iCoaK9J3ZssWuIoa
	vJwgj489mRrh89ugpZ7QLxT4C+aU2ZQJMy2tVfGR6Nf1BDOGIAQvJRJfY/JKhY9WN8yecPy15GTIx
	+XohaiDQR3vtY4IsUKUpSB6QPzdagV1Odkrl8xGSzexIFQhlnhcrNtt2ADR91HuAcq3V0q/kuPsgi
	262wc1FTeAzExdSGSR6B1u8aQ70PuRqfo/kt1oyz42Qo5Ex6H3zGfNsMxpQYGFgXQJQrLcE9ApqkH
	Xvxz+BpJaswBhlUyWKdchRyFuwoar7mgm7SwOyVuUnw9NVfVapVlJX7RFGLNjCzoXlwGo9EoyM9wS
	WuZofmG/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6kAP-0000xC-K7; Tue, 02 Feb 2021 01:07:41 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6kAL-0000w2-Kb
 for linux-mediatek@lists.infradead.org; Tue, 02 Feb 2021 01:07:39 +0000
Received: by mail-qt1-x82a.google.com with SMTP id c1so13867875qtc.1
 for <linux-mediatek@lists.infradead.org>; Mon, 01 Feb 2021 17:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NszN4D5jzxy6frT0PN3aEj0vwxxqCzqxTFC21xlKA2c=;
 b=mzPpODks3Hz/c3k7qugw9y9nTN+2ETWrIEmwpYHyI23BXj3J6N2CmbedBCmDvne9e2
 uWBUZXHVTmVsGahn5gvR3D5CEcMo2U8XoFLapZ7aC00EzXj/poCNx4CLsMN4pKHclSGK
 JVb6OfBikmgd2t++YwljcC1c0B6Oz0kJHd01E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NszN4D5jzxy6frT0PN3aEj0vwxxqCzqxTFC21xlKA2c=;
 b=J0PjIHu4xrD5SvFli46gUCgvAGV7hOdwso2m8iNXQPMKsmADLb+lZ1sYD74+NLrXne
 gk/6xrxjarYCpmnlLhlLsQIS1wp+0Va1z8EnzE/KRCvwmjdZ3mcb0hWHzmeyQJ6qWYnW
 e/p6rjAWjhcoiuXV7Q95irocKK0dzPlPsucBTcFCW2ph1C7NSX4ziSsHV8jL1/GnGO81
 SSD5tetKIswOE6uB/Q5h0EAYXMxUoXbjGZhQrYFtw4C02GdTczky/0asw3a9x7vWKNAb
 CColbkl5H7PWJtrPfmtOjpMexf9SizmZsblPVa6jEJhf+AheKgvDxp74BVK4j2GXHb23
 YnUw==
X-Gm-Message-State: AOAM532GgHOwVkf7AlSt6760RuIcxD6ByAK0jfkDat0DtjTRA+jtneSJ
 8BdgzBTgCZCV0WYOlldviZNwTfkeorS71w==
X-Google-Smtp-Source: ABdhPJwPKVK7KSVgsSff2JcdX/qjL/G3Ao9izSRwxx8bdJ3ye70rQL4VBbRdEbvojazhuCbdGML9HQ==
X-Received: by 2002:ac8:46d4:: with SMTP id h20mr16277884qto.256.1612228054396; 
 Mon, 01 Feb 2021 17:07:34 -0800 (PST)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com.
 [209.85.219.180])
 by smtp.gmail.com with ESMTPSA id o45sm15096796qto.91.2021.02.01.17.07.31
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 17:07:33 -0800 (PST)
Received: by mail-yb1-f180.google.com with SMTP id e67so18769791ybc.12
 for <linux-mediatek@lists.infradead.org>; Mon, 01 Feb 2021 17:07:31 -0800 (PST)
X-Received: by 2002:a25:c683:: with SMTP id k125mr30638749ybf.32.1612228051259; 
 Mon, 01 Feb 2021 17:07:31 -0800 (PST)
MIME-Version: 1.0
References: <20210107122909.16317-1-yong.wu@mediatek.com>
 <20210107122909.16317-2-yong.wu@mediatek.com>
In-Reply-To: <20210107122909.16317-2-yong.wu@mediatek.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 1 Feb 2021 17:07:19 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xkn0pVGP5R7-xKjrDUTsrWRcy3L-D_qg8_hgV=noRhxA@mail.gmail.com>
Message-ID: <CAD=FV=Xkn0pVGP5R7-xKjrDUTsrWRcy3L-D_qg8_hgV=noRhxA@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] iommu: Move iotlb_sync_map out from __iommu_map
To: Yong Wu <yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_200737_681522_2D04FEB5 
X-CRM114-Status: GOOD (  15.49  )
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
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, LKML <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 Tomasz Figa <tfiga@google.com>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 David Laight <David.Laight@aculab.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, kernel-team@android.com,
 Greg Kroah-Hartman <gregkh@google.com>, Robin Murphy <robin.murphy@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Thu, Jan 7, 2021 at 4:31 AM Yong Wu <yong.wu@mediatek.com> wrote:
>
> @@ -2438,18 +2435,31 @@ static int __iommu_map(struct iommu_domain *domain, unsigned long iova,
>         return ret;
>  }
>
> +static int _iommu_map(struct iommu_domain *domain, unsigned long iova,
> +                     phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
> +{
> +       const struct iommu_ops *ops = domain->ops;
> +       int ret;
> +
> +       ret = __iommu_map(domain, iova, paddr, size, prot, GFP_KERNEL);

The above is broken.  Instead of GFP_KERNEL it should be passing "gfp".


> +       if (ret == 0 && ops->iotlb_sync_map)
> +               ops->iotlb_sync_map(domain);
> +
> +       return ret;
> +}
> +
>  int iommu_map(struct iommu_domain *domain, unsigned long iova,
>               phys_addr_t paddr, size_t size, int prot)
>  {
>         might_sleep();
> -       return __iommu_map(domain, iova, paddr, size, prot, GFP_KERNEL);
> +       return _iommu_map(domain, iova, paddr, size, prot, GFP_KERNEL);
>  }
>  EXPORT_SYMBOL_GPL(iommu_map);
>
>  int iommu_map_atomic(struct iommu_domain *domain, unsigned long iova,
>               phys_addr_t paddr, size_t size, int prot)
>  {
> -       return __iommu_map(domain, iova, paddr, size, prot, GFP_ATOMIC);
> +       return _iommu_map(domain, iova, paddr, size, prot, GFP_ATOMIC);

Specifically the above bug means we drop the "GFP_ATOMIC" here.

It means we trigger a warning, like this (on a downstream kernel with
the patch backported):

 BUG: sleeping function called from invalid context at mm/page_alloc.c:4726
 in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 9, name: ksoftirqd/0
 CPU: 0 PID: 9 Comm: ksoftirqd/0 Not tainted 5.4.93-12508-gc10c93e28e39 #1
 Call trace:
  dump_backtrace+0x0/0x154
  show_stack+0x20/0x2c
  dump_stack+0xa0/0xfc
  ___might_sleep+0x11c/0x12c
  __might_sleep+0x50/0x84
  __alloc_pages_nodemask+0xf8/0x2bc
  __arm_lpae_alloc_pages+0x48/0x1b4
  __arm_lpae_map+0x124/0x274
  __arm_lpae_map+0x1cc/0x274
  arm_lpae_map+0x140/0x170
  arm_smmu_map+0x78/0xbc
  __iommu_map+0xd4/0x210
  _iommu_map+0x4c/0x84
  iommu_map_atomic+0x44/0x58
  __iommu_dma_map+0x8c/0xc4
  iommu_dma_map_page+0xac/0xf0

---

A quick (but not very tested) fix at:

https://lore.kernel.org/r/20210201170611.1.I64a7b62579287d668d7c89e105dcedf45d641063@changeid/


-Doug

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

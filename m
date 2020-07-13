Return-Path: <SRS0=TL3J=AY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5D04C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 00:38:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 751C7206F0
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 00:38:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i42rS6Nq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KB727iWE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 751C7206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z4YvIfWplPVzMtM7KgTqFUKISBJwrxMiKk5SAuKt+Gg=; b=i42rS6NqK85+3iad74JTjPzMP
	ZFnrDBgLmne7iJ9gFc41cxSISzpikTrwaiH0+MOxUNmiMh8ePGh6DUMvrGsb+/8stz5TQ7geeYvYU
	fhYYsIYqTnGSHxsXesZ1HIyVJi10E0nLETaos+8DC0/er4ojlcDXju0gUKzvXJFzj1twVaxTz9dfL
	hdAYxBxQhs7S0tLLBVmEq9V7quPKa8ZoQ/dV9I+x5RLAMesAwa92hz1+fvI6lKDS+iEjqP6rSSNJz
	kbjtgPkkxLab2hdf2KrCc5XfwN+gpsNmlNZi3ovXxBKbd2WYSPFFFYhYcrMp9L4RLi+8pMYCfDgxW
	5ceubNw5Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jumUW-0003yS-Ad; Mon, 13 Jul 2020 00:38:44 +0000
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jumUQ-0003ww-VB
 for linux-mediatek@lists.infradead.org; Mon, 13 Jul 2020 00:38:41 +0000
Received: by mail-vs1-xe42.google.com with SMTP id m6so1606801vsl.12
 for <linux-mediatek@lists.infradead.org>; Sun, 12 Jul 2020 17:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g0AyRgeo4BEr9j6w4Przg7qSFRU4h688XiJcnxouhyk=;
 b=KB727iWE6w5PGxDvHa2wMRrbthwrun9FRgyTC4B4X7EbxLxG6FdFeC67YzVOR4lsHJ
 zyacQjO2mMSGubdbACm0TfaMStvb+6H3WogGdpeeIJm1xd8Iw2CS0a0Ob1BjenJom+xI
 dcKKYQB/EsxLk/eyTmJPjelq7Zl1iRYhjVfw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g0AyRgeo4BEr9j6w4Przg7qSFRU4h688XiJcnxouhyk=;
 b=cTONoC1TE5qwTsG5O76KkcN3wAWdugMU5r9SIvtISUz3f1mG+Y0TBn4fd1J2dSTjbC
 jwRu8cFphgaqRHsfz+n9TNpRNtQiz4YJV3AhOGhpoznWqGi/bWsot+yLlsPVX/EsDzN5
 QM6aNq2p0BUj38FQBl53EPs9D6AMxTiwlf479hGY4z/RuwrKsS1FSWmCz5/UO2z0Ag8y
 VQQcHsMJukRpUq3DW3MuMuRPzU4t0K5jatGJr8DJtPAFBEujjfb13AG86sCG6LlXwcSR
 8fjuk2XjoLSCBM0TI7hABQ/VTid4W6YB+MrU+YvOJHwEB/oknNuxwTP7P+xEWtp/1ebz
 j/ww==
X-Gm-Message-State: AOAM533RJtcUj+y6paaikKsg+dTK52TJ0nzjUhHqwVu4O/6zO7onsSzk
 8m+xsaUtf1Q/1izFn653nrz29H5vNGBeuCMEHbEmIA==
X-Google-Smtp-Source: ABdhPJyT1J4v4BmuydEm21M0iODeO7rG9nBCEHI+CqgAFKtghpRKBPQRwE/iexbiZAAoAgeSe+cmOhjfU0b5xXQV/no=
X-Received: by 2002:a67:f5c6:: with SMTP id t6mr13334091vso.14.1594600715022; 
 Sun, 12 Jul 2020 17:38:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200711064846.16007-1-yong.wu@mediatek.com>
 <20200711064846.16007-7-yong.wu@mediatek.com>
In-Reply-To: <20200711064846.16007-7-yong.wu@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 13 Jul 2020 08:38:24 +0800
Message-ID: <CANMq1KAhFCWfywV=OiHgW00pof8K8TdwC6Hzgyj=QWSiWBf1ag@mail.gmail.com>
Subject: Re: [PATCH 06/21] iommu/io-pgtable-arm-v7s: Use ias to check the
 valid iova in unmap
To: Yong Wu <yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200712_203839_113687_4193DD89 
X-CRM114-Status: GOOD (  15.16  )
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
Cc: youlin.pei@mediatek.com, Devicetree List <devicetree@vger.kernel.org>,
 cui.zhang@mediatek.com, srv_heupstream <srv_heupstream@mediatek.com>,
 chao.hao@mediatek.com, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, lkml <linux-kernel@vger.kernel.org>,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com,
 anan.sun@mediatek.com, Will Deacon <will@kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Jul 11, 2020 at 2:50 PM Yong Wu <yong.wu@mediatek.com> wrote:
>
> As title.
>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/iommu/io-pgtable-arm-v7s.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
> index 4272fe4e17f4..01f2a8876808 100644
> --- a/drivers/iommu/io-pgtable-arm-v7s.c
> +++ b/drivers/iommu/io-pgtable-arm-v7s.c
> @@ -717,7 +717,7 @@ static size_t arm_v7s_unmap(struct io_pgtable_ops *ops, unsigned long iova,
>  {
>         struct arm_v7s_io_pgtable *data = io_pgtable_ops_to_data(ops);
>
> -       if (WARN_ON(upper_32_bits(iova)))
> +       if (WARN_ON(iova >= (1ULL << data->iop.cfg.ias)))

This is a little odd as iova is unsigned long and 1ULL is unsigned long long.

Would it be better to keep the spirit of the previous test and do
something like:
 if (WARN_ON(iova >> data->iop.cfg.ias)) ?

>                 return 0;
>
>         return __arm_v7s_unmap(data, gather, iova, size, 1, data->pgd);
> --
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

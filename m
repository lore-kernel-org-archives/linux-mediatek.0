Return-Path: <SRS0=TL3J=AY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 030D2C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 07:34:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3089206F0
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 07:34:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tXrUQ51B";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mn5gncYv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3089206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=K8cpWzFxppjljNCB/pBbVZPMscduhyPeNCyk+esk+/8=; b=tXrUQ51BswM5GTQCFVWA+VD8P
	II2uTbjBkdhNALXsPWS9ryRcWlCnb2Jft3BG9T8UvURCcig2q9Z73Bbk/kSZCag2wVjbGq7VhByPm
	INZAONpThu8QFM3oxy12+5HvmmL2wxH12SoD/y3y+PSw+vTO8Qx3cHCsqQabBTLtEm39SzjCKmc2o
	WStnefC2vDELsl3XpI8PACs4j9bx2DOFaMhFGMpoX6mT8dS5yHjbXlg+r5VhUPyxLjFtBp12hvK0a
	jWLSZyDHPigkOu899kTwIlGtzttXLNDUkW7VyEpXy3BpDFDnI2YU9OdZ4+D7n+ZWOZmGoECYFeH3j
	A6pafoyBA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jusyv-0006AY-B5; Mon, 13 Jul 2020 07:34:33 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jusyp-00067q-IM
 for linux-mediatek@lists.infradead.org; Mon, 13 Jul 2020 07:34:28 +0000
Received: by mail-ej1-x642.google.com with SMTP id p20so15204954ejd.13
 for <linux-mediatek@lists.infradead.org>; Mon, 13 Jul 2020 00:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Mv5WdsbJHcmRfr1CWAqVLgCzyD2WDHyCcH3cW9CT870=;
 b=mn5gncYvlT0Ikasjdu4y+nGbhp8qf0g/S/fJiCGf6woiq1WyBZiFigDT3Qp1D2tYTI
 pmW6YdaDNjwHR3PrL+IiKlbCPjioM14hSjLWkaH1Hv6Cac70Zw6Oxga2x9v5s8SMy/5x
 GmsD0Ru1j+a4thlGopDDg3e8+Sd1/EIjJPBh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mv5WdsbJHcmRfr1CWAqVLgCzyD2WDHyCcH3cW9CT870=;
 b=ETs5IbVFuiEdadyf6+bcx2/sWxpoFmH8SMJ5UmfmYBdJA6Z5rQrvg7YCDZm+s62w1B
 KR9w2DraNvhU+ozlr3V7INWgpuWvpPoFzgCVUs2Oof3DvQLp4Em/yx5fQZAwcdNh6mlN
 zYMYO2mEakUPSKHgFWTWdClvl4LclOL37UgXEg6dEUYqsd9WqI10u0GVMK/ao/YnoN8L
 ntcUTK7twpPTuhqCyyXD5rGzimGzZlWsM5oDb5pQFv7SAFjOd/bD1MPTuBMhtjBNejEv
 9UinPr10Ak09oDOUjK7Lwkvw9CebGjFUdQLzyBukEX30YE+WUqmgwy/+5CeGXpQTw26n
 G5JA==
X-Gm-Message-State: AOAM532re1xPXFQ4BkHt8QwiwOOu12tdatKAqM1o4nhuOTNcdWcJugjF
 bltShIwtugVZEnwnw3rCy2KeEUfPuH0Efm/5Jkbp1jfhBVxD7g==
X-Google-Smtp-Source: ABdhPJz7YORADPzpZtFVoxEClRzjUf3OF/9u0ANmR6SeAWwU4pfqH4KGc+q797K0VN2/NzCee6zahEJc92V4Gk3su/c=
X-Received: by 2002:a17:906:1db1:: with SMTP id
 u17mr64544271ejh.72.1594625666473; 
 Mon, 13 Jul 2020 00:34:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200711064846.16007-1-yong.wu@mediatek.com>
 <20200711064846.16007-13-yong.wu@mediatek.com>
In-Reply-To: <20200711064846.16007-13-yong.wu@mediatek.com>
From: Pi-Hsun Shih <pihsun@chromium.org>
Date: Mon, 13 Jul 2020 15:33:50 +0800
Message-ID: <CANdKZ0d8CSWQepCj9RFFxrvYq8K8G=oZCnskRiA3aY3gY-DD=w@mail.gmail.com>
Subject: Re: [PATCH 12/21] iommu/mediatek: Add iova reserved function
To: Yong Wu <yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_033427_664245_34DC0CC5 
X-CRM114-Status: GOOD (  15.91  )
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
Cc: =?UTF-8?B?WW91bGluIFBlaSAo6KO05Y+L5p6XKQ==?= <youlin.pei@mediatek.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 cui.zhang@mediatek.com, Hao Chao <hao.chao@mediatek.com>,
 srv_heupstream@mediatek.com, chao.hao@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 open list <linux-kernel@vger.kernel.org>, Evan Green <evgreen@chromium.org>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com,
 anan.sun@mediatek.com, Will Deacon <will@kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Jul 11, 2020 at 2:51 PM Yong Wu <yong.wu@mediatek.com> wrote:
>
> For multiple iommu_domains, we need to reserve some iova regions, so we
> will add mtk_iommu_iova_region structure. It includes the base address
> and size of the range.
> This is a preparing patch for supporting multi-domain.
>
> Signed-off-by: Anan sun<anan.sun@mediatek.com>
> Signed-off-by: Hao Chao<hao.chao@mediatek.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/iommu/mtk_iommu.c | 37 +++++++++++++++++++++++++++++++++++++
>  drivers/iommu/mtk_iommu.h |  5 +++++
>  2 files changed, 42 insertions(+)
>
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 03a6d66f4bef..fdfdb75706e0 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -151,6 +151,11 @@ static LIST_HEAD(m4ulist); /* List all the M4U HWs */
> ...
> +
> +static void mtk_iommu_put_resv_regions(struct device *dev,
> +                                      struct list_head *head)
> +{
> +       struct iommu_resv_region *entry, *next;
> +
> +       list_for_each_entry_safe(entry, next, head, list)
> +               kfree(entry);
> +}
> +

This is the same as generic_iommu_put_resv_regions, use that as the
.put_resv_regions callback instead?

> ...
> --
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

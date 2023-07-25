Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8DAC00528
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jul 2023 08:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JQlid0H2jkWZz9fgcu7Ae/8sWUNA4lIusDDxBLqkgag=; b=vPrWPg3NnIqyG7gbaCBvlXq9Bq
	5oZTQIUOweJh4eXRb3PaT4EyrBxH+4zpD5YwfYfcRnvbDcU6di1X2OfheVBYe8F7cIWWIzN4HT9tL
	L/JG/4tIdYqZOWCIVFQ5XYtsbtmNDAyb7YCtKmrk48/nmjBFdyLxu9BjlrfL2pYVr36OY3I9Igrnq
	r9lwXH9pB2vIrlK62T/ycmgYJZcqeYhlZv3tch6FNehRcU5d+DIRn430A6WUexIUTfLicOeK8wY08
	KKpC7vqudYsPshgnxuCrh6gyZmXNGUuvG4fRnAIje+BDdJfxb/SdaprCvVIgzqvApBl/dQHCiKii1
	2X2v/cZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOCyG-006gHG-15;
	Tue, 25 Jul 2023 08:00:40 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOCyE-006gFo-0H
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Jul 2023 08:00:39 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3461053677eso12375665ab.0
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Jul 2023 01:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690272036; x=1690876836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQlid0H2jkWZz9fgcu7Ae/8sWUNA4lIusDDxBLqkgag=;
        b=A/uLkzbDCvjpk3unTr6bJvbBj17r0jKVmvMc4rMvViTCRDbLnMfqDslU2uPtuTxfZO
         gq8SRcTDvdt5wkLjt0GCOJs5ucdWueqZ9PpWkDCaI66gICLMl8zJVQOaDYWa1XrECU1m
         6Wwb73IVCvBZCsPp3SAZdZIPm6Uee2QwU1G24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690272036; x=1690876836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JQlid0H2jkWZz9fgcu7Ae/8sWUNA4lIusDDxBLqkgag=;
        b=YotKPKuSyAr6cnY35CQTgY/cyZKW/+nUw5JgHpVgFhvumKhPDW1Eo4e4UHvABt475A
         lbiO3ZZ9R3dNzxnwZoclfflQ4A0WGNNSjzkKNkFpvFHrQEGJzsQuwPi/PvzxSM11Yrdp
         tro17ocXWgW7BtgInKM2B8BvJV5v/Hjdph0vy63SX1ePLuNYm+ahx7KwI1e1f8OY43IS
         y4Zsr/OBngyfAxd4idyuVBYaDz24AUa3G61lLgb1of8RNhmNPi6EXogZNIPgXPOOP4IU
         aSYbcFvVkdyAUhGZR8DsO+t4arhNWxYWfqZUSkL5fC16+xowVWYabXOLaMK4JoySwsyZ
         Dq+Q==
X-Gm-Message-State: ABy/qLaUFEVxPevB8niDssPMI+EZcW2UeyU3wtOKIaGoy2hF+qAMTuA6
	FMKtmCjaxsUd0CmfVluEoNwIqjJ+tPs76d1Ev4M=
X-Google-Smtp-Source: APBJJlEBLSSeYnXPVuDt8R2WipCmDAMA3LW0tNTs2DpYFO8mpJLKhE0Ykx/YpKIAVu3HsYRgYFnwUA==
X-Received: by 2002:a05:6e02:1be3:b0:348:8da5:87a0 with SMTP id y3-20020a056e021be300b003488da587a0mr1449070ilv.9.1690272036456;
        Tue, 25 Jul 2023 01:00:36 -0700 (PDT)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com. [209.85.166.50])
        by smtp.gmail.com with ESMTPSA id j15-20020a056e02014f00b0034601fbfd01sm3522516ilr.79.2023.07.25.01.00.36
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 01:00:36 -0700 (PDT)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-7835ffc53bfso124174639f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Jul 2023 01:00:36 -0700 (PDT)
X-Received: by 2002:a6b:8d82:0:b0:789:dcd1:8eb9 with SMTP id
 p124-20020a6b8d82000000b00789dcd18eb9mr1029181iod.6.1690272036013; Tue, 25
 Jul 2023 01:00:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230602090227.7264-1-yong.wu@mediatek.com>
In-Reply-To: <20230602090227.7264-1-yong.wu@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Tue, 25 Jul 2023 15:59:59 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhgkj5zh-Oa+OJjZKmkNMfG63+WjSefB2swybm29KxDXA@mail.gmail.com>
Message-ID: <CAC=S1nhgkj5zh-Oa+OJjZKmkNMfG63+WjSefB2swybm29KxDXA@mail.gmail.com>
Subject: Re: [PATCH v12 0/7] MT8188 IOMMU SUPPORT
To: Yong Wu <yong.wu@mediatek.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, iommu@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	mingyuan.ma@mediatek.com, yf.wang@mediatek.com, jianjiao.zeng@mediatek.com, 
	chengci.xu@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_010038_153193_7FADD0B8 
X-CRM114-Status: GOOD (  17.50  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jun 2, 2023 at 5:03=E2=80=AFPM Yong Wu <yong.wu@mediatek.com> wrote=
:
>
> MT8188 have 3 IOMMU HWs. 2 IOMMU HW is for multimedia, and 1 IOMMU HW
> is for infra-master, like PCIe.
>
> About the 2 MM IOMMU HW, the connection could be something like this:
>
>         IOMMU(VDO)          IOMMU(VPP)
>            |                   |
>       SMI_COMMON(VDO)      SMI_COMMON(VPP)
>       ---------------     ----------------
>       |      |   ...      |      |     ...
>     larb0 larb2  ...    larb1 larb3    ...
>
> INFRA IOMMU does not have SMI, the master connects to IOMMU directly.
>
> Although multiple banks supported in MT8188, we only use one of them,
> which means PCIe is put in bank0 of INFRA IOMMU.
>
> So we have two pgtable for MT8188, specifically, these two MM IOMMU HW
> share a pgtable while INFRA IOMMU HW use a independent pgtable.
>
> Another change is that we add some SMC command for INFRA master to
> enable INFRA IOMMU in ATF considering security concerns.
>
> We also adjust the flow of mtk_iommu_config to reduce indention.

A friendly ping - this series was reviewed, but I'm not sure if it's
still on the radar today.
This can be cleanly applied on top of next-20230725.

To give more confidence, I also tested the basic multimedia and infra
functionalities on my MT8188 with this series, so

Tested-by: Fei Shao <fshao@chromium.org>

to the entire v12 series.

Regards,
Fei


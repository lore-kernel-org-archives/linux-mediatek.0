Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9B8CD3432
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 01:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PvRZLPqqTs6XU4Vq4LYbTofQlpvUuAuHUNr6aENGrRU=; b=ORVdHBSrLAx+AKje7bIVviFtLg
	WJ8+TIhGHsjxBlnLP45C7CG7Kh8/3GyQR4wd/2ng1yPjw6Za/QjdXYKQYzo0o1t6PY+CdlEPvnHER
	CGaJZwAGDHjhaL0rOlQONgAqlK9MtZW1peLdp+scRAE+S1C2mtUah+kvFe+UTn5mcFDOdRSg5Sk9S
	yj7ej7NHYvyQ6h6U34w2RMwDSQTlcc1Swu57xhQleJrKEsB8fKOlg5grilU+VYTI5Xu9pSJQbnaz8
	zKnd0eQsBkpP8BbqHXOfMSOuBAeRYw8tG/hQacoQZjDH5cA+AhCs6tPs9z4f74JZITHwc7/qtyq4q
	ba+kXdtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiPMe-00GdxW-0B;
	Tue, 19 Sep 2023 01:17:20 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiPMa-00Gdvo-1H
	for linux-mediatek@lists.infradead.org;
	Tue, 19 Sep 2023 01:17:17 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9a9f139cd94so694372766b.2
        for <linux-mediatek@lists.infradead.org>; Mon, 18 Sep 2023 18:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695086232; x=1695691032; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PvRZLPqqTs6XU4Vq4LYbTofQlpvUuAuHUNr6aENGrRU=;
        b=u8BSKgQrmx5Rly6flFSFpkQ20EtVnrJIXRTVW/IAPzoT1nxUCioVqZnZJWKtJppEBH
         UHC45cyVgI7DOEJphQHon1WT1Hnj5gjXfPJ/2ZYSdJZF5T+rjlHyAgRBA8PthvSX/BpD
         n1NgIoHPlTAd0xircPUEofPAnYezk5/wQtSneu9R9WI/V24fUoCfC18PbbSBR3EyWb6v
         tnUljMEv+65bdngU2/ZETCNV1IpL/7takX/idHkwas6QtzpU9wIQ8gUysm9OzWTjPYuR
         gh4VXmA+WlSFaagA8ffjoOd2VudqvI+7feqyBWwHomdIkNNS4PpGncBgi4+AHxNFG9LT
         /GXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695086232; x=1695691032;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PvRZLPqqTs6XU4Vq4LYbTofQlpvUuAuHUNr6aENGrRU=;
        b=LMpXM6HN9tTsdYS+ReinSnhLA2UP5TITayMvyMsucYZfvVheEILVRdlv9I7T9d1ert
         XanyEuN+L2+WsX63ew1VLQC1bP2n7bPbbB7j6O99CbGEUSpqkWfKI+HoUUBrOv8ZRR4b
         hdDC27GCzvnKtS66RsQilLd/5Mwa6RPvvf4YxF5DvEE1h595jZCLVu4GNDP0Cd37IPSu
         WsuA8JffyO29IWwCeUP3X07TSZItjsZCbTDvdJ/FdWJK6j6LlCWfJPpVFZ00f+JYdD2F
         8r9B6ykRygQFx9tfaoU3aFPOXUxcBCXUhnLw965SY73sGkUPsnHvLCLRHd7TUf9bZZ9L
         vWzA==
X-Gm-Message-State: AOJu0YwwWJWIcuOt/Q8MiyoYneVyYCvLQIiqgeyf6KgF0eKFqq/mmbdl
	/W6A+xD/d++BGtRZ/2fMGstV8Q==
X-Google-Smtp-Source: AGHT+IEA/aai0FCc2yuuCJiETggbIYU6gkj8QXBRxDW/fJIwmR3c2jahedHvJ0G0qQaBP1Nk8v23ag==
X-Received: by 2002:a17:907:7717:b0:9a5:cc73:a2a6 with SMTP id kw23-20020a170907771700b009a5cc73a2a6mr9189708ejc.14.1695086232647;
        Mon, 18 Sep 2023 18:17:12 -0700 (PDT)
Received: from p14s (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id z10-20020a170906714a00b00991e2b5a27dsm6989592ejj.37.2023.09.18.18.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 18:17:12 -0700 (PDT)
Date: Mon, 18 Sep 2023 19:17:09 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Laura Nao <laura.nao@collabora.com>, tinghan.shen@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	andersson@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
	robh+dt@kernel.org, kernel@collabora.com
Subject: Re: [PATCH v17 00/14] Add support for MT8195 SCP 2nd core
Message-ID: <ZQj2lSl47qZQv8fX@p14s>
References: <ZQH2dG+l/dONUsyi@p14s>
 <20230918103141.126271-1-laura.nao@collabora.com>
 <CAGXv+5Esi=G0xgkP=+Bhf39Xs3gMN1PBzarxKBKduOjgwDijAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5Esi=G0xgkP=+Bhf39Xs3gMN1PBzarxKBKduOjgwDijAA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_181716_439875_1D86A5FB 
X-CRM114-Status: GOOD (  20.64  )
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

On Mon, Sep 18, 2023 at 06:44:25PM +0800, Chen-Yu Tsai wrote:
> On Mon, Sep 18, 2023 at 6:32 PM Laura Nao <laura.nao@collabora.com> wrote:
> >
> > > Other than patch 2 and 14, I have applied this set.  The remaining patches will
> > > have to be resent to Matthias.
> >
> > > Thanks,
> > > Mathieu
> >
> > Hello,
> >
> > With patch 2 missing, the SCP is not probed correctly anymore on asurada (MT8192) and kukui (MT8183). The mtk-scp driver relies on the existence of the `cros-ec-rpmsg` node in the dt to determine if the SCP is single or multicore. Without patch 2 the driver wrongly assumes the SCP on MT8192 and MT8183 are multicore, leading to the following errors during initialization:
> >
> > 10696 04:33:59.126671  <3>[   15.465714] platform 10500000.scp:cros-ec: invalid resource (null)
> > 10697 04:33:59.142855  <3>[   15.478560] platform 10500000.scp:cros-ec: Failed to parse and map sram memory
> > 10698 04:33:59.149650  <3>[   15.486121] mtk-scp 10500000.scp: Failed to initialize core 0 rproc
> >
> > The issue was caught by KernelCI, complete logs can be found here:
> > - asurada: https://storage.kernelci.org/next/master/next-20230914/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-nfs-mt8192-asurada-spherion-r0.html
> > - kukui: https://storage.kernelci.org/next/master/next-20230914/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
> >
> > Reporting the issue so that patch 2 and 14 can be resent and merged soon.
> 
> This being a backward incompatible DT binding change, maybe we should revert
> the node name change. Or, the driver could simply count the number of child
> nodes that have the "mediatek,rpmsg-name" property, which is required.
> 

You have a point.  Can someone send a patch that makes this patchset backward
compatible?  Please do so as quickly as possible to that it can go in the next
merge window with the rest of this feature.  Otherwize I'll have to back out the
whole thing.

Thanks,
Mathieu

> ChenYu


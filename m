Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15266CD342F
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 01:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WA9SbgZBS2d7r+giDCDiM8qHprOh9fflcSF1kPyE+mg=; b=bVvqbM9bZOMeaW+kW3r6cMS+91
	7zm26OghUCc0S/diCYo/Iz4UczKUzxyHLK9lWvx9EbtVc+wmJL4mT2YQKxW9PTg7hJYA3WByV+xLy
	tBl2QMe3KGcufCFOpuPuoZNeDZqWkA0Ptcg6K8M5V2kH9HD+Yj4YxyBsaB+mIkx/p4wSl/5KKyIbN
	WImxy5krL8AQJOwOjk/ECehOvaVsaDeqensaKX8HCyk7/06/lzGu1zm2UiNfW2l3NLpf7LBhEe2zF
	GAmjqL/HjU7ij42ztJs9X1oc6WqPvCQkirtUEXzLdB8wcv5CGPPxyUo4wv+xHjyyqKPAxcEl5lbXR
	MMYx21bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiPJt-00Gddj-1G;
	Tue, 19 Sep 2023 01:14:29 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiPJq-00Gdce-0G
	for linux-mediatek@lists.infradead.org;
	Tue, 19 Sep 2023 01:14:27 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-991c786369cso696880266b.1
        for <linux-mediatek@lists.infradead.org>; Mon, 18 Sep 2023 18:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695086062; x=1695690862; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WA9SbgZBS2d7r+giDCDiM8qHprOh9fflcSF1kPyE+mg=;
        b=sVVzOx/yqfi+zBqZZOPU5DzesMlJQNGpvmFZnlJUhAlRhKq3Expu9njnV5hldLPxm3
         rglVY3lVJ/f4IiY0iiPAFxN195t3tQqZ8zh31EjhwBzrf8IUd0bPvDC7Q7W/lKXQyAIc
         40g8LNYtNaL9pHmOp10dZ14iL5tElK4nkY2QAfBYqoacqRcS+Av/cXTXUDTh5tcpK/L/
         KO1z3gneik0R4YehWqpFq5DMtKgjPqGQBQyRjq7xa71+VPpfYLK9ymhetV8LvHeHswzg
         3oEqduyOX7ofaSZ8AKvpPMdSO0i1NAAcqG+BRnPGjLYLD60u6kzVNdqAcLqDa+gO6Ujn
         R+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695086062; x=1695690862;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WA9SbgZBS2d7r+giDCDiM8qHprOh9fflcSF1kPyE+mg=;
        b=qRj2wrZtBd1uAQ1SQWeLzz8/oejV/vbdIYkZ+jNsgt3TB8ScVO/vsE8DsEbmc7tQ54
         XELU7RuV+e+ijvEJd7Rle/vsj8d0n0ECKaqUp1KfV3IANie2zR1CDkWeKTQw/I3PsjVj
         nudlSam3rPTiNfj++F/2s488F8/zH65IDcOyw8p0nk80CRK/GtOGfUzi4E9IGjYsLTZP
         zWdCjbHGnTKgTWOWynkzxnCXPcw7J/tKcXAvEwMwDp/Hd4+9YNcQgLvpSxPkopdVlXMN
         p4/o9+S9MRWN9XzPV0B58Z1veXWmg860kK0tgqjuhoJcr+yYSZpcQCcau9L5CvqY9mRg
         Ikwg==
X-Gm-Message-State: AOJu0YwtEgUe2+mZGmLDZalnM91VD7AaLfm9JQCG4BKQh3urUrSsRFhe
	elMPDBzERrAPm4pzFT4P/OhLNw==
X-Google-Smtp-Source: AGHT+IFc4395RdOi+9dnmD35OMMHJNoIlb+eoF7osT1BHi2cs5ABN5XhkVj3C/6cd39Dibx5sALVhw==
X-Received: by 2002:a17:907:2c64:b0:9a2:139:f45d with SMTP id ib4-20020a1709072c6400b009a20139f45dmr8175665ejc.43.1695086060930;
        Mon, 18 Sep 2023 18:14:20 -0700 (PDT)
Received: from p14s (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id z10-20020a170906714a00b00991e2b5a27dsm6987169ejj.37.2023.09.18.18.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 18:14:20 -0700 (PDT)
Date: Mon, 18 Sep 2023 19:14:17 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Laura Nao <laura.nao@collabora.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, andersson@kernel.org,
	angelogioacchino.delregno@collabora.com, conor+dt@kernel.org,
	devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
	robh+dt@kernel.org, tinghan.shen@mediatek.com, kernel@collabora.com
Subject: Re: [PATCH v17 00/14] Add support for MT8195 SCP 2nd core
Message-ID: <ZQj16b1NvkDlij+H@p14s>
References: <ZQH2dG+l/dONUsyi@p14s>
 <20230918103141.126271-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230918103141.126271-1-laura.nao@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_181426_163117_3897ADCE 
X-CRM114-Status: GOOD (  15.19  )
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

On Mon, Sep 18, 2023 at 12:31:41PM +0200, Laura Nao wrote:
> > Other than patch 2 and 14, I have applied this set.  The remaining patches will
> > have to be resent to Matthias.
> 
> > Thanks,
> > Mathieu
> 
> Hello,
> 
> With patch 2 missing, the SCP is not probed correctly anymore on asurada (MT8192) and kukui (MT8183). The mtk-scp driver relies on the existence of the `cros-ec-rpmsg` node in the dt to determine if the SCP is single or multicore. Without patch 2 the driver wrongly assumes the SCP on MT8192 and MT8183 are multicore, leading to the following errors during initialization:   
> 
> 10696 04:33:59.126671  <3>[   15.465714] platform 10500000.scp:cros-ec: invalid resource (null)
> 10697 04:33:59.142855  <3>[   15.478560] platform 10500000.scp:cros-ec: Failed to parse and map sram memory
> 10698 04:33:59.149650  <3>[   15.486121] mtk-scp 10500000.scp: Failed to initialize core 0 rproc
> 
> The issue was caught by KernelCI, complete logs can be found here:
> - asurada: https://storage.kernelci.org/next/master/next-20230914/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-nfs-mt8192-asurada-spherion-r0.html
> - kukui: https://storage.kernelci.org/next/master/next-20230914/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
> 
> Reporting the issue so that patch 2 and 14 can be resent and merged soon.
>

Apologies for the trouble here, the error is mine.

I have applied and pushed patch 02 - please confirm that things are working as
expected now.  Matthias will need to either ack patch 14 or pick it up himself.


> Best,
> 
> Laura
> 


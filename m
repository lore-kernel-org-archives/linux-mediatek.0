Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0363CC636D6
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 23:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CUtIlqowlh77/2rCcvCPqEo8bYeoC8RahUA3A2M1OwM=; b=hFHeiYZuaEbvjFY9WUn9s+1diV
	KspH1DMKBBWcCQ7TBBEesPoN9yiivFE/zzebNedD3vayfl5IzmPtgfpoVDTMm+xLbRmTIAWiKzv7/
	373FWMqPUOstbJ5tpQk1Wgd/krGsNUUR5hDoerSQP14hqbT81XXh/IsLMowez4srbo3l8qvHFihXh
	esrzEgugvmJSpvkeIKSYt4XAfl/6Ul9b5R43DvNmgfl8MyCxugmtdimoiUhUpoUTcG6baQwX96oSR
	11pksRcewl3ojFbMBCTZ1OF45s4Tx5SiWkpVGofWUDMS5rhagt0N1+PXTc9uxhyNbNUP2s3HRIpZm
	IAhy2BcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNjFv-00HRKt-87; Thu, 02 Feb 2023 23:44:39 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNjFk-00HRJS-Hk; Thu, 02 Feb 2023 23:44:30 +0000
Received: by mail-ot1-f49.google.com with SMTP id v24-20020a05683011d800b0068bdd29b160so916146otq.13;
        Thu, 02 Feb 2023 15:44:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CUtIlqowlh77/2rCcvCPqEo8bYeoC8RahUA3A2M1OwM=;
        b=Fx8VO44mQVZF6WTEqLfiBFNGJptpFDhvLJC06EdHo8cAqDxe/iNeDyfwsq/ZFGakPV
         FCo1RhQN9yNf4W+csjN0ZKaCLEDqYYvbh9C/pnR5qwmVeXU8797Cfvr/NCekylqvelsJ
         ghFtBI3EdmlPah/orS3bjyy78ev/nyejJqUvvyYtrQ8UVrQ3NVBcaSj9mREsIeDyalst
         SR4zIjs7WIUfrlbqh3px+mi9+bSuQAkwi+NLGg6RZ2QBPjz0qDXQap4oMzWM0YRMT3o9
         yZYU/+0AjfD1oqpwwSfLbIwToStDB9txWSGp3uwXyKoNhuya/iGnHp6HPmxUXGODJPGc
         iArg==
X-Gm-Message-State: AO0yUKVEXyw4MyCC9jnWNGwGMnCqBtXeIZ8qiYg5CcHKX/60vcB8lA99
	5TYcII4BmeoOiueQEpFVDQ==
X-Google-Smtp-Source: AK7set/QrFi2MQe/q9DdZissE1xaOXkrFs42A3E3MZWLN/cgUehiBDdNmYDs9PB1jCYYQD5oMreucg==
X-Received: by 2002:a9d:6749:0:b0:68b:d4bd:c375 with SMTP id w9-20020a9d6749000000b0068bd4bdc375mr4039512otm.30.1675381467327;
        Thu, 02 Feb 2023 15:44:27 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id f6-20020a9d7b46000000b0068d51cb1fb7sm451911oto.6.2023.02.02.15.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 15:44:26 -0800 (PST)
Received: (nullmailer pid 2915928 invoked by uid 1000);
	Thu, 02 Feb 2023 23:44:25 -0000
Date: Thu, 2 Feb 2023 17:44:25 -0600
From: Rob Herring <robh@kernel.org>
To: Michael Walle <michael@walle.cc>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, devicetree@vger.kernel.org, hayashi.kunihiko@socionext.com, krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, mhiramat@kernel.org, rafal@milecki.pl, srinivas.kandagatla@linaro.org
Subject: Re: [PATCH 3/4] nvmem: mtk-efuse: replace driver with a generic MMIO
 one
Message-ID: <20230202234425.GA2898249-robh@kernel.org>
References: <20230201064717.18410-4-zajec5@gmail.com>
 <20230201084821.1719839-1-michael@walle.cc>
 <8452b341-8695-05d8-9d03-47c9aeca0ec7@gmail.com>
 <017a17eb99ac2b2c858d27b65c5dd372@walle.cc>
 <20230201185402.GA4084724-robh@kernel.org>
 <1b3024876259eab4464db9ca676a884f@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b3024876259eab4464db9ca676a884f@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_154428_617349_10A3B738 
X-CRM114-Status: GOOD (  56.62  )
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

On Wed, Feb 01, 2023 at 09:15:50PM +0100, Michael Walle wrote:
> Am 2023-02-01 19:54, schrieb Rob Herring:
> > On Wed, Feb 01, 2023 at 11:46:01AM +0100, Michael Walle wrote:
> > > > Before I convert brcm,nvram to NVMEM layout I need some binding & driver
> > > > providing MMIO device access. How to handle that?
> > > 
> > > I'm not arguing against having the mmio nvmem driver. But I don't
> > > think we should sacrifice possible write access with other drivers.
> > > And
> > > I presume write access won't be possible with your generic driver as
> > > it
> > > probably isn't just a memcpy_toio().
> > > 
> > > It is a great fallback for some nvmem peripherals which just maps a
> > > memory region, but doesn't replace a proper driver for an nvmem
> > > device.
> > > 
> > > What bothers me the most isn't the driver change. The driver can be
> > > resurrected once someone will do proper write access, but the generic
> > > "mediatek,efuse" compatible together with the comment above the older
> > > compatible string. These imply that you should use "mediatek,efuse",
> > > but we don't know if all mediatek efuse peripherals will be the
> > > same - esp. for writing which is usually more complex than the
> > > reading.
> > 
> > Because the kernel can't pick the "best" driver when there are multiple
> > matches, it's all Mediatek platforms use the generic driver or all use
> > the Mediatek driver.
> 
> Isn't that the whole point of having multiple compatible strings?
>   compatible = "fsl,imx27-mmc", "fsl,imx21-mmc";
> The OS might either load the driver for "fsl,imx21-mmc" or one for
> "fsl,imx27-mmc", with the latter considered to be the preferred one.

No, there's some assumption they would be similar enough to be served by 
the same driver.

While it seems like we'd want to fix this, it's been an issue I've been 
aware of as long as I've been involved with DT and yet I don't recall 
anyone really having an issue. Could just be everyone couples their 
kernel and dtb versions...

> > Personally, I think it is easy enough to revive the driver if needed
> > unless writing is a soon and likely feature.
> 
> That what was actually triggered my initial reply. We are planning a
> new board with a mediatek SoC and we'll likely need the write support.

If write support is on the horizon, then I'd say keep the Mediatek 
driver.

> But I thought the "mediatek,efuse" was a new compatible with this patch
> and the (new!) comment make it looks like these compatible are deprecated
> in favor of "mmio-nvmem". Which would make it impossible to distinguish
> between the different efuse peripherals and thus make it impossible to
> add write support.

No, it's in the schema and dts files.

> 
> > The other way to share is providing library functions for drivers to
> > use. Then the Mediatek driver can use the generic read functions and
> > custom write functions.
> > 
> > > nitpick btw: why not "nvmem-mmio"?
> > > 
> > > So it's either:
> > >  (1) compatible = "mediatek,mt8173-efuse"
> > >  (2) compatible = "mediatek,mt8173-efuse", "mmio-nvmem"
> > > 
> > > (1) will be supported any anyway for older dts and you need to add
> > > the specific compatibles to the nvmem-mmio driver - or keep the
> > > driver as is.
> > > 
> > > With (2) you wouldn't need to do that and the kernel can load the
> > > proper driver if available or fall back to the nvmem-mmio one. I'd
> > > even make that one "default y" so it will be available on future
> > > kernels and boards can already make use of the nvmem device even
> > > if there is no proper driver for them.
> > > 
> > > I'd prefer (2). Dunno what the dt maintainers agree.
> > 
> > No because you are changing the DT. The DT can't change when you want to
> > change drivers. This thinking is one reason why 'generic' bindings are
> > rejected.
> 
> There is no change in the DT. Newer bindings will have
> 
>   compatible = "vendor,ip-block", "mmio-nvmem"
> 
> when the ip block is compatible with mmio-nvmem. Otherwise I don't get
> why there is a mmio-nvmem compatible at all. Just having
> 
>   compatible = "mmio-nvmem"
> 
> looks wrong as it would just work correctly in some minor cases, i.e.
> when write support is just a memcpy_toio() - or we deliberately ignore
> any write support. But even then, you always tell people to add specific
> compatibles for the case when quirks are needed..

Yes, I do. I was assuming these are simple cases unlikely to need 
platform specific support. We're just reading static bits from 
registers...

If you may need write support or have other complications, then 
"mmio-nvmem" should not be used. You can use the driver, but it should 
match with a platform specific compatible, not the generic one.

Rob


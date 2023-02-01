Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6243C38142
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 18:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0sMQc0PK6ObdJHfFL3hGtO0pIoGyC7nHbzdlT3Spl2Y=; b=Mzhod5PX9j7zkw/HcUyXNTpXWh
	GtLwmUwiYjCH5AuKGm5TrGUNcqFVXKLORG2z7rHY0nqAqlg6azzkrVbI957eS7WwHR67xsl2anfdZ
	PPRmMdibysjb7aATZx1En+9A70mpMwuSkUQclUdyjLuy9oP1v57LoxWkGsHqwktAT4IO904DWPy0F
	dB+dARdFERr3cjCcz/mjW/EbUKp0kePAXl/l6Gr7ztv2YQ2lRLfVovOIjjUoa+dymP8vhcyMZTpbY
	+sM/ZPoQB14G3SbquZfIJcjM7wOpRy+ojJsMDOZZqIH8M9YFzxjyy1ph1UZzHyElfcb4B2E1cMw+p
	gi5N66ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNIFL-00DH5G-Qy; Wed, 01 Feb 2023 18:54:15 +0000
Received: from mail-oa1-f43.google.com ([209.85.160.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNIFC-00DH35-1S; Wed, 01 Feb 2023 18:54:07 +0000
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-15f97c478a8so24721670fac.13;
        Wed, 01 Feb 2023 10:54:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0sMQc0PK6ObdJHfFL3hGtO0pIoGyC7nHbzdlT3Spl2Y=;
        b=lOWcDkzuZ1kiNK5nQzUTWwjkqiM6rRoPVl5EciNpxJTJ/oJjymj4VQV6bvnag/Vxy2
         CO4mjHBPKEOOCQrVL7CHqHrii9Q/5PeXXzfbl/TKVlZu8C3ne4eEQeECvQLzWwoYPkbD
         hAzcQdVhazo2OEtHI6FxrdehswEu/mIjPBYXVMJlag2L6NJKXg1D6nA6VRH0tQy5j+MN
         RYWknCDcaje0hFsrJ8Xhv4SJeD2jC+JLob0o69nmjr7+SlS5Z39u/78KuYJ2QCEUpzr/
         9vg3WwCliQvYEx/9fajsH+CWUbTvm4wa4ddx6mi8DiD4D8TbEuS1W0CnJQuznktoGB0E
         BQWQ==
X-Gm-Message-State: AO0yUKUi32nMxIRrGGkB+kkM4q1xxkYzAmwMcXQE8zZNmxGXF67BRdbC
	BQluH8mLrcZ7CWp2S8RIFw==
X-Google-Smtp-Source: AK7set+x4JYggnZQEp7fWaOZYSgRM7McC3+rmo9BC9jTfy4gSLLBzuRh3gqarJNb/Hc9cF/IrLdkpg==
X-Received: by 2002:a05:6870:ac20:b0:163:573b:3e8d with SMTP id kw32-20020a056870ac2000b00163573b3e8dmr1535116oab.30.1675277643870;
        Wed, 01 Feb 2023 10:54:03 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id u16-20020a056870701000b0014fd7e7c3fesm7904092oae.27.2023.02.01.10.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 10:54:03 -0800 (PST)
Received: (nullmailer pid 4146388 invoked by uid 1000);
	Wed, 01 Feb 2023 18:54:02 -0000
Date: Wed, 1 Feb 2023 12:54:02 -0600
From: Rob Herring <robh@kernel.org>
To: Michael Walle <michael@walle.cc>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, devicetree@vger.kernel.org, hayashi.kunihiko@socionext.com, krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, mhiramat@kernel.org, rafal@milecki.pl, srinivas.kandagatla@linaro.org
Subject: Re: [PATCH 3/4] nvmem: mtk-efuse: replace driver with a generic MMIO
 one
Message-ID: <20230201185402.GA4084724-robh@kernel.org>
References: <20230201064717.18410-4-zajec5@gmail.com>
 <20230201084821.1719839-1-michael@walle.cc>
 <8452b341-8695-05d8-9d03-47c9aeca0ec7@gmail.com>
 <017a17eb99ac2b2c858d27b65c5dd372@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <017a17eb99ac2b2c858d27b65c5dd372@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_105406_105849_1C3AA61A 
X-CRM114-Status: GOOD (  32.08  )
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

On Wed, Feb 01, 2023 at 11:46:01AM +0100, Michael Walle wrote:
> > Before I convert brcm,nvram to NVMEM layout I need some binding & driver
> > providing MMIO device access. How to handle that?
> 
> I'm not arguing against having the mmio nvmem driver. But I don't
> think we should sacrifice possible write access with other drivers. And
> I presume write access won't be possible with your generic driver as it
> probably isn't just a memcpy_toio().
> 
> It is a great fallback for some nvmem peripherals which just maps a
> memory region, but doesn't replace a proper driver for an nvmem device.
> 
> What bothers me the most isn't the driver change. The driver can be
> resurrected once someone will do proper write access, but the generic
> "mediatek,efuse" compatible together with the comment above the older
> compatible string. These imply that you should use "mediatek,efuse",
> but we don't know if all mediatek efuse peripherals will be the
> same - esp. for writing which is usually more complex than the reading.

Because the kernel can't pick the "best" driver when there are multiple 
matches, it's all Mediatek platforms use the generic driver or all use 
the Mediatek driver.

Personally, I think it is easy enough to revive the driver if needed 
unless writing is a soon and likely feature.

The other way to share is providing library functions for drivers to 
use. Then the Mediatek driver can use the generic read functions and 
custom write functions.

> nitpick btw: why not "nvmem-mmio"?
> 
> So it's either:
>  (1) compatible = "mediatek,mt8173-efuse"
>  (2) compatible = "mediatek,mt8173-efuse", "mmio-nvmem"
> 
> (1) will be supported any anyway for older dts and you need to add
> the specific compatibles to the nvmem-mmio driver - or keep the
> driver as is.
> 
> With (2) you wouldn't need to do that and the kernel can load the
> proper driver if available or fall back to the nvmem-mmio one. I'd
> even make that one "default y" so it will be available on future
> kernels and boards can already make use of the nvmem device even
> if there is no proper driver for them.
> 
> I'd prefer (2). Dunno what the dt maintainers agree.

No because you are changing the DT. The DT can't change when you want to 
change drivers. This thinking is one reason why 'generic' bindings are 
rejected.

Rob


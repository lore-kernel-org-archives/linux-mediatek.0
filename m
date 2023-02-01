Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59523C636D3
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 10:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/Nn9vIhP684Dyg+/S9/KC+Ry8ajbwCM27GQszn7uBE=; b=IlTjmSygnzQIjZq9482nteTzR+
	AArauECfH0asq7yh8C/YX5fmjzNaeaaOnfKTFxez/zSQ/FCNBCjjZjT/Q1g++iB/EzVT31c8c72SP
	Jac5Rgry9azWDCncKmT2rEz1zRfDomZnTMMj8gail2OapJydjzmE9SZ8zpRXvMD+rjmAPo/H6/8Qb
	sfdKSzaPr6HWrPmlUbCPgCL/YiR+vN3yRqOtGILkxHmOOIp/cIWuMqyMAJWISvTvO+dSILT9FOorF
	wxmL4ndqlIKdgNDBttk1VRWcKsQF01RfCyZTv/TE1vxc1IBUf4so/eDCA9sncN/ShmEKeggTu+KG2
	OvIW/8Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNAd8-00BJxw-3A; Wed, 01 Feb 2023 10:46:18 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNAcu-00BJvH-Nz; Wed, 01 Feb 2023 10:46:08 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 2D365126A;
	Wed,  1 Feb 2023 11:46:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1675248362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j/Nn9vIhP684Dyg+/S9/KC+Ry8ajbwCM27GQszn7uBE=;
	b=FnLre03ttlykqOT5twpuMP6FFFU/GYDMLPiJbQ5x24R+62f9zZOmq2Hyk6bmnNBuzHTQfT
	IZEEqRBz7xQlkCmBWiZEVNeTNOkuDofAWU8loul7jmBGWNDayoA9/BLmZAz5YL7r93SQoT
	yRrLi2QTW0mlVV7Hjo8V5bojgKCJTzdq5rT6GFR3yXtCk6ludx6P5waPGvrPROTxmBHoGD
	ZLK4g8TkisopCQZVl3P5jW97q+ZbA6Xh18Us3SqNelTexKVihoIW7/y/DLKpKl+zeOvxqN
	7agL0pEnv+68qKRhnu34IBbhTqMid7TPcUAJzwT7mN6fNx6sf0N0PX4imDdcRA==
MIME-Version: 1.0
Date: Wed, 01 Feb 2023 11:46:01 +0100
From: Michael Walle <michael@walle.cc>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: devicetree@vger.kernel.org, hayashi.kunihiko@socionext.com,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, mhiramat@kernel.org, rafal@milecki.pl,
 robh+dt@kernel.org, srinivas.kandagatla@linaro.org
Subject: Re: [PATCH 3/4] nvmem: mtk-efuse: replace driver with a generic MMIO
 one
In-Reply-To: <8452b341-8695-05d8-9d03-47c9aeca0ec7@gmail.com>
References: <20230201064717.18410-4-zajec5@gmail.com>
 <20230201084821.1719839-1-michael@walle.cc>
 <8452b341-8695-05d8-9d03-47c9aeca0ec7@gmail.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <017a17eb99ac2b2c858d27b65c5dd372@walle.cc>
X-Sender: michael@walle.cc
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_024604_983857_4A811599 
X-CRM114-Status: GOOD (  16.51  )
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

> Before I convert brcm,nvram to NVMEM layout I need some binding & 
> driver
> providing MMIO device access. How to handle that?

I'm not arguing against having the mmio nvmem driver. But I don't
think we should sacrifice possible write access with other drivers. And
I presume write access won't be possible with your generic driver as it
probably isn't just a memcpy_toio().

It is a great fallback for some nvmem peripherals which just maps a
memory region, but doesn't replace a proper driver for an nvmem device.

What bothers me the most isn't the driver change. The driver can be
resurrected once someone will do proper write access, but the generic
"mediatek,efuse" compatible together with the comment above the older
compatible string. These imply that you should use "mediatek,efuse",
but we don't know if all mediatek efuse peripherals will be the
same - esp. for writing which is usually more complex than the reading.

nitpick btw: why not "nvmem-mmio"?

So it's either:
  (1) compatible = "mediatek,mt8173-efuse"
  (2) compatible = "mediatek,mt8173-efuse", "mmio-nvmem"

(1) will be supported any anyway for older dts and you need to add
the specific compatibles to the nvmem-mmio driver - or keep the
driver as is.

With (2) you wouldn't need to do that and the kernel can load the
proper driver if available or fall back to the nvmem-mmio one. I'd
even make that one "default y" so it will be available on future
kernels and boards can already make use of the nvmem device even
if there is no proper driver for them.

I'd prefer (2). Dunno what the dt maintainers agree.

-michael


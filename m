Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60827CA5511
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 08:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NvABGxrwjJi8zw8bx3iv5y02rhYVq31nX92vN9mp+NQ=; b=wAMKk87eAIa6KtK0GqG6vhdtFx
	XZ2Pnq9Iw2CakaKiGyI72GJTwBZXUpN1BylNO53o0ssLAmQGlA7NN9upeiPfO3VRxYhnY8Qj14eIs
	oZVA0m7nNMymtDTmmtTNDgWZQmjXJVLZJ7SIBucNdK7oQFU34g8nnq4Nei0lSCO1t2Vhd4pQAFkTA
	/x+jN7nTiG4ozg9eehw+gsKYhpuXn78XxJC8CmCRNVFetgQC7T2VmfU7B0R8MpTN/B65YsMDv523A
	/YzBx0Wu2IafSDuWB2BxNUFI4jwIvoJrPObeXL3HrViitzwnf5aKGY8vBojNZNqXciY3DP+zyyk42
	ZyKRNyJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLfp-005D80-1c;
	Wed, 13 Sep 2023 08:56:37 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLfl-005D5j-1I;
	Wed, 13 Sep 2023 08:56:34 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B7764660732C;
	Wed, 13 Sep 2023 09:56:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694595390;
	bh=nqOTtfwX7rRj9GC8sr2U/6FJNTLSLN8f0d2I07koGF8=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=n6z/R42AhHSVBEMMVnpq0HkyEmRYjwYH1r++RCb+Z6eM6IvfahC/Mhwn+Wp0X+rSZ
	 l82NoT1THmC3L8eZVSjEEYXNolZN5xmI+Co157my/fQ1/dpJ8nbSYWLMO9wLeTr7KU
	 KtOrUxL7VCc8F5W3V7F6z7AUFTzrYxn1r3an4klqmVy0MG2R6Vlcc7gdzFZKujIYnL
	 FP4oaww6t4o3gffwZ8T8WVFKSwda92f7ftblWG07MpUT+Z8n8XK+YxBFTHTloPBHV5
	 d/7MrFgx48pX2DXkdco+a7fgxfb6ElHkNOWyPIUlNSUUn8cNjJh3rczIs4cPdSB5YY
	 td++vPQOwA4nA==
Message-ID: <09603bb9-59df-a6a4-fda0-c47fa3941659@collabora.com>
Date: Wed, 13 Sep 2023 10:56:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH -next 2/2] iio: adc: mt6577_auxadc: Simplify with device
 managed function
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, jic23@kernel.org, lars@metafoo.de,
 matthias.bgg@gmail.com, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230826035402.3512033-1-ruanjinjie@huawei.com>
 <20230826035402.3512033-3-ruanjinjie@huawei.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230826035402.3512033-3-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_015633_594170_C2BF8C0E 
X-CRM114-Status: GOOD (  10.17  )
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

Il 26/08/23 05:54, Jinjie Ruan ha scritto:
> Add a device managed hook, via devm_add_action_or_reset() and
> mt6577_power_off(), to power off on device detach.
> 
> Replace iio_device_register() by devm_iio_device_register() and remove
> the mt6577_auxadc_remove() function used to unregister the device and
> power off the device.
> 
> Remove platform_set_drvdata() from the probe function, since
> platform_get_drvdata() is not used anymore.
> 
> Remove mt6577_auxadc_mod_reg() call from the probe function error path.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Suggested-by: Jonathan Cameron <jic23@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




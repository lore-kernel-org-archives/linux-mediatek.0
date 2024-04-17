Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5631C4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 09:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fcxgTbPA7i2iecLeVWDnPYckzwnKxNSjAFHTnBkGITE=; b=LRbZS1RZ+ioE7rOyygki9shI/e
	yoftgJ7hp5deTngORqUUgzGNCftcCwVdt3l3H4Sw9wR6LJxfsI2xTXaYJB1HS84fu5eY1CnH0+Bcs
	DbOa5dXXoCm93RW14xutgeGYe5vnL+YpbNQUqjC4b2UOT8K0kRfJ0ekYUlDcN3rDFYmsLFBWGMej+
	GADH/U56oxnEF7NSQHArdghQKCzYI4ZIW11IoGVABo030nyYudXxTV4SNTbQeTWys1+zQJWXzWlZ8
	Eqi1fwWyhZQuqcoLALzHmDFqUyqwgGMyP7NIru0bbQ/S8Kuus0SjwCvLA76QyS+Vb/o3WN2LOWuQT
	wXV8JnWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx1gv-0000000FQmA-0fkU;
	Wed, 17 Apr 2024 09:34:57 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx1gs-0000000FQkW-09z3;
	Wed, 17 Apr 2024 09:34:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713346491;
	bh=P2KyDPtDgrufeVQNwR/8NacfwZdrMlwcBsOVnXpMJ38=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CI93zXtpM6qUvr/AbqoLPjEmIH2Q8m95FmZ6hkIlUcSY01RGKWQ6PKcvoYcytbRVA
	 J9s8yQAPE5kyoCjUxD2NshFYlNp7Xdu1WCUtMw/nnizow+zhgHbI0NQjIoNkwuxxW0
	 8mxSLSSXOZ0eyuv24EpmlKgOBVXAb6D4Nr5cM53AcZSnSMstf043C+XNvkqDBzyjl+
	 yJgeCRH4u1ANQhQWRNcmhzW/OHkLa7LbWaBZWXP5pHaNUNA8PU3mkrKIMksYIakytK
	 DgPYFu8eN+7Ju2Gw3PFNS5DeI4/chCUDJRTG+f8ScSfSxveRbngKFdpmUGs02bbNYh
	 HOpI46JIw/A8w==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0E98C378020A;
	Wed, 17 Apr 2024 09:34:50 +0000 (UTC)
Message-ID: <657b3245-b294-44f0-8c40-668f474a9ea5@collabora.com>
Date: Wed, 17 Apr 2024 11:34:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] scsi: ufs: ufs-mediatek: Remove useless
 mediatek,ufs-boost-crypt property
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "amergnat@baylibre.com" <amergnat@baylibre.com>
References: <20240415110012.148871-1-angelogioacchino.delregno@collabora.com>
 <20240415110012.148871-4-angelogioacchino.delregno@collabora.com>
 <c9634a286fbdb4c98a7fe6703a4eb10d66dfcb9e.camel@mediatek.com>
 <4d60e9e4-9eae-4b0a-abb2-b1ad3d278fc9@collabora.com>
 <93db93aa7eb24a255f97a1a1e8e8d936dc908258.camel@mediatek.com>
 <f3920433-b0fa-4a64-9653-e385bf1eb5c7@collabora.com>
 <d11e174d85c7f5a9b4ffe5fb2bb15dfd5823f83e.camel@mediatek.com>
 <ecd7c691-db47-42aa-ab19-f554c20774af@collabora.com>
 <12cc437d2213720190a2fcf132411cfe4485f5d0.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <12cc437d2213720190a2fcf132411cfe4485f5d0.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_023454_293434_8DC61837 
X-CRM114-Status: GOOD (  21.14  )
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

Il 17/04/24 11:29, Peter Wang (王信友) ha scritto:
> On Wed, 2024-04-17 at 10:14 +0200, AngeloGioacchino Del Regno wrote:
>>
>>
>> Upstream supports platforms that do and don't need this feature, and
>> having
>> redundant device tree properties performing the same checks is not
>> just
>> suboptimal but plain wrong.
>>
>> Adding to this, devicetree describes the hardware - and there is no
>> physical
>> hardware switch that needs this redundant property, this means that
>> the
>> property that is getting removed in this commit (and the va09 one in
>> another
>> commit of this series) is a *software switch*, not HW.
>>
>> Keep in mind, also, that this feature (and again, the va09 one as
>> well) has
>> a specific requirement to be supported - and this is what the code
>> does even
>> without the software switch to add it.
>>
>> In case there's any need to disallow such feature from a specific
>> SoC, the DT
>> bindings can be modified such that a specific compatible string would
>> disallow
>> adding the required regulator and/or boost-microvolt properties.
>>
>> Besides, I want to remind you that there is no reason to drop
>> support, or have
>> them unreliably working, or use hacks, for SoCs that are "old" -
>> especially
>> when this is a driver that works on both old and new ones.
>>
>> Regards,
>> Angelo
> 
> Hi Angelo,
> 
> These two property(boost and va09) is not software switch, they
> are hardware switch. Because if platform support crypto boost, we set
> boost property in device tree. And if platform support ufs va09, we set
> va09 proberty in device tree. These property are main hardware switch.

I disagree. If a platform supports crypto boost, it will have the dvfsrc
regulator and the supported voltage for the boost; if a platform supports
ufs va09, it will have the va09 regulator assigned in the ufshci devicetree
node.

> 
> We don't use sub switch like voltage or clock setting becasue it is
> not intiutive. Especially when va09 is not used by ufs (No va09
> property but have va09 voltage), The behavior should be wrong if ufs
> control va09 which used by other module.
> 

As I said, devicetree describes hardware - and this strategy being intuitive
or not boils down to personal opinions and nothing else.
Aside personal opinions, again, properties not describing hardware are wrong.

And again, if VA09 shall not be controlled by the UFSHCI driver on a specific
platform, then the regulator shall not be assigned to the UFSHCI node on that
specific platform.

Regards,
Angelo


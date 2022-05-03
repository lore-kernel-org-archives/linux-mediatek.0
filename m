Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B2DC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 12:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dsdnBWX54RdqONASzaT8Z3BWvoAiwDZvqN8fahXC5mA=; b=hGuCiHRpAzIu4b
	XUwRTqVM1Cud7VXrfq10ZixS76uuMpK+rc08qeKyx3ebK1+UcU7OlZTt6usOi9NPXBojwV9wuuzLP
	2oJ9ctY7sG2KBgsklk+XPd9Gj1Lsl9S3wAla3UtgZwpAA9+X3MfzE449RhA63AGqgqiN/fQblgX+7
	cHJcxak5NiVpN6gmHW0xY8WPhYJJwV50YKBckUKikeJoPMJgb973bl3JUKJ+s31piKr10hRP2drJo
	KVxD4YE2QAtGssHI167gdCauD6JIdB7efFOyi7mj6/KeW62p/L0WawIkjYpDrQPKOgiRkDbct3yqS
	ubZzrxugVBjemeSm0joA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nls75-005wam-VR; Tue, 03 May 2022 12:58:48 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nls6u-005wW1-4g; Tue, 03 May 2022 12:58:37 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B82D81F44301
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651582714;
 bh=x3OQ1oHSHfYp4EWTit5w0xva4dWoTSyHlpVA/f0sBc8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oE4Gzqh7OQZobIVPBHen/agv7mJlYdisUly3VljCB4nzrklgVosKcpjP/KQOtoNfk
 DAMgQab7UjiiKvjE3rCyi2RSCQQQWkTKn4wGCfOX6CXlnWkLGX0mBI8thk68jbVXjk
 HzzCj5qWKP6/ZkqopFTk/2M9IexLWkJfU9KS/YD/nygGcXa8XFDSDlUV9EQVpnk6k5
 LMf45muBV7e0FDFb/S9UQzm4bmQWbn9z1HXyrS4ZaG6uaoROVu/6/GbcMEhT26IQCo
 A6df+5G40WYA9IITkq57SlpR9v/ftM3fPD2jB+bwwc4jIsaDQbkWXna/+MEW8XMP+C
 MvmEEtEa0xFAg==
Message-ID: <64129cb4-f33f-6017-4923-63f67f7067fa@collabora.com>
Date: Tue, 3 May 2022 14:58:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] dt-bindings: power: Add MediaTek Helio X10 MT6795
 power domains
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 chun-jie.chen@mediatek.com, weiyi.lu@mediatek.com, mbrugger@suse.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, nfraprado@collabora.com
References: <20220503105436.54901-1-angelogioacchino.delregno@collabora.com>
 <20220503105436.54901-2-angelogioacchino.delregno@collabora.com>
 <ac774c74-4577-3dfc-7bf4-3c180d45b420@linaro.org>
 <94dbb7ee-764a-5568-a044-80dbfe77c29a@collabora.com>
 <d371fff5-0d45-b827-2696-3862b3c5fd59@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <d371fff5-0d45-b827-2696-3862b3c5fd59@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_055836_364501_D18A1849 
X-CRM114-Status: GOOD (  11.56  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 03/05/22 14:57, Krzysztof Kozlowski ha scritto:
> On 03/05/2022 14:43, AngeloGioacchino Del Regno wrote:
>>>
>>> If it is not a derivative work, should be GPL-2.0 OR BSD
>>>
>>
>> On that, I agree with you, fully.
>>
>> Though, all of the mt(xxxx)-power.h headers provide this license tag and I
>> wanted to follow that to give the same.
>>
>> Should I change it to (GPL-2.0-only OR BSD-2-Clause)?
> 
> Yes, please, for this one.
> 
> For the other bindings - you would need acks from people involved.
> 

I'm glad to read this. I'll change it in the next version. Thank you!


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

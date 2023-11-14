Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0591BC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Nov 2023 13:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jwMru+Zy0Paw4qqc91JT2jPGiWH6R9ZY4wzD0CZm2go=; b=XaDz+4HlpZaxqQLJwblmqmi3Fl
	d2ETMRe7UCbD87mMG4QG5lNQbBo3kd/Kegxh4x2AGB9b2zHbHLFFRlxh7g7yjBcZ2sp41uSP9HGLX
	6ATrBKGFozDuogju/+6WXLLhVe+4mV1Rz7ag3gW6m+m8aoKWQ58/VfP7LTG2J7+a2nPgZd40yHSbs
	hiQe8gq8ewjPLTIKGZKnh0FfOp/wFFyQZJ0a95dbE+leSRCIXSKhRt4LcC4THSKJlU7UDbGba7Ir9
	+kYT+ULaCznqgS/BwXjflZxQqTClmtI8E/kOQOfGaXlxCA7MsAFIC1MzS4nxJritDxK3x4h+83Ykq
	rclxhr+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2tJf-00G0pY-33;
	Tue, 14 Nov 2023 13:18:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2tJc-00G0o5-1y;
	Tue, 14 Nov 2023 13:18:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73274C15;
	Tue, 14 Nov 2023 05:19:33 -0800 (PST)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 98F5B3F6C4;
	Tue, 14 Nov 2023 05:18:43 -0800 (PST)
Message-ID: <3daaa2aa-61d4-40db-b36d-cd825a340d2b@arm.com>
Date: Tue, 14 Nov 2023 13:18:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] dt-bindings: reserved-memory: Add secure CMA
 reserved memory range
To: =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "jstultz@google.com" <jstultz@google.com>,
 "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?=
 <Jianjiao.Zeng@mediatek.com>, =?UTF-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?=
 <kuohong.wang@mediatek.com>,
 "quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>,
 "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>,
 "jkardatzke@google.com" <jkardatzke@google.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "tjmercier@google.com" <tjmercier@google.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "joakim.bech@linaro.org" <joakim.bech@linaro.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
References: <20231111111559.8218-1-yong.wu@mediatek.com>
 <20231111111559.8218-7-yong.wu@mediatek.com>
 <0ccee72f-98ac-4a08-9253-9c22dad4d95a@linaro.org>
 <5d7b2458b8d1896ce575f4ed2d413f4e8eeb92b4.camel@mediatek.com>
Content-Language: en-GB
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <5d7b2458b8d1896ce575f4ed2d413f4e8eeb92b4.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_051852_700545_78978A8D 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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

On 13/11/2023 6:37 am, Yong Wu (吴勇) wrote:
[...]
>>> +properties:
>>> +  compatible:
>>> +    const: secure_cma_region
>>
>> Still wrong compatible. Look at other bindings - there is nowhere
>> underscore. Look at other reserved memory bindings especially.
>>
>> Also, CMA is a Linux thingy, so either not suitable for bindings at
>> all,
>> or you need Linux specific compatible. I don't quite get why do you
>> evennot
>> put CMA there - adding Linux specific stuff will get obvious
>> pushback...
> 
> Thanks. I will change to: secure-region. Is this ok?

No, the previous discussion went off in entirely the wrong direction. To 
reiterate, the point of the binding is not to describe the expected 
usage of the thing nor the general concept of the thing, but to describe 
the actual thing itself. There are any number of different ways software 
may interact with a "secure region", so that is meaningless as a 
compatible. It needs to describe *this* secure memory interface offered 
by *this* TEE, so that software knows that to use it requires making 
those particular SiP calls with that particular UUID etc.

Thanks,
Robin.


Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A853C25B78
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 May 2024 10:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/xik6TiS7aqCuoNggHsqJl6fYJBQo9IQgRf7BSH0tmQ=; b=sp1avRKiPbAsdJ
	jbsoktQA30SjNB+NjxA5AcRQ604I+Vfd/GCHlnXC/nHv9gRioKkHHuWd9u0RG4WaY+UO02sjHaSm8
	jwMmcBeLMnBEcObLg38pXPVuzSjEqgV18dxXOWR9I8UAXAX8yjvwvxr371aynfSCUm9baQsjg2hHm
	0fAmQj323uu8JdCwAfP3KZkXxMEmsvK/lamtxpJlPwRWbr0YllrSOPQK9mL2pLLipwNNdKmhP86OS
	XDyyOuHVj8G2KE4UlJdrV5ZhgBPZRquk7HEDzTB7WVBnaO/uJaa0r1SjWgdxYcqg1JZ3+LkHGqfr5
	T2HRdvVdKerqAHZ8MBKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBu2o-00000000DtR-3Fgy;
	Tue, 28 May 2024 10:27:02 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBu2l-00000000DsV-2T3w;
	Tue, 28 May 2024 10:27:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716892018;
	bh=ShbB0egsqc+viF42q6rsRBuCb+8DgZ4kwsWT9hgU0u8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qo0ABDpDeGyeb5AM6CvxMAHNti9En+O5JJ7JH2bf5Kz7yu4heP+HUSyNzNLBu9l4v
	 r6G+r6Xjl5Q34vGGu+TXIib93qalmPg7v5r7lyS330vgVmLB7adu2KP8H+lX7rrfIu
	 zJzxuXF37jfduvnRfRK/e8nQU1J25bdFgPMWSPOB7M3qUfMJFNBYvZoUeVe2eDL7OI
	 IhiyY4tRqs1ePuvCQhmrTEcAjzVzMjtN3LeaZzlImY/eHCHvRfjLs4jdpNhm0HiC1L
	 MeJYVO6vs3cdX8W6jVn4un+D6X7h+XF5EW/FG6J2SfjzNJDaYpsv4bglD9wNkfq/7P
	 tdkzEA4zshBBg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D4030378215E;
	Tue, 28 May 2024 10:26:56 +0000 (UTC)
Message-ID: <430cf0a6-4d8c-4819-8a95-d436eb044eec@collabora.com>
Date: Tue, 28 May 2024 12:26:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: mailbox: Add mediatek,gce-props.yaml
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>
References: <20240124011459.12204-1-jason-jh.lin@mediatek.com>
 <20240124011459.12204-2-jason-jh.lin@mediatek.com>
 <f91d3ac1-0a7d-4ca2-bf0f-c5e471c2f6bb@collabora.com>
 <2a2a939c9cb56de0383ec3e42db9bcf8e8518775.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <2a2a939c9cb56de0383ec3e42db9bcf8e8518775.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_032659_782539_31C03C82 
X-CRM114-Status: GOOD (  10.36  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, =?UTF-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?= <Jason-ch.Chen@mediatek.com>, =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>, =?UTF-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>, =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 26/05/24 17:04, Jason-JH Lin (林睿祥) ha scritto:
> Hi Angelo, Jassi,
> 
> Could you help me apply this series?
> Thanks!
> 

That's not me, it's Jassi - green light from me, btw.

Cheers,
Angelo

> Regards,
> Jason-JH.Lin
> 
> On Wed, 2024-01-24 at 09:57 +0100, AngeloGioacchino Del Regno wrote:
>> Il 24/01/24 02:14, Jason-JH.Lin ha scritto:
>>> Add mediatek,gce-props.yaml for common GCE properties that is used
>>> for
>>> both mailbox providers and consumers. We place the common property
>>> "mediatek,gce-events" in this binding currently.
>>>
>>> The property "mediatek,gce-events" is used for GCE event ID
>>> corresponding
>>> to a hardware event signal sent by the hardware or a software
>>> driver.
>>> If the mailbox providers or consumers want to manipulate the value
>>> of
>>> the event ID, they need to know the specific event ID.
>>>
>>> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
>>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>>
>> Reviewed-by: AngeloGioacchino Del Regno <
>> angelogioacchino.delregno@collabora.com>
>>
> 




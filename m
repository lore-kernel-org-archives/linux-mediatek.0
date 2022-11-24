Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98718C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Nov 2022 10:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X3CzD3Bx9SuivUb23uvgVg0XuIgS3pmJfRveEMHmIHc=; b=Q21PgGCSR3tlGA5tIzvKP3D7+q
	hRLAbaBgaQPACyHkG68AAZh0HTARuBPUxfDaesthFQut3hfq5FCkR5iHi0yw6MGdgDLZ46w2JhXRW
	HHmRNOH40zkzmu48EpwJ9GvAIfDDl118WN3oH0kf8UUaR+Gbcog6FtBCwO/pOb5CyrTVodT5C5oIC
	yjEUP3M7KThV+vewDxGiukEcuY+QFrTcC842ofyD0D3lEAB5hWWRpb1SGnnbDoUQNESmsLSCm8K14
	5x8n/ns3ctHX1WuyCTdJgsWt818ODgI1OF+D6d2dvxiX+S6ssPMouKyvPvwkz3TrVaETD+SuGgL1P
	r23G32qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy91k-007OoZ-Sz; Thu, 24 Nov 2022 10:00:16 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy91X-007OhK-SL; Thu, 24 Nov 2022 10:00:05 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9A2226602B0C;
	Thu, 24 Nov 2022 09:59:57 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669283998;
	bh=48X8OTH7/cJ6CzdDW7GuIRWxszRUPEKFaWr6Rm9Yc2g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UYW5QHWhwBOR7p3o9u96XxSmWa8xr+p1ubdXEmrliSgtBIkDYi5jIPtiVA6RF6kaZ
	 46VoFh+RSngStfA1rChmknARUMuJ1s4ze0Qks5JGNwao+G8EX1uHeaKbxXJtsgw64b
	 wNKDpfR70/WEXO3FwQXMD3SRLvY/Gy31CVvIYJn1F5l0CDkQqnMEWxjDuIi6fy5CZf
	 fxyE/QWo0U4YIiG51BVCWWkf+SaE8fbECIDpte7CC5KQcsJPfIHZVizGnrcSKTGgX5
	 klrGuyATQddROqSwNPC3ywyIg7OgyLnUX21Oo6vN8U3pZSwOGx5d+gLkfzQuK1QW4W
	 nHkZo1uPovCsg==
Message-ID: <9c4167ac-d962-17e0-6e9c-03656169f50b@collabora.com>
Date: Thu, 24 Nov 2022 10:59:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 3/4] irqchip: irq-mtk-cirq: Move register offsets to
 const array
To: Marc Zyngier <maz@kernel.org>
Cc: tglx@linutronix.de, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 youlin.pei@mediatek.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20221123112249.98281-1-angelogioacchino.delregno@collabora.com>
 <20221123112249.98281-4-angelogioacchino.delregno@collabora.com>
 <86fse9ok3y.wl-maz@kernel.org>
 <c8174977-2995-811a-83e2-9f941057acd8@collabora.com>
 <86cz9doctj.wl-maz@kernel.org>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <86cz9doctj.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_020004_122582_1793C0FA 
X-CRM114-Status: GOOD (  12.62  )
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

Il 23/11/22 17:28, Marc Zyngier ha scritto:
> On Wed, 23 Nov 2022 14:57:02 +0000,
> AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:
>>
>>>> +					 enum mtk_cirq_reg_index idx,
>>>> +					 unsigned int cirq_num)
>>>
>>> What does cirq_num mean for registers that are not relative to an
>>> interrupt? Create a separate helper for those.
>>>
>> Means literally nothing, so yes I agree, but...
>>
>> ... mtk_cirq_irq_reg(), mtk_cirq_reg() feels too similar and may lead to
>> confusion while reading the code.
>>
>> Any advice about a possibly clear-er name?
> 
> I think the names are OK. Passing an interrupt number as a parameter
> is a good discriminant anyway.
> 
> Please wait for a few days before posting the next version though.
> 
> 	M.
> 

Let's go with these names then, thank you!

Regards,
Angelo


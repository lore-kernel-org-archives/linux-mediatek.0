Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF208CD6E5C
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Oct 2023 11:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LMxsdijMcCBmo+M5tAWjS7TMX7ogjrH/xuNeDT7Xu3E=; b=EvqBC7oMr//kN90ThecmO7LqN4
	ijDF919QbfIcpPaxRSHaq+6NwSzJ52ITZ9xM48/+dIKqSdRfykWNABGNH81XXX49wm62FZKF6DqKz
	blTpsllF0imBKAWpLlHrvwJ5zSEwMiXg3xr00FEiBosLe+YvyVaf1vb/xVKdLfCQb5zrTXe+jcZWh
	fguD63KGLRfXKogotMGE0Z81LDz39Fmg94ZZYCyzl9qQAC7CcKLO92P5ZQW1MW0XdlX4jqM122M/P
	riiEoJF3Eez3IEgFDMlsSm83k2/i0WynGjAOUurZjLzYx1TWk2w1SrMvS13UI8FDcaIUcmyarKIop
	W6ihtoJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqXdh-00Flx2-1r;
	Wed, 11 Oct 2023 11:44:33 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqXde-00Flve-1L;
	Wed, 11 Oct 2023 11:44:31 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5244B6607312;
	Wed, 11 Oct 2023 12:44:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697024667;
	bh=N4YKplRWJ6SDqnjedGaZQWvesSWK9mTeJQID5g1MjoI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VTJnx51lKG+BlnOCi8O3YIxIpn9ha3Yd+jN389ICrk6TvipPLABaaTGdRbI/88LZe
	 2GAn4QSENinasDmlFEf0NTPaigZA15DuO6LJt8/EWuPbewd9ilnqCj9pkqd3TpS0IA
	 dnNoabmRZItnOle1WKQW3/hGsHdyMV3b7oJ6cBtxw5qw+xjEBtkhHRBR+TgF39JLC5
	 mVuLSuX1ncXEHLtpCO7srNqv8fLMcmgWAzJAzoOIrWlIz+RenKgMq+rIvN2TCIhPaN
	 3E50cD1PFXD3fcbsSoMDeaSGfvswWBMp2o2/Ozg3f+v+TJNa4KISsJgutlkAGpfybC
	 /DCrIFymcInHQ==
Message-ID: <d6386e5e-be7a-a68c-e592-1587380480d0@collabora.com>
Date: Wed, 11 Oct 2023 13:44:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 1/2] media: dt-bindings: mediatek: Add phandle to
 mediatek,scp on MDP3 RDMA
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: mchehab@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, moudy.ho@mediatek.com, hverkuil-cisco@xs4all.nl,
 sakari.ailus@linux.intel.com, u.kleine-koenig@pengutronix.de,
 linqiheng@huawei.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, wenst@chromium.org
References: <20231005104905.120544-1-angelogioacchino.delregno@collabora.com>
 <20231005104905.120544-2-angelogioacchino.delregno@collabora.com>
 <20231006-jinx-playing-261e5f41ff7f@spud>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231006-jinx-playing-261e5f41ff7f@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_044430_585225_F6348EA5 
X-CRM114-Status: GOOD (  19.07  )
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

Il 06/10/23 01:36, Conor Dooley ha scritto:
> On Thu, Oct 05, 2023 at 12:49:04PM +0200, AngeloGioacchino Del Regno wrote:
>> The MDP3 RDMA needs to communicate with the SCP remote processor: allow
>> specifying a phandle to a SCP core.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>
>> v2: I've dropped Conor and Chen-Yu's Reviewed-by tags because I have changed
>>      the description (so, the patch actually changed a bit).
> 
> I dunno, you made it more informative so you could probably have kept
> mine at least.
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 

I just wanted to be cautious with keeping Reviewed-by tags.

Sometimes it's better to drop than unfairly keeping, I'm sure that you
understand my point here.

Btw, thank you!

Cheers,
Angelo

> Thanks,
> Conor.
> 
>>
>>   .../devicetree/bindings/media/mediatek,mdp3-rdma.yaml     | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
>> index 7032c7e15039..59dcea797b71 100644
>> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
>> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
>> @@ -45,6 +45,14 @@ properties:
>>         include/dt-bindings/gce/<chip>-gce.h of each chips.
>>       $ref: /schemas/types.yaml#/definitions/uint32-array
>>   
>> +  mediatek,scp:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      Phandle to the System Control Processor (SCP) used for initializing
>> +      and stopping the MDP3, for sending frame data locations to the MDP3's
>> +      VPU and to install Inter-Processor Interrupt handlers to control
>> +      processing states.
>> +
>>     power-domains:
>>       maxItems: 1
>>   
>> -- 
>> 2.42.0
>>
>>
>> _______________________________________________
>> Kernel mailing list -- kernel@mailman.collabora.com
>> To unsubscribe send an email to kernel-leave@mailman.collabora.com



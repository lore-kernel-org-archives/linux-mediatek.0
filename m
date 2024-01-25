Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513B4C47258
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jan 2024 14:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KOkJZqauz9hUIxteKSgIDdTGbyrmCgjVSGuCVVwQZAw=; b=w5fmQlunmqhs9WAAI+GQtWg4wX
	J23JejnQT0NXWEv43uJmYRdRX0zSv8GYrmaDiF4exEBjLNZOMzlXkuYfEWwjXRCSNoeHimfG4M/MD
	+JsGvncQLpEFGqtdmjIG5kpbAFNPCbNVmb8Y/MamcnNDYkBrnCkHR+r6dKwB31KWVEjE48nJGMriK
	JcsF+FPyKCeXKQWFSfL9VQBdyfZxizc9E8KCdkpgjSilJE4eB3a+sj2SLcz588nuvMPHR8QNMRcYz
	c5hnLhOvGLZPGHJFHgC6hJiN3Ux0w64ofgEHMuRRXK0Khupmx+agq1yis1Ntt1dS/3vcWjCMERcT+
	Uiq49lpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0aO-00000000L1i-3HPF;
	Thu, 25 Jan 2024 14:20:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0aM-00000000L0x-0ZIb;
	Thu, 25 Jan 2024 14:20:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=KOkJZqauz9hUIxteKSgIDdTGbyrmCgjVSGuCVVwQZAw=; b=k2vKAW7YteNYtI0vcQViFK4elk
	CB87cp57toNXGLqgUQwmqQTyNFsIkv4OtAOMkX3g3nMWEoNR+6RIHP0AkpUHYi59ENj3M93aYlT9q
	dXoZc6yk0gZI6yxiE67N1eFytZ2S5KrxMSIkde0PbqpUGYbZ6FrFLIcTRReuBZ5ajaw/01WHTSqNM
	7hE+vLxivxLqfOGSJbmuUZKYlKyqyHJ9v5MIoQtpdF+RqEBcohHoBvJSV9ppSHzLWnXkY7XuEYTv0
	JqpX/wptpS0r+mch/7b9rNalQysApxhTP+TuLn3QCHKy6VVm3/jP097/9ibV8yHi3G9iYsLAtu6lf
	rb3Zdi/g==;
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rSy8J-00000005Dma-2XbA;
	Thu, 25 Jan 2024 11:43:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706182919;
	bh=lIMClxazBCbbP0kSsel6jlB5mJrKwckFwpLWr68KnQk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vewYOVwJUEiqmlgjNKNPbZKIVEvx1wPn8xyneTSefKDDOj+Zh1gYQtubBg06SAM75
	 Yj7ndipccxrzQtscnWa4d7x7nETGOvom4Km7rspA1Rmh9jOLXtnXAd19kIFlQYhUGh
	 1wss5MkNQg/8zVW/HHCaak2qUqh0+oxPi2sIn7KIBVqUb7oEPyL+OQ1U3hFY6q9Ai+
	 E7A6s26M+Tae8n2PIaeDYzcwlaXFHqmQDs9NcXPDDlaq6bCb8lxPYCbrITb4hA2DXP
	 ZE+xjAkqaQ1KkKKVAWtgq9na+sJiMccfCTDzkGsWiwWuuF0T7YD2MaDOFdjUpQ1oth
	 Cg5LK8OuDO3kw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3A0303781182;
	Thu, 25 Jan 2024 11:41:58 +0000 (UTC)
Message-ID: <abbc1135-6d32-421a-baea-123a9f761362@collabora.com>
Date: Thu, 25 Jan 2024 12:41:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: mt6360-tcpc: Drop
 interrupt-names
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Conor Dooley <conor@kernel.org>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: chunfeng.yun@mediatek.com, gregkh@linuxfoundation.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, cy_huang@richtek.com,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240119094105.98312-1-angelogioacchino.delregno@collabora.com>
 <20240119-eldest-discharge-e2d3812be0a9@spud>
 <12b7b339-498b-45c1-bc5e-05e07660aefa@collabora.com>
 <20240123-procurer-jumbo-ebbec485505d@spud>
 <4fdbc3d8-3d44-4c2c-aae6-daa0b431e1c9@collabora.com>
 <dc9773aa-690f-47b5-b60a-a79c1e2dbaf2@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <dc9773aa-690f-47b5-b60a-a79c1e2dbaf2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_114259_735626_AF78CDDD 
X-CRM114-Status: GOOD (  18.69  )
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

Il 25/01/24 11:32, Krzysztof Kozlowski ha scritto:
> On 24/01/2024 09:48, AngeloGioacchino Del Regno wrote:
>> Il 23/01/24 18:14, Conor Dooley ha scritto:
>>> On Mon, Jan 22, 2024 at 11:32:30AM +0100, AngeloGioacchino Del Regno wrote:
>>>> Il 19/01/24 17:32, Conor Dooley ha scritto:
>>>>> On Fri, Jan 19, 2024 at 10:41:04AM +0100, AngeloGioacchino Del Regno wrote:
>>>>>> This IP has only one interrupt, hence interrupt-names is not necessary
>>>>>> to have.
>>>>>> Since there is no user yet, simply remove interrupt-names.
>>>>>
>>>>> I'm a bit confused chief. Patch 2 in this series removes a user of this
>>>>> property from a driver, so can you explain how this statement is true?
>>>>>
>>>>> Maybe I need to drink a few cans of Monster and revisit this patchset?
>>>>>
>>>>
>>>> What I mean with "there is no user" is that there's no device tree with any
>>>> mt6360-tcpc node upstream yet, so there is no meaningful ABI breakage.
>>>> Different story would be if there was a device tree using this already, in
>>>> which case, you can make a required property optional but not remove it.
>>>
>>> Not every devicetree lives within the kernel.. If the driver is using
>>> it, I'm not inclined to agree that it should be removed.
>>
>> I get the point, but as far as I remember, it's not the first time that this
>> kind of change is upstreamed.
>>
>> I'm fine with keeping things as they are but, since my intention is to actually
>> introduce an actual user of this binding upstream, and that actually depends on
>> if this change is accepted or not (as I have to know whether I can omit adding
>> the interrupt-names property or not)....
>>
>> ....may I ask for more feedback/opinions from Rob and/or Krzk?
> 
> Driver is the user and this is an old binding (released!), thus there
> can be out-of-kernel users already.
> 
> Minor cleanup is not really a reason to affect ABI. You could deprecate
> it, though. Driver change is fine.
> 

Thanks for the clarification. If USB maintainers want to take the driver part only
without me resending this, I'd appreciate that.

The interrupt-names is not a required property in this binding anyway... :-)

Thanks again,
Angelo



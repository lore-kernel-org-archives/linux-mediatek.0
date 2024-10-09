Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF53CF0453
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 11:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GL06fSO8Q3oYpoF+fChf2oSUixskEZ/HSzIOe8lQa2k=; b=zxpjW6dMCNjlNnOMwTH9v0VGWb
	gnVbFitDwz93mzDKqIp7A2HUEDJ9J9+dHCakmN6TX40NsV83LiQmZ5g+xCx+y6+0qnP5JlE89Ba0V
	NuxWb7CYl+nqVAOQG2x+4KRM8ySvMerzNaKCmEIykxZzHOy400MY1MOOXBiTIb3tIP548UMsvfYoY
	eQur1eCV1GoS5cdom7DCmHdJw3lDpslUwnISe4J4QBtYQXts0z7uH9n/U8gjaEUhsGF/72oIhs3T8
	//ZoyunEbOQ0OYe039lnvQ9yVAk2Jm8AqywfSO1GNAxB8FcK50UoOA05jeKnfgKi+ydisk1nzobaY
	mhVPfAoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syUWW-00000008zji-42IH;
	Wed, 09 Oct 2024 11:06:32 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syUV9-00000008zPG-3xID;
	Wed, 09 Oct 2024 11:05:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728471905;
	bh=TKg0yrvwHu/NQPe513WTgLUNfnI/jftaMyGjttredTg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I6e90AM5V9SrAtm5zY2/oJst8VLSC7GcUrXw7jqbo/CMwPQGFprGtyaXpdSlaSeBm
	 OXmAtgAZlb5a/ya5Bymg8hqLo115hc8ClFC7T1T2T5AA3fplXHEeMV3oPO+Yz00fvO
	 GioNirBpDaPWu9l2yATMLPgVyXBP6kU027oEGV0b25emFA9oxWm1sdn1B7OLBVq1B4
	 pXykQKUeUw2puJ/lxwuyuI8k5IrCcZWGk6dNuFTjYupPrVCbWosiy7+RNBJ9d3YDXO
	 Xk46wIT7Stapp9Tr1a9nIGnpmd5/HEThuHvJ3TB8kFh4l6Awn5sl7DNhPeo3ODu8am
	 fAR8D8wajrvMQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5A0E017E1394;
	Wed,  9 Oct 2024 13:05:05 +0200 (CEST)
Message-ID: <e68b3cc7-3851-4085-a16e-8b2c8882e26d@collabora.com>
Date: Wed, 9 Oct 2024 13:05:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dt-bindings: mfd: mediatek: mt6397: Add start-year
 property to RTC
To: Lee Jones <lee@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, eddie.huang@mediatek.com, sean.wang@mediatek.com,
 alexandre.belloni@bootlin.com, sen.chu@mediatek.com,
 macpaul.lin@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org,
 kernel@collabora.com
References: <20240923100010.97470-1-angelogioacchino.delregno@collabora.com>
 <20240923100010.97470-2-angelogioacchino.delregno@collabora.com>
 <20241009101549.GB276481@google.com>
 <e0de3810-38b0-40a3-872d-678e9d4f72e5@collabora.com>
 <20241009103307.GD276481@google.com> <20241009103746.GE276481@google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241009103746.GE276481@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_040508_215598_72E199AD 
X-CRM114-Status: GOOD (  13.31  )
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

Il 09/10/24 12:37, Lee Jones ha scritto:
> On Wed, 09 Oct 2024, Lee Jones wrote:
> 
>> On Wed, 09 Oct 2024, AngeloGioacchino Del Regno wrote:
>>
>>> Il 09/10/24 12:15, Lee Jones ha scritto:
>>>> On Mon, 23 Sep 2024, AngeloGioacchino Del Regno wrote:
>>>>
>>>>> Enable evaluating the start-year property to allow shifting the
>>>>> RTC's HW range.
>>>>>
>>>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>>> ---
>>>>>    Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 2 ++
>>>>
>>>> No such file.
>>>>
>>>
>>> In the cover letter, I wrote:
>>>
>>>
>>> For the bindings commit, this series goes on top of the MT6397 schema
>>> conversion from Macpaul Lin [1].
>>>
>>> This series was tested on a MT8195 Cherry Tomato Chromebook.
>>>
>>> [1]: https://lore.kernel.org/all/20240918064955.6518-1-macpaul.lin@mediatek.com/
>>>
>>>
>>> So, that's why. :-)
>>
>> Nope, try again. :)
> 
> I guess you actually mean:
> 
>    https://lore.kernel.org/all/20240918064955.6518-2-macpaul.lin@mediatek.com/
> 
> It's on my list.  I'll place yours behind it and see how we go.
> 

Yes I actually mean that one.

That's because I use to paste links to the cover letter of a series, and that
one did actually miss it, so that's what happened there I guess.

Anyway, I'm happy that you figured it out - this reminds me that I actually want
to keep asking to add cover letters when I review series..... :-)

Btw, many thanks!
Angelo


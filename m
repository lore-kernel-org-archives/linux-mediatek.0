Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8092EC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 13:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zoNlcl5EdrvBU+HSJMxnrCA5HD90xdYfTEFQLwtn1Z4=; b=lWghwFKNYpQemrFZ36A/5ygyxK
	oJV5yGqiz2koAEaGK85CG+ubn/p/RyEjdQH/YgFzgb+xg0gJJiMr005EzaRE57k0P5LQ7XNlpTck2
	uCYKvpzDE2dY/K/21LmUi6bMfBwhN8MnX6a+EnBd70Gt7XQ+Bimnwg/Y87J7lTN9M8y4JHin32msv
	s/OLtZy0tL3qKP1Yq4JdEuYF0+8l1BptHILi7lohcUdQmJuTclr4W8U173U9Ag2aS3FygcoUpOvUb
	gxVZ6wIXTY0hjhp8Q/HoeeUe9D3MV/V412O1BWkgxQtoovTcQe+CZT/sa5fPDHB8KM150Kuv+ocKj
	FOhqv/Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6AqW-00FK4T-KV; Fri, 16 Dec 2022 13:33:52 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6AqK-00FK09-93; Fri, 16 Dec 2022 13:33:41 +0000
Received: by mail-wr1-x42d.google.com with SMTP id i7so2497950wrv.8;
        Fri, 16 Dec 2022 05:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zoNlcl5EdrvBU+HSJMxnrCA5HD90xdYfTEFQLwtn1Z4=;
        b=dYbJm2vLGzYTl1SR6lTyIyZDstx1WHy/Pa1BkvMtNfVWOJJWSBtNqOMr7KvD60tTH1
         FUs79ciy/klSi6Ca989XP7UcPfqMDJNa7mMv+e7QspU4A+yXs9uWaK20MybNg5SNzUFv
         YemAjT3GurkQ3xmcvrNMR86uWiCyrwE/bmuSF8Bt3XQum+X2RppVB5fl+bs1t/p+/w9x
         PacwAi/dZhqMs4dImvBd9KpF3OseST3sSw3R2NIHu3GAnj+MdAbjja76JJJnnww6fNuA
         1nve9xSjYmBo50fZEgbXo3owRD0Z0up36hjZJ4fvcyMMBxRwy84c3oOdJSrtvffgMrcr
         9iuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zoNlcl5EdrvBU+HSJMxnrCA5HD90xdYfTEFQLwtn1Z4=;
        b=LK6etKTpsee69/n2XhcmRMXy3UsAbLlzIjoAJ6BvY1u9g2/JARpREmftfWCt78gQeY
         sewAUuLsj+sYSKUy8iLuvec04JqdhPICIA+RVIrsxthkICLII0mablr2w2Fz9IvxDTDG
         VvWc5NQOPobsHvSpH9WP1M9h4FfXND62DLavkyvPf/dILHIka3k88LX5nypXMLQD+IZC
         j2mPubFcAF7s2FNrsIcsR/J7+berc2qbwqOrBxYs0120A+CXqT7GpBp/xP1Z7hpkCOGT
         rCpeT5LmIPxy1BXocczolqIdw43HrHCh7KlXH+1+w9sZsjrqR0H+w2ijU4X3T/3u5KsS
         NkQg==
X-Gm-Message-State: ANoB5pkKIaXqYxrvgH2abvikM/V34mKyvSvuqsN69+yJp4GgJwTDBX0e
	/YvlDGibjWn4ddI/+WqE04U=
X-Google-Smtp-Source: AA0mqf7GsK+9KF+6xYlMmd/WNxVKsNSXdi9DxwopLYeC+l+LHjQC8M38gOSFU/By16MxGtlZGjC2uA==
X-Received: by 2002:a05:6000:156c:b0:241:fbef:29b5 with SMTP id 12-20020a056000156c00b00241fbef29b5mr43444027wrz.13.1671197615729;
        Fri, 16 Dec 2022 05:33:35 -0800 (PST)
Received: from [192.168.1.132] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id y6-20020adfe6c6000000b00241e8d00b79sm2624307wrm.54.2022.12.16.05.33.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 05:33:34 -0800 (PST)
Message-ID: <dd474515-4a4f-3925-cc96-068f9818a2f4@gmail.com>
Date: Fri, 16 Dec 2022 14:33:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2] soc: mediatek: Add deprecated compatible to mmsys
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@kernel.org
Cc: nancy.lin@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221111082912.14557-1-matthias.bgg@kernel.org>
 <46c17d4b-d130-86a7-b5f8-73c30d7fdfdd@collabora.com>
 <CAGXv+5FORS=iGe55StxR_1E3sdtk9cvitfvNa1SydqCjWGcubg@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <CAGXv+5FORS=iGe55StxR_1E3sdtk9cvitfvNa1SydqCjWGcubg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_053340_365425_9805B402 
X-CRM114-Status: GOOD (  16.78  )
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



On 01/12/2022 12:20, Chen-Yu Tsai wrote:
> On Mon, Nov 14, 2022 at 7:59 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 11/11/22 09:29, matthias.bgg@kernel.org ha scritto:
>>> From: Matthias Brugger <matthias.bgg@gmail.com>
>>>
>>> For backward compatibility we add the deprecated compatible.
>>>
>>> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
>>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>
>> ...And tested on MT8195 Cherry Chromebook.
> 
> This now seems like a bad idea. In the dtsi we have two nodes (vdosys0 and
> vdosys1) that both currently use the -mmsys compatible, which in the driver
> maps to vdosys0. So not only do we have vdosys1 incorrectly probing as
> vdosys0, we also have duplicate clks being registered and duplicate DRM
> pipelines. On my device vdosys1 ends up winning the duplicate clock race.
> 

That's true, we should fix the DTS deleting vdosys1 node as it's not 
implemented. While at it we should also fix the compatible for vdosys0 as 
"mediatek,mt8195-mmsys" is now deprecated.

Would you mind to send a patch?

Regards,
Matthias

> I suggest just reverting this. The display stuff won't be useful unless
> the drivers are able to distinguish themselves from one another.
> 


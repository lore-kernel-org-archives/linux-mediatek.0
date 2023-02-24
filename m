Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B09C61DA3
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 13:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7bFUJgibXbgEqLDdVcvOdjEbvwz5eD3aylDmL5/ninY=; b=ErICcsx4rH959a1AWiYYF46KFo
	FDT+Mmt1qKnYPz2a0rp+pVs1WNi0HzCr0rDb2gp/pj2iIACi2UQjpChbNPgErIP6kiSXvsPQcknGn
	fOaYkyN4X7NoD29/K/8kleT0xqpEoP3XMsvvTBZ9SQF/Rk6rc7Ga4wNOz0S/Hwrr9KNZVyKUpLhaN
	oU3x6KCg7XQBpVaLjx3vFq2stu1YNH0UquuC40ej9kDS2qu1M82npuLJasXcFf2zXT/RyDR+2mAvV
	94Cl/8iJ8Q3wfwDjgGhoWfXvYD0NVepXateuQPNIvqA4ytrjgd5146Hy2V5fK6jBgXf+hIdasANfe
	oQGt0tNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXjU-002Vfy-0t; Fri, 24 Feb 2023 13:03:28 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXjC-002VYK-OX; Fri, 24 Feb 2023 13:03:12 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1BD2C6602FB6;
	Fri, 24 Feb 2023 13:03:09 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677243789;
	bh=nF7vnKnk57AVWXiNF4H8GktvnOQkVo77OMsiyD+o5dU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IF0YTRxd8cT2I7MlYUZkOHXZZnGe0AOe8qgo1ZmAlRT7zi2T0ki5Dj2aBwylXBu7R
	 0Tkhz0tTirQNA8+X1zSRMavYt7tn8d7sjZL7HzIVszNX0t4p3KjgXZqzt54wVD8QIU
	 GDHw52Jkfe6x+Of/er5oiB/u/ZBNudXydmoBheW7LlKimJXxdXCxxUwei8BQv0SAj6
	 OmyqK7dDGMMUgazjsb/XEKPXoD0k5i+Ne1bOnCZnR0QF6ZBPYUENRSvVK9ZFxs/1r6
	 LlmDZMykS2EvFscbpVxKT95fVv3xtX3SYqTUMR1ADPD0oAlCyKihR8L32U4fHQusKK
	 HxLRF5UpChEWA==
Message-ID: <a14eee4a-9659-62b5-6767-0d14bc1712eb@collabora.com>
Date: Fri, 24 Feb 2023 14:03:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 04/16] arm64: dts: mt8183-pumpkin: Couple VGPU and
 VSRAM_GPU regulators
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230223134345.82625-1-angelogioacchino.delregno@collabora.com>
 <20230223134345.82625-5-angelogioacchino.delregno@collabora.com>
 <CAGXv+5Eh62NFNW1T7PYiQe+9KD8qX2WB7M3rwrYD=ca872y3WQ@mail.gmail.com>
 <CAGXv+5Ehm0yb+52m+DL8s99KqBqx7skPZ2xfMFMYVJ23CDsfHQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5Ehm0yb+52m+DL8s99KqBqx7skPZ2xfMFMYVJ23CDsfHQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_050310_973450_7FA483BB 
X-CRM114-Status: GOOD (  10.09  )
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

Il 24/02/23 10:53, Chen-Yu Tsai ha scritto:
> On Fri, Feb 24, 2023 at 5:51 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>>
>> On Thu, Feb 23, 2023 at 9:43 PM AngeloGioacchino Del Regno
>> <angelogioacchino.delregno@collabora.com> wrote:
>>>
>>> Add coupling for these regulators, as they have a strict voltage output
>>> relation to satisfy in order to ensure GPU stable operation.
>>>
>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>
>> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> 
> Actually, maybe you should override the constraints here as well.

I'll add a commit to override the constraints on v3, thanks for making me notice!

Regards,
Angelo


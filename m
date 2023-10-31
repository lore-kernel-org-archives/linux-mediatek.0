Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB14C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Oct 2023 13:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GH1r7oKy0y44dj360FiE9Us94vZ/qTRz9aTS7IJbd10=; b=RtVYi1k4V1qexA6OmSH35/oOpC
	oTycxEQqK86igxrwggv1Lr8I2z9MhS6wbcEyE4g0GVj58skotUX4QS3TD0k5F2PvwW8sWO2NasVPG
	JafJSYlrJYZSSHH4pfYkEzW/pmPsB3uYe8xu/uKmkXEDUR7sYSQ5/0vy/pNDkjfqC+IwqLqHZjHBc
	zcBIfruIj1zsVQJGrzkFGBYOm9rNU3I4EpRTCcsq/WYrY/FwOM4nMuJcQSmlnlBp4aEbUidG2c68r
	bK+m8fLncFVynm96wHuXUnsLr/rBhsBwJZ5KI2aV+80PCOiBt861ISRZNsK35qngAolvXGTItIwoj
	jcKJytng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxocI-005KZO-26;
	Tue, 31 Oct 2023 13:17:10 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxocE-005KXm-35;
	Tue, 31 Oct 2023 13:17:09 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D7B1366073A3;
	Tue, 31 Oct 2023 13:16:59 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698758220;
	bh=UKig+LuihbJ88pZrqsdMkSm6GIDrEJck0xJqKEx+xT8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=heU/JmH5bzkBexwGGbhEbA2kshYTP/yFEexLfR0na3soREvJWMZbMgw79+2gwCwMt
	 F+tEJDK14a+T+Vq2da+/j19xmN7Hjr4QzsCduGwPan6KMhAl2odY0UqnkXZjs+3/Uy
	 iyZd8pINFEQ3IobDyIbhsRB3m66+AOxnXblcTQvgC4BVw5oU9cw5EYouoG/8rPFtUC
	 HH+QNAl7XMxJr5VoMj9rBdKE6v35OZagcosKuzqFRaeC5WjXvrcaJH+KldiY5HU61h
	 dBY/PKGKYmz0oyJUnvDs5fnbsHPKQDKEqqYfvjeXVTXmt5htOtYacdOgJWEWQfSBky
	 wvflJV5wkGfuw==
Message-ID: <e17f5c83-80b2-4cbd-8e56-c484b6848e22@collabora.com>
Date: Tue, 31 Oct 2023 14:16:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] MT8195 Cherry: Assign MFG vregs for power saving
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20231030132523.86123-1-angelogioacchino.delregno@collabora.com>
 <CAGXv+5FWPZYjsXse58k5HyMijkrKBDYw0k4wpdfGv99ur8=5yg@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5FWPZYjsXse58k5HyMijkrKBDYw0k4wpdfGv99ur8=5yg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_061707_131290_A1C6DD8E 
X-CRM114-Status: GOOD (  12.93  )
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

Il 31/10/23 10:19, Chen-Yu Tsai ha scritto:
> On Mon, Oct 30, 2023 at 9:25 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> This series assigns the right regulators to MFG0 and MFG1, respectively
>> VGPU (GPU Core) and VSRAM_OTHERS (GPU SRAM), and removes the property
>> regulator-always-on from both.
>>
>> This allows to save power both during runtime suspend and during system
>> sleep; specifically because:
>>   1. The GPU SRAM regulator is switched off during runtime suspend
>>   2. The GPU Core regulator is switched off during system sleep
>>
>> Of course, in order for those power saving actions to actually take
>> place, it is required to also have the code in [1].
>> Anyway, even without series [1], this will not introduce any unstability
>> as the Vgpu regulator will simply not ever get turned off.
>>
>> [1]: https://lore.kernel.org/r/20231030132257.85379-1-angelogioacchino.delregno@collabora.com
>>
>> AngeloGioacchino Del Regno (2):
>>    arm64: dts: mediatek: mt8195-cherry: Add MFG0 domain supply
>>    arm64: dts: mediatek: mt8195-cherry: Assign sram supply to MFG1 pd
> 
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> 
> on Tomato without the power saving patches. Regulators are correctly
> requested and I can see the SRAM regulator get turned on and off with
> GPU usage.

Yes, I confirm that the sram vreg going on/off is expected even without the power
saving patches (as the power domain refcount decreases during runtime suspend).

Thanks!

Angelo



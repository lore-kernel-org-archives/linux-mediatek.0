Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4621C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Oct 2022 08:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IwjHNZZzUlSgb1XCxw7m+/nnNZYdvWdc29BruIAjm5s=; b=f48ly7GKX/GyivjM0stNXx36J7
	WYrpaV65EUypZPDNQnQyTljQbQWVwl6iWaowvo7xJUIT7HTj7ebnhQikc89PHrDUO1vLDHf93baVs
	2eBE9IpMoyJscKP7Wf2Ri/VoUa+klLB9Y81Vy4h94mxTevBCOhukcHJAf4RnlqCK69fyLgCjf+IQ7
	x4dt2xIr2CM8duetrWI60tSMQSpbdHQjhDRg/BCajY+5E91lGTzibjnLROdNSHBYiqJyga9Wy150L
	VXAcjQkn2m3z4KmPPsZCF9X3vEWp4gl+LP8Ah1yzkKjTtmkUbD+6h05yogUtSJxHO4NVd/1gJTS6U
	PpVTtTJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogj6c-0089Gu-FE; Fri, 07 Oct 2022 08:53:18 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogj6R-0089Dq-58; Fri, 07 Oct 2022 08:53:09 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1C0C26602329;
	Fri,  7 Oct 2022 09:53:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665132782;
	bh=vtFElDx7m6ery3R7WHMzjFgwq5qcoN9DS+Yyj6A964Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EmbYq3a7kp/at3p3BEgiwkClYB6r+EffnRkLhd+qYZ2v8ZLBw9/1gPg8YsB6bpsf2
	 YmMi2o8kRfkKaY6n4tag1dm1eCpmi22oLDcH2kz0cvdoOssXHK/hrqQ1WKiXnVRCPV
	 /b2ZnYBhkoT42lzIz6tP4zfRPJMNvILVGCDZFZxQqJxS3/fMgAhvGQZUYIDEbcLbim
	 X334vqTnhHGxUYetu35zF/BoDKZVLSzCKVzLodY6B2VxxM9crQop0+90E9L2HfgG2F
	 N+lufwLLz1yV/B2/zlJaF8BqFi/QCJQgyxZbPQ7YsnyO72f1UznvmbKzD3zOjXOQ3a
	 eacY+QdgD+eEg==
Message-ID: <f12144d1-d37a-2bd7-5c28-4b15b84818ef@collabora.com>
Date: Fri, 7 Oct 2022 10:52:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 0/4] MT8195 Acer Tomato - Audio support
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220922094908.41623-1-angelogioacchino.delregno@collabora.com>
 <CAGXv+5EzD_CvZHv_HOd4cRB_3qzUDUYwvOBN1qkkdP4ygo862w@mail.gmail.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5EzD_CvZHv_HOd4cRB_3qzUDUYwvOBN1qkkdP4ygo862w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_015307_450332_C751BB33 
X-CRM114-Status: GOOD (  16.21  )
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

Il 07/10/22 10:42, Chen-Yu Tsai ha scritto:
> Hi,
> 
> On Thu, Sep 22, 2022 at 5:49 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> This series enables full support for audio, with DSP, on the Cherry
>> Chromebooks.
>> Related ALSA UCM2 configuration was already merged in its upstream
>> repository [1]: this is fully tested and working as-is since all of
>> the required fixes for MT8195 SOF drivers were picked and are present
>> since `next-20220908`.
>>
>> [1]: https://github.com/alsa-project/alsa-ucm-conf/commit/a59c3b1a57de8eb424c4f754bb031265e856260e
> 
> While trying this patch, I get the following error:
> 
> # modprobe mt8195-mt6359
> [   44.985107] mt6359-sound mt6359-sound: ASoC: sink widget AIF1TX overwritten
> [   44.994393] dmic-codec dmic-codec: GPIO lookup for consumer dmicen
> [   45.000636] dmic-codec dmic-codec: using device tree for GPIO lookup
> [   45.007165] of_get_named_gpiod_flags: can't parse 'dmicen-gpios'
> property of node '/dmic-codec[0]'
> [   45.016177] of_get_named_gpiod_flags: can't parse 'dmicen-gpio'
> property of node '/dmic-codec[0]'
> [   45.025084] dmic-codec dmic-codec: using lookup tables for GPIO lookup
> [   45.031666] dmic-codec dmic-codec: No GPIO consumer dmicen found
> [   45.041434] sof-audio-of-mt8195 10803000.dsp: Topology: ABI 3:22:1
> Kernel ABI 3:23:0
> [   45.050185] mt8195_mt6359 mt8195-sound: ASoC: Parent card not yet
> available, widget card binding deferred
> [   45.060566] sof-audio-of-mt8195 10803000.dsp: ipc tx error for
> 0x30010000 (msg/reply size: 96/20): -22
> [   45.069965] sof-audio-of-mt8195 10803000.dsp: Failed to setup widget AFE3.IN
> [   45.077575] sof-audio-of-mt8195 10803000.dsp: error: tplg component
> load failed -22
> [   45.085291] sof-audio-of-mt8195 10803000.dsp: error: failed to load
> DSP topology -22
> [   45.093062] sof-audio-of-mt8195 10803000.dsp: ASoC: error at
> snd_soc_component_probe on 10803000.dsp: -22
> [   45.102880] mt8195_mt6359 mt8195-sound: ASoC: failed to instantiate card -22
> [   45.123915] mt8195_mt6359: probe of mt8195-sound failed with error -22
> 
> Any ideas?

We have to recheck if the firmware that was sent upstream is the right one for
Tomato's dts topology variant, I think.
That's surely a firmware issue that you're seeing, anyway.

sof-mt8195.ri

Cheers,
Angelo


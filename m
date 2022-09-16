Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF288ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Sep 2022 07:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SZjaPEz0KW/NGLXDXwJQqk1E1Ha/J2O2+lU9nTzG2VM=; b=a5pMJQW1ktFz7wqpYpQSNQYn9h
	Sel/0Ej1gh8mFWmmhqi70mhrv/f5Xnz/H5by6KgBQeJ3iP5n+asCiS+gQZuKOhXfKVIEgugvOssFd
	VtUQ1OI8uK4WcEyEn+8GlMT2uFQ9LQ0mZR2ftuIaJI/ahAzGYMwgR27OURbLMw69neRXLgIxG8GEG
	jqTu+Bzk752GgnqW6nzMDxlYOlBg+Vo+mtmtv9jqximQeaYeeZdzBSqppLjIPCDX1gYfJnzSKtYBi
	4s+BY5aeyOhl/IVS4zjz3OaloUMOjRcfRGUy8VuRGAqASh7rbPupkShnxiCkCirzUUpxStw+TgTfp
	RsOXrxlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ5rR-00A1MN-PJ; Fri, 16 Sep 2022 07:34:05 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ5qy-00A0mE-6x; Fri, 16 Sep 2022 07:33:37 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 957C56601FA1;
	Fri, 16 Sep 2022 08:33:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663313614;
	bh=aWtRXRI7fxQBjROCdpFicK7krf9njG3Luudt99ZAeAo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZTeH9hWylUWWDYAaQO0o4OhhOY5Bn9HdDkUrinzDSsrVSDTaTF8y8f0As5M9EBwxL
	 o+fphIvpgDmSRDWkhdQW2JdY5dIHZoOYkFvcg07IT0EmNNtMCtqeb1FNP1qJkT2aQf
	 N4FuWYkjCVAOPMA8taDAHbZ+CTUk8da4e2Fm7ssosj84DI9zREw4MdYG2QdsMPcV+5
	 ECshjxW9VgHmAu3IRSR85tbWs7b1FPOo10Dhj/8h5PEPighiA48tLa0ydZDE/4ccKb
	 l8N5X48BGQr2YJ6tcYKcVr7P7wIRwKuHQA4wcFI7FnoXhnFRXyjlTureF27e+giOPx
	 ucoaa/7eiJCbA==
Message-ID: <ccd27ec5-6bce-0f5c-1b58-b7bfcbccdeed@collabora.com>
Date: Fri, 16 Sep 2022 09:33:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v9,4/7] thermal: mediatek: Add LVTS driver for mt8192
 thermal zones
Content-Language: en-US
To: Balsam CHIHI <bchihi@baylibre.com>
Cc: rafael@kernel.org, rui.zhang@intel.com, daniel.lezcano@linaro.org,
 amitk@kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, mka@chromium.org, robh+dt@kernel.org,
 krzk+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, james.lo@mediatek.com,
 fan.chen@mediatek.com, louis.yu@mediatek.com, rex-bc.chen@mediatek.com,
 abailon@baylibre.com
References: <20220817080757.352021-1-bchihi@baylibre.com>
 <20220817080757.352021-5-bchihi@baylibre.com>
 <8d6383e0-329e-ca91-6e79-85b3806a2af3@collabora.com>
 <CAGuA+ooEHPiHuGYXOh7s68HRTv9HSr-BexFsCLUPWTMQ3szCfg@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGuA+ooEHPiHuGYXOh7s68HRTv9HSr-BexFsCLUPWTMQ3szCfg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_003336_416511_E3353C97 
X-CRM114-Status: GOOD (  19.17  )
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

Il 15/09/22 18:58, Balsam CHIHI ha scritto:
> Hi Angelo,
> 
>>> +static int soc_temp_lvts_read_temp(void *data, int *temperature)
>>> +{
>>> +     struct soc_temp_tz *lvts_tz = (struct soc_temp_tz *)data;
>>> +     struct lvts_data *lvts_data = lvts_tz->lvts_data;
>>> +     struct device *dev = lvts_data->dev;
>>> +     unsigned int msr_raw;
>>> +
>>> +     msr_raw = readl(lvts_data->reg[lvts_tz->id]) & MRS_RAW_MASK;
>>> +     if (msr_raw == 0) {
>>> +             /* Prevents a false critical temperature trap */
>>> +             *temperature = 0;
>>> +             dev_dbg(dev, "LVTS not yet ready\n");
>>
>> ...and you're not returning an error code, despite this function was called
>> while LVTS is still not ready? :-)
>>
> 
> if I add "return -ENAVAIL;" here, I will get the following errors on boot :
> [    0.292094] thermal thermal_zone0: failed to read out thermal zone (-119)
> [    0.293019] thermal thermal_zone1: failed to read out thermal zone (-119)
> [    0.294158] thermal thermal_zone6: failed to read out thermal zone (-119)
> [    0.295697] thermal thermal_zone9: failed to read out thermal zone (-119)
> [    0.296600] thermal thermal_zone10: failed to read out thermal zone (-119)
> [    0.297698] thermal thermal_zone15: failed to read out thermal zone (-119)
> [    0.298625] thermal thermal_zone16: failed to read out thermal zone (-119)
> 
> I just preferred : *temperature = 0; to avoid a false critical temperature trap,
> and "return 0;" to suppress these errors.
> After that (first read at boot when LVTS is not fully ready),
> "msr_raw" will be always != 0.
> And I did not want to add a "delay" or a "sleep".
> Please let me know if you have any suggestions that could fix it in a
> better way.
> 

It's the wrong error number. You have to return -EAGAIN :-)

>>> +
>>> +     } else
>>> +             *temperature = lvts_raw_to_temp(&lvts_data->coeff, msr_raw);
>>> +
>>> +     return 0;
>>> +}
> 
> Best regards,
> Balsam



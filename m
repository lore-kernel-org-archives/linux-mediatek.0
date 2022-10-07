Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB72C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Oct 2022 08:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/wRN9Yv2CfNxcf9YBqx89gFKM99uDrGF0BzMeFd+YFU=; b=JewaQnmPznvZzgGT9yXwrz84VG
	eT0Pj7eUGuYkleIyFMnvRxiiQGBkd3i5Kq/W7PfTk4NK9IQ4wDqflhjdTJIJHMMZBTXz9KgnHVK0A
	/5kG0oLyOnRU9PiOQr1GBOOIBfHQ+sSrcBgdA1GhWq9WN/SnC/pi9FWtFqfNpnmPHnVg1at0ZyaMc
	LepYAne87RaiMH1dBEIx5zKp4EPVofFWd6g24C5hnxJCDRHutPdacJR7xyY81ldPuWV5F8d9fRzB5
	VBG+26a5A1qkWJNriMZ95/zv67CC438LPLOyefQXK9CA/0Wu5U/0f2BtPtmlxPzW/Faa8pSwQvMMi
	000UF+9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogix0-0087lO-9t; Fri, 07 Oct 2022 08:43:22 +0000
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogiwp-0087kU-LC
	for linux-mediatek@lists.infradead.org; Fri, 07 Oct 2022 08:43:13 +0000
Received: by mail-vs1-xe2f.google.com with SMTP id k6so2216006vsp.0
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Oct 2022 01:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/wRN9Yv2CfNxcf9YBqx89gFKM99uDrGF0BzMeFd+YFU=;
        b=RC4QKAxEKz4CTRbnr2wi1YEIbcXXzvIs++ooUV0OXRGR9jX6ETreM5yyblTbOATPFl
         scH8L0JgjTL6qJXBGXDNlZqNhssTLF6yGtVwP3EvnrOSSVmeFAyUhcbBTUSeeQQZxnEk
         nDumFDgu7ISQiHdHcpJhNPnfuK0z8nSIKewSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/wRN9Yv2CfNxcf9YBqx89gFKM99uDrGF0BzMeFd+YFU=;
        b=0+flTHMJDTGTLmaeJ8XTesSmR+JqqPtVDtp1u8Pzgak4Z+H4yrIWNV/ImhawnnFEq0
         A6yoFrSWH6eNuK8gfnmNHeErx+AoPzml1Gxreyt9lOPcFluk/1wXo38CYPJ7Q1v9NLX2
         60YdpPsR0TBlXyyXxz5NT8+b0+1c3MIYlJqgnHHzMg5cImnmeLMzESfyfkW2hYxF0V1X
         BsWUdB0lirWGItv6czzxoumxJitKmHElyghrHgXQZg48fTVtru8YPj1n4j7R+P2RCOMV
         U1su0v9m3T83RbJD1xl1U3ndOzkBPb9Lc3kogjv21vgcPAPXNxkNb/Txs6buNwcXT54n
         JncA==
X-Gm-Message-State: ACrzQf2AR07eCcehR+4HiwgpgjoIPuemtSj7Ike2WluAqBYUk8wMzRea
	ak0QUa5ReeYcglsj+H0wuhr+UgerNwly+2hAsTBvKg==
X-Google-Smtp-Source: AMsMyM5T2pR3gJ6oy1XnmNARB6l9+7aO3arQUP8stoBiyG9epg+dwG5j2SQGcmkRKHxu2I0GuhcX1JiF0CFNH357KNs=
X-Received: by 2002:a67:ac09:0:b0:39a:eab8:a3a6 with SMTP id
 v9-20020a67ac09000000b0039aeab8a3a6mr1999587vse.9.1665132187627; Fri, 07 Oct
 2022 01:43:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220922094908.41623-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220922094908.41623-1-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 7 Oct 2022 16:42:56 +0800
Message-ID: <CAGXv+5EzD_CvZHv_HOd4cRB_3qzUDUYwvOBN1qkkdP4ygo862w@mail.gmail.com>
Subject: Re: [PATCH 0/4] MT8195 Acer Tomato - Audio support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_014311_698978_C6F082C8 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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

Hi,

On Thu, Sep 22, 2022 at 5:49 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> This series enables full support for audio, with DSP, on the Cherry
> Chromebooks.
> Related ALSA UCM2 configuration was already merged in its upstream
> repository [1]: this is fully tested and working as-is since all of
> the required fixes for MT8195 SOF drivers were picked and are present
> since `next-20220908`.
>
> [1]: https://github.com/alsa-project/alsa-ucm-conf/commit/a59c3b1a57de8eb424c4f754bb031265e856260e

While trying this patch, I get the following error:

# modprobe mt8195-mt6359
[   44.985107] mt6359-sound mt6359-sound: ASoC: sink widget AIF1TX overwritten
[   44.994393] dmic-codec dmic-codec: GPIO lookup for consumer dmicen
[   45.000636] dmic-codec dmic-codec: using device tree for GPIO lookup
[   45.007165] of_get_named_gpiod_flags: can't parse 'dmicen-gpios'
property of node '/dmic-codec[0]'
[   45.016177] of_get_named_gpiod_flags: can't parse 'dmicen-gpio'
property of node '/dmic-codec[0]'
[   45.025084] dmic-codec dmic-codec: using lookup tables for GPIO lookup
[   45.031666] dmic-codec dmic-codec: No GPIO consumer dmicen found
[   45.041434] sof-audio-of-mt8195 10803000.dsp: Topology: ABI 3:22:1
Kernel ABI 3:23:0
[   45.050185] mt8195_mt6359 mt8195-sound: ASoC: Parent card not yet
available, widget card binding deferred
[   45.060566] sof-audio-of-mt8195 10803000.dsp: ipc tx error for
0x30010000 (msg/reply size: 96/20): -22
[   45.069965] sof-audio-of-mt8195 10803000.dsp: Failed to setup widget AFE3.IN
[   45.077575] sof-audio-of-mt8195 10803000.dsp: error: tplg component
load failed -22
[   45.085291] sof-audio-of-mt8195 10803000.dsp: error: failed to load
DSP topology -22
[   45.093062] sof-audio-of-mt8195 10803000.dsp: ASoC: error at
snd_soc_component_probe on 10803000.dsp: -22
[   45.102880] mt8195_mt6359 mt8195-sound: ASoC: failed to instantiate card -22
[   45.123915] mt8195_mt6359: probe of mt8195-sound failed with error -22

Any ideas?


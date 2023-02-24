Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D9EC678DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 09:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/qoo0Vl6Dt6+rRFuuAIcMuZATYWf1GK6779hkAk6CE4=; b=Z9BpkApYTvTNTbrKWVJLx3U61e
	jatgVhN1LcjWv57hqMJ81fRoQ8XlPkoqUUFD+nrW8d5mGZnar996GAloqfm+hNgJZhYXzFIz+zwam
	/tu4tL56ZGlxeJ8I5n8OeiosK7KSEW+g2hfcLw9uTVV6/908raRihA1NrDWpZdGFmG1Ny/i4lM9uN
	di59QUU9PUpLm77x48f9m+w5Mo9DGPljmKzYQPd0mV6RFPA0BKxuBtnoN6eZXQMnEzC0fXAVZhugB
	G5U8lkWJ8YtbWXQe26pFqn/4FZNpbbyt2KzqqM/S4bSYWTWAWtledvehrrybP/FCOStNl6c7LFeSF
	AMMCCNuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVU8G-001erE-B1; Fri, 24 Feb 2023 09:12:48 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVU85-001eou-Hy
	for linux-mediatek@lists.infradead.org; Fri, 24 Feb 2023 09:12:38 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id f23so20233519vsa.13
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Feb 2023 01:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/qoo0Vl6Dt6+rRFuuAIcMuZATYWf1GK6779hkAk6CE4=;
        b=ZjPNlKUyIo7tNRDIxYTYuF7YTMR/erUuudAm8uZtmcoRkOW3CV1paGAOl7X1VC65Kr
         Z6eSKAiYHLmTsaJ/J3gbRAba8BV+KEPVEP+qanXhg+mav/BY9GlOqJLPB/yvnNT7pkM4
         2ikpZ6yDaQdRtMuD914DMA/lDdtdfQh5O/zTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/qoo0Vl6Dt6+rRFuuAIcMuZATYWf1GK6779hkAk6CE4=;
        b=5ch0bAV/yh8BdSCeL3F+bHcmW8cr4NWd+TNwpO1660aZMf5WLjNP2GzO76zlDVbsGx
         kD7mDE1NhIwSOvyog1uF6Km1GwbVm0n00vhybvNmkHV3VMxxbMvRp0Avuh6zPw3QbLVw
         x5QNDvhuykKvc8vqYnE5AzB1cKSDnYw14iLvDjFfT/QnhhpTjUJXE2IoDe0447XiCUSk
         hFvRhYo2R0+rG+6kARb1cZjn3iScuQww6RrM94ggnin5dRAxUY72sEGQ8ivhAkUHxgF2
         vNBF/aCnxvUByH1twbgAdLk+piPPYKao8iXOM4GSynav4zeOMHHwrN6FL15HWTDtU2aw
         CG4Q==
X-Gm-Message-State: AO0yUKXJEMNjnLzqamWt3P46CjwYRoGBVGs+UzUp0so/vuZ52yyFzozN
	QHiV/lQbRwJWGHMqMZ4jfg8weG7wyZzoeEr1GAdlTA==
X-Google-Smtp-Source: AK7set/kZM+FtzDiARLR/jfO3rdOy/faEqk4bCEdVebsQUHQkhnwfGQlKHeg2rZg9NqLac7Tpv7VJ2de/hYHIO2cTYE=
X-Received: by 2002:a05:6102:1592:b0:412:5424:e58e with SMTP id
 g18-20020a056102159200b004125424e58emr2312489vsv.0.1677229954275; Fri, 24 Feb
 2023 01:12:34 -0800 (PST)
MIME-Version: 1.0
References: <20230223145426.193590-1-angelogioacchino.delregno@collabora.com> <20230223145426.193590-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223145426.193590-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 17:12:23 +0800
Message-ID: <CAGXv+5HyqPLYqXBwwExRUXy0BhykX7K+gGGnGCZ1rAmJhm9Hyg@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] arm64: dts: mediatek: cherry: Enable PCI-Express
 ports for WiFi
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_011237_630416_F16B4164 
X-CRM114-Status: UNSURE (   8.57  )
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

On Thu, Feb 23, 2023 at 10:55 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On the Cherry platform, a MT7621 WiFi+Bluetooth combo is connected
> over PCI-Express (for WiFi) and USB (for BT): enable the PCIe ports
> to enable enumerating this chip.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../dts/mediatek/mt8195-cherry-tomato-r1.dts  |  7 ++++++

For pcie0 in tomato-r1, this is not used for WiFi. This was only used in
the earliest version for NVMe. It was subsequently removed. Please add it in
a separate patch.

>  .../boot/dts/mediatek/mt8195-cherry.dtsi      | 25 +++++++++++++++++++

For pcie1 in Cherry:

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>


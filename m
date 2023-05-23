Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF26C7EE26
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 May 2023 10:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i6w3sPrSomaK6vYQVMgu/kzGmiGHSmd5gsIIpynPqCg=; b=00C7r8Dv2ruBSSddhERA+mQdpv
	X06lvmxNkm81ZH4KnlbJPHzmywbWDQvaql+lBiwleICr6/Y3v0IKB0ur9NzOSjdGkbb/dya2ZbeCN
	haUJmz/6AgT9xtNhY5yw1+x9fE+/DG8v+1djuYX912CkthmaDPA/aT5FBHZboFJOeQheB2qfb3d5P
	exf7kinIOopIgEFdgIVHQ/aISV2tA2MWm0n0U9xBxfiKtIpAtIYgwdN6QrAaMWCjBNxbEXA9i8zOf
	1saHFgO7di0aT1/+ADoPeTee4gnwVJEHWjg/kB2skEx/bHZInIQBr9Iq9/6a1mMoikVjbhHRgO42a
	TNP36DJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Pix-00A0UH-1F;
	Tue, 23 May 2023 10:58:39 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Piu-00A0T0-1p
	for linux-mediatek@lists.infradead.org;
	Tue, 23 May 2023 10:58:37 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3f608074b50so15153855e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 23 May 2023 03:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684839515; x=1687431515;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i6w3sPrSomaK6vYQVMgu/kzGmiGHSmd5gsIIpynPqCg=;
        b=ZqWAbyEakVKPpFD/J/z3kYo7lHMPrxJjYYN7fnLelta0e/YR9Xmz3GMlu5Ym+Zr2pK
         ouFcbNJFQknKe98Zw+zI8kbqTwTPY6eLMWhFxiCcav6cBhxAlYya8e7aJifoqv0YAQzU
         fqpJjF/TVcp938OLCWo5wRRGjYd1aLzQskm3YZ/H1fsua80DSr8LOwtPOSAFSfUcYw3z
         LSIYmux9uryyokaXuXLYEvDl5CAxAu4mGn9Kb6kFhXm+Zq+FUdatjGkmMo43fAjnaKD3
         Sj39zh1BKS0x+qo2iOwFlMoYkW3UXJZ1dgius2stQHDAsri6U35E6rETfSLp0N6DFzc9
         sYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684839515; x=1687431515;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i6w3sPrSomaK6vYQVMgu/kzGmiGHSmd5gsIIpynPqCg=;
        b=UDLh1bKiygNXKrVB61oTiIpbEC3/BlxE2BwYarUKmgNCOJPgxGeyfNEyueHumKg9zE
         yYW0FjTQNiMzuWTzE4EIaWoEOEWP4g2Bqodu+qQTo2ao+M2CR5Nma0SPMTGE5rdq9m4f
         HN2LRJ0/9wJA4yhnH6+iI0Rzrd5OQyDBmWODIBeZ026I5GF4M1n74i1LFTjbGH6BZgl0
         7KjD783gJzaZkSmdR/pyLBDqKTYtxXq22iQOdsYd+oTPL6jD8ZWF66E1pc+f1wdM+/U7
         FW1UCmObfmFrn77Q4kWykaJu0zKP803MbSpIVnjQLUiDmxCdq0SUVIdFerJmdspzd3g7
         XwdA==
X-Gm-Message-State: AC+VfDxp+C8Jg6dbpEmCRMz6SLqO6nETSXE1PR590H0auRssAaDwtKp0
	YA2MX1nAX3Xlqau5dNt5SvNYog==
X-Google-Smtp-Source: ACHHUZ7S/7Vokqqrj6HwXGeGDqC/4hlfaVpowDnOSEx8UktgQIfdViz/chTBaLrC2s80+i7yUZqCxA==
X-Received: by 2002:a1c:f402:0:b0:3f4:23a4:7a93 with SMTP id z2-20020a1cf402000000b003f423a47a93mr10738378wma.25.1684839514687;
        Tue, 23 May 2023 03:58:34 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id y21-20020a7bcd95000000b003f4e8530696sm11286717wmj.46.2023.05.23.03.58.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 03:58:34 -0700 (PDT)
Message-ID: <af25cbbe-bfa9-3d29-360e-e4f932d286c8@baylibre.com>
Date: Tue, 23 May 2023 12:58:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/2] clk: mediatek: Remove CLK_SET_PARENT from all MSDC
 core clocks
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 mturquette@baylibre.com
Cc: sboyd@kernel.org, matthias.bgg@gmail.com, wenst@chromium.org,
 chun-jie.chen@mediatek.com, mandyjh.liu@mediatek.com,
 miles.chen@mediatek.com, zhaojh329@gmail.com, daniel@makrotopia.org,
 nfraprado@collabora.com, rex-bc.chen@mediatek.com,
 Garmin.Chang@mediatek.com, msp@baylibre.com, yangyingliang@huawei.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20230516135205.372951-1-angelogioacchino.delregno@collabora.com>
 <20230516135205.372951-3-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230516135205.372951-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_035836_609171_E421826C 
X-CRM114-Status: GOOD (  11.04  )
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

On 16/05/2023 15:52, AngeloGioacchino Del Regno wrote:
> Various MSDC core clocks, used for multiple MSDC controller instances,
> share the same parent(s): in order to add parents selection in the
> mtk-sd driver to achieve an accurate clock rate for all modes, remove
> the CLK_SET_RATE_PARENT flag from all MSDC clocks for all SoCs: this
> will make sure that a clk_set_rate() call performed for a clock on
> a secondary controller will not change the rate of a common parent,
> which would result in an overclock or underclock of one of the
> controllers.
> 
> Signed-off-by: AngeloGioacchino Del Regno<angelogioacchino.delregno@collabora.com>
> Reviewed-by: Matthias Brugger<matthias.bgg@gmail.com>
> Reviewed-by: Markus Schneider-Pargmann<msp@baylibre.com>

Tested on mt8365-evk board.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Tested-by: Alexandre Mergnat <amergnat@baylibre.com>


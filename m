Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6301C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Nov 2023 08:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IvsRfYdBOBRI+2J2urSL+yk+k1mRSeviqg4tt/tKPu4=; b=LFX5Rr/IasyBCOz2i6FfMCcT4m
	819gY/kN70tPuYK0OJH5qAXOL4RUXyLfhfdOAj7F8Bf6nXhkuw7iOq8d1Lwjm3k6nqH1FVLmAT0IN
	SkJXlgaA0VjPUAqrp0Pwq5trouMzR6F+QAp884+Jj8JBoylWkjHdtTODoOeycST5yz2c9rKDo2m3T
	1cUUvGO1x8Nvo47HkijAIYQ1OLEK1+gGqEHnn/w06IMwrB1/VtCOZfal/xW9AdFgeVzXOwhRudN+2
	FgJrOS7f/ct7wXVPFNQLIi1QDLAHuRDViTuz7UA1XfqlS1IIitNUNg0bKOUCzVlGEdEKd9ESNcRT8
	09VyHKyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzvJf-00G6U5-1X;
	Mon, 06 Nov 2023 08:50:39 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzvJb-00G6S4-2S
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Nov 2023 08:50:38 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50939d39d0fso5450394e87.1
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Nov 2023 00:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1699260631; x=1699865431; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IvsRfYdBOBRI+2J2urSL+yk+k1mRSeviqg4tt/tKPu4=;
        b=HmV9LMnf+WL10NdoISwI3GbMdcyWEDyP08QZLeFwT6uHNUEsAUIbNcpp3ajHxgvoiH
         tsstRI2kYoE7z9IojgvbWjPUbQ0d8/mhiUX/t59OuCK+omzO0GRRdKYx203dH5tlH7rF
         Heg3VsiVpHXtLWwIMMtMktdo/U+JVcOR5hYyFnawVKVjPFX7MWVAxc1CifmpGDGuX8ug
         Lc+lOz/ElgegUiTM1wGfxmOoes6jExUflyVJJ/WJLN8UcNSdPBwmi72SRbtEIfpK4IIR
         Ym5X0OMIEgIO65On9sCCdw0CaQYSYQaVDM1EhQCd/NRtEAupuwU2oK1FWNHS8ON2o4zF
         cbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699260631; x=1699865431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IvsRfYdBOBRI+2J2urSL+yk+k1mRSeviqg4tt/tKPu4=;
        b=dWDymFbCP1EHPglFAiBnh2kyrorDztboNt6FXq7W3IcW1eQ40xDX8igADXF1wEHjob
         5Tz2HzCC+q3Dkv+SXbXtlgth/VPlypfN2WP5AeDB41PP5CQOE1CV7md785AYUrfMJety
         UwZmx6rfmPyToD9cB0Jk4LArrU+/IhqZzgKiYbSy0Wq1eZ78+aWu78vr5hraCZ+nL+e0
         FZH9AEjhKCMf0GxUQa1fQtxkT0UNCaxrBKdRiu6U7tJCQqvpOqbiAK28IJ4/eyNnP4Fo
         CRCFU9pStTag9mS/oH/RInsj5PB1GKAZD984DRPM381FyJtUqQ6IDeMC3e5z8+0ksNzm
         Cscw==
X-Gm-Message-State: AOJu0YxELDuDVLthWsmBJ4KVr89cDhJVq4QC2rpYuRDpt//IBASVprcw
	YbkeEAi5Dx8+QcqY8ZIjGyNEiw==
X-Google-Smtp-Source: AGHT+IFtG/faO87cJotALJcL+BJ0/q9GgEd4szJRDFIiNksFhPa1PUp3VBl0axOB+aGZEJFN0JWOIQ==
X-Received: by 2002:ac2:5626:0:b0:507:9ff6:75b6 with SMTP id b6-20020ac25626000000b005079ff675b6mr19451969lff.50.1699260630822;
        Mon, 06 Nov 2023 00:50:30 -0800 (PST)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id l7-20020a05600c1d0700b00405bbfd5d16sm11521401wms.7.2023.11.06.00.50.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Nov 2023 00:50:30 -0800 (PST)
Message-ID: <34b7503e-5d1e-4fd2-a909-d7f50e45c8e6@baylibre.com>
Date: Mon, 6 Nov 2023 09:50:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] clk: mediatek: mt8188-topckgen: Refactor parents
 for top_dp/edp muxes
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 sboyd@kernel.org
Cc: mturquette@baylibre.com, matthias.bgg@gmail.com, wenst@chromium.org,
 msp@baylibre.com, yangyingliang@huawei.com, u.kleine-koenig@pengutronix.de,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20231103102533.69280-1-angelogioacchino.delregno@collabora.com>
 <20231103102533.69280-4-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20231103102533.69280-4-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_005035_799019_EEFDD8D2 
X-CRM114-Status: GOOD (  12.52  )
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


On 03/11/2023 11:25, AngeloGioacchino Del Regno wrote:
> The top_dp and top_edp muxes can be both parented to either TVDPLL1
> or TVDPLL2, two identically specced PLLs for the specific purpose of
> giving out pixel clock: this becomes a problem when the MediaTek
> DisplayPort Interface (DPI) driver tries to set the pixel clock rate.
> 
> In the usecase of two simultaneous outputs (using two controllers),
> it was seen that one of the displays would sometimes display garbled
> output (if any at all) and this was because:
>   - top_edp was set to TVDPLL1, outputting X GHz
>   - top_dp was set to TVDPLL2, outputting Y GHz
>     - mtk_dpi calls clk_set_rate(top_edp, Z GHz)
>   - top_dp is switched to TVDPLL1
>   - TVDPLL1 changes its rate, top_edp outputs the wrong rate.
>   - eDP display is garbled
> 
> To solve this issue, remove all TVDPLL1 parents from `top_dp` and
> all TVDPLL2 parents from `top_edp`, plus, necessarily switch both
> clocks to use the new MUX_GATE_CLR_SET_UPD_INDEXED() macro to be
> able to use the right bit index for the new parents list.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre


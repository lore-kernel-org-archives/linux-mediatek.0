Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D00C7EE23
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 May 2023 10:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JpbiziC971fCgdwZTyN3rsD98IhVaUnm83YTaNKNO9U=; b=ezWkAkrZbO6gwLzrLHpTkNhsvR
	XFL4XMsdAiOQFn104WllxLlpsr0kTFRBDirsADlHMqILFdYyNMbAmra/UZIsabTDVVWU0AWrHSyjX
	w1wIXK3IHyPbcQkHsG/1uI5h6JMK7wBNrgWc00WwOZ/5PuRGbjwzpE4QeuUC9EBWz5v68s7cfmrNv
	WlXpTZwpk5HoHuVBZeFiJxEABr4XlVdVTeYSJ/yt2vkQS0Ejuhg9i3B2BwoVeU/HSAC2S9Pts6MZx
	jXqkHJNtWaOnwQpeCZY28MEKXqrEGlApozLDTqexOlVQKdEKk3GaaERyXR5ZpnBH3IopPaqwqvt49
	+TERMnOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1PfL-009zbR-2P;
	Tue, 23 May 2023 10:54:55 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1PfH-009zYj-1g
	for linux-mediatek@lists.infradead.org;
	Tue, 23 May 2023 10:54:54 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f607dc98cdso12337955e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 23 May 2023 03:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684839287; x=1687431287;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JpbiziC971fCgdwZTyN3rsD98IhVaUnm83YTaNKNO9U=;
        b=Im2BC/cZZs/nLmwVnIFV9v2x4XddTP6s/jNYrRuPb3xtg9NZgt5845Wuc5CCzJxvqt
         jyU6XsT6NRj8lu7AJ5J4YVMk12Iq/b/NmbZG8HNvsD0OrGAuphe1ipnH+3MBZDws5+3G
         oaMhKoymv3iCrZVy6I7p9okVdADL8bMeeBKnFDHpjsJ9WGRlv9VklsgCniJ8Ods85TJk
         v0i0DgcH37rrtDFdpazXkVThlpPpN87h/v5/HOe8gTu8hKN+f+k6drBg7tK7d/XqsUBk
         l/cYOlh4HFLLgPauWUTOWMeZyyNlx7EDF6Eg+AInEETIWnW00/ZOF9MWNopq3qI/3HY2
         wx/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684839287; x=1687431287;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JpbiziC971fCgdwZTyN3rsD98IhVaUnm83YTaNKNO9U=;
        b=aFWWXf/xA3tVnd0QtHwwMCfKNOnvyYNxVsjbzgSYa2T7TpBF2s28iR9v8vIIxe83o6
         K+H8v58Kqv5sODWQoR3BKLDqTtc3qgGv8VOU08wjNykPdDNHMArpfKw/sqdCa/oqMg0n
         QkxTMoKSovenbxWjZljhhSq06TDJwTagm9yexwEqxBAhddQcSzPo5dPW0kAjAnRv/p2P
         cr0JH1rX8oJbUovcypJI967bsxcMt3DFPx8z/KZuY0W2DSA0sbsL2KvWRzZLRUFuy/G8
         E6ZaY3JesLwLSwMjXOgnnfeblyl6YE6YpmSNfFBwtn1Mq8cYpBEBMXGVtqgN0y5jo+2r
         QvZw==
X-Gm-Message-State: AC+VfDynSFQ7lUWgPXf3F5O6J13EZlk4PQnplBVdCU+JMY2Kga8N8LGG
	fpKAMFNh49bGreKClR67jn5GIw==
X-Google-Smtp-Source: ACHHUZ4OkQbxZxWJnqMxYZkGGL+kAn4S+slV+wc6xaUCOai6Uyf3iG710FbrcdEtIc85NncyWLqDTQ==
X-Received: by 2002:adf:f409:0:b0:2fe:e137:dbad with SMTP id g9-20020adff409000000b002fee137dbadmr8403815wro.51.1684839287494;
        Tue, 23 May 2023 03:54:47 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id w13-20020adfd4cd000000b0030497b3224bsm10633223wrk.64.2023.05.23.03.54.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 03:54:47 -0700 (PDT)
Message-ID: <b91a60a8-0f9e-9020-8b06-e78f21ef1fed@baylibre.com>
Date: Tue, 23 May 2023 12:54:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/2] clk: mediatek: mux: Stop forcing
 CLK_SET_RATE_PARENT flag
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
 <20230516135205.372951-2-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230516135205.372951-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_035451_775435_FF8A885D 
X-CRM114-Status: GOOD (  11.00  )
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
> The clk-mux driver was forcing the CLK_SET_RATE_PARENT flag even for
> the GATE_CLK_SET_UPD_FLAGS() macro, as in mtk_clk_register_mux() the
> flag was unconditionally added.
> 
> In preparation for a change on MSDC clock muxes, stop forcing this
> flag and, where necessary, update clock drivers to add it so that
> with this commit we introduce no functional changes for the currently
> supported SoCs.
> 
> Signed-off-by: AngeloGioacchino Del Regno<angelogioacchino.delregno@collabora.com>
> Reviewed-by: Matthias Brugger<matthias.bgg@gmail.com>
> Reviewed-by: Markus Schneider-Pargmann<msp@baylibre.com>

Tested on mt8365-evk board.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Tested-by: Alexandre Mergnat <amergnat@baylibre.com>




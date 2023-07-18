Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918AFC001B0
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 08:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oqJ9u4SGNXyNg5ofFpDQaS2ayWAUml8z0VaX7hI3krE=; b=IWifyaLyGZoumDj2wL5EF6cawo
	N8pe7knn0GTwKNHn4nppOl8777iuGXcrj8Rng87twMOX1VOTF2oHboBhqGTAQQraGXO8865hJSpOQ
	e06kiY/GC7vK8ubwfU7mZMWbWGwp0hSYs04X13yYL8vAYJee0aY94+G02S35NG/0rpT+yOE7X4Bpa
	puFeZMLyPXfTk3JFllGkwOtkgx1iO/TpiS0uMV7iCtWGc6fub/GZA46tbUbORpkw6+T9eDkoIikpz
	YzIlg4saUajcY7QHOOp3g6vs3VS5DmNhicGYyLgCpsSNp/zKaIEhCWrqtfv+kN7d4zDPIoNu2lMJy
	zpO1SLhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2Zv-006MgH-1T;
	Wed, 19 Jul 2023 08:30:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2Zu-006Mfc-0D
	for linux-mediatek@bombadil.infradead.org;
	Wed, 19 Jul 2023 08:30:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=oqJ9u4SGNXyNg5ofFpDQaS2ayWAUml8z0VaX7hI3krE=; b=R/Mzb9gqRl7DbPonTZo3fTY2hX
	fh4ekMcskmP/8Y3fKJkGNg7cGH5NHKKAc8SpMK5BPMTZIxl8cmBYVXUShIbuG9a3FFUL8G+gjWxmH
	bo5fOAPGs40zJDotV0U8vwju4R+x6usQjZ48Mc2xZbMXeQfCbhQgEUWb2N4gPYDhuWastyTNyDjq7
	FNT3OnTrjwk5uid69NJ8+cb+83NTW+dU4RHASpdm+XhvFzpYtOUUgTZ2VQpABkMsY2RftIS75yAgD
	7sSQB0Vy/geCbwKBvHZua7Pr0iWzJCIsQ0zKODsy+F1FqXidT2PX2ykZFXqAvMOcxQyK94Ktt8UYq
	oNJRYr8g==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLgEN-00BJQo-08
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Jul 2023 08:38:53 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fbc5d5742bso53925445e9.2
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Jul 2023 01:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689669467; x=1692261467;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oqJ9u4SGNXyNg5ofFpDQaS2ayWAUml8z0VaX7hI3krE=;
        b=OtQl27dbnrPDI7c6OCZexeFM1iYA9d10Zwj0fJcjU/xtspNfbU+DGUpo46ndDA1aIM
         gZg/OCmSHMHuQuMmvVeoXewgFNsxM0pIz6YgPuvE2vjcY+02CxfSY1UL4s58Ck/orQ1o
         rYFArvC3gq1tjaq/Ls0ZSpzgjHsBPeY3D5vbiHVrl2WILTRaSuFa8nM1XkvE1CtETZM9
         XWwbJsgMx7HE8f/oE1sWY419GaCKdr+lXUbKY+6EoISl4wlhMQT/T5YzFDmRxzggXRnj
         qhUkGGoMXPPBH5sSG3KZe0+qk5qr1Ys7Z9El9iEcXhdSc1GBSVBQVKEGBQdURjhdcgg/
         5zVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689669467; x=1692261467;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oqJ9u4SGNXyNg5ofFpDQaS2ayWAUml8z0VaX7hI3krE=;
        b=ONl/LT+EwuuNZ2N3/UfASDDYkx4yELB0tgmpLl0YR1DXN5hLouA2zSoQOpkDs1U45p
         nuuh8CCxyXyJGV827vHDjc16SBT4bgHAD0wSDNIIbHtKJPhciwcxqLt1b3nXsugkkKmM
         8g3oml62/UM53j+75iQxj+fJB9quQMudhYcJculObylRMkb9RrUhG6qPD9KfxXIvVoqY
         s2fLHjY8VoTN0de2AJS5rmWwWavoUHKXvGKnRqaKAzyj8ZHYx8D76J/BrUqKwqNHwCSM
         KfG3kqH0eRw361mH8LX4fhA8RWSgPeMvgw7UHPoxpNe8+r9BecD2OCg0WXgjbw8CzpBr
         gwLA==
X-Gm-Message-State: ABy/qLZHSONrAqpFztw2EGoscglLc9AZQavNRuB0O4kJJxOtRV+0qqMu
	wnMQv8K+0gNncLyOre9v7enMpg==
X-Google-Smtp-Source: APBJJlFK/PMnPBKxy9LlIGsKQCxu9WTEnU0WFv4qPQ2XmQ7jxfyYmlP+rhkxlTGNQbZ/CrvEDeEwUA==
X-Received: by 2002:a5d:49d0:0:b0:314:1e47:8bc2 with SMTP id t16-20020a5d49d0000000b003141e478bc2mr13465958wrs.0.1689669467371;
        Tue, 18 Jul 2023 01:37:47 -0700 (PDT)
Received: from [10.101.1.6] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id n18-20020adffe12000000b003143be36d99sm1696453wrr.58.2023.07.18.01.37.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 01:37:46 -0700 (PDT)
Message-ID: <cf31ccd0-f11a-49f6-4e55-457fa78c8b86@baylibre.com>
Date: Tue, 18 Jul 2023 10:37:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] clk: mediatek: clk-mux: Support custom parent indices
 for muxes
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 sboyd@kernel.org
Cc: mturquette@baylibre.com, matthias.bgg@gmail.com, wenst@chromium.org,
 msp@baylibre.com, yangyingliang@huawei.com, u.kleine-koenig@pengutronix.de,
 miles.chen@mediatek.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
References: <20230713072138.84117-1-angelogioacchino.delregno@collabora.com>
 <20230713072138.84117-2-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230713072138.84117-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_093852_183015_158F5B49 
X-CRM114-Status: GOOD (  14.76  )
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



On 13/07/2023 09:21, AngeloGioacchino Del Regno wrote:
> Add support for customized parent indices for MediaTek muxes: this is
> necessary for the case in which we want to exclude some clocks from
> a mux's parent clocks list, where the exclusions are not from the
> very bottom of the list but either in the middle or the beginning.
> 
> Example:
> - MUX1 (all parents)
>    - parent1; idx=0
>    - parent2; idx=1
>    - parent3; idx=2
> 
> - MUX1 (wanted parents)
>    - parent1; idx=0
>    - parent3; idx=2
> 
> To achieve that add a `parent_index` array pointer to struct mtk_mux,
> then in .set_parent(), .get_parent() callbacks check if this array
> was populated and eventually get the index from that.
> 
> Also, to avoid updating all clock drivers for all SoCs, rename the
> "main" macro to __GATE_CLR_SET_UPD_FLAGS (so, `__` was added) and
> add the new member to it; furthermore, GATE_CLK_SET_UPD_FLAGS has
> been reintroduced as being fully compatible with the older version.
> 
> The new parent_index can be specified with the new `_INDEXED`
> variants of the MUX_GATE_CLR_SET_UPD_xxxx macros.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre


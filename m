Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B431C531D1
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Feb 2026 21:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UA1VERvz5151jt2KdPat2DgK+V02UUk6l4sZ04x/A1s=; b=rqG5C5n60UvuQKVQb4qzEFlx4u
	ldtRyKIYQBqzy08+ZC16dHgQQjGZQskMV33MiQDEiw75ThYwgaQGp9FGFspKibIf9WByYOMr/I7VC
	UZrwuQtIQxP4lC9AiCH3k/A/aVZJ6lhVcAUpe/iuoviErIMv+P8q0EmkheEPAoypAMEsMU7FSRC21
	FoblCIieKzbWK/Zn9aRHU/iRhmmIeXpYZGvkkEbgr3leBGENqjP/sRm3+R9G9nhdVcX4soOquoAms
	VTnNshHNvDYM2Ecu3y4xwc2lt7nz/GkRzDgLY77bWEvwtqzNxgyvpha6ukGNBePRZscJ7foe0KENJ
	dKVFUrlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtBYZ-0000000C62N-0dwV;
	Thu, 19 Feb 2026 21:27:31 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtBYV-0000000C61U-2HFw
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Feb 2026 21:27:29 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-40ee196dd78so933440fac.1
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Feb 2026 13:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771536446; x=1772141246; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UA1VERvz5151jt2KdPat2DgK+V02UUk6l4sZ04x/A1s=;
        b=jLzRW19v4O2EUqqsx/8X1VZ3MRHkwkHzprQDiU9Stj4PexeZk4X+YOJMio6CRyu2sq
         tQewpy5XetELLipKaOwXP28JxS6oFnfjvcvkzRNXA3B5fHYpCICRmLHU0kYg5gDscuZr
         +gWuXubEwrQF3fIAJHRl55NqJuqbwHRu1tHlq3LCplrcYqSlb1fXcN4DSoKRSU8eI+na
         r6aG0pwuev/RwJnTqzhtZ3AMHZBVjq8YJ3aEm9nUd4LuqimUfG2sF5zPC91puhkzaHNG
         LMAb5M9DSkVUWElo4NSaLwuypssanu3uoi6HcM/ax4q+NLRQbDiVVdTTC5iOrSx+hp2y
         bVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771536446; x=1772141246;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UA1VERvz5151jt2KdPat2DgK+V02UUk6l4sZ04x/A1s=;
        b=XfdxHWGtW+ncquNb0WkOiwS6g0c+cU/+uDS567QGOjeH+nrrUbG6mspcJkOQq8rJAA
         bMeVnwKE3LMc4d4ULKg5g1G+/bRFcjT67N5gjL1SDnTUI814hQ3dP0mSz5+qE7oSxU94
         IgiJsUkV6izbCWpAJ3X4Xu8sniOyCiyP9gXSNbTLc7qFwC18Yupse5tW8KI79h01T7pV
         94MhoecLDFYHqkLx++9e9gkXa0pAxRBJ+By2godzjuVcSrHQsHalpOQZcsiZ7mtwWz3d
         Yv51CiI/CSNd9XrQ01YQXiaM3t5LhEJUYdcsSesXEXRSS6nYYB28F8e9u0tf8fOALIIc
         HK4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWwofZHLYuvqcvPxZKNtrVnSYIEVR4YcpnL8HbT8vXIpjI65ITIOudmuGRUjmhCCUYtIaj6wWm2FcAv4M+aeQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPPqRz8uBg0t2okFAC8KDQTEOaRf+Q+6WeyWD2g/KU3NDISpVI
	tuoWBQQ8UYl6A4e6cKqVvLRQv3sOhcUPBMEUd7ntzCxKSZ9OW+Qeb5Out1UALALQdUI=
X-Gm-Gg: AZuq6aICT7ebK50+SvhimT9CJaW37bRSRcMXckPeTZD+WZ5M3ELok3Ochm74Nu8FrvH
	RcWMQliiW4QkfD0pXxruVNM9RWYeKcIQj3qsLzei9wa9AZRNgSSXtpgdWjSr9/s/KTrIVl0F0ZF
	A/gfFfRsF++mlBcAcjAh+jO+kLUtg5oR5nBcYQJ9xZzkCIHtwWd+U/q1GIUoxllOlQFxdNoXo+q
	9rJ+JTPhTydS54HMQSZswMnGH+57w3EsyMRg7wR77W18fTJwGTnBG8Z50lWNDbVVkfMD5QVpycw
	De//xvebTT89e/4GK5wpPv1cBDOaGr1LC6VzvSZKFeuv2U1c7Y6oIEMsRAjYVPAtIUZJPY6Qqj9
	qF+l2zL1MwyxdRXrGWL9c6P+6XVsw8T3fyGaZr2kMNjYFarVaWR86M/xXtQx+2n9+6e79UHaKuQ
	mCSEQZfO43BvxiPEQ38zJVIIK2vPOnZltG/WHhRjsztB2Qa+YTGapAM8c5xzUBjC0cbZWmiQ==
X-Received: by 2002:a05:6870:326e:b0:404:1ec2:562c with SMTP id 586e51a60fabf-4154539ed1emr1793941fac.6.1771536446376;
        Thu, 19 Feb 2026 13:27:26 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:d4c1:bce:26a1:c903? ([2600:8803:e7e4:500:d4c1:bce:26a1:c903])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40f062ee328sm18930333fac.4.2026.02.19.13.27.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 13:27:25 -0800 (PST)
Message-ID: <5e6fbdcc-6a19-4d99-af5f-50ba8fa529bb@baylibre.com>
Date: Thu, 19 Feb 2026 15:27:24 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/18] clk: mediatek: Add MT8189 vlpckgen clock support
From: David Lechner <dlechner@baylibre.com>
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
 Miles Chen <miles.chen@mediatek.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Qiqi Wang <qiqi.wang@mediatek.com>, sirius.wang@mediatek.com,
 vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
References: <20260202062840.342707-1-irving-ch.lin@mediatek.com>
 <20260202062840.342707-6-irving-ch.lin@mediatek.com>
 <b7fd3dfe-c141-4164-80c2-ddc1f79374f8@lechnology.com>
Content-Language: en-US
In-Reply-To: <b7fd3dfe-c141-4164-80c2-ddc1f79374f8@lechnology.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_132727_593540_4E92F326 
X-CRM114-Status: GOOD (  14.40  )
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

On 2/19/26 2:44 PM, David Lechner wrote:
> On 2/2/26 12:28 AM, irving.ch.lin wrote:
>> From: Irving-CH Lin <irving-ch.lin@mediatek.com>
>>
>> Add support for the MT8189 vlpckgen clock controller, which provides
>> muxes and dividers for clock selection in vlp domain for other IP blocks.
>>
>> Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
>> ---
> 
> 
>> +static const char * const vlp_aud_adc_parents[] = {
>> +	"clk26m",
>> +	"vowpll",
>> +	"aud_adc_ext",
> 
> I could not find a matching clock name for "aud_adc_ext" in any
> of the other clock drivers. Which clock is this (i.e. what is the
> macro name in mediatek,mt8189-clk.h)?

I was able to solve this one. It is a fixed clock. It seems to be
missing from the devicetree, so I will comment there instead.

> 
>> +	"osc_d10"
>> +};
>> +



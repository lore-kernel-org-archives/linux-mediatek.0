Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D55C3601E
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Apr 2025 12:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9VoKRS+yOUVccmHWqHCUYdtGt2QnJX1Av3s20gfz76g=; b=reM5U+bi+lyJIW4oMJwvypCAWX
	r+1gOkc13bssCOt/ZBQX87qoy8E0NPNvqd7DU+hnSjlS7Xra9lGGUY8aaMFpUKVuybTuyhkQoCgQV
	1RyNYgeAu66YKHwMef6ie5shT35kMBQFIrEj0boWT2BnF2pLEk7joljfpHpJbfXM1VblQBPnaETI3
	2AJdke5xISiMz9KdGTvhGEGYLabg28sFzep6UyDCA6aHU+vF/6kWd1a4iEkG5e1Zwx7U8Du0p3fVM
	ZeNA1lShLRrxQdaoTWE9dafYjSLuek8TTzHGf+wbZkv6y4Qk5NOuCKZvQXNkeVbKe3IdPggGcwDPg
	qVXRledA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2rKb-0000000AYsq-3FNm;
	Thu, 10 Apr 2025 12:48:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2r9Y-0000000AWYG-2GrG
	for linux-mediatek@bombadil.infradead.org;
	Thu, 10 Apr 2025 12:37:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9VoKRS+yOUVccmHWqHCUYdtGt2QnJX1Av3s20gfz76g=; b=Z7fiKbC06AJg4XNqwP5B39mdNm
	XmOQI16VVK3pSs5yP0uS4xQBPUV5H4z4YoIHLWqEwRoThwv6AL1ehZs9AHshM8wvADNzLFno11w6g
	KVP51L17lxswMRY/o+Fdd/vww3S0o6gUrDkYhHqkPUjKnSXqNd+b5iqjNsFQHkWBsZwYHONyT1/IF
	QIZeYvI29CXvPpDX8fyPgxaZZYypPaSj+3taxRH3UM9JvUYs9PHwePfEWA0lvw181ooWxwiis3xFK
	JNnNbrB69kLiq2pfmqWRIzXSFa8Hte1kWpRWGR/ndaCG+zvkuBdL/JKDcV/IGiefAobQSg9BfNarj
	21ghNJtw==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2r9V-00000008ogB-0jDn
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Apr 2025 12:37:07 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so8787685e9.2
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Apr 2025 05:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744288623; x=1744893423; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9VoKRS+yOUVccmHWqHCUYdtGt2QnJX1Av3s20gfz76g=;
        b=Bhog0H53I+LmfUtN/sVi+m0X2iFw2u8kqg7iir1jXBMJqgsKSo8sDwbeymWprDF9cx
         lQCl1l26bO6FUk4PXoZNBxOf0Z7GY2qiW8kt9sB0jqpgpJebO941eIyhwZJTT6qWWorS
         mZVvIg8/FKC4eD+c2VT+zeyBmgFDiamj+zhkzb05Fraw6i23+y/cPO/PZAKX4eKXD23i
         bM1dC0UtUofMuCldWtMlhujI8vHgztO7Fw2txpVFtGNarNU4uKBxExvaQihfkaM7mZYU
         24n/yDoTkv3qHsZER0PgrirqnAW+Zd1pkQmRMVPIKwTqYhgdsV1+LNoecEd2j3nW9m/b
         dbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744288623; x=1744893423;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9VoKRS+yOUVccmHWqHCUYdtGt2QnJX1Av3s20gfz76g=;
        b=T4W42mcdJQKAa41sDY/93zveigyOQNce3uzlScKNE6ySwrQ14sfnS4Crn56ApW1ghG
         GIPzIgtII7Wy0ibuQ3djsOK8ZHQEZPQtgTF1t3AagWVvKCEeFxXnnPKz6zbEmjpR6JJg
         tVl2SILou2DfC//WAn0S4Z9/N33PlNvOmxx3zQBFqZviXDiz2B6jBTIIma4ac2lfRtj7
         AXlm9p1FcZiarQcMIUn07rKwAv/YrH8gEC1fRI5bZEa1zh8zqe4iSUZkA73r4hyH6MBU
         /cC17BO9tR7x16c3hhzrILraOy3FPZSW5Uen2QfQoDs5ln9E+Ygdg+zXGVWnCh4W1PdJ
         jQ2A==
X-Forwarded-Encrypted: i=1; AJvYcCX8lcT/R8ApVrrIlP42FE2TgoxT5FVUfyNACCkTh2IgDpw+gK81PykTHybAs013w3wN3dxyJTic2vAOldmmlg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzPXoVYreBQIZRfgv2qFIPYIiQ6dO7MUuVslPL3nQI7xgR/dneO
	cLSEI+XPrASc3LVtk8VrdwrLhBPeyr+3OAtcPFsmV+uBupxYxrlTQyA81A8J8zA=
X-Gm-Gg: ASbGncudJST2xQBsF5EtYlDJ8L/zhaqCPWfzE7bf3dqc3SGfQ2vsTMdT9uYpTi69yza
	WDebRAdncLLcWGwL/6mewZAXWY/iXkEzcqm9XcvP8yOPUk5ABt3qCq9Ayhv0rCjyslTs8aWliO6
	M8P6JNQV7sahBZCVq7+SlSLneQjWpQIlCfIbZeNRt0Jt+4MpfJpG+/lfnEUNDKkhJei87U5Mn6/
	I3A2UJMcDcwYB9n2CK4MD63in9UDZqV84VOoyGiAXT7gUIAw8ljEAetdYwN43/Ppn2hzxjum62A
	eDbdIwwJ77jDVl9+ssAGdBnBktv1dF7d8Zhxa/aJqeDidOMKCI0K6wgCduf8Hb3+x/W9460h2Ck
	Hh6outJJ14+cfKA==
X-Google-Smtp-Source: AGHT+IGMoIZKu18tKxGlE0nCM035PBeR69RdqmMHuq8h1Eu58CnOlQWvz4UQddkUAElDY1GsfzU8ew==
X-Received: by 2002:a05:600c:348a:b0:43c:fdbe:4398 with SMTP id 5b1f17b1804b1-43f2fdceccfmr22721935e9.6.1744288622955;
        Thu, 10 Apr 2025 05:37:02 -0700 (PDT)
Received: from [192.168.69.238] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f207cb88asm53015095e9.37.2025.04.10.05.37.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 05:37:02 -0700 (PDT)
Message-ID: <20de7ce7-1cfc-40bb-9457-84e462cf4483@linaro.org>
Date: Thu, 10 Apr 2025 14:37:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/19] arm64: dts: morello: Fix-up cache nodes
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com,
 Conor Dooley <conor@kernel.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-3-076be7171a85@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250403-dt-cpu-schema-v1-3-076be7171a85@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_133705_373151_E2668194 
X-CRM114-Status: GOOD (  10.95  )
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

On 4/4/25 04:59, Rob Herring (Arm) wrote:
> There's no need include the CPU number in the L2 cache node names as
> the names are local to the CPU nodes. The documented node name is
> also just "l2-cache".
> 
> The L3 cache is not part of cpu@0/l2-cache as it is shared among all
> cores. Move it to /cpus node which is the typical place for shared
> caches.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   arch/arm64/boot/dts/arm/morello.dtsi | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



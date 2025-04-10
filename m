Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C03C369A6
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Apr 2025 12:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iQ0j7wMSGTmXUuOHtflR052mxHlsC9aOf5SK3WIqsvY=; b=TU+FgKTEI9+LlKQ4vpIQcnkh4e
	thu8/zBYPSh2nxH7XI5AlgP/7qWd99B5KRgy7qfPTpvtg65rZ/K0IzK1cn78ddlJFt/pwKNq7cvO+
	nbcISYYc6J4R9iaLy+PRdKpN6X7A/wQFRZ/WbUiIXUhsrjOBIcaVOtcX9pUFgLCsaekfE+ST0y8my
	Zj7mCIaDzJEV+Z9vlfXRvRdiOa8qXerFHL2DULnI1RRs7JCFx6Naeo+Kr13yJvT2GBzhQYBiziXQB
	gzsL912LVWsEXtktXwJduJKKTXpZ7nI2VspU30Hy07FQ1QK9tj2lb7+8TmLPfIOqnEGr2QItFppG9
	9wO16ijA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2rH5-0000000AY3R-3G7v;
	Thu, 10 Apr 2025 12:44:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2r8l-0000000AWP0-3MdR
	for linux-mediatek@bombadil.infradead.org;
	Thu, 10 Apr 2025 12:36:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iQ0j7wMSGTmXUuOHtflR052mxHlsC9aOf5SK3WIqsvY=; b=p3rrCQJD8oujmGg3eF7s+ibVxj
	9q1jRDEu6ex7YkdHynkbR2MNtV179d14328REIaVCu+TNPbSqRpxV0yM5ZSMogPyXALGvg4JByy80
	2oEOMWl/EWxeJYl0iQckTcfFAQoGuiO3IDLPrrPXKqIVtjUn7VVxuVcRCeMsz4f2fZT9slgiqZHkS
	puBxFITVZmtdAkNIqbY4yVmjFe3s0kl6VsVm1tYYq/hVoJ7omd3BpNI47E/flpETBW5NFiqAWbzBz
	VtRXcqXHHn6N1Z6f/AB5URS0WoWTLKjHwePcBKbIHkjxV1NUAjfh8gG+xT9tjYXhI8y0cF3K8K2jg
	7GKT8mbw==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2r8i-00000008oeF-28qM
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Apr 2025 12:36:18 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4394a823036so7759195e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Apr 2025 05:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744288574; x=1744893374; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iQ0j7wMSGTmXUuOHtflR052mxHlsC9aOf5SK3WIqsvY=;
        b=dmQ9O9beqXDsWaPeGT1oTG472KbdbTYygmfBsFn0sXBMvOy5Cee8FwRk01FYoyINjt
         Cq78AV65o8x+F0vN4Xg7vPxB7sZp7akBzuM+cFwJIWaA2EDBgDd8EhqtAumQ18IC5Jcz
         Ox+qu0e6o5VpECmmUM9suJEue3tH4Zu5giSVQpjbiBy7UnUcR4Oz/kaNiBbeERppKk2G
         y76kn3pUyK70pt0d3MF8XscCdzTpiaeK1fUN7OCcgdCzWuvaPOmqZRgUgkOpsEbXmJVn
         Ojp7LTqoAVo0W9FxkvN9QlwXpp/r1LJ68PdxEyIpdfbWPvULyIpFiWqoJ1qCXy5f/EGM
         zd/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744288574; x=1744893374;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iQ0j7wMSGTmXUuOHtflR052mxHlsC9aOf5SK3WIqsvY=;
        b=J28mrlJFJFSrnAcsPJou+Ir42IU6gOEtBghkpZNzsjDA9wqOzlACpVKbi3f3CkpBUl
         AO90fP/CDHamt6sUInElfgVKwDl3Foc/eZOAPgtUIuTaC1w6I3QwEW6gDFAKO9g2aeo5
         7nhbHGn9iPkEHmSkJUQOFpvN3ucXKzZsbmdN4qdHTD14nEelU9GRxtw1STxJHwXbbAiV
         6UrVjL5VTYB57uM79ioDc5zo7aKyNGYTM8GrtTnnW4Xtx6YkBm7v67lHMkL8RwNzQglJ
         S/rcnhM24GeFn2xLHdRYhFkO2RYDL9bk34BRlt4mVe6HS4AZ1Fl1IkdH2vAZbp8Qb3tX
         aeyA==
X-Forwarded-Encrypted: i=1; AJvYcCU6HKcXW/pxJXfYPtFS32+R0tFHnAObzjKJDtkf0x56Jn6YlXTKRvKNQabUd8z/tPyiPXvNyw4o4Wwb04yECA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzUNN60w6J09bgZFjuNwFBPTvIiSoiLsU8d8AYaGP4NosPiaMOt
	ZF+WFMDK9Ie7mT4r/wjsGeRDAi5SxQuczVyTBJZCzcCl/7sljngZW6g+vRyzG2c=
X-Gm-Gg: ASbGncvu6XLS114Pu/XjRcieCvohl7H3OtdlphntStKE0mxoJ4ov6N+fHE394rUEnF3
	DGA2XTlXTGRrWltfxMJ6sB7Qddhlj0cab2PGXVyolZwnkJ6pvjQj1kRZg4Xbu82srNev/jPWcN8
	yPwuLbuEs5R0XiwhxL/98lbdnfM13+YXz9V44lbhXNkLw9Gr7FOQomV9a4M0Skkbs3hu0YdpIXc
	LjyHH4FrLYrVlgDYgtjob7SsQz6ZbSemShBQwk7Dp14ZS22XP8xFhVwiBHvbmYFN3C/cZL6KqhO
	zI+9L9T0G5UcrlLqquRKRvo0FL1U0pNZwM9LM3XP6MictgcJaLn3y5CQqWwCJ/RUh0EOgTu6eNT
	5GQN/thm6kAsWWQ==
X-Google-Smtp-Source: AGHT+IFetWy1yp/dwylC0fW3Xc3rkEsOkh6f7DWozfmMsr0xNplY7KcWpRd6urR6Mieq6r6/8yNM9w==
X-Received: by 2002:a05:6000:4285:b0:39a:c80b:8283 with SMTP id ffacd0b85a97d-39d8f498980mr2285415f8f.31.1744288573720;
        Thu, 10 Apr 2025 05:36:13 -0700 (PDT)
Received: from [192.168.69.238] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893fdf8fsm4624182f8f.91.2025.04.10.05.36.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 05:36:13 -0700 (PDT)
Message-ID: <17b9ff87-899e-44ca-b902-ab965cff0879@linaro.org>
Date: Thu, 10 Apr 2025 14:36:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/19] arm64: dts: broadcom: bcm2712: Use "l2-cache" for
 L2 cache node names
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
 <20250403-dt-cpu-schema-v1-2-076be7171a85@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250403-dt-cpu-schema-v1-2-076be7171a85@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_133616_749663_5D8EBAB5 
X-CRM114-Status: UNSURE (   9.14  )
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

On 4/4/25 04:59, Rob Herring (Arm) wrote:
> There's no need include the CPU number in the L2 cache node names as
> the names are local to the CPU nodes. The documented node name is
> also just "l2-cache".
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



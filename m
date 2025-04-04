Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645E5C36010
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Apr 2025 11:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A6vgbE4TYnmj+hfq88kdXovzQvYb/OaWLf5kbtVE6dY=; b=SffmUbYj3IKzjxqcDGSO7zmDXP
	hRGwf15FZXJfCG++ZKAkFgVR7DSyOon2fD3aat8U0C+r9PxyDhpOMK4ZEShnzE2oH+k4Ya+ihw74N
	+4JCq7hEa6okeZZQe9B0guZytGGOk89MvbxvRve1eXZO6PkXx0kGx3Kw/aYwAfmduDF4YGnY5ajQR
	i+L6MsIP0soMSEja9igK/EEzKAxrySJX2MI/i3LET6MVqdiiemhquVS7tFUX7K8j+1oijzEh4rjqT
	mxIbfnVcPSlNadqGq3ap4iGru6D3Srh6Rw61Dfu16k9IfX0wTYGXNuuwGXfytWoLoI8P3hbwRd27v
	8joSXUiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0fOT-0000000BZU7-1Te4;
	Fri, 04 Apr 2025 11:39:29 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0fHS-0000000BYOk-3oaZ;
	Fri, 04 Apr 2025 11:32:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743766333;
	bh=Jw1FPz6DF2WaJMktgqsDpD5UOieABbNHs5cz1OQV7+Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LJPXaVbq60/Cb5k5MJ7zBEKHhcJ/RJ2XOeSUfeGVa9B6t5StSeJpF5Rh8VSpyV4OG
	 6qvbZA+DJiPKvA8oZmtxELP2AOQ0sZld5CamuOMDVdPFj6a78TccHaPK4Tvrr486vK
	 jdSaxZDfwi0ncvAB9XwcoOY+tv9gv16LHwc9o8cmvTeXa2UskaGu4S1VKAfK8nGrZE
	 vct7UyFGwVmWVCvZDCSClpfCMUyShZvHciYs3+sipjVjXeruKaQXsGVaHfymqTd+Og
	 mPFSiSQmlYOjLNoHLs/SMTb/qZ/5zrPp+oAQM2P0hEj8RVXesY8cFd5/XQBtMb6elN
	 Yrr95JBG7PAJg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A836E17E0C50;
	Fri,  4 Apr 2025 13:32:10 +0200 (CEST)
Message-ID: <547daa6c-0ca9-44c0-9317-02e006926dc3@collabora.com>
Date: Fri, 4 Apr 2025 13:32:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/19] dt-bindings: Reference opp-v1 schema in CPU schemas
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
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
 <20250403-dt-cpu-schema-v1-16-076be7171a85@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250403-dt-cpu-schema-v1-16-076be7171a85@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_043215_095734_44375424 
X-CRM114-Status: UNSURE (   8.97  )
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

Il 04/04/25 04:59, Rob Herring (Arm) ha scritto:
> The opp-v1 binding is only used in MIPS and arm32 CPU nodes, so add a
> $ref to it in the CPU schemas and drop the "select".
> 
> As opp-v1 has long been deprecated, mark it as such.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

ARM//MediaTek:
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




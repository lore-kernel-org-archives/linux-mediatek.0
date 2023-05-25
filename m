Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69ECAC77B7E
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 May 2023 08:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d6wGaK166A8k/8R/NtANWwhV6nfTK/TCvfUXfkJ1k84=; b=JqZ3Z62FGXHT3yyByyK7+lDN0+
	8NUcJAzp681HnWdFyJUIFVf4g8EQGrdojryWRVyh1uiiLg7Lpzgt3+LWYCizkgVsv6joy3s5GbdCN
	9xZnh/g0NSf4JL1Pep9DzTzs6juzFJty6m2cWwCWVHJwi/0P/CU/qUdmuuWLu+V2N/+e4W2Cxl3O7
	iYvmAr4iBJCH7DeFRax+4XvCBjn4U5+7yWNiqmCtXsh9Zl39iW3m/an3V+BT8gWcO/aNaf4ZuJx3M
	/2ONysjjAFxjLHzxa2FE/jjG4nchuIaj6gAZMoFI+Kj2TbJwVEsVMumNHuob8OkCSsQZ4kBL+NmE8
	YO/6GT+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q26S2-00G0lk-2s;
	Thu, 25 May 2023 08:36:02 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q26Rz-00G0kp-0k;
	Thu, 25 May 2023 08:36:00 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4DAD166003B2;
	Thu, 25 May 2023 09:35:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685003757;
	bh=7pF03sbG1gQpLZsg2RNInxN2LKYtcdzK6QIsJAMXv/g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=or4b+YjlguD+Ok8qKhnFHdwGckQy6NcTWyl01QRaSVz0hqajX2Uei8j6Yns//ujKW
	 JtFxYL/WKar+cBspEuFGgzToY8YdeTujFWpiRseDSGoAmCHdYQHpu2W5CxXaiIvNyZ
	 7/YEFPtbco30/XIbLIZNJN9ZXfbThXZcbKFKgthwLK5Md6lvBN23wyN2LhJzwFv9YN
	 jSmN818wUcAIRwNi2cCtWwnvV7fc8EI3WwuyOj3b7gvcSEFLWheMaU3H6/N0VoEnYe
	 VOB1s7NJN4qQZ1y70xHK8a9ySGP2liHWCvMqvTUkzsQ2/WgrPFm8ZPUW+KZ5+M4Fx2
	 DSHa/Bugl1hvg==
Message-ID: <b732cc5d-f982-dff9-db4c-70bd401d5796@collabora.com>
Date: Thu, 25 May 2023 10:35:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v4 1/2] dt-bindings: reset: mt8188: add thermal reset
 control bit
Content-Language: en-US
To: Runyang Chen <runyang.chen@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20230525075011.7032-1-runyang.chen@mediatek.com>
 <20230525075011.7032-2-runyang.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230525075011.7032-2-runyang.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_013559_402128_480D24EE 
X-CRM114-Status: UNSURE (   7.63  )
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

Il 25/05/23 09:50, Runyang Chen ha scritto:
> To support reset of infra_ao, add the index of infra_ao reset of thermal
> for MT8188.
> 
> Signed-off-by: Runyang Chen <runyang.chen@mediatek.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




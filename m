Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 666D8EB64DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 08:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cx7b+D54SgroOtXAUFUWljfk4Z/vhi1svx51GsyHPCQ=; b=tvXvjCyzRjgYqv+7wHMU+GuMG5
	v0zQpL7iI2f+tCciiAhiwAvD5/WjeT+WzF6BReLHxBriUKG9CzHKeNrkipenXuvT8vcGg2XGy8PjR
	3buC/BjgfmVQLedGzCUqBiG0bsiPinmcJStoVgkAOkKvTmrkdabohZigOyFT79KP6Qvfz/ed4Cj+v
	2RHDzkNawhhR6Md4mvXYiorbgB2FU43/QGl+TONW8RjgjHApeQpduvNSrZKWvTLbm6JnblXEvLSS7
	+MtoHYjFqqSJjOvbV/F0nybUOKZgXdhB2UHNcGMErkegW60On29LXhKUgYsYXk+OMoRNTOxYxwheu
	kD0KQbFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMlta-00DR9Y-1T;
	Fri, 21 Jul 2023 08:53:54 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMltX-00DR7L-0R;
	Fri, 21 Jul 2023 08:53:52 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 36FDC6607099;
	Fri, 21 Jul 2023 09:53:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689929629;
	bh=kXBYkev3Jnirv4Zq14dgjAYSbNq7XOepox4imR+0kTE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g5iDMZ26TarTBRiQfhOK6brLdoKOl8wXjZ+BeOUnk7ZmPUwmUmZ8oHLICtRkgzR2x
	 uT5rXgJWf9H8lw1deBI5xU5zFiaZKslT3LrQp0IjXRVKpflCAQW9YzaAax9HZnr/Nh
	 YaAnC5O8zZQXRHa4W3rmvKt0anBsdhIJPYw0CygiaF0+X/Hj01J5FdbZUrYmWe1Plv
	 Ca9+nU7wBLdw8D3ModfsTi33sGefvAEuSFc/L3IezoghtMaimZD6mKEdwYTrBUSL4N
	 lyCv+ikqTQNsz2zPG8fJc58f14J7JQXttsxc4TlUARKbcd5nCUbhw2v88iFz4Q/EEs
	 MZbLId5jAEIHQ==
Message-ID: <24952eda-9821-4634-aaa4-e636119f99fd@collabora.com>
Date: Fri, 21 Jul 2023 10:53:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v2 4/7] regulator: mt6358: Fail probe on unknown
 chip ID
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230721082903.2038975-1-wenst@chromium.org>
 <20230721082903.2038975-5-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230721082903.2038975-5-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_015351_302763_7BFB7FCD 
X-CRM114-Status: GOOD (  16.07  )
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

Il 21/07/23 10:28, Chen-Yu Tsai ha scritto:
> The MT6358 and MT6366 PMICs, and likely many others from MediaTek, have
> a chip ID register, making the chip semi-discoverable.
> 
> The driver currently supports two PMICs and expects to be probed on one
> or the other. It does not account for incorrect mfd driver entries or
> device trees. While these should not happen, if they do, it could be
> catastrophic for the device. The driver should be sure the hardware is
> what it expects.
> 
> Make the driver fail to probe if the chip ID presented is not a known
> one.
> 
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Fixes: f0e3c6261af1 ("regulator: mt6366: Add support for MT6366 regulator")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2625DC3DA78
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Jan 2023 12:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/EKC0W005XlFnrGAeZ1x3UghEcg9mE9667uYBu5RCBk=; b=W7X81XKnWY0l2OskbRnbx4qD8G
	tHvmFKK/cZMf5Ja46ktXyqXeEhUPWWz6kPErJdETk93BYvqycKVOwF9uDlY8CW2IW2t0sMtlx0/fT
	tf3rZiYT8JeAjFIDZTRBT1VuGGBKM3WoIWLs1KxopgViQPRK33LHc2dQ44SQ/M595pEgaJL9nMZI6
	P23gnLh6plBZTDe6hvghFhSjRBYYJ8hbz8fML+uB1/7Co/jFbZPk+p5PL8jEYUZDzF7tC52WFDP8m
	2uqLchnkz5PgMybVs6JLXI6V9YWfCiC2jVCmAhiGejC/xAafSzvRwRztlV/mnix/z1CRD74n3/QLh
	ie8muYjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHlSE-00EFXF-4R; Tue, 17 Jan 2023 12:52:42 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHlRy-00EFQO-14; Tue, 17 Jan 2023 12:52:27 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 697AA6602D6D;
	Tue, 17 Jan 2023 12:52:21 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1673959942;
	bh=Zy6UIHFiddxESUTWxezTFwLYwuiwsUZyyuC6D0UK0o8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K4PMSwd19uLLwMgu0BrDk7n+pFxWk/AWCpiWDlDle16J/mxjN+qsFZh/Va2PBcs63
	 fot26hvufCnAGIqgmiEAnf+P2v6+TttXrHltMASaSockQlhka7zxqB17lcbw3ZwOTj
	 kx7owuM6mnoto8I02BFS7MQTf4ITtxEH5zeqENDvvXmhz9fDi2x9go6lhtk4dx9Nwp
	 yH6iFzsgX3nfCabV0PMH7Hy5NHx8zcAFTvpr1ISzD8ZehkpRv++XyGFanoaDtQ0ufZ
	 HoELW7xY7Hj9Mf6r0mk0KnQp1Yq3e5kkCRU6We7/65kReOwqGJUVQ/m+xTdLxyQLUd
	 JRJE97qs8niCQ==
Message-ID: <ddb81fcb-b353-ce7f-8b12-9cdcbfcacb8e@collabora.com>
Date: Tue, 17 Jan 2023 13:52:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/4] arm64: dts: mediatek: add i2c support for mt8365 SoC
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Qii Wang <qii.wang@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-i2c@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Fabien Parent <fparent@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
References: <20221122-mt8365-i2c-support-v1-0-4aeb7c54c67b@baylibre.com>
 <20221122-mt8365-i2c-support-v1-2-4aeb7c54c67b@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221122-mt8365-i2c-support-v1-2-4aeb7c54c67b@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_045226_247902_3DEB0D4C 
X-CRM114-Status: GOOD (  14.01  )
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

Il 17/01/23 09:49, Alexandre Mergnat ha scritto:
> There are four I2C master channels in MT8365 with a same HW architecture.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8365.dtsi | 60 ++++++++++++++++++++++++++++++++
>   1 file changed, 60 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> index a32f2b7507be..3c2819bd32af 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> @@ -282,6 +282,66 @@ pwm: pwm@11006000 {
>   			clock-names = "top", "main", "pwm1", "pwm2", "pwm3";
>   		};
>   
> +		i2c0: i2c@11007000 {
> +			compatible = "mediatek,mt8365-i2c",
> +				     "mediatek,mt8168-i2c";
> +			reg = <0 0x11007000 0 0xa0>,
> +			      <0 0x11000080 0 0x80>;

Compatibles fit in one line (83 columns is fine);
regs fit in one line, reaching 76 columns.

Same comments for the other nodes that you're adding.

Regards,
Angelo




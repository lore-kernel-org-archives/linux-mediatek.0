Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352F7CE7B19
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Sep 2023 10:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YiTulQge3KzO2CHFF2tdAzDXydlUajvlAe3wc6GZ6yM=; b=Dz7NIJzmptx/i+ll8j3ijOhwH1
	Ahv6RKuRqy16+FTwxF+CrVS1Vc0jKLfaQa/xHC16VBTnk2aGwYaRyMBaHrCPdBKWIWkdnZlus/gXo
	6vDKyToJCYwgkjHXrteJ+wWG3tSQdS6tLFWFBAuysfhszq9cRtVewPcbaBiS9Vkx3T0INbbb7vpwk
	kDky214g9R+dt7OnWU1FwMxLl2gxDbchZ2x+lrtGBHICNH8Yrc92ZRRZ1DcQM/xWAGuxmkg5KOYBq
	fdkHuICKat6pNt2LoHJZtZd7yj6vIlJzgNWhML67eQl0vNXN7zCEQpCk7B2axzxd25p4JGtu8klSt
	cktialtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qloFN-002prA-1y;
	Thu, 28 Sep 2023 10:27:53 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qloFJ-002ppO-20;
	Thu, 28 Sep 2023 10:27:51 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F1A776607330;
	Thu, 28 Sep 2023 11:27:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695896868;
	bh=vyqtGkPk6PukXN65NbvwhvWD0HwSXHn79AF28WiHhVA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jGlOLv1s/LU7KYiSJu/xUOAY0nUqM/mdTJbTkoj+pZAAW0i2rFzePBZhTNICEb5ob
	 zgfCwOiYK9CCBDM4zO5EyZa3b7DQQhC75E4xQX/8uQ94IxvBjUk5NJtmWN3k+vkNjg
	 ddhawPmX2NG+MsaKmnZjwgclWSgKCAWKkdyI0D+XPX3ClQELOwlOgOvmUZbYqt8PJV
	 FfZUpTOsRUdRg8+sC1WvLSLbJiCEGBA4ztl2dJZ4g8N2q6WH82p3DFcrdw8TQ1hodz
	 qKF2i8WOfOrFF9r0gsV7Kl71683SZXjYtDLxbZrevrDPEqEpGW6hbjtTc8GJ0B1BP4
	 mSbierKK8Habw==
Message-ID: <1fa77502-eccf-219e-2641-a2d72a6dedcc@collabora.com>
Date: Thu, 28 Sep 2023 12:27:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] arm64: dts: mt6358: Drop bogus "regulator-fixed"
 compatible properties
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20230928091415.3253698-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230928091415.3253698-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_032749_791845_B52875C9 
X-CRM114-Status: GOOD (  10.28  )
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

Il 28/09/23 11:14, Chen-Yu Tsai ha scritto:
> Whether a regulator under the MT6358 PMIC is a fixed regulator or not is
> derived from the node name. Compatible string properties are not used.
> This causes validation errors after the regulator binding is converted
> to DT schema.
> 
> Drop the bogus "regulator-fixed" compatible properties from the PMIC's
> regulator sub-nodes.
> 
> Fixes: 9f8872221674 ("arm64: dts: mt6358: add PMIC MT6358 related nodes")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




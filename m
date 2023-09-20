Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F5B9CE79C2
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Sep 2023 10:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nWvCLqceEn6wG3ZRCAt4o5gpIsZJj2HveoheM85J1dE=; b=1ZL3p6mmUcmKBsVcchA+eeN2ar
	HIRxwSmaKoT09/bch9ALUO6qXuKsjgDf4WQIKahAfCNnOwccZyJtuDvaEc5877Agl5QzF41KciLrt
	5phgM8PZUpuBrI0rWZfULFz64dFHwLlIGgsgxafh8EGqMxEwP37sPMhQ+kZqn+/WW+yFHjUm+IhZ0
	fObX2tZpspf8K7zUmELd6WZFKyCic+wpiyybc1PFSpuQ6hlRTM+Yx9+BW6tPzLzC/iOpra40RgV7y
	gl+yxdPr61WvqQLHi1KP+rkjZc/gur3iaS22BOid8FwKV/xqHaMU/EgmBhNzRUK6/RC/2LkO4YtZm
	JJixLOSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiuhG-002ey0-0H;
	Wed, 20 Sep 2023 10:44:42 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiuh9-002eun-25;
	Wed, 20 Sep 2023 10:44:36 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CE07D66020EE;
	Wed, 20 Sep 2023 11:44:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695206674;
	bh=G338lXUJZ7YTM0Q7o/Hhflrx9583KA/wLdEtpyqYJyo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CEWExvrD9a+y3n9LJ7lAa7Kl4RvaCKlBKmInfM9DF1uU8oclkaQa35rBxaOtGABPg
	 yf8+mp2+A+dGECE8suzbmU+0xPADRqLIa67y4+no7vKahABQhuaLjuYZfJc03uDmUc
	 bTLKGbisZSoW0Cc91620NogoBAQsTpFXKPGunidYcHeakpINz5eJOO13g1U/Ro1xN+
	 EIsXOka5uUfnsnipLT7xLWc8hVH9Ts5fa2qohiNE9YrVv3ffP0XmTh0F9iMgaeclfu
	 91wTAMogsV8JSHuPhue+917MpHbZQXJuXWxPqUA1vJutEGFX//P1r6GkImep/v2X4a
	 XksEYfLEGvdvA==
Message-ID: <f8c359f6-4525-081c-290c-146ce99b1cfb@collabora.com>
Date: Wed, 20 Sep 2023 12:44:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 09/12] regulator: mt6358: Make MT6366 vcn18 LDO
 configurable
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Zhiyong Tao <zhiyong.tao@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230919104357.3971512-1-wenst@chromium.org>
 <20230919104357.3971512-10-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230919104357.3971512-10-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_034435_816956_FDE48923 
X-CRM114-Status: GOOD (  11.53  )
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

Il 19/09/23 12:43, Chen-Yu Tsai ha scritto:
> The VCN18 regulator on the MT6366 (only) actually has a wide
> configurable range of voltages, even though its name suggests a fixed
> output voltage.
> 
> Convert it from a fixed LDO to a configurable LDO. Its range of settings
> is the same as the VM18 regulator, which is missing and will be added in
> a subsequent patch.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




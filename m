Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DE5CE7B17
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Sep 2023 10:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Hl8D5QKAJR5q9tH/F3SP2ozkmICHSZFDht5XGwek7k=; b=1kK4Z4RR1KCW6cls1Kh+V5jfod
	ghTiWlyTLYDNHjuaet2G7ZiCH2dTilUf/H++xxsr7hYdIXtUfBUigCvgPdx2h0gf2s4PfpqybV3xf
	1QWPrKc0OvV9V/i3MqTdvAaHFXOhU2weJJ0ejyoFwRbgwR+bhIGIhfF9wC9jqbsh7mhRLqKYDnaYU
	qN//9mfAopH8aTwtm6c0xuMs2lsstesk/YzcsOPccsvmdRdwQHLu6xjKomTXBk7qQOMqrOFZ20zWQ
	DQ8i51HsSQCH99rFQR7NV9W74KFAn6ecAFfDeBSxWs6DxMgTGjmq8Sr1C/Q0zX5XFlFbr03uBMWBI
	zK9E0rew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qloDQ-002p7e-3A;
	Thu, 28 Sep 2023 10:25:52 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qloDL-002p5G-2y;
	Thu, 28 Sep 2023 10:25:51 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1B6AF6607330;
	Thu, 28 Sep 2023 11:25:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695896746;
	bh=RCSdUR/osdkCB5Bl2WmbzxTRoja3hNKs1eu4r3gAs2E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DVXch+pbyJerTappMmJKe1mDPwvj3brTBhUrdK3j9xVX1QbSVO57F1gmBQ2vvtxnB
	 ewY9aexnBFY82dLg+e/w/nnQ1Vcg7TNsr5G64HhqIGh+CkPxDchtYoZXT3ediAQiYJ
	 KI2wXZrr5vRsPsJpkHknhoE0gj62ZxP56aK0lBAGCvqS6RKMdp0iaSETktc+tixi0v
	 Z0rAAf8RGVus7HptjBDH8oFVMarFgQ4bUzahTg6uMokJ5i1ptmDxiMX0kLxive1if1
	 RCjWC5O7D3n+oHZrCV2iBrg94ypVwgtd7wBMSDLk3IHP5w17sb/j8OZh0e1ywqOAz+
	 ALdVsk7oXLh5Q==
Message-ID: <58a7d962-bfa7-ac1d-a324-c78a03b6835d@collabora.com>
Date: Thu, 28 Sep 2023 12:25:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v4 01/12] dt-bindings: mfd: mt6397: Split out compatible
 for MediaTek MT6366 PMIC
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Zhiyong Tao <zhiyong.tao@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230928085537.3246669-1-wenst@chromium.org>
 <20230928085537.3246669-2-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230928085537.3246669-2-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_032548_099272_8118FC07 
X-CRM114-Status: GOOD (  13.27  )
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

Il 28/09/23 10:55, Chen-Yu Tsai ha scritto:
> The MT6366 PMIC is mostly, but not fully, compatible with MT6358. It has
> a different set of regulators. Specifically, it lacks the camera related
> VCAM* LDOs and VLDO28, but has additional VM18, VMDDR, and VSRAM_CORE LDOs.
> 
> The PMICs contain a chip ID register that can be used to detect which
> exact model is preset, so it is possible to share a common base
> compatible string.
> 
> Add a separate compatible for the MT6366 PMIC, with a fallback to the
> MT6358 PMIC.
> 
> Fixes: 49be16305587 ("dt-bindings: mfd: Add compatible for the MediaTek MT6366 PMIC")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




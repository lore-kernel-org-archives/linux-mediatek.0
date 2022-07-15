Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FECBC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 12:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SWvoVGxjQoPYepdvVRvKAyK35x6plmPloVZujpe0+k8=; b=mT9dY9SUktYGrfV1LUuft4ngma
	vI02clwtCUbNSoDhftxKqqTn1QGXiWj+LSXavE8oU7ZBI4pBeoANNA0sgC/DFJQOquEIZZg88G/6+
	/h62s/KJFe9PLpaSfkJR3yw2B9ucNX7iRw30v/W0w+kL61sELxUtOP+sQZHF0yOSQixAqREbNgpn2
	i/CipWj9nfgdXDKtHFiqt4SVarLo56gpkkztomD3JIfFMDYFfAAqwjuwbTsJJgFD5ly02Zq5sYUN0
	gGgoB019Z+OJvupRu2M9iPV26urFdJq2zQfx/X53dOm4o+al/TxbnIAvQUKU2aczusCNgN8UwzBRY
	13ZlBjEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCKbZ-006z2e-Ef; Fri, 15 Jul 2022 12:39:37 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCKav-006yfO-Rt; Fri, 15 Jul 2022 12:39:03 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4E4186601A61;
	Fri, 15 Jul 2022 13:38:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657888733;
	bh=ZVElrDNNWLxEWloFAOfH7C4Fpr0Lmvic8ERGB1kvqB4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e99cSQWmHm7/JZisirbonm/6U8vy5nhVjOgdKT+QyHxey50y+124SM9Feq3upTZDV
	 JJIyAven0vbE+1i/x5o7H8h8JGWRkh9c0N3eb0vEbubdPAjXeyNkQk/dQtOkH21r74
	 GNrTYmh51m0PLEmqNY6mEKzQz4iBNbuuZxZNqGL9dVuq5RtknpjUJPf8zNySc40qxt
	 X4DSKYPCXagYwowsBhGu+H53zkOnXtHthBdqtSIc77smb67eiB7qx+y/PccB9afccT
	 kUpGpLT5VFmk/zOsa7H4z4Kc5rTW4ICz852x9h2Isgae9gAcbBAM/JS2CDcA7bFxoj
	 9WnK6KjGSgKgw==
Message-ID: <7cec46d2-8888-89cd-5775-48fa113452b0@collabora.com>
Date: Fri, 15 Jul 2022 14:38:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 09/13] iio: adc: mt6370: Add MediaTek MT6370 support
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, lee.jones@linaro.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
Cc: chiaen_wu@richtek.com, alice_chen@richtek.com, cy_huang@richtek.com,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org, szunichen@gmail.com
References: <20220715112607.591-1-peterwu.pub@gmail.com>
 <20220715112607.591-10-peterwu.pub@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220715112607.591-10-peterwu.pub@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_053858_082400_3159ABEE 
X-CRM114-Status: UNSURE (   8.22  )
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

Il 15/07/22 13:26, ChiaEn Wu ha scritto:
> From: ChiaEn Wu <chiaen_wu@richtek.com>
> 
> MediaTek MT6370 is a SubPMIC consisting of a single cell battery charger
> with ADC monitoring, RGB LEDs, dual channel flashlight, WLED backlight
> driver, display bias voltage supply, one general purpose LDO, and the
> USB Type-C & PD controller complies with the latest USB Type-C and PD
> standards.
> 
> This adds support the MT6370 ADC driver for system monitoring, including
> charger current, voltage, and temperature.
> 
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




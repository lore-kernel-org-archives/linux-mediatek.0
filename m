Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5AFCE79C2
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Sep 2023 10:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h07sEVEYD/cLSeIbxmFhyVsIHONhMP8y34GzRyrKxSw=; b=VQ7Ml5ouiqB/xwFfLKVSGi3qcY
	2zjyW1+zBCRhv3H9AvdU0xizhqZK49ZeeIJir13GlGXjhxNe7fWqFZWax8VCfpP3zNOs+a02urlfu
	RFMfaYvIKXlOZSUh0S0lFAA+9fEMjDT6gLcCIl1yivNPiPt3P47g+WOQg8kt9QWUVjxDhn+6ED32z
	Jtkf5rBV0G79cNR9pYl2375UgZA0yag2PaNFQoGtmQ0XEjEQ9LDjeFvz8aRg1+fm/6R7Qz0w+Sr5T
	ytk3OdJyAJCwbElsCAUdtpniEd/eBhok+GriKyTkJv9lYAnCAj9AyCbiH2RbXTwKQUI7kTv0tA/uT
	14Py35yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiuh3-002esA-0l;
	Wed, 20 Sep 2023 10:44:29 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiugt-002eoB-0T;
	Wed, 20 Sep 2023 10:44:20 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 111756607084;
	Wed, 20 Sep 2023 11:44:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695206657;
	bh=qYDv4UmMS35eowUXXzmtkFsA7eJUiQCM8vMVF/nTK64=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZAD1dEJ1+YyBkqVSC/7hBtnGxVL86hiumckiBEh+QZzbKipI8e0RLLVH7hlGGp1vW
	 RhA7SCmbuBXlzQVQF+TPAdIGsMbxcL0uecE+mzQyUA2J1pgszbVzp8iWL5O7rXP1oW
	 jcNPI+FyE48vZRV/uKlKghj1EPuCdKHFbYMCkfjhKQ90cUmdO39y9ZfPg0jAchJGhS
	 7m5yPvLw3oKf0VSkZIRwbAunQ/LtOdKEJLjn6JsuvRSBdzGKIJn4Gu1SLm7qf2wTqh
	 IPYMbjBl94Akb0JRrRzP2DdQRu5kwhnh9H3F1qz0vErE/YG/SdJQe1A0BnnlMI739D
	 nZ1OrUWwCkRng==
Message-ID: <10fe286c-7168-6454-4ac6-bc9a8fe50004@collabora.com>
Date: Wed, 20 Sep 2023 12:44:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 06/12] regulator: mt6358: Use mt6397-regulator.h
 binding header for buck mode macros
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
 <20230919104357.3971512-7-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230919104357.3971512-7-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_034419_308495_6A90F346 
X-CRM114-Status: GOOD (  11.96  )
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
> The (undocumented) possible values for the buck operating modes on the
> MT6358 are the same as those on the MT6397, both for the device tree
> bindings and the actual hardware register values.
> 
> Reuse the macros for the MT6397 PMIC in the MT6358 regulator driver by
> including the mt6397-regulator.h binding header and replacing the
> existing macros. This aligns it with other PMIC.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6359CECAAA1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Aug 2022 10:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mk4M3Eja+4+uXjTFzPwuvsPbNdEIrBnWxoNII/WXHCI=; b=AYVkYSG2BNUMFizFH9fa6/9SzZ
	cOVrfM5R9BUzq9dWnw51Y9iXmO8QIIi6ymob/ZHnseF+8WdCiBBa98CPWke2Zi0peb2gvvWO1TcYb
	EqOssFQ9wwFAWA6eygYEWwV+dTLSqfi9i91+17GlAYcFIkKydzXn6IDxzad4xf3+dbw0lt6x4YP0z
	SuBtrP28E2pPPTc7cdfS/dcnC/f3BRaJSkZ5wAyFgt/TjphmAh/TLLa/e7fQtpdrcEP/9U4hQYhkA
	wHdyyqRkWTsOrQF3fJL/ERl7/QuQ1wc7t0Q03pW2VDTu3RcF08DKp4I6KLt/ijSlr8bfRyV/hIVew
	BTCO8b5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSyoe-00GI5c-EH; Tue, 30 Aug 2022 10:49:56 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSyUT-00GARc-OE; Tue, 30 Aug 2022 10:29:07 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 423FE6601D92;
	Tue, 30 Aug 2022 11:29:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1661855340;
	bh=PKyYLG/23Jae2iv0f8420lyRHaoRQtmdhQus4GBtX3k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fbYaphZJdongwYOH2xf/j+qNzpDQmmZ3fdf+w5NANSWPI+ABahvzh0CV2cIQqp+ZY
	 eUrQyQw9/75pm0mBGLmQ4sKCMEKA1OyXNEZj2/3sMPuLyM9TRru7dBByChzmuGJDMp
	 F4sFBSeI70zpJJX0yJ2Y7AIEmi3mBDH/jmIofcDdGz4mB53Ufs8Ti0rpzYGXgq0+hi
	 xcc5IEN9TFy72cRgV0I6hcpZsfiSTHvu6dZkB8Jsl4+haNdr44Qna9sVFBWeTSf13c
	 41IgHfYj4BdTBXCE1PPksFfB/C6prBGcvSLM+6qwow3oafKixAbbAPiaZ0npZS6Asm
	 SIOiy5Qp4KitQ==
Message-ID: <68e2d818-3b82-733d-43d8-288f84df6885@collabora.com>
Date: Tue, 30 Aug 2022 12:28:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 3/4] soc: mediatek: add support of MTK_SCPD_STRICT_BUSP
 cap
Content-Language: en-US
To: Markus Schneider-Pargmann <msp@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Fabien Parent <parent.f@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Alexandre Bailon <abailon@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>
References: <20220822144303.3438467-1-msp@baylibre.com>
 <20220822144303.3438467-4-msp@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220822144303.3438467-4-msp@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_032906_074721_95CA8F31 
X-CRM114-Status: GOOD (  13.12  )
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

Il 22/08/22 16:43, Markus Schneider-Pargmann ha scritto:
> From: Alexandre Bailon <abailon@baylibre.com>
> 
> This adds support for MTK_SCPD_STRICT_BUSP capability. It is a strict
> bus protection policy that requires the bus protection to be disabled
> before accessing the bus.
> This is required by the mt8365, for the MM power domain.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>

You've renamed the cap, but you kept the old name in both the commit description
and title. Please fix that.


> ---
> 
> Notes:
>      Changes in v3:
>      - Rename MTK_SCPD_STRICT_BUSP to MTK_SCPD_STRICT_BUS_PROTECTION
>      - Remove extra bool variable reflecting the capability
>      
>      Changes in v2:
>      - Fixup error handling path.
> 


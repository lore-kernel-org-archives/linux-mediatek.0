Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5ACFC64EC4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 13:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hv2qOxs3G0gjO2budTsHBarTacr/H8wpE6N7OPTxy6M=; b=fGj0PXFGSlmoq+Kw/mp7S8jaht
	1PbNATavztLis6CN2CGI5WCOdQdJM9Lrqv449y0pR4IZLPqeHD/ZSwrIhREwaBfqOwglS8RF0MDEv
	4h6n6hZq2CvBQ8+z1SVMXWjDF5GmiT9eLdFjmkHV9i6yU3JhlOgF/v3NJDXp/ISUESZBFHVrEaeJa
	PQn7AzwFkzcZWtRlDhrSDHgo/3WJ0ZWOHM6YFReV3Y03fnd/uPaZr+XwICqNMrjRIEb+max795ze5
	ZsKsHtYKSCTzBiaR0EQBY7voCrPBVp2PKJ4QCv1YXA8lZwwRhZzmoEQ4PQpzxXQU0WEmAg/rdZ5rg
	+QO8jbUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paGOa-00A8Vy-21; Thu, 09 Mar 2023 13:33:24 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paGNp-00A89s-BT; Thu, 09 Mar 2023 13:32:42 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B410966003B1;
	Thu,  9 Mar 2023 13:32:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678368754;
	bh=l6DDXlsauhhCbZ03pxW3WllL2mKUtfCwuScLJaPHbmg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CSyCOrq6eVhdVmFXNTdk5rks0+qlq9FmhN7fCP9CEXVXYdA5QZjqfONgQoNBzXXKP
	 fdvwDLmthZCB1ziMgoj4lfEWVZ/Cx/IdsO9JKN125Czii2vVjk/XMC0tZC08lp4NO0
	 tFhS4I/0uCZ4JzvrGf+3msofJigSGHbN6+NnSEnNmxozzKqYj2PMOLOrHMP04BSwXt
	 QelUiu6H+Q+ophgeiataSOaelGWsdsLWErIqBGYzAH6aido3XrmNVJ+CMa3R7jTDyz
	 5Wn8GKPgJDtBckS0dA8b5zm/GFQIEpL290gpXkW/E/DI8TWilOMqs4cJ6AeUBza5Rw
	 SMX8c0Ijh1a+A==
Message-ID: <0fb37a8f-f284-76f2-e2f3-ff0f23eaa200@collabora.com>
Date: Thu, 9 Mar 2023 14:32:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 17/18] arm64: dts: mediatek: fix systimer properties
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>, Guenter Roeck <linux@roeck-us.net>,
 Linus Walleij <linus.walleij@linaro.org>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Wenbin Mei <wenbin.mei@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mmc@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>,
 devicetree@vger.kernel.org, Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
References: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com>
 <20230203-evk-board-support-v2-17-6ec7cdb10ccf@baylibre.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230203-evk-board-support-v2-17-6ec7cdb10ccf@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_053237_724448_438A0147 
X-CRM114-Status: UNSURE (   9.36  )
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

Il 07/03/23 14:17, Alexandre Mergnat ha scritto:
> From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> 
> MT8365 has a SYST timer (System Timer), therefore the compatible node
> should be "mediatek,mt6765-timer" instead of "mediatek,mt6795-systimer"
> (which corresponds to ARM/ARM64 System Timer).

So this is not a CPUXGPT, not a GPT, but a SYST?

At this point, this should not be even introduced because commit [1] is
not in linux-next yet.

[1]: https://lore.kernel.org/all/20230125143503.1015424-10-bero@baylibre.com/

Matthias, please take note...

Regards,
Angelo



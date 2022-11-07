Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EACEC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 09:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eGlJSqzBGWcG0kh4QcwEyUkI84xPl9mD45/iv7pWkWY=; b=grmorJtEpSWCXcHnhq6WMkdJ49
	nvslSMdjuIOaJ316R3O2Gg+0TSS4Zz6ek6DIilpm6mtdc/FjWBDYJ6JJDvpOoMxoY3Kq6wJMT2oe7
	9JDS6w4AOAR4QO8tAX7RKXM4UIeYj+zDrUQ7MDr1srpPSryuMhlpW0lTs40Y6H6X0an0fsgYwLPf3
	FDE5vHvHZBBquKfG1qjGBIPgjX8Fm6ua5SzBAJAj9MFKDrohXGtRqOnmTT5zQi0mmrZGyKIoXrNZM
	V/rJnHgrgWUCaAPz4DfpXDsn0J9l4HTQML5w9t1HgwsKdLlDGQiIFIZTAmVvhCGCsdbkL5Dm3reOT
	bzie3Aqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oryWS-00DMwU-8V; Mon, 07 Nov 2022 09:34:28 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oryVQ-00DMPM-12; Mon, 07 Nov 2022 09:33:29 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 21A6566028AE;
	Mon,  7 Nov 2022 09:33:22 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667813602;
	bh=6NwMJFI6osQ8vcsqL/iCBpLI1i5GePEmjL73qupB9I4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HXRv3f5XGuH1GVY0cARvvgJCSoGi/8hGpFISdrPmO44dMt0bkJBFoZjzK/GPWpIru
	 VWKZXZ+fK8EO+SfWCzLc7QcIyTOXmfFe73je1VWBKbV1N5tyCjKxiPxrWq6lORMQwW
	 NFLEYJ53bUoTibgzB8FnBeA58Lj/x5oCc9DRNwTA6X4IGAyBDXzZMjMFacrm9YebqC
	 kNleduv97xJ9yCB+rsZFE3qlc0V7liaS1HS+0tbAXnLLGLvriU8GqPz8hHP5SvRGv7
	 pZWi1EXif9t/7ZqsMbgMJp7gjWfedUIyIM7TkSeQc2QlYoGL2sTlqKURWHaAnIykbv
	 3GvRpVU6ohGVQ==
Message-ID: <6e697379-4100-9aca-e536-8e7ef300ed1e@collabora.com>
Date: Mon, 7 Nov 2022 10:33:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2 4/6] pinctrl: mediatek: fix the pinconf register offset
 of some pins
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
References: <20221106080114.7426-1-linux@fw-web.de>
 <20221106080114.7426-5-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221106080114.7426-5-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_013324_282039_E6D2B197 
X-CRM114-Status: UNSURE (   9.10  )
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

Il 06/11/22 09:01, Frank Wunderlich ha scritto:
> From: Sam Shih <sam.shih@mediatek.com>
> 
> Correct the bias-pull-up, bias-pull-down and bias-disable register
> offset of mt7986 pin-42 to pin-49, in the original driver, the
> relative offset value was erroneously decremented by 1.
> 
> Fixes: 360de6728064 ("pinctrl: mediatek: add support for MT7986 SoC")
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



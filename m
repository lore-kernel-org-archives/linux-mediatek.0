Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1274CC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 10:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cxkw4eA5UiLJ3+uJFlXbFCYgWU4KWUk7uJLgPQnT5iM=; b=s3CFTA+zJ8oTSWQHuUXK4OjmAn
	6oaXS/rnVdfRRwZdb6l2ggFvxOno0oFInTgUITrOjbGDSoZdUpououyiuUzWDlFu/VaWDaAaUu2CG
	KfcPS+E18oskppuqfXE6AJqqSTOpU3GZIjtqMjGeqnavaLKxxsq8rTqRf6cqKxi66GfnKKesdflQq
	a6BXOqFnH5/9TJ13wT51KQcmA1FU1Y54XcJz1TrSyoiDXzXTAQ2mnYT7nlFF/zBpKNM/y9nrk+aT5
	xFCuFJcqQ1tn7whC73jiEDW6nWF3scCul1ByAvxTRUKFX3nq4v6VfrCcJw3HLo9XJG3jHcHbRH6u3
	LIi67ZaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFvRX-008JNS-KG; Mon, 25 Jul 2022 10:36:07 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFvRM-008JGJ-0C; Mon, 25 Jul 2022 10:35:57 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E0FB56601AA6;
	Mon, 25 Jul 2022 11:35:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658745354;
	bh=uJhjhv9FEf4L8eIR0Uo4rGRFYDm94By0OZtCQ7aMwS0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IZXFrqEAmkP6tSa8ke4aIOQTmJcLqTi85C4KCMTtR2p6A74so/XsYXJ0OrX5inCC9
	 2SsTT7PLbgMmqI6Q8SVaFtJWUgqcy3tJKiCwZK1LI0oJw4gTGJ67puWWNi9Orhrq0A
	 ymKJwZZ+HKzUInw0rU1iV9I8VX7dLLDXX/wHbkzPTNoXxhtE23mxakoRGC+9jl6PCK
	 RaJIri0xaDmxW5+NgzhysPsRlBBz18kRlq2W/c9PrgABEekxFacLDdpOPyNcvzc8XZ
	 f8ChmX4v58mFMNHqR3YxudPT/nj2F0o39Iehx/WlMrozY1D8LsvO65EjLMwfvAkB3a
	 P7kwfbhSbOx9Q==
Message-ID: <b52caf77-7fdc-8496-3087-e4d392c93853@collabora.com>
Date: Mon, 25 Jul 2022 12:35:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: mt8186: Add and use
 drive-strength-microamp
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20220725100253.10687-1-allen-kh.cheng@mediatek.com>
 <20220725100253.10687-3-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220725100253.10687-3-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_033556_203046_0F791220 
X-CRM114-Status: UNSURE (   9.93  )
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

Il 25/07/22 12:02, Allen-KH Cheng ha scritto:
> Commit e5fabbe43f3f ("pinctrl: mediatek: paris: Support generic
> PIN_CONFIG_DRIVE_STRENGTH_UA") added support for using
> drive-strength-microamp instead of mediatek,drive-strength-adv.
> 
> Similarly to the mt8192 and mt8195, there's no user of property
> 'mediatek,drive-strength-adv', hence removing it is safe.
> 
> Fixes: 338e953f1bd1(dt-bindings: pinctrl: mt8186: add pinctrl file and binding document)
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

The fixes tag format is wrong... Please fix that:

Fixes: 338e953f1bd1 ("dt-bindings: pinctrl: mt8186: add pinctrl file and binding 
document")

(sorry about wrapped line if you see it, that's supposed to be one line!).

After which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



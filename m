Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B52C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Oct 2022 08:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZnmZOpI5q3E6/WpKyY+eHujla3Z8QOEHmOAgfd9OCCo=; b=YQlW/DsnO/dt/6o2BOnlaYnDr8
	WpMsErFAYOnGAwd6EYAaQFuO/QS8ZWuzgbZDXuvcDpGAI8NQPV1jAGaMbdehVdBiz2R68kz998D65
	M+Y4XOjnxLcr4RQtQH4rdUpdURXhw/tsXXjYmb6uwV4ruTVYe6is8cwbiAQah5P4qbZJD3iUjVij3
	d3YDDT1VMaqWL/tGw230k/mFZQgX8O5Bzd7FKAwAIm2QnDhPR8GsrHsgvlCfz9boIVMwqO4eWGCZU
	Svhu3Hn+5fyagDblfXhh5n0pAqEqr2txJc11R0uwxOnACayuJckGzRbvvTOHUw85J6bLIn9bmorph
	tuDTN5yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohnyL-00HXYB-Ql; Mon, 10 Oct 2022 08:17:13 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohnxW-00HXBy-VD; Mon, 10 Oct 2022 08:16:25 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 237EA66022C7;
	Mon, 10 Oct 2022 09:16:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665389781;
	bh=7m1P0uQdVeYZ0P/r2K2/caJqWj5cB2sMteSYpiLHPaI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AftWLdqK8mRvjg/FfSUvul6ff3jDfz84tkNTjCDWpICGur1U8iKFYWOkcxgt5B3R8
	 N/Edf2oIX134OBP9WM2xEyx1FdTkkX/77RRIAhOd7eHwoa//SY6DGVneOem+C54mhK
	 vlluvK98oLcyGlmFCSsCJXltzn3B/quqwc8BgSzTdXzyjhqTgSr9zFeUXbkxuj2Ukx
	 LlSzc6iMaoxH6l2tNRGYFTk1kqovNYJ5GmomWULWJVtt5gI52mYjw3jwdyc1E6nJbS
	 7jTObHaFI+wfMSFqMVs82Tvi9XKyYDhCHQ7oCmHCgRkR+12U4NOKA4j2wa/cMtsnlP
	 zntjCYeBhNjyg==
Message-ID: <e01f710f-9f62-c5d2-30c2-1d1fc04f0688@collabora.com>
Date: Mon, 10 Oct 2022 10:16:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 03/10] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Make gpio-ranges optional
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>,
 Andy Teng <andy.teng@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
References: <20221007125904.55371-1-y.oudjana@protonmail.com>
 <20221007125904.55371-4-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221007125904.55371-4-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_011623_227049_D5693367 
X-CRM114-Status: GOOD (  11.24  )
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

Il 07/10/22 14:58, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> The pin controller can function without specifying gpio-ranges so remove
> it from required properties. This is also done in preparation for adding
> other pin controllers which currently don't have the gpio-ranges property
> defined where they are used in DTS. This allows dtbs_check to pass on
> those device trees.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




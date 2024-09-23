Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73732CF9C5B
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Sep 2024 08:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cyxfB4QaS1+FcvkmPe6fxmNpBn2L3coWLjf8uFLXULg=; b=ehSs3bC0U/S+FGuL51ylBS16G5
	EmId+agvinmdbcMFB0PE/E+4n2kcDR9+Dz5zNRkvWkYlMkEDFB1aAR1EVJqAWDHn2ug9c2DdCFaYV
	fMXOBEuo2wSJbciZHkKI/fMeDOVjWQeeW4QPWVQX4byp/ZemxSuLVBPtF5wbxGJorKjIMBhCEYApJ
	j/0Y+y364HxTHchFu8Sj6yTxH6TDzVoe9ZW8f9RWGfY7iZHTxzhh4YkQSmd33m4aNxXEHmt7+/081
	tXTwelPJSEHlNnM3c0gobgt0w8Hkub39RA6EpziHRsLpT8J5NVYclvB/orVSkr3feKtbk/+xekQO1
	4UAKKDWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sseee-0000000GhjP-2GH9;
	Mon, 23 Sep 2024 08:42:48 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sseaM-0000000GgqN-0GQi;
	Mon, 23 Sep 2024 08:38:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727080700;
	bh=rcivXolReutd/1EqUvrpD3Vx/mkT+TgRwYLp20qEAFg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Yc4yh4IIsBOEZ8VMS85XjlBoF93yTvLouVXm+ZJRDYk4ufZtVgvE2QZvOVey8j4Yz
	 39B+x6EbQFr4+Nmqnx7BMgqzq9wnQ5H/Aw6YYuLQuARSI2miIbjsX0Uyq19+ri2Ic8
	 YgzfivkH9sHlcTUNxZwHh6EQP7sfFCr12AdJSdoiNzL6F8U0YIhHa0l7e6JfJHWoE9
	 tWaH+AsYq4/5K2wS8MkDOySW7M/tT63ugKatzUNj7wuNh0sJSH9d/mXo0BvQDMwwlr
	 BvC9I1zp4fucbr2DLmAKE6xi76HWw1lARPGt3iml6xw2qTUugYKRTmAN4BDoK8MX2i
	 oX9Mk+szMRFhQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F26E717E1060;
	Mon, 23 Sep 2024 10:38:19 +0200 (CEST)
Message-ID: <3f5055ad-924b-423e-88a6-9e5d46cd8c13@collabora.com>
Date: Mon, 23 Sep 2024 10:38:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] clk: mediatek: clk-mt8188-topckgen: Remove univpll
 from parents of mfg_core_tmp
To: Pablo Sun <pablo.sun@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20240920134111.19744-1-pablo.sun@mediatek.com>
 <20240920134111.19744-3-pablo.sun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240920134111.19744-3-pablo.sun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_013822_287632_427FC8A0 
X-CRM114-Status: GOOD (  10.27  )
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

Il 20/09/24 15:41, Pablo Sun ha scritto:
> Same as MT8195, MT8188 GPU clock is primarly supplied by the dedicated
> mfgpll. The clock "mfg_core_tmp" is only used as an alt clock when
> setting mfgpll clock rate.
> 
> If we keep the univpll parents from mfg_core_tmp, when setting
> GPU frequency to 390000000, the common clock framework would switch
> the parent to univpll, instead of setting mfgpll to 390000000:
> 
>      mfgpll                            0        0        0   949999756
>      univpll                           2        2        0  2340000000
>         univpll_d6                     1        1        0   390000000
>            top_mfg_core_tmp            1        1        0   390000000
>               mfg_ck_fast_ref          1        1        0   390000000
>                  mfgcfg_bg3d           1        1        0   390000000
> 
> This results in failures when subsequent devfreq operations need to
> switch to other frequencies. So remove univpll from the parent list.
> 
> This solution is taken from commit 72d38ed720e9 ("clk: mediatek:
> clk-mt8195-topckgen: Drop univplls from mfg mux parents")
> 
> Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




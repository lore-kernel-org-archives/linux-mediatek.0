Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D84ACA0EC2
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Aug 2025 09:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dSRIDBpPLt7ICwRWt0D6MHJB/Mqmmv7YVIi0fQlWilY=; b=R6JRd4QQO3iND0
	sZCh+M9ABiKEQbyoFB7zw5jUqhLnCzSLvHjW9v5U268bf9jaYUV3uGic7v0hUJQLqeO46J72Xx+7I
	+B35X4aV4e3BXVNh812DxGcYCi59rvtMzCSdYxR00i59u6yxgxNxjVGH/m0i8vMEG093ygXFGPnGl
	ql24O3efRdGco8K9jLMEVvN3MTgFVFAHvwpZ1CYtwc0yjf/GXVZpQWMu+3gpdemuf5pTGtakA+l+N
	S7wmB6E/gHXJ7KvLiPvIvgv7yvf+a1D7I3qHEYNAYr4DfSjpJrSnNrtrqpVwXpRNH7KWw7O8avr9R
	DftytwqpYGaRuFudjkHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uirSl-0000000A4ly-2i9R;
	Mon, 04 Aug 2025 09:26:35 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uir5k-0000000A25C-1whF;
	Mon, 04 Aug 2025 09:02:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754298166;
	bh=8C3vrohJCMkNz48Npe0D4JIHwbn6kl862AvU60VY+nc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JLhO9L5BrmEQq9pumRV6CfhrlnygeF7jd5jsfvnwprETB0viNvn+WVgy4x+oprZNy
	 NZMHKJ5FUGdpXtd/Z91veR88ZNZxnRiWy8gzUpM4VD3Bp1+ZMGJqkHlVDnltCmoX77
	 pEC0B9HdhIbwF0CXCerXL5yvMdtg6lc/MykiJ5GtAdNMH6gFfi+lYx/xupQv3RbuJ0
	 NJv4suYr1gAPIRqj1dlB/qP3+0QaKx3IJNkcXs/mM23ZuHvaqBDEZUS58CU+kpHguY
	 UFnQcc/YiVj/hwrJ2+LpHeezdF7hUj7DmtnENhEATscLQJ5rLRzsOuY/8U3nY2X7ZL
	 NL5nQ/VDDluIg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6AF9917E04DA;
	Mon,  4 Aug 2025 11:02:44 +0200 (CEST)
Message-ID: <72934f23-08eb-4214-a946-7aa7a432352e@collabora.com>
Date: Mon, 4 Aug 2025 11:02:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/38] dt-bindings: media: mediatek,mt8195-jpeg: Allow
 range number in node address
To: Krzysztof Kozlowski <krzk@kernel.org>,
 linux-mediatek@lists.infradead.org, robh@kernel.org
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-15-angelogioacchino.delregno@collabora.com>
 <70ae6787-ee0b-43a0-851e-1fb6c82f6c31@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <70ae6787-ee0b-43a0-851e-1fb6c82f6c31@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_020248_653370_3D43D881 
X-CRM114-Status: GOOD (  11.17  )
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
Cc: daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, herbert@gondor.apana.org.au, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, broonie@kernel.org, eugen.hristev@linaro.org, houlong.wei@mediatek.com, matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, granquet@baylibre.com, sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, linux-media@vger.kernel.org, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 24/07/25 11:14, Krzysztof Kozlowski ha scritto:
> On 24/07/2025 10:38, AngeloGioacchino Del Regno wrote:
>> The dual and triple core jpeg encoder and decoder (respectively)
>> on MT8195 are far apart: the only way to have this to make sense
>> is to split those in multiple address ranges in device trees as
>> one big range would overlap with other IP in at least the MT8195
>> SoC.
>>
>> Change both the jpegdec and jpegenc bindings to allow specifying
>> children nodes such as "jpegdec@0,10000", "jpegdec@1,0" or for
>> encoder "jpegenc@0,0", "jpegenc@1,0" to resolve dtbs_check issues.
> 
> 
> This should not be needed for standard MMIO/simple-bus nodes. I think
> DTS is wrong here.
> 
> Which cases really need the ','?
> 

All of the multi-core JPEG enc/decoders on MT8195 (and newer).

The DT changes are included in the same series as this commit; check:

20250724083914.61351-35-angelogioacchino.delregno@collabora.com

Cheers,
Angelo



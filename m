Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B79EC25B50
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Jan 2023 08:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P8VJUXLV3mPtD2dfpiFDG1xnSOI7MKNPWHZFrKL0CVk=; b=NvjtdAEZGIjne6/ilsGDIVT4In
	nHOMTcZznlo31Ww3I4jQHdefLZ/cI5W+50iw4tVj3yrnPo19NOd+NinSpVrm0T1bsB4XEmpvZS67J
	LhJnJveCLsdqPSIbx5jeATw8j7sMpqOdxRm+mMz/gyUeCy4B6+z0S4MYqkNqYVbYVXnwcub8r2Cy8
	UCoWgOsZ8RhNx+28nsG1QOx5uuzd3DnbuNM+SFmdnyU7WTbr8mmNwssPBglsDaMcek8I8DYhhJT29
	Q7bEmA08Oa/126qr4Ji6TREuAKHjKkurjReOQsZ6jDpm5OMinha9OK6ckiwCttVvs7aTMedyHRbRu
	oNih59+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIn65-0097dZ-Ag; Fri, 20 Jan 2023 08:50:05 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIn60-0097ZP-Le
	for linux-mediatek@lists.infradead.org; Fri, 20 Jan 2023 08:50:02 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EB256660087F;
	Fri, 20 Jan 2023 08:49:55 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674204596;
	bh=dtOCdLeTQE8zVSUcE8A4hi8VQQlIAstmK+GCMOpm3gw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dNmUuKaMEpcLhTJXo8+9pFLy257FUS5znKBB7aPeH8tiqJudb246wHzQ1/LV8XLKP
	 RhfzW2YxAypWrQoAJUfYu+Mm64RVJwVQeTa6dtO7DAU8BW+7Gp+IRwG+n5fdkhldbp
	 K3pmge3y07BdVmi/tAWxLuQZ8aZ6S43luTpzTIyVVruh1mTpG1Diwl/fu8fbdhuNbi
	 BgTB12x5Db6a5k/Ady/vXeGRwWVV5B0w52XBfAtippXsZcWS7ZkjCP3PGF0THdimjK
	 nHpAMlriHnf1jgt9E5gS5G7vgQdSWJn9PD8G0FJy8frYa+/aQqMgB0DVeb9yHo2Pv6
	 R2pJz8iNvt0yQ==
Message-ID: <c4cf0c0d-9863-fa3a-88da-591c26e08188@collabora.com>
Date: Fri, 20 Jan 2023 09:49:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/3 v2] add support for clocks on MT7981 SoC
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-armkernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Miles Chen <miles.chen@mediatek.com>,
 Edward-JW Yang <edward-jw.yang@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, Sam Shih
 <sam.shih@mediatek.com>, Jianhui Zhao <zhaojh329@gmail.com>
References: <cover.1674152610.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <cover.1674152610.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_005001_052597_A90CAE28 
X-CRM114-Status: GOOD (  14.55  )
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

Il 20/01/23 02:24, Daniel Golle ha scritto:
> The MediaTek MT7981 SoC is quite similar to its big sibling, the
> MT7986. Hence most drivers can be reused and not much is missing the
> get also this SoC working on mainline Linux.
> 
> Start with a cleaned-up version of the clock drivers, based on what can
> also be found in MediaTek's SDK[1].
> 
> Upon request of AngeloGioacchino Del Regno this series has been rebased
> and adapted to be applied on top of the pending series
> "MediaTek clocks cleanups and improvements"[2]
> 
> Changes since v1:
>   * rebase and adapt on top of [2]
>   * split-off addition of dt-bindings header, fix filename
>   * changed commit title as requested

You didn't change it as requested :-P

> 
> [1]: https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/refs/heads/master/target/linux/mediatek/files-5.4/drivers/clk/mediatek/clk-mt7981.c
> [2]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=711734
> 
> Daniel Golle (3):
>    dt-bindings: clk: Add apmixedsys/topckgen compatibles for MT7981
>    dt-bindings: clk: mediatek: add mt7981 clock IDs

s/clk/clock/g :-)

Regards,
Angelo




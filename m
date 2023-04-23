Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F3FC77B60
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Apr 2023 12:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WyFT1OE2/htKooqP1M5cdEY1eb4eAgd3c/gsT7iApcE=; b=KWm8DTIwuzQlgU
	xYqvevEWYagSS0y6YT+nyTxJbEz/Fk6LVyHe2nWGclZ7DuEXUWKvyrfgIxz29TumYsU3fV87aLyns
	tqeUSYRDwINbWCK7uWgxv2Z5I283YN8NmDPxJLxDc0KF9m0gT3+961+jCBklDFsOQGF6ChWEXJQlp
	0SBaOKuRev52DcDNkfQQtAruASvxuazgDBsNaueKoCC9Exw2juj4tpQEltVIb5Gs0QZRhqVXfJn0C
	cIrzldJpL5AsgqfEL9UG0jQ98HDYoG65fJtmGT8phFoqEU9l+qmzom77/3PiOHw2pEulc+V/Gh1i+
	9PqiEH2MjuOCHOv5rFPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqZ7l-00EJoK-1y;
	Sun, 23 Apr 2023 12:47:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqZ7g-00EJmw-0L;
	Sun, 23 Apr 2023 12:47:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BB08860DEC;
	Sun, 23 Apr 2023 12:47:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B9FC433EF;
	Sun, 23 Apr 2023 12:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682254038;
	bh=eGIoQHOJZfoILARB2pz6hMBq1nDSmvzLHJKWEe0ma+w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=T7mQuPTQFPWuWy1mJDy7UEmWdGrDE2z68wNTYlADK1cY+MHtDCBpyPlSLQa4/no5p
	 q8b/8MVcD1U927TGdXuiNm8cIT4wPGJPms35oCY35Xik4tzPFlwETQdDQJjaXxS6J4
	 jzmDMqOgTXKg1wgq4c+Hp2xN7cVeumCgFJ2v8U0ZNVRI7SsBO8rF1swtCaynXAMHEO
	 jY9kYSBOM7JXLD64g0tBOUI+IPsLyGXzUJWKMkiiVSixWSbRTqoP/+Iv/sp878U2J9
	 wldxbB2P6SEIuPqoxh+FHoC04X1o4iJ1Uu2rs/rqdTzU7wQRVgVxWuH/zob+INIpfu
	 b/1MQtu4ds3Bw==
Date: Sun, 23 Apr 2023 14:02:52 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v1 2/7] dt-bindings: iio: adc: Add support for MT7986
Message-ID: <20230423140252.7b018c46@jic23-huawei>
In-Reply-To: <20230421132047.42166-3-linux@fw-web.de>
References: <20230421132047.42166-1-linux@fw-web.de>
	<20230421132047.42166-3-linux@fw-web.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230423_054720_217768_FEBD670F 
X-CRM114-Status: GOOD (  16.83  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Lars-Peter Clausen <lars@metafoo.de>, Lala Lin <lala.lin@mediatek.com>, linux-iio@vger.kernel.org, Zhiyong Tao <zhiyong.tao@mediatek.com>, "Hui.Liu" <hui.liu@mediatek.com>, linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 21 Apr 2023 15:20:42 +0200
Frank Wunderlich <linux@fw-web.de> wrote:

> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add compatible string and specific clock property for mt7986.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Given how trivial this is, I'll apply it without waiting for the DT maintainers
to get to it.

Applied to the togreg branch of iio.git and pushed out as testing for 0-day
to take a look at it.

Thanks,

Jonathan

> ---
>  .../devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml      | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
> index 7f79a06e76f5..6168b44ea72c 100644
> --- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
> @@ -26,6 +26,7 @@ properties:
>            - mediatek,mt2712-auxadc
>            - mediatek,mt6765-auxadc
>            - mediatek,mt7622-auxadc
> +          - mediatek,mt7986-auxadc
>            - mediatek,mt8173-auxadc
>        - items:
>            - enum:



Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E26E70713
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 10:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HC8D35TCdZUOXqWhbhM+Shwo1cqwwddI0ooxd0gnQLg=; b=HuEZk1kzjAk6tAtZmxblxAEL8c
	XEYq3spqIy1OXwF/5Wk/0KP0a6zIYdzgh0QzHy3YzRfXgD1508fb9waeWkonX5GBWPe8S1ZWruBr7
	DR0F/fZHFdVbfzarhaT7P4fZ6/XQDZGNvJPzrwSclAJNipPdExXSbk+g4cQ/5sr/6IQ13VVKGuUJK
	37kK9CzIudN3s+lSm2DuxeclOXgavzbtj8JlTaQ11pxoWfrRFyT/dpOM0OZiyNAllXOfRM2z1xoDo
	rzbTm/Wh5TsN59Dc4qQOYMKF2w7ayFNqNFMHkOcb+F26gb08S6p9BHabbQOZEWGXZ2EwV2BBK8T5J
	g1vxR5dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjH7W-005pRS-2u;
	Thu, 21 Sep 2023 10:41:18 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjH7T-005pOZ-2r;
	Thu, 21 Sep 2023 10:41:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5D891B81FFB;
	Thu, 21 Sep 2023 10:41:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 879F7C32799;
	Thu, 21 Sep 2023 10:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695292873;
	bh=l9YKq4Mo9HZomeyWWq8kJ2jlUSxpMR2JEf+l+sajQFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p1Bkwrc82xTjn6S9fkfu1yiZ4LfO5ofNvcMcNA8MIGtqd7F7tDfjdpUr1AOtmtnqi
	 sFM5ci71SLHRYEDyPlMNnzy5g7ru0idAFa10yaEAHNKLaefUUbzbVuN++DOZQ2RDJm
	 ZjSGkQcYMdLfnS/yo/WxfN0TbHiL6s7paewBypixzYOq6u2/tVx/LFQcwQgtjXDrhd
	 yGt0IzyAEl93pdCUN9tY+qenaQWhYeIUkeNWjc9iBGrkghsLeTXRqBmmhHLyt+adjG
	 cqXsqXx7dDdOhfJ12uftnOzE24YlAVl279KkYhuMIDU5d8w61ySkebprKCKjePIBvY
	 lbZX56e425AvQ==
Date: Thu, 21 Sep 2023 11:41:07 +0100
From: Lee Jones <lee@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 02/11] mfd: mt6358: Add registers for MT6366 specific
 regulators
Message-ID: <20230921104107.GE3449785@google.com>
References: <20230822084520.564937-1-wenst@chromium.org>
 <20230822084520.564937-3-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230822084520.564937-3-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_034116_063700_0AE66317 
X-CRM114-Status: GOOD (  18.59  )
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

On Tue, 22 Aug 2023, Chen-Yu Tsai wrote:

> The MT6366 PMIC, compared to the MT6358, does away with the VCAM*
> regulators. Two regulators VM18 and VMDDR reuse their register space.
> There's also a VSRAM type regulator VSRAM_CORE thats' split between
> the VCAM* register space and other parts.
> 
> Add register address macros for these MT6366 specific regulators.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  include/linux/mfd/mt6358/registers.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

Acked-by: Lee Jones <lee@kernel.org>

> diff --git a/include/linux/mfd/mt6358/registers.h b/include/linux/mfd/mt6358/registers.h
> index 5ea2590be710..d83e87298ac4 100644
> --- a/include/linux/mfd/mt6358/registers.h
> +++ b/include/linux/mfd/mt6358/registers.h
> @@ -294,4 +294,21 @@
>  #define MT6358_AUD_TOP_INT_CON0               0x2228
>  #define MT6358_AUD_TOP_INT_STATUS0            0x2234
>  
> +/*
> + * MT6366 has no VCAM*, but has other regulators in its place. The names
> + * keep the MT6358 prefix for ease of use in the regulator driver.
> + */
> +#define MT6358_LDO_VSRAM_CON5                 0x1bf8
> +#define MT6358_LDO_VM18_CON0                  MT6358_LDO_VCAMA1_CON0
> +#define MT6358_LDO_VM18_CON1                  MT6358_LDO_VCAMA1_CON1
> +#define MT6358_LDO_VM18_CON2                  MT6358_LDO_VCAMA1_CON2
> +#define MT6358_LDO_VMDDR_CON0                 MT6358_LDO_VCAMA2_CON0
> +#define MT6358_LDO_VMDDR_CON1                 MT6358_LDO_VCAMA2_CON1
> +#define MT6358_LDO_VMDDR_CON2                 MT6358_LDO_VCAMA2_CON2
> +#define MT6358_LDO_VSRAM_CORE_CON0            MT6358_LDO_VCAMD_CON0
> +#define MT6358_LDO_VSRAM_CORE_DBG0            0x1cb6
> +#define MT6358_LDO_VSRAM_CORE_DBG1            0x1cb8
> +#define MT6358_VM18_ANA_CON0                  MT6358_VCAMA1_ANA_CON0
> +#define MT6358_VMDDR_ANA_CON0                 MT6358_VCAMD_ANA_CON0
> +
>  #endif /* __MFD_MT6358_REGISTERS_H__ */
> -- 
> 2.42.0.rc1.204.g551eb34607-goog
> 

-- 
Lee Jones [李琼斯]


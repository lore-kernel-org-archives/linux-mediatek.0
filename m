Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49F2C43217
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 08:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wxF9+OzUmH79r9qe2hP2RUT7UpT+tQ9E4H/DpTvCdCI=; b=v6H1MqWHswvuZ4QdCGk08wejuP
	y2ER6XWDcJ8uBntEaf0BoUA3FPcGz1R6DTdjUpLyTZU6Gm4HEBHyAPqLXsCDjMkFfkZG8REMpvFw6
	EgJaesqb2zqnCIBpsu/MWmQKLh9ZaSb/tLEB/rlRyQdXaWgQ1hKUkzg5zwCQJrXP4U/x3A5k08zuR
	U1G5mnSYde1eVKbc4n5i58Jd0z40G6/teMRcPpG4GXXP9ckAzS2EX89atCFc8q9uW1si8+ddlznjV
	i01lnA5pdvb5GLgF0vg15N9NEGBrIcUJlo9lIv4EFtLsEfsKVtyL3KGufz8djVDfGsvIftw1dBKFQ
	FSjhgppQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olR0L-00CGPZ-Qx; Thu, 20 Oct 2022 08:34:17 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olR07-00CGFH-BN; Thu, 20 Oct 2022 08:34:04 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6B26966023A2;
	Thu, 20 Oct 2022 09:34:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666254842;
	bh=2UNffIqKl9kH8OQ2kWi77ZkGLh9VCV/WSKKr3JkfLio=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DOVn7CNkTSdtftA5n9AsIu69+b61TGcZ2ZpgFhWQ/TGhEF6RoJqVq6Dwf9cTidhJv
	 yMGzEE/Us1gF0mVlrnbQ8gB3MDFSbSY+pNVJvONUQ9Q+HRQKpDF4RMMLKRlAqbcKOC
	 svRtQ2+TT3vuufHbv9IVnmvUPDGvaNQLugW8TY4oOEGRkKYeBq/yrSj2w5dC/gJxC5
	 8AKeilYlXiRkEOk1MJhbd2/vnK4slPcZpsBMhU4CaKl1u1Rq/ia3cEU/h8VIjeIEdm
	 ZU+3Cdh+ZlsNxAfjUOJZJhiXCzVG8t44ZjOjYl9IskmLJFR4z38/tt+9ObJiIlqd3C
	 YG1Cs18lzwuiw==
Message-ID: <9761e573-3ec6-bbbf-7985-b9ad63d00580@collabora.com>
Date: Thu, 20 Oct 2022 10:33:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH,1/2] dt-bindings: display: mediatek: dpi: Add compatible
 for MediaTek MT8188
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <1666249553-15801-1-git-send-email-xinlei.lee@mediatek.com>
 <1666249553-15801-2-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1666249553-15801-2-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_013403_570434_0114F212 
X-CRM114-Status: GOOD (  13.54  )
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

Il 20/10/22 09:05, xinlei.lee@mediatek.com ha scritto:
> From: xinlei lee <xinlei.lee@mediatek.com>
> 
> For MT8188, the vdosys0 only supports 1T1P mode while the vdosys0 supports 2T1P mode in MT8195.
> 
> So we need to add dt-binding documentation of dpi for MediaTek MT8188 SoC.
> 
> Signed-off-by: xinlei lee <xinlei.lee@mediatek.com>
> ---
>   Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> index 5bb23e9..963f82b 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> @@ -23,6 +23,7 @@ properties:
>         - mediatek,mt8173-dpi
>         - mediatek,mt8183-dpi
>         - mediatek,mt8186-dpi
> +      - mediatek,mt8188-edp-intf

Please rename to "mediatek,mt8188-dp-intf".

Regards,
Angelo




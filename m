Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A37EC43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 22:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2MIOq5LH1hqO2YV6QV/r2XoVueww6cKoH1ZwzTIbrck=; b=bBXRrUaU5JWY9CQjtyah7ij1k+
	w8U27yP3oGn5332uziYvckVwWSXBYLRntO8KXDNHGigUvtqjxtTRqBzQMTDKr6VmIYu4Jk+BLfO/p
	c6zr4Svq3U5kEt7NhqLNAUDdwYEU8DtrzW2Rh0WEOo1rxkzQ68gdoaQySzpvQue4Te25ISceFziIJ
	ixfx3o1Nf97UZ+EXvBHPy0ZqqhnS596kKucuj5Tsgdwp38omdbgtJ0+cDpvdYJAEEUKzPOqiGfeeN
	Y62GT7ZQAmgi0jH5D9tMlyy+LUfQZGWBR0rbUgGQIm9k3qElefEJxilSJ+kXXbw2JOPKLRcIVY4wC
	ouuJAb4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7OkV-0078bk-Qm; Fri, 01 Jul 2022 22:04:27 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7OkK-0078Yk-G1; Fri, 01 Jul 2022 22:04:18 +0000
Received: from notapiano (unknown [194.36.25.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6321266016D9;
	Fri,  1 Jul 2022 23:04:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656713050;
	bh=FS8tHQQbEegKqv0OZKb+CidvdIdHGPU9aGVYrYy84Bk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XDeAqTDdKBq9w9PKOo5APAaJRkM442HanA7T45CaCWWp82p7InVtQOceYpZrCFqsQ
	 EyPfmpGQ/P5jugbjirM98XD9/OWPZMpphSYFS+oVcOQbowVj7OcniOWGEopP2HcCL3
	 SDmAX00W2lcJHciYY6sucsAnhLyNR7vdLhFNDdYqNu/WpFDLs4clzNuJFkzomiylm3
	 ADhkbZ4IPyFjNd641IsaGIrlPWzApc/b525SbrFjlPUC4lss3iN8kIeUiYgZWnA3jb
	 K3dc8KMeM06rgEoPOMjUR1ykAezPMkWsM5tiu2Fvl0OHJ7A5S9+dq4OKPyEuSS3/Wk
	 pyjjdNMS4lm3Q==
Date: Fri, 1 Jul 2022 18:04:02 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, hsinyi@chromium.org,
	allen-kh.cheng@mediatek.com, gtk3@inbox.ru, luca@z3ntu.xyz,
	sam.shih@mediatek.com, sean.wang@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, wenst@chromium.org
Subject: Re: [PATCH 01/11] dt-bindings: arm: mediatek: Add MT8195 Cherry
 Tomato Chromebooks
Message-ID: <20220701220402.v4g6u75mzptb2fly@notapiano>
References: <20220630153316.308767-1-angelogioacchino.delregno@collabora.com>
 <20220630153316.308767-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220630153316.308767-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_150416_708043_E1BAD906 
X-CRM114-Status: GOOD (  16.54  )
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

On Thu, Jun 30, 2022 at 05:33:06PM +0200, AngeloGioacchino Del Regno wrote:
> Document board compatibles for the MT8195 Cherry platform's
> Tomato Chromebooks, at the time of writing composed of four
> revisions (r0, r1, r2, r3-r4).

Though r0 is not added in this series?

> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index dd6c6e8011f9..3e0afa17ed2e 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -144,6 +144,19 @@ properties:
>            - const: google,spherion-rev0
>            - const: google,spherion
>            - const: mediatek,mt8192

Angelo, this patch is depending on the patch from the asurada-spherion series
[1] to apply. Since this isn't the case for patch 2 as well, I assume this was
a mistake. And it does seem better to keep them independent.

[1] https://lore.kernel.org/all/20220629155956.1138955-2-nfraprado@collabora.com/

Thanks,
Nícolas

> +      - description: Google Tomato (Acer Chromebook Spin 513)
> +        items:
> +          - enum:
> +              - google,tomato-rev2
> +              - google,tomato-rev1
> +          - const: google,tomato
> +          - const: mediatek,mt8195
> +      - description: Google Tomato (rev3 - 4)
> +        items:
> +          - const: google,tomato-rev4
> +          - const: google,tomato-rev3
> +          - const: google,tomato
> +          - const: mediatek,mt8195
>        - items:
>            - enum:
>                - mediatek,mt8186-evb
> -- 
> 2.35.1
> 


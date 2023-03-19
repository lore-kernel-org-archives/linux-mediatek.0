Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C871AC7618A
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Mar 2023 15:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SNbKycMIcC3HXDXZD/Df3Lp7pektrckA3oJ1dzbspW8=; b=cedeHCcNW+3rqa47A6YEcIdk7J
	XR8LirfFOCnCALbukwaSIsgluZSBomT9/Ad1YUc3ypN2GrAuTCARLLwJK6KZFKzKdPsD3Y8IQLW5w
	58v37GQY9xVq493X8rzC/fEo8lLbB1IGKJo9kwRYwEQDR6YmGda3s5iT0++oLXx3ViwIRKqhPNm9F
	QOTZ/cvmRVjR1dShx+Pbdzv9iWny4xjkS9+E71/qSvoqn/dSzgUfF0UoM/+HR9wH43saMHLDJxgPg
	aTJdVsQLnTXEZ1S/pR/mRMsAHxiBq3ljl43yJx8bH6zoJ7PCH0y6gyx7RTbGX9C4+6M4r8cuQzAaN
	67dBb5uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdubd-006u62-0d;
	Sun, 19 Mar 2023 15:05:57 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pduba-006u51-1W;
	Sun, 19 Mar 2023 15:05:55 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pdubU-000246-2r;
	Sun, 19 Mar 2023 16:05:49 +0100
Date: Sun, 19 Mar 2023 15:05:35 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	John Crispin <john@phrozen.org>
Subject: Re: [PATCH RESEND] dt-bindings: pwm: mediatek: add mediatek,mt7986
 compatible
Message-ID: <ZBckvw5NMihHx0Ja@makrotopia.org>
References: <Y+zfb2uQyKHng0kS@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y+zfb2uQyKHng0kS@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_080554_507991_7079C426 
X-CRM114-Status: GOOD (  18.22  )
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

On Wed, Feb 15, 2023 at 01:34:51PM +0000, Daniel Golle wrote:
> Since commit 241eab76657f ("pwm: mediatek: Add support for MT7986")
> support for the 2 PWM channels implemented in MediaTek MT7986 SoCs has
> been added. Also add the compatible string to dt-bindings now that
> they have been converted to YAML.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

May I kindly call your attention to this patch please.

It has received reviews and no further comments for more than a month
now:
https://patchwork.kernel.org/project/linux-mediatek/patch/Y+zfb2uQyKHng0kS@makrotopia.org/

Follow-up patches adding support for MT7981 are already waiting and to
avoid conflicts it would be good to have this one merged before.

Thank you!

> ---
> Resending this patch as I missed sending it to linux-pwm when first
> submitted. See also
> https://patchwork.ozlabs.org/comment/3049442/
> 
>  Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml b/Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml
> index dbc974bff9e9..8e176ba7a525 100644
> --- a/Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml
> +++ b/Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml
> @@ -22,6 +22,7 @@ properties:
>            - mediatek,mt7623-pwm
>            - mediatek,mt7628-pwm
>            - mediatek,mt7629-pwm
> +          - mediatek,mt7986-pwm
>            - mediatek,mt8183-pwm
>            - mediatek,mt8365-pwm
>            - mediatek,mt8516-pwm
> 
> base-commit: 9d9019bcea1aac7eed64a1a4966282b6b7b141c8
> -- 
> 2.39.1
> 


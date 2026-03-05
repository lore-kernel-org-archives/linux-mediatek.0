Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACE6EEF31B
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Mar 2026 08:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IkSaF0Dsvx5a7zpRz8U8mSAGn+Ce1fQQVveZw/uuT5w=; b=jqAwehEmryGz0w42/dr/hB6d0E
	eedvXFcpJug7tZmdzq5RHlLz4dlmV3yL7fuFpvvqOrBuys7OhYfoXlK4V4K00zEy7a3/Xed2JdlqX
	ncpMShCjLPohpOhegtq+HaVifAso3A8Xn9FDApd4Nzta7VVktf5fCvQaGwaz8khprYq+Dzy3t9F0h
	hNEWe3EIz7Q+qQC7sBLSfyq2OPRQGQvRhi7x3lQx+la6fnwySkugMqp4YBc6pN1lSikhNSCGOmGOu
	5HnQTnkOVSKc9ClkY2tvDKjiO2KgpB910ad4ConEm4hmNNiZck4JFztQLluxqJTdwMVouFnH8a5bd
	o/CwIG3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy433-00000001C2I-3EYb;
	Thu, 05 Mar 2026 08:27:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy432-00000001C1q-1gDH;
	Thu, 05 Mar 2026 08:27:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C157761420;
	Thu,  5 Mar 2026 08:27:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18761C116C6;
	Thu,  5 Mar 2026 08:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772699227;
	bh=A05QtUqhcS2Bq8q0WVUQ/YHtuUYveSKDtR50Qqa1If8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZaQ36wdXD2N4N6cd0udiKvDdAgebDVHyP9Llku295/+WBMGtnxVh+jvJhGm+LhZCP
	 4sLJLNkJn1SrKZaJSYPnaF0JYwauw8BoBfm/09sypjY8GOk0sIwxt34voR7p1vM4hu
	 ynBaxj3Fl1GOoK/JrUKlYp8gxHMS8urguyVqjE7zDvlUZo3s2kvOI8+m0BRAg5y9HE
	 aBKDP9ftAv+OTXmHRWeC1xAEuDmV8MUXuftbQhn83UpALT45i9laWGf0yTcguQ7pvB
	 FjA3mIqJVnandYLDR7EqjrAOumYGUH5GD5axV561pd/iqwy7rrK/n6ygzrdnAlyX3s
	 wm9YJBwxZ8Fmw==
Date: Thu, 5 Mar 2026 09:27:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, sean.wang@mediatek.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: mediatek: Add Lenovo YOGA Tablet
 8/10
Message-ID: <20260305-fair-jasper-barracuda-5ae1e6@quoll>
References: <20260304192417.818211-1-akkun11.open@gmail.com>
 <20260304192417.818211-2-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260304192417.818211-2-akkun11.open@gmail.com>
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

On Thu, Mar 05, 2026 at 04:24:16AM +0900, Akari Tsuyukusa wrote:
> Add the "lenovo,blade" compatible string for the Lenovo YOGA Tablet 8/10
> family and add compatible strings for each board
> (B6000-F, B6000-H, B8000-F, B8000-H).
> 
> These tablets are based on the "blade" platform, featuring 1GB of RAM
> and powered by MediaTek MT8125 or MT8389 SoCs. Since these SoCs are
> tablet-oriented variants of the MT6589, they are grouped under the
> "mediatek,mt6589" compatible string.
> 
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index 382d0eb4d0af..69dbe389515c 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -44,6 +44,11 @@ properties:
>        - items:
>            - enum:
>                - fairphone,fp1
> +              - lenovo,b6000-f
> +              - lenovo,b6000-h
> +              - lenovo,b8000-f
> +              - lenovo,b8000-h

I don't see users of few of these. Also, explain in commit msg
differences between 'f' and 'h'.

Best regards,
Krzysztof



Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09C5C79F82
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2026 23:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0c3oGstG3xDxCXANdh3fAEvUFrpWDHb5nmqT1W/Ldvs=; b=eyc4/IZkqMlGRb7L3wc0leHLGE
	peSaYko0TM7NoeLh8ZH5qXSbtXs19ZavNvCwFGjYwki1eDh8640VfqhSnsIFQN+0P2Zr2I9Asmytm
	YJu3kJNvAK+bz033WGBrFrvDBknML3iWOgBuWmSFl1dm45/N02K/XQoQ/cmV1h4dOqYcTlBMMOubE
	feEs7L6Owf/DCEz27x3lqdw64gZNCtzDzSJ5NnG8YxmB9uw99Gy6ymVblqzmeQh/e2RMR0PllQ4BQ
	z4V0noBpF61CE9R1mS1ojvTYf8Zx4WAQCvPem3IHnMo5Q5DA+V8/0p2B5Q5P84xxCz9WIk6rgD6rK
	HCjAymlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2dl8-00000003UTm-2xzV;
	Fri, 04 Sep 2026 23:55:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2dl7-00000003UTU-0FLA;
	Fri, 04 Sep 2026 23:55:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 83DB1435FC;
	Fri,  4 Sep 2026 23:55:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91CF31F00A3D;
	Fri,  4 Sep 2026 23:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788566148;
	bh=0c3oGstG3xDxCXANdh3fAEvUFrpWDHb5nmqT1W/Ldvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l9lUpTGQg78X2IgeMY/eRTQmMCZ6ao7s1+afbEuxXWapwpHDJrA0jp/JvZnXsSeiJ
	 oS/l3ZJepGUQ/A9ARtwR89mGz1mbWu7+UiJnMmD3gtohKkwWSW1QaTDH0MFlQC7erw
	 cYbI25bTNd1ic3OFu8s5uHfMcq4zaR+rb5yA+/IJkDrrDLKmvXqjDL7Hu6fcZTR22U
	 P+9ibFxkOABgyDbXFEfu5uyiFKhRv7UtZj9AoCgcxqhjXHObMUuuZy5v44OnAgubPT
	 TB8dpYVq14yt98KsWXWWZl0cv4Pjci+PWJ94zdrlPq9K2npgf2jck/dySHPYhdcrui
	 AtB+7bK7kLNsw==
Date: Fri, 4 Sep 2026 18:55:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Udaya Kiran Challa <challauday369@gmail.com>
Cc: skhan@linuxfoundation.org, linux-kernel@vger.kernel.org,
	matthias.bgg@gmail.com, me@brighamcampbell.com, conor+dt@kernel.org,
	linux-mediatek@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org,
	krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5] dt-bindings: arm: mediatek: mediatek,g3dsys: Convert
 to DT schema
Message-ID: <178856614396.2615846.11646781132094655887.robh@kernel.org>
References: <20260822093829.46295-1-challauday369@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260822093829.46295-1-challauday369@gmail.com>
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


On Sat, 22 Aug 2026 15:08:29 +0530, Udaya Kiran Challa wrote:
> Convert the MediaTek G3D system controller devicetree binding
> from the legacy text format to DT schema.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
> ---
> Changelog:
> 
> Changes since v4:
> - Add Mediatek Soc maintainers in the send list
> 
> Link to v4:https://lore.kernel.org/all/20260326181726.64957-1-challauday369@gmail.com/
> 
> Changes since v3:
> - Fix $id path to match new location
> 
> Link to v3:https://lore.kernel.org/all/20260325181509.3430-1-challauday369@gmail.com/
> 
> Changes since v2:
> - Move binding to soc/mediatek directory
> - Rename file to mediatek,mt2701-g3dsys.yaml based on fallback compatible
> 
> Link to v2:https://lore.kernel.org/all/20260323180616.23333-1-challauday369@gmail.com/
> 
> Changes since v1:
> - Drop redundant description for reg
> - Drop redundant description for provider properties
> 
> Link to v1:https://lore.kernel.org/all/20260315080302.454233-1-challauday369@gmail.com/
> ---
>  .../bindings/arm/mediatek/mediatek,g3dsys.txt | 30 ----------
>  .../soc/mediatek/mediatek,mt2701-g3dsys.yaml  | 58 +++++++++++++++++++
>  2 files changed, 58 insertions(+), 30 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,g3dsys.txt
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,mt2701-g3dsys.yaml
> 

Applied, thanks!



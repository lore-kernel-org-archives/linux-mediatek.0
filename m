Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC74DECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 12:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ZPlZ3IKW+SnzgZAKI2K/vGkuaFxUObD4KGkTfSqY0Q=; b=eIn7O7AvS/TKE+s8Cj+9k6dYTt
	GuP1tZlJteZxnE6AJkSXY51QYo4Orf6A7L5vRn/8bqiRZNbBv50nztN8Vy47/70LCidwpAjlw6o3+
	4NqKxdLISHEBt3RM9JaSPDL9CvnHoi2tN8U5Au00ORG2w7XAsdarsOwiR81Dr6p+k0jow/GJzOSFa
	xPm3ft8QV6klawsglCd+Sx1MaDjy8tK2KVsq/ZlHIYL1wvTI/sD6mWyxkX8sVgix94f4+EbgN4ahr
	qLyzcCrvwdwh59k5kXj2+wo35bk4GZRNjYgbybusm/0t66N1PZx+qvLscOB1JhPJJLWGFxIvULPYZ
	TUryzoGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omww0-001XuZ-RD; Mon, 24 Oct 2022 12:52:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omwvD-001XWC-Ar; Mon, 24 Oct 2022 12:51:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 69AE5612F3;
	Mon, 24 Oct 2022 12:51:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84E0DC433D6;
	Mon, 24 Oct 2022 12:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666615874;
	bh=4cT1AgEscL+bDejuGY6uubW9ABwIZGuR4hZ++Wp8v4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kq3W0qANSUbPg7Xp/RRLV7VbWyzUd4fFQfb2glXmct6bX6PIhetoQgY85xKNVeA+J
	 G6jvtiH0AxGM35AE0jkcMeu8B3ip0EwROrkAQfDl6VVWPpT19T544nwG7qFVCop0VI
	 HDNSyETZfrbbhPwwU7JyS7whFHvKU4rqL4Qy4qZsH6Z9upRjNew40drv8HnH1wbgMW
	 I/bZPHsz9Gi23tSc8LlxSOnHWY6O4v9KT3nTwLO3zW6yfkolKWKQwH4wnwT3LBcdsn
	 W+D1mLFp2BV/5+TXP/f9FolibKs2KNirfCEyZNpHUj20JdWj8iYfZvGEUe+miHsp/n
	 ip4jPJQHClUqA==
Date: Mon, 24 Oct 2022 13:51:07 +0100
From: Lee Jones <lee@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: mfd: mt6397: add binding for MT6357
Message-ID: <Y1aKOxGTNAsb2vgz@google.com>
References: <20221005-mt6357-support-v2-0-f17ba2d2d0a9@baylibre.com>
 <20221005-mt6357-support-v2-1-f17ba2d2d0a9@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221005-mt6357-support-v2-1-f17ba2d2d0a9@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_055115_459630_E7E42663 
X-CRM114-Status: GOOD (  16.36  )
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

On Wed, 05 Oct 2022, Alexandre Mergnat wrote:

> From: Fabien Parent <fparent@baylibre.com>
> 
> Add binding documentation for the MT6357 PMIC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/mfd/mt6397.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
> index 0088442efca1..518986c44880 100644
> --- a/Documentation/devicetree/bindings/mfd/mt6397.txt
> +++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
> @@ -21,6 +21,7 @@ Required properties:
>  compatible:
>  	"mediatek,mt6323" for PMIC MT6323
>  	"mediatek,mt6331" for PMIC MT6331 and MT6332
> +	"mediatek,mt6357" for PMIC MT6357
>  	"mediatek,mt6358" for PMIC MT6358 and MT6366
>  	"mediatek,mt6359" for PMIC MT6359
>  	"mediatek,mt6397" for PMIC MT6397

Let me know when it's safe to merge this.

-- 
Lee Jones [李琼斯]


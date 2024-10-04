Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB1B7CFA74C
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Oct 2024 06:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NomARK6jj8w0Iur+0K6aHu9g6VAe7Pzr+4RkTV4WOGQ=; b=OqWSmBRrsGC0VeIbbjBFmT9eP9
	VwV88L19cPHoB5QH4SxExkXt4XPl0dl0gFvi89p4XXc2DKo708Or+psAb4pX4H7gciFwqauKXWo+8
	UatTyljPUKZsgU3WOpFI70Z8fJBQOaqIh3QICgxrcSLmtDgkWsu5XUgG6bYLGLKyggcUOeqvHuI0v
	yaijLl9JYey59q+jHpelZ4jy/HvSHSiwj3aE7cF4SNOGmOlYopFeTNdSIbTn8XwYmqg6lllsWQ6L4
	OtLPMod5eGdqPQwcktcBWGwGfWnQxqb0dCl4dWEbRxhK1sppl6AW5vaAt6cixkU67DUn6GeZB1Cfh
	Gj7F1Kxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swc4j-0000000BA09-3JJS;
	Fri, 04 Oct 2024 06:46:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swc3T-0000000B9pc-0X5T;
	Fri, 04 Oct 2024 06:44:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 74CCD5C5B4A;
	Fri,  4 Oct 2024 06:44:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BFABC4CEC6;
	Fri,  4 Oct 2024 06:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728024286;
	bh=hRRsY7h9P+J+jzsOIjFTtgHQRBKWcW9QYy9H7fPvjcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sUqi5YL3lSKBvN4bjhPjS+SLBDZ8jGWDCmQWCxSq5AYi5UPM5Az9rmp9cPqiErdyX
	 YwBhNBSc6ypoVIdnemuqglSLoUv6OC7ZWhD5c4RQyXWUfxO57YRoeZFDXhGZpxdqtj
	 YX1YnhTV34zX5M5H/QKiSimqqAL/Zovhymfr6/pYrbRZgLxuT3gDsEtvvMLi6KCULi
	 SVXCkgHkzwTPAhTu1lcOPIYjInr9vyOLJNdjlUkFYnvW4hDEQYdE9wNXEwvp4mN4ZT
	 iFxy8fVbhBO2jzFqsGWFI3VqrJcihsm/b1GzF+cVTcnszDqOCmCHKyw10cIXp62cli
	 zhLwj3i2eHXaw==
Date: Fri, 4 Oct 2024 08:44:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Alexandre Mergnat <amergnat@baylibre.com>, 
	Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>, 
	Macpaul Lin <macpaul@gmail.com>, Chris-qj chen <chris-qj.chen@mediatek.com>, 
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: mfd: mediatek: mt6397: add adc,
 codec and regulators for mt6359
Message-ID: <cv7icg65qhq52purvfrvlns7akejmqzuqodoujrlgbq4o24jpn@krjzrb3rqmtb>
References: <20241004030148.13366-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241004030148.13366-1-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_234447_232884_5E3D14F2 
X-CRM114-Status: GOOD (  14.84  )
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

On Fri, Oct 04, 2024 at 11:01:47AM +0800, Macpaul Lin wrote:
> Since MT6359 PMIC has been added as one of the compatibles of
> "mediatek,mt6397.yaml", the sub-device node of "MT6359 PMIC AUXADC",
> "MT6359 Audio Codec"  and "MT6359 PMIC Regulators" should also be
> contained in this DT Schema as well.
> 
> This patch includes:
>  - add 'adc' property and $ref for 'mediatek,mt6359-auxadc'.
>  - add 'mt6359-regulator' to the compatibles of regulators.
>  - add 'mt6359-codec' to the compatibles of audio-codec.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  .../devicetree/bindings/mfd/mediatek,mt6397.yaml          | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> Changes for v2:
>  - Rebase on top of the DT schema conversion patch V8 (should be final version)
>    without adc, audio-codec, and regulator.
>    [1] https://lore.kernel.org/all/20241001104145.24054-3-macpaul.lin@mediatek.com/
>  - Add 'mt6359-codec' to the compatibles of 'audio-codec' property.
>    Please help to review it again.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



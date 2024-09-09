Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA94ECE579
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 16:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wq0IkV0Lv2pZtfXSh1BPu6k9p2NO+aTvValWcdqq3mQ=; b=Y/HlOu6eI19eT6jy459rTpcrVh
	09l+rS3X8fqOrs4USPlC45IHI/hCGmongI9IHM7lHbeYaPCPSQidPDCLJaceSU4ZnQ9DBjFbdRFit
	Pminycqa/5K/DUksa8oyPmbqrRi8pFMp/Rpq5LOFQIxyBpkXS8Amn4Tw/wmAPz/3eLE37gEHUJ6fL
	30730X6oE44Ra4ri/dbmv2mbdxnqeNlOYLQeFEfQUeYH6oHxXAoF/lILYEGdS4vbnrqElGLeKznWb
	PSHP1y27FrwVl7qvryTjRyeBIQzzw2D1Bda74rNX/j4t+p50llGj5LjqoN4VM1HnXoNf4o63fVuhw
	XJTV5vug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snhAh-00000002dUj-2NFi;
	Mon, 09 Sep 2024 16:23:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snh0D-00000002bs8-3dhc;
	Mon, 09 Sep 2024 16:12:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 78AC75C00A4;
	Mon,  9 Sep 2024 16:12:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A6E7C4CECF;
	Mon,  9 Sep 2024 16:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725898352;
	bh=OtOcI4mwE4jLt6DU3HeKv4GZ8kD7yTDwnouuHDCYPhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H9ieu6t0DxInHvwEGyZjzDRyo24HMrpacur192BO207ZdU9YWj1udgNu7cJFa8b9i
	 Ev1k7lkUnUFmKN53YsjzA8BnUitV9kzpBO0+D/hXfnfxUJU8dpctJ1YgYyO44Maf1X
	 gSd20JtTod/qAK6lLGN+wY8oM5Xu2/Hu72gGqkLQT9rKa4w9ppVaN2ryPGHNlqtiot
	 i+3Knzp5KaBXHksKxizNCjpuFbFk4twpqPUsIL1M+O6wolbnK883UCWjyCeTt/f7nW
	 G2u0mIPvy0fvG+q1/fHBzzM014RkCCwgtbtf50Vwneync30s7woRtMM/lgSF8iLElE
	 ZLGokkxxoDlHA==
Date: Mon, 9 Sep 2024 11:12:31 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Fei Shao <fshao@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <fparent@baylibre.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-mediatek@lists.infradead.org,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	MandyJH Liu <mandyjh.liu@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 07/13] dt-bindings: power: mediatek: Add another nested
 power-domain layer
Message-ID: <172589835005.306979.15596103474181849299.robh@kernel.org>
References: <20240909111535.528624-1-fshao@chromium.org>
 <20240909111535.528624-8-fshao@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909111535.528624-8-fshao@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_091233_989864_2DCAA110 
X-CRM114-Status: GOOD (  11.57  )
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


On Mon, 09 Sep 2024 19:14:20 +0800, Fei Shao wrote:
> The MT8188 SoC has a more in-depth power-domain tree, and the
> CHECK_DTBS=y check could fail because the current MediaTek power
> dt-binding is insufficient to cover its CAM_SUBA and CAM_SUBB
> sub-domains.
> 
> Add one more nested power-domain layer to pass the check.
> 
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
> 
>  .../devicetree/bindings/power/mediatek,power-controller.yaml  | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



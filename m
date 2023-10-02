Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C2BE748F0
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 16:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IWeqoseHigeDD0I7A77bR5hqw/yONRLFUNmHT2k98Kk=; b=S/gjSCxVx/xJnMjPro8ff9OZuf
	g64Vu5YIgPpwEXy8cmtVtIQ4GU9Qhjj064LM9iV6nnmu6Kgge6kEiYAjRH5ImpZr/bRUdeRuTKLur
	LZR+fdtvS38AYz9NF9TEeRvHCoYcMIBwVjymS7e0JQZLm+4AlHGs31RFQbcqfxxVuTs0z/lDDSZF8
	ZEdEswJAsaXBvSNawYY8/wqHaIm74GPGvj1cM2ezS7mtMIJtIEUO0CymJV6k9IPqIEuaNpY2msXfY
	69HXT2O7kvQpl3Z2nHP1/3JNZSWbPJCx4MQRHhexxrCbGkDvqg2mZfbY9imAZLOU1QO+njZQpI+3Y
	Gxb1im0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnLa6-00D3V2-2o;
	Mon, 02 Oct 2023 16:15:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnLa2-00D3TO-0b;
	Mon, 02 Oct 2023 16:15:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8342960C76;
	Mon,  2 Oct 2023 16:15:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07FBCC433C8;
	Mon,  2 Oct 2023 16:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696263333;
	bh=AhZPFxKw6JIAmar3BTlp6KAFMwqOxLDxCPhW4rygFww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QrbkQazhVsQR0aAe2Xv3ul3hzgSf1cGt0FJwjroCzNjjAz1l1znBYWl1XOJo96pN0
	 idDJth42GnDGl/dVKBqf+DP0S0Oh3LjO7pTXHivmWOQmWf+ZxuP60GfIBJawDF8AF3
	 K6wxLOnFNcSmnQNwR1seQdWlkDmZXghcgF+PlcU5pxI70NrTTZ4qkbspQXz0Qk1+vy
	 Al07ycPBfUFS6Nkb5Ixzkp2CmhiXWKG1c1XAqzgALMjZKpaPypirr3C00axU1yENrm
	 qmYBDJoUcK6Ab2TARJQt4NfGGHc0dS42ZcI3dnsK8YM6xRayV81iOiCjPzYBBX94QG
	 +AZpN55EcW4ow==
Received: (nullmailer pid 1883864 invoked by uid 1000);
	Mon, 02 Oct 2023 16:15:31 -0000
Date: Mon, 2 Oct 2023 11:15:31 -0500
From: Rob Herring <robh@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Lee Jones <lee@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 03/12] regulator: dt-bindings: mt6358: Add
 regulator-allowed-modes property
Message-ID: <169626333046.1883804.1497786674123702405.robh@kernel.org>
References: <20230928085537.3246669-1-wenst@chromium.org>
 <20230928085537.3246669-4-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230928085537.3246669-4-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_091534_273327_85D34A51 
X-CRM114-Status: GOOD (  18.63  )
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


On Thu, 28 Sep 2023 16:55:26 +0800, Chen-Yu Tsai wrote:
> The MT6358 PMIC allows changing operating modes for the buck regulators,
> but not the LDOs. Existing device trees and the Linux implementation
> already utilize this through the standard regulator-allowed-modes
> property.
> 
> The values currently used in existing device trees are simply raw
> numbers. The values in the Linux driver are matching numbers defined
> with macros denoting the two supported modes. Turns out these two
> modes are common across parts of the larger MT63xx PMIC family. The
> MT6397 regulator binding already has macros for the two modes, with
> matching numbers.
> 
> Codify the supported values for regulator-allowed-modes for the MT6358
> in the device tree binding: 0 and 1 are supported for buck regulators,
> and the property should not be present for LDO regulators. Users should
> use the dt-bindings/regulator/mediatek,mt6397-regulator.h header for
> the macros, instead of using raw numbers.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v3:
> - adapt to ldo_vxo22 and ldo_vusb movement to properties
> 
> Changes since v2:
> - new patch
> 
>  .../regulator/mediatek,mt6358-regulator.yaml  | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>



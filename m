Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4219ECF31AE
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 09:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m++tfcZZCVoXQgPzlhypGh8obxOwV7QUnuJyUKOR9ns=; b=XyOR4l8CcUoxnPD3ADcCjPw3kH
	7JmZPPi/K600N0M0j3baKhCaDuSoBiDU9v2qtBBDWadMt4XpCBAGrusaKlaWKa/skRz/hJpjp1B7H
	ShW2ddKFkuaf94nhWYc14EoNHp6GCLdiO4zK1AwvGVbYP1HNbJ2mC/kj1hJleNu2Q1qAjxiugJeoV
	xGGhtfuUWGN8fHABlTrKNRQ+ht4c79N+j1gfQeDZ9XxWlg7CNcjTqHXWrLCUSjwKtMbSJAOf7wOAW
	JyGQ9XixVlVwCHQ79Xb32/ia9O+Fd1DPqr0t8uDNwbsvv7KzilyL1ak7yXlD/V/hduEwAnSr3ccrh
	Kn7rzymA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svvwT-00000005NuP-1NP0;
	Wed, 02 Oct 2024 09:46:45 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svvji-00000005Lgb-0Ucc;
	Wed, 02 Oct 2024 09:33:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727861612;
	bh=e5TK+I2oYnRQG4QdX0P6mxvv+kjLwPutRBAWCgBesyE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MatshYVfvsWvV9NCcvudL3wcnCVSEBGb2qkDzT1GgoiU3QgcMwoUdxnTfmE0B8Zkg
	 ZCVMU6W2zmQaxrb7nI8EFAm3boc0wgbzBmSe/FMVfw/xAQFpLvP3JruJqQggvGA91y
	 oOYoQfspy2NkY0idvMVQybdBPlD6xwKGLGBPCCdTeoIWPzGlJkN+5/AU6NSE6zBY1e
	 ZwidbPatIyVbX7n7sCFqoPoxBTLEhmfZWki6a5/iswuUu4QDmLFSmETYoo2eQq/Tam
	 uYeG2EMcNFF8XRGc0wvJxJp25r0iHq6tY2zcBiUxQxzU/fpGe26tqzmIuIxDH/V1Cw
	 ZglBmu28SLmoQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6EA2317E1270;
	Wed,  2 Oct 2024 11:33:32 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Pablo Sun <pablo.sun@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20240912070624.25540-1-pablo.sun@mediatek.com>
References: <20240912070624.25540-1-pablo.sun@mediatek.com>
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8395-genio-1200-evk: Enable
 GPU
Message-Id: <172786161239.39477.15429063817774681723.b4-ty@collabora.com>
Date: Wed, 02 Oct 2024 11:33:32 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_023334_427778_FF055050 
X-CRM114-Status: UNSURE (   8.78  )
X-CRM114-Notice: Please train this message.
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

On Thu, 12 Sep 2024 15:06:24 +0800, Pablo Sun wrote:
> Enable the Mali Valhall GPU on Genio 1200 EVK by providing regulator
> supply settingsi to gpu and mfg1, and enable the GPU node.
> 
> In addition, set the GPU related regulator voltage range:
> 
> 1. Set the recommended input voltage range of DVDD_GPU to (0.546V-0.787V),
>    based on Table 5-3 of MT8395 Application Processor Datasheet.
>    The regulator mt6315_7_vbuck1("Vgpu") connects to the DVDD_GPU input.
>    Note that the minimum voltage in SoC eFuse data, which is read by
>    MTK-SVS to adjust the regulator voltage, does not go below
>    the recommended operating voltage in the datasheet.
> 
> [...]

Applied to v6.12-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8395-genio-1200-evk: Enable GPU
      https://git.kernel.org/mediatek/c/a0fc74a4

Cheers,
Angelo




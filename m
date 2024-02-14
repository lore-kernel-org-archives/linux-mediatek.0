Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45EA1C48BEB
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Feb 2024 09:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oAhUVK24LxHpiC5ZANvk/ehlC39I8yphWBKqRbAs4ns=; b=LnPOHZORd6TAq2YW7ajePiauBL
	/vNsoXC2NjQyIxWJBlSBwvNjA7CqKv+raqVcoI/jhvw7e3A1gFdLkktAVh6nnlLWpkRSdZggIpYEF
	YEa3Pk6UOXAUZTujsMjvcbI1/n3sqZqa+QhLIGsHI0Bx7/fVBtbBOsB7BMU7NYfgpE4Pz6uyIq0Ak
	iS389WXbrxejxsKZ8AGVbZ/kPyc+0Jbh6LUorYa2XPWhvjyolM0F2s2bVVSaV6/xBUEdKGxqyyVLf
	ps1lLXt5r+v0/CnXNvBcUrAWjrx19ctAS70rv3jRu7AwOSIZUv9HHSasVCAVUHZNiVQCHUE+ea4Wm
	rpMoJcrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raBB6-0000000CD3z-3NdZ;
	Wed, 14 Feb 2024 09:03:40 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raBAy-0000000CD04-0KE0;
	Wed, 14 Feb 2024 09:03:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707901410;
	bh=E4Fif1h9LAA837algbblMC/VbtR1NPcDBXt52yRm3WQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=r3X8VTjjoFJUcBdiXZ0v6uttY6TAs5Xt4/Ya0lWRAaqEmQ3u9e1RmD2eNiZ4I4h6m
	 yB3BhPiRh3G1sOWARcawu3l8fQp/URU71ShBah7Bw44g7bT6W9rgYQmEW+X/i9RhHS
	 r/q2AJYbvhP21Zx4Ci8vc9labXo96H8JIiFcCezw5zrf02EaN1ChS+dcHaG+g6RM2z
	 EWWpUuWsxYPGZ9lFUKo4aGZWS2evYlR+WjcZ6a8kCeiyyRYlBkUtm8RDtpzuQCTor8
	 7I3sd/byrRT5b/y98KLu0h5sjsofgI8wbGTcfMq33I6tzy8hPGGu4isOHSqkeydP6x
	 axSIHwXWLwr8A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E01DA3782075;
	Wed, 14 Feb 2024 09:03:28 +0000 (UTC)
Message-ID: <c8878258-9f3b-4e2f-a022-3bd43bcfd02e@collabora.com>
Date: Wed, 14 Feb 2024 10:03:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: mediatek: mt8186: Add missing clocks
 to ssusb power domains
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Eugen Hristev <eugen.hristev@collabora.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>, kernel@collabora.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240213-mt8186-ssusb-domain-clk-fix-v2-0-1f981d35f3fd@collabora.com>
 <20240213-mt8186-ssusb-domain-clk-fix-v2-1-1f981d35f3fd@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240213-mt8186-ssusb-domain-clk-fix-v2-1-1f981d35f3fd@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_010332_272094_5516FADD 
X-CRM114-Status: GOOD (  12.36  )
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

Il 13/02/24 16:02, Nícolas F. R. A. Prado ha scritto:
> The ssusb power domains currently don't list any clocks, despite
> depending on some, and thus rely on the bootloader leaving the required
> clocks on in order to work.
> 
> When booting with the upstream arm64 defconfig, the power domain
> controller will defer probe until modules have loaded since it has an
> indirect dependency on CONFIG_MTK_CMDQ, which is configured as a module.
> However at the point where modules are loaded, unused clocks are also
> disabled, causing the ssusb domains to fail to be enabled and
> consequently the controller to fail probe:
> 
> mtk-power-controller 10006000.syscon:power-controller: /soc/syscon@10006000/power-controller/power-domain@4: failed to power on domain: -110
> mtk-power-controller: probe of 10006000.syscon:power-controller failed with error -110
> 
> Add the missing clocks for the ssusb power domains so that they can
> successfully probe without relying on the bootloader state.
> 
> Fixes: d9e43c1e7a38 ("arm64: dts: mt8186: Add power domains controller")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



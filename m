Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB541E7718B
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jan 2025 10:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ExvOa/A06b3pj7qPi57FwVToE4MwmM1rQecSaAO2J5M=; b=Lxtr20j6+vVmK246dr7HIKXu8K
	CCgqKaJvbaTCoQaZ7vJhD2HKJQYxGp7SyvQ6kAQq0Wb86UXlzQovT0jlW36XRx7TbU8g2Lma2XT9X
	m0bVitdCwFOtW8kQYrTEtJ9q4hPyEUJNkYcDkmKhf9gzMWgJ23R9VMhXbzwWhKSjY+UsDUhcGNEXk
	3JVb8XMLX2oTbbezvVS+G7L+t3SQk8Ngf7WTk9m3lIRSnW0ppqW6pbIq2403cYz0Eo8m4HFoRtzp8
	xGSI81aG+A9j25dCx3yrOTq4STM5kSxkzlOBVcNCfpoRpgkHKLx6bnuRV9aN0OUGMVEjx5PL1cldp
	SlQrG4Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTIac-0000000AAfd-3DPa;
	Thu, 02 Jan 2025 10:38:06 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTISB-0000000A95H-3xJn;
	Thu, 02 Jan 2025 10:29:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1735813762;
	bh=Ui5Ax6l8RhcBEr+KDx7Y4gphne3ZIzmcVAcKme4QbaQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lnDjH4e49m8sL1pxJma4tV+WV36PeaCESERSgKFzZ3vdQMEN9zzML5rdbDRyg/eST
	 9ct3oa0EUyVQDfdp/Q1IG7Q+gngQiatZsaNQAsMuFgoRUwXZzpmvVjEC6g4h0UJ7Mx
	 hNlu7cbv9eNvpih8yHi1beLLwFKTpLdCcTx4sJ3j8zrqS0qnKvQxkk/B4CfGFf3dEA
	 mft19HRNPjMgfjG/bx8NYctNzd9hv5poQEcZ10r1Hu3xBYcy9TaWhrDCwcBWzo1Jfr
	 fIaiQqKA5HJn5O+FNi9pivNFs75XYXnB6kQBwAwhffXZvNNIjWcKioR0uMAtpdmLXS
	 y+mBUYcmX+j5Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A4B8317E1554;
	Thu,  2 Jan 2025 11:29:21 +0100 (CET)
Message-ID: <5a4db8a5-82fa-4feb-bc2e-c78d9e1c88e2@collabora.com>
Date: Thu, 2 Jan 2025 11:29:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] mt6779-keypad: fix compatibles and add to mt8516
To: Val Packett <val@packett.cool>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Fabien Parent <fparent@baylibre.com>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241225192631.25017-1-val@packett.cool>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241225192631.25017-1-val@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_022924_138842_FFDA64C6 
X-CRM114-Status: GOOD (  13.50  )
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

Il 25/12/24 20:26, Val Packett ha scritto:
> The mt8516 patch was previously sent in another series but rejected due
> to not using an mt8516 specific compatible - which the other usages
> of this driver (mt8183 and mt8365) weren't doing either.
> 
> It's only fair to add the SoC-specific compatibles to all of them then :)
> 

Nice!!

Whole series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> Val Packett (3):
>    dt-bindings: mediatek,mt6779-keypad: add more compatibles
>    arm64: dts: mediatek: add per-SoC compatibles for keypad nodes
>    arm64: dts: mediatek: mt8516: add keypad node
> 
>   .../bindings/input/mediatek,mt6779-keypad.yaml        |  3 +++
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi              |  3 ++-
>   arch/arm64/boot/dts/mediatek/mt8365.dtsi              |  3 ++-
>   arch/arm64/boot/dts/mediatek/mt8516.dtsi              | 11 +++++++++++
>   4 files changed, 18 insertions(+), 2 deletions(-)
> 



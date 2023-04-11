Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6741EC76196
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 08:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zVU7UnNtqVd7hpTIZKHYfg6Z/XK/zszHk7jI/84DChk=; b=e9t7mcGAZMFuTWUlTtUW0L7R4h
	EQzXQEqkTvYtNposQzJkOKNAdoCYjUoERd1NhmaOaUGMNsOvtkC2VJ2xSlv8YAxXe1UenRVHxWTqw
	fbOBHV1OlMXZNv5r3Nqly+VTg7AiyxIl6KZgPqkiLTmx/PnlWTEOQL1l/xHK4i8bT9N2I7BOQ2UdN
	GjqlrJd9aYzQyLkJP17StxomzzTbinYC2ybwYyWBDe1+MrkyJ6dhEvZH6+8vcMF24MUgMRC9gD92s
	qPdqdE56KwSA+icfcv9aQAyZCo2dD+Yu92cso/0AmMcNJFRUoedCzohAZdgZrD7o+932zqWuRCPXJ
	+zDFOu3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9KN-00GrvJ-0V;
	Tue, 11 Apr 2023 08:26:11 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9KJ-00GrtN-2r;
	Tue, 11 Apr 2023 08:26:09 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0A4E666031E2;
	Tue, 11 Apr 2023 09:26:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681201566;
	bh=XuOTH3cHEPlON9QnLhoyvLswIctTTjWgzKO4CZvmkes=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Edc9DbRKhBpaEXqrP8ICK2TJ3Y89+56BkJ8a1lCfkCbZpa9B0R9uYWVXktu8RLQDK
	 X17rYU65MQHvone0pf9E2HEI9fxeasyxrS2wITpgxpDuVOOPYSLJj76Fwv7zqCcgyx
	 HrmIU+Bd7nhVlQAJt5I8pNTQOVG1omkYnORVzx9bto6sGUaf++Rv4CTsiKtMn6LRXr
	 MdbSOYlPHLFIhD8zvUNaBNOfAGMM0JrJ4AxRvdHCt4xzwHiJLH69OWDBvMYIpTJ6Bi
	 AUUgSFLNqUa0Z3jMmOX6s+fcTIs1yVsCqmNpspKGhB+ZWWvhJJlb7mDjfmzcD14fJo
	 5KzBrgxXllVbg==
Message-ID: <a62c279e-80be-9450-5891-74b4b3994dd8@collabora.com>
Date: Tue, 11 Apr 2023 10:26:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3 1/7] arm64: dts: mediatek: add mmsys support for mt8365
 SoC
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, Yong Wu
 <yong.wu@mediatek.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230207-iommu-support-v3-0-97e19ad4e85d@baylibre.com>
 <20230207-iommu-support-v3-1-97e19ad4e85d@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230207-iommu-support-v3-1-97e19ad4e85d@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_012608_049999_8BF06B5A 
X-CRM114-Status: UNSURE (   7.90  )
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

Il 07/04/23 11:34, Alexandre Mergnat ha scritto:
> Multimedia subsystem (MMsys) contains multimedia controller, Multimedia
> Data Path v2.0 (MDP 2.0) and Display (DISP). The multimedia controller
> includes bus fabric control, Smart Memory Interface (SMI) control,
> memory access second-level arbiter, and multimedia configuration. It
> plays the key role in handling different handshakings between infra
> subsystem, video subsystem, image subsystem and G3D subsystem.
> 
> For more detail, ask Mediatek for the MT8365 AIoT application processor
> functional specification.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



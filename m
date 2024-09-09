Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D580ECE579
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 11:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+LcjTqJ1NfzSwokjTt+H36g8KhvlqfLjaAxBzMMxI8=; b=xic1S2ulBtT2CA5V4qFa/kBq1y
	JPRjUz6aENDRYpwECVvDOZ63HeRYvMUYoGLrjaBiX5ngCtOecbd1iFv5uClxTm9SkCjJrxqcB5LZU
	eJyjMVmWKyDSb9cqIAXRxPaQKzd7nsW3s+UiWQcy8W0aTgok0XLyimC3edGacGgVz0wwRsVUysnxO
	7RGfV6uDgTMVMxPKPD6MqRXqJnrYx2syo+rLE/6Hn87Zn3k481gpz/m1REQ+86dVDQJI7MmnjSO2B
	/qAY2ZQhaygS/p/59L2bQbckplpnSFzxCJjF5EVd97nQ5ovpf9D0B1NRMB7RxJPpP9x3tsWqqzk5E
	rYrWF89Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sncrU-00000001jWu-0drx;
	Mon, 09 Sep 2024 11:47:16 +0000
Received: from a7-47.smtp-out.eu-west-1.amazonses.com ([54.240.7.47])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sncoT-00000001j4O-1P5j;
	Mon, 09 Sep 2024 11:45:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725882246;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=5h1cpryF4X32+0kSthzAIdsn9OIb6lI/YBijLBKiv84=;
	b=WZEDz6flt5zc6e1H+MfzCf0VzfUJif6uzxLxPeAbEIqAoD2grIQzhl0k8zo9w+Su
	QjkUXA2ATRJSi27q24vxAfnyJdi2aoZ2SWsVSwySptjYOUgjAUO5fH4LDsYivk04B9h
	oeUfsiPqUOuHw7C+/OUMnPtR/oopWKjSIdbT8MuVGq1cIWLuj03zA4liqnOmqhu+iEd
	DUDVJDPXv/YqDO5IhF3uG4m1WwJ4Uk+lTYlMt0VumUVlR5JuNCnswgjwDGA/zj8/KgT
	xt9KNdelTtevLlrUo5DSXVoaE8ihyinqBvvUESl7Kh4IdVGikgTDlBU6kPDjl58xagx
	PQIT9E9IWg==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725882246;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=5h1cpryF4X32+0kSthzAIdsn9OIb6lI/YBijLBKiv84=;
	b=aqfDUh0MY3otv0eaAQ0v+Ci0rK15hWc+qXQ6RTFFOpOdDx+KnE8iqPkEL1532j4b
	b1hnb5MXs1Dzrgxu3c7iuKmxQDk93TsC2zuQtDQNq/QY/FO+NKESdJae48AhRMCPsFf
	4/gA67ah9EkB65H7z8cVeXjWGM7g8bR2EvfKXhYg=
Message-ID: <01020191d6992288-f834e61d-ad1d-4de7-90b4-77525530532c-000000@eu-west-1.amazonses.com>
Date: Mon, 9 Sep 2024 11:44:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] arm64: dts: mt8183: Add i2c-scl-internal-delay-ns
To: Hsin-Te Yuan <yuanhsinte@chromium.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, 
	Enric Balletbo i Serra <eballetbo@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Daolong Zhu <jg_daolongzhu@mediatek.corp-partner.google.com>
References: <20240909-i2c-delay-v1-0-4b406617a5f5@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240909-i2c-delay-v1-0-4b406617a5f5@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.09-54.240.7.47
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_044409_546427_21E537B0 
X-CRM114-Status: UNSURE (   8.52  )
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

Il 09/09/24 09:29, Hsin-Te Yuan ha scritto:
> Add i2c-scl-internal-delay-ns for each device.
> 
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> ---
> Daolong Zhu (4):
>        arm64: dts: mt8183: fennel: add i2c2's i2c-scl-internal-delay-ns
>        arm64: dts: mt8183: burnet: add i2c2's i2c-scl-internal-delay-ns
>        arm64: dts: mt8183: cozmo: add i2c2's i2c-scl-internal-delay-ns
>        arm64: dts: mt8183: Damu: add i2c2's i2c-scl-internal-delay-ns
> 
>   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts  | 3 +++
>   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts   | 2 ++
>   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts    | 3 +++
>   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi | 3 +++
>   4 files changed, 11 insertions(+)
> ---
> base-commit: ee9a43b7cfe2d8a3520335fea7d8ce71b8cabd9d
> change-id: 20240909-i2c-delay-6d202918ee0f
> 
> Best regards,


For the entire series:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


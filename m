Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7228ACCD193
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Oct 2025 08:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5urZBlbYKiRMm07kFg+R1hqrauuoOVuRSlz3aO5QIQc=; b=4LMjtaTO5qcSt143x0lZHfjY3v
	XqCbnIrqhSwTtn3fQWDDjtBR12owCEzOkTfCt0KAmNSDeGfI/wjGj9f9tdtvG8L+mLNC9dfLzj0Gz
	6fDeA9yteJ2tV8/1gzML4dxV7Y3NIibEAhUgz2iTXYJNYjXyZ6SxbTCowF7euv3rQnoBApN3Ls+t/
	W4ttPh5sT135r/tygS6oeenXyknq6TLznJjNySRTJOaj5DHAYtt6ED1G9toBEQT64qaLoTjl/TS5v
	QV7lQM8OLETEbZtgbYNSVJBc6jT2TAAfAnXt64jopqt21lRLsQBhP4JDRPWn8Z/PW98spBsnpZgH+
	qWA0mr9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8xM1-000000011r3-25qo;
	Wed, 15 Oct 2025 08:59:29 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8xLx-000000011o9-35Ys;
	Wed, 15 Oct 2025 08:59:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760518763;
	bh=XCOa6UKMhp1ANTY93PkNLWmuW4ZzjeRtQ3m+yYFujDQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fiHu5AEM86zk+RnqhjIILNMO66Za6N7CHFpcg1o4H5JZ70pcbus27J6Hk7uv1BV0r
	 pdK+20Ruz9ynZp9ZviI7augpG2ZJk2avc1+DiwyC2dYrrzHOPlx3VBod5e/NyNhusR
	 eJJ5DtlBV4KrutK2/E7ckvjnsMMF2U1b/e0vVb4/hSPWUTwGhR03M/S/Tqm7zNB8El
	 6LQjk/5UswIBswaDAaEZaiO2QflDq36Ibkv6VaSno5ZYSel72NsLp3lwZ/RI/werdw
	 oPT/D6rGLLskHGoFMOAIkn2FKeZZmyL5WGq7/lUjCCRiKFAdxX47tccjXhiBxxmTSJ
	 gBXIwzR7Lg2vg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CE5B017E12EB;
	Wed, 15 Oct 2025 10:59:22 +0200 (CEST)
Message-ID: <da324c96-2cba-46cf-af69-c9eaf7ea697f@collabora.com>
Date: Wed, 15 Oct 2025 10:59:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/5] pmdomain: mediatek: Add support for MFlexGraphics
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Chia-I Wu <olvaffe@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-hardening@vger.kernel.org, linux-pm@vger.kernel.org
References: <20251015-mt8196-gpufreq-v7-0-0a6435da2080@collabora.com>
 <20251015-mt8196-gpufreq-v7-5-0a6435da2080@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251015-mt8196-gpufreq-v7-5-0a6435da2080@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_015925_935793_BAB45453 
X-CRM114-Status: GOOD (  11.90  )
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

Il 15/10/25 10:50, Nicolas Frattaroli ha scritto:
> Various MediaTek SoCs use GPU integration silicon named "MFlexGraphics"
> by MediaTek. On the MT8196 and MT6991 SoCs, interacting with this
> integration silicon is required to power on the GPU.
> 
> This glue silicon is in the form of an embedded microcontroller running
> special-purpose firmware, which autonomously adjusts clocks and
> regulators.
> 
> Implement a driver, modelled as a pmdomain driver with a
> set_performance_state operation, to support these SoCs.
> 
> The driver also exposes the actual achieved clock rate, as read back
> from the MCU, as common clock framework clocks, by acting as a clock
> provider as well.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



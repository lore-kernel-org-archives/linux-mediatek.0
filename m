Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C578C6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 13:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tAe0mcUqb/LXK+olh2TOAUObQyDepgt18iTN8ixk8Eg=; b=F2eJgTfj3CQhGeVciDeZG70VBK
	n7+0nvqGz1MfYoVlKohIStadBmim6W36Khj02W5cVDFKHcAbGg/tX0yuzUtoGcEQu/2f0AhZmo15I
	d27rsT27icRd1ElDW6+iiH9D/OfKWW3jvL6KXUYO0Hq7UXVuyHZkOjn+UfhowLHzu7RaECqgFjyHg
	RKRx5gbeAl6rSwetirHazPX48xOC0LSGL777dADgii2vF8wc7lhgTLglRj15AruX4wWaxAzvs7Cdb
	oEkw6fvu1tFHWB5CQ7wv8QO3y2l+4PTzZQnyX39ggD6vwlWmTiePWMHwXtuj3Cc9hhRuxIoVqxmkG
	8nYrV2Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phVzR-000Qv6-0T;
	Wed, 29 Mar 2023 13:37:25 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phVzL-000Qrz-0Q;
	Wed, 29 Mar 2023 13:37:20 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 61FB06602EDC;
	Wed, 29 Mar 2023 14:37:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680097038;
	bh=Ram8hwcMQYU/0Y3uvt0yjRCZRpaM7nzONKbQLQWbWI0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YxYE7q5uwQClIQ45BtRf1pdYfW8Zl46PogBT6b/OH11BRek8KgSfA/3rLM7zTH4Pe
	 TurdfeZfAOGEMdwMHBEvCSJPezhk0F1GZuaqUDSzWEU9UBykpDP+r1IhmeZHrBfGXe
	 kW3kQGEvXusUmOF9/JRz/emFXlr35ml83WcvBeQ4iptHL2l7yF8Gkxvq6MFKByzNsz
	 X8DPKskSLCxV2sUCo3G2WL+fw6bn5/eXUml2VuMJHcOgOhHMq9nFnWjbDMx76BxITN
	 txvohPxxncgLuCtaTtxa7lDziir+RNDU3KkP0VFLTwOet2kl6DpT9iRonz2vzX8DgL
	 78NhHdv/TgD7Q==
Message-ID: <66432e8d-197e-f325-c935-b4076ebbd408@collabora.com>
Date: Wed, 29 Mar 2023 15:37:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RESEND 6/6] arm64: dts: mediatek: add iommu support for
 mt8365 SoC
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, Yong Wu
 <yong.wu@mediatek.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230207-iommu-support-v1-0-4a902f9aa412@baylibre.com>
 <20230207-iommu-support-v1-6-4a902f9aa412@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230207-iommu-support-v1-6-4a902f9aa412@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_063719_298688_AD6FFEC6 
X-CRM114-Status: UNSURE (   8.53  )
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

Il 29/03/23 11:52, Alexandre Mergnat ha scritto:
> Add iommu support in the SoC DTS using the 4 local arbiters (LARBs)
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>





Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1915C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 12:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h8q5X42S7Nu7zpJC78L9KwX/AjKKSwiiCDaGHPQtp08=; b=le3HVX6henitAMZ+rhcdb7abpv
	7rVEycuT2IVLMwdyH2djka/yidp3cnVTEPJJYdjVGoOndeA/5W4Pyju24LeBOixBmztTtUVNwMP0L
	nFSM04DLkVySmqmWq81bR+Y8deSBcL5/OaFVTI+R34afskERRipUE6OdPFsEexaXJ+upsLfvcMCbR
	hAUh9HAYfw2cnVhFjy7KulsxrSFZvLsmAW5BoC+mWTPgB93XH3uBS+JQrup+L9msMsi+WEpzaIytr
	5jxv9RsfDi17Z77fpLmO819Gjxt7iQlJ8pekoUMCLkCSG9fSHO5cYtwQXh3mFjC7CXxK1d1wJZGHh
	2/9ikzJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oByDN-00ELpg-CC; Thu, 14 Jul 2022 12:45:09 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBy4x-00EG3t-T4; Thu, 14 Jul 2022 12:36:29 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EEBE16601A3F;
	Thu, 14 Jul 2022 13:36:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657802186;
	bh=fcsVlf6xPjzt5yZzyb/7Pgp8srcKQ+iZoypPGWQLnpI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=B7VNKzC74eawIHUeNRTyXOmvtwhbg0XtsCGVXt8OjKqpnhveB0pWJUeCCW66bzZlv
	 5lquChQXuumBdUj6Y2KpkdaIR/CWqjKd/FfszSitYJjTngjWzoK97g26A218BvQwx3
	 UXkZSDDwxvDy/jQYp5uVPyLxfiilKoiNmJvzOvMTigVjhlyoxgDazhHAd5Pw8HM1Gh
	 +LBDYRzrCG4QItjnCf/QOTIBumdxFqwFHNxZuTwWpChCL2VK9byqSaBsiUptoqBMfN
	 MOp4UwwhrstyFnyv+wNLFR40buO2nOMhY4AHOJlhgRfp8tBR8hj4xUuX9+NbJNAMyd
	 KcLRCWCuos3HQ==
Message-ID: <54d573df-fa3c-b2d2-e470-c157ac06bcf3@collabora.com>
Date: Thu, 14 Jul 2022 14:36:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 02/19] dt-bindings: memory: mediatek: Update condition
 for mt8195 smi node
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lee Jones <lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
Cc: iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220714122837.20094-1-tinghan.shen@mediatek.com>
 <20220714122837.20094-3-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220714122837.20094-3-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_053628_126135_E876A015 
X-CRM114-Status: GOOD (  10.29  )
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

Il 14/07/22 14:28, Tinghan Shen ha scritto:
> The max clock items for the dts node with compatible
> 'mediatek,mt8195-smi-sub-common' should be 3.
> 
> However, the dtbs_check of such node will get following message,
> arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: smi@14010000: clock-names: ['apb', 'smi', 'gals0'] is too long
>           From schema: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> 
> It's because the 'mediatek,mt8195-smi-sub-common' compatible incorrectly
> matches the 'else' conditions for gen2 HW without gals.
> 
> Rewrite the 'else' condition to specifically identify the compatibles
> that utilizing gen2 HW without gals.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



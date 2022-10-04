Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E963EC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Oct 2022 08:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SStqlCjXpWU94DGUKv3wUXH/JMhW9f/ZwFXYahV+K48=; b=NPzul9MDXH5+l7h0EER7DTAJtG
	d9AcZS4FNacGEwRgdO3+IbkC4YByprUc29ct3K+ojdebMec03TRo080+C+ATW6qXWhL9myv9ya7z1
	4S3uXFNIWvaBPR40u3LLa6RRw/1pXgUGSzVEWRkClOidoIkgAcjngQxFVEJSZx+LBJJQTT+cpayZU
	dDOjoFcltJuG9Kl2+gwTG8fiQoIbR6bb/YA2k93Xreotjq1yI2Nyop1zsxGUDMLIrk9f4Q5kdCiGn
	OgJ9TCcCq1v7lQAoqNITPTsnORsKxntzvOljNDtYkp/mvSOG2HU11Cb3gHSnt52f/o11JpagplmYF
	FHOqN0og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofd9e-008uYM-Ft; Tue, 04 Oct 2022 08:19:54 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofd9F-008uOU-Ln; Tue, 04 Oct 2022 08:19:33 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 350216602297;
	Tue,  4 Oct 2022 09:19:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664871565;
	bh=zuBeNSQNFjp7cJXJ11wCTMTl/gSuKRPoQcw2VUDVsFY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T/NIJMvblrO0gNvNDkG18D0FiFp4qtd07nrK7Wab9jlQ5dBgErolEVbTZ8t6q9xEy
	 +LZLDmuKR+2TmqR/S2SUEaDCQi3szxhhfplKFvtvubLt8PwNqY6zSEnH9p0GJRh782
	 34wtqIOUw/P6W7jZ3AFvRIh6fOu6YY9MFsNz6NpyoVgAq5wpTrTPv63e7QS+R0sUAM
	 9s+frUP1ZKsXrrCPsxezcvqZfntgVTuEUAVydIXroAf6mHF8uICY79iIYPMfad8ror
	 FA3rOeLnFC1qAgvxSRNsLGVedUeI0Zn7ciY8TQTURYEYupG+R38nKPklaeTxh5Cfcy
	 Dg/4cSainwxQQ==
Message-ID: <adeff0b0-1a8c-58ba-ff03-4d550c3eb8e7@collabora.com>
Date: Tue, 4 Oct 2022 10:19:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 1/2] dt-bindings: power: Add MT8188 power domains
Content-Language: en-US
To: "Garmin.Chang" <Garmin.Chang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220928084315.29187-1-Garmin.Chang@mediatek.com>
 <20220928084315.29187-2-Garmin.Chang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220928084315.29187-2-Garmin.Chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_011932_293270_2A0C2E3A 
X-CRM114-Status: UNSURE (   7.78  )
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

Il 28/09/22 10:43, Garmin.Chang ha scritto:
> Add power domains dt-bindings for MT8188.
> 
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9E6C04A68
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jul 2022 11:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+5vNhxFYzvEzru/LHufNEKerRb/W3PQLtOJFARCDZkE=; b=G/3aJi0/CYrhc4zdG7yPzL1cGa
	A92idExOIt+IDjg4+5bizHolFc56hfoZJavPaM1D2EIttQoIJXZ+3PG1sBhz+5Aaw7mmLwSGftCLN
	QyDpTGFFWDcLJ0eqZUs9y50NXqhoFEXnjRjz7JfRiNIIHILPVV2pwadmebKR5/SQTjhwi4z//4DLt
	8S8qNsT3cONqlSSfSIeirE+ZtwJyMfsnQbspdIXQDsi5+gYXgdMmBlGT9EIZeFuP5/2XGdAKluolh
	D/zk3eh1qlX8lntfPqTlImGgFuLjrNnOAGpIH6a7ZoVLyL0DLxErbyC49ZDqP0vbLBAP6Yb2YB6pt
	j6YajNMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH1ia-008iul-Km; Thu, 28 Jul 2022 11:30:16 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH1iI-008ikH-Rd; Thu, 28 Jul 2022 11:30:00 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3071E6601B43;
	Thu, 28 Jul 2022 12:29:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1659007797;
	bh=hhjBVzceIN8XHpmgLlkXWe+ErK5AF7MI/o3gUfkyXSk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZFe6KNsATisv/bK5KgTYcFc8XHCWDf3gOFAy1lgkloYzL90CpT4hm4eIsier+HgeS
	 49pvozJ2iOsnP8fYEyx0UZ9VeSNTKGpSDbfDlJj7yK6Viu20iMbMQF7lRKG0UoEa26
	 w4KtWZw7jOjbcQpngyDRfkhPLM8x8pwNdKlAnY50sCYCBMXdsaP9Gc97NRBx5tGTa9
	 cV2ak2bHQWW+TyhobFM/SmK3FlIOCp1KOpqV0UqGVb9MJcL0H/6DbTUFvzhG2LETim
	 j2vtysvFcZFfT8UYYis3TrPPo7oIgVQNA9h1F3nPdIJK5h7hMaBQbeCfCbXSwC9gAr
	 iqYpjkclPJWbQ==
Message-ID: <27d4a2b2-9c0d-066d-92c5-1b7c760a1e9b@collabora.com>
Date: Thu, 28 Jul 2022 13:29:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] dt-bindings: soc: mediatek: pwrap: add compatible for
 mt8188
Content-Language: en-US
To: Sen Chu <sen.chu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Hui Liu <hui.liu@mediatek.com>
References: <20220726104242.24839-1-sen.chu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220726104242.24839-1-sen.chu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_042959_065145_F268CE3F 
X-CRM114-Status: UNSURE (   6.79  )
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

Il 26/07/22 12:42, Sen Chu ha scritto:
> Add dt-binding documentation of pwrap for Mediatek MT8188
> 
> Signed-off-by: Sen Chu <sen.chu@mediatek.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


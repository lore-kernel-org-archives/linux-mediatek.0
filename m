Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45587C61D85
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 10:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hzZT/wldxcKiW6XdfOj5oLkLASMJpOL46hAAX2ziO84=; b=r0lUt1sxlwjs+IvnzZ462alADz
	Wk+7CT45XuxgegyQlDtVbV5QQ6LW5OqEAbzJFjKCi19pn42dZlNRRp6qnS4mogLBonwXTzhp1RkjT
	+AFub1lLHHPZ1rQSnyl7lLEDDKR1SvqdrEWLjNfVB5k6Xm+/R5DQooh2/BPoJdfZFHERQ1pGJ41+6
	hCQDN1iwt+BmTE5tr8XlmGeoek+mezgx0miUzFLeXPVR2rfhzi3DTp/Qmdn9KIdVmsLaNTIj6F8TL
	Ljm8vUwy9Oqz2zjvRMAAv3GKdWwpjRp2zqpK1/WUxX/bOHCIE6pvidvmsPJU9mP3dtlAJx0Zg1/F1
	lBliMrmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r66zz-004OMh-0C;
	Thu, 23 Nov 2023 10:31:55 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r66zv-004OL5-1E;
	Thu, 23 Nov 2023 10:31:52 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A24EB6607377;
	Thu, 23 Nov 2023 10:31:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700735508;
	bh=6hK8m7VIhmrU2OJGm7DqqR0J2A9CMw+Ic7fnXiQSnqM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LYKDYOkDauP1JSYgbl4YafxYdpJ870lv3Xs+zMWVmSRBND7/sSmsl6L3MPq7A32fv
	 g7zYQOcdij5icyna5gCARfz2BSqtuVoH9xNvRyaYJvfCXX/uR6g6JxlI1bAthCbUPQ
	 +l4VNw6mts1Dve+cIpUBpHVL7N72Hs2QcElCptL/xu7arF6U+iEhafiXnnGPQqvU4i
	 LywVjxC+k6EPu6I1Bb6Xy3zsI/o+Ff9aBRnlT6pZS/tJ5P0BVc4zGhxG6U9m/tkCi2
	 /lFLTtqIriQv4vqmbXdY9uWapWu1cBI8ygQKR91AHOVH7Dvz273ZnpDfBy1VeYxYBH
	 grvObbhwTJXqg==
Message-ID: <5560ba13-e09c-4751-87f7-845d82199b45@collabora.com>
Date: Thu, 23 Nov 2023 11:31:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183-kukui-jacuzzi: fix dsi
 unnecessary cells properties
Content-Language: en-US
To: Eugen Hristev <eugen.hristev@collabora.com>,
 linux-mediatek@lists.infradead.org
Cc: krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 matthias.bgg@gmail.com, kernel@collabora.com, hsinyi@chromium.org
References: <20230814071053.5459-1-eugen.hristev@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230814071053.5459-1-eugen.hristev@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_023151_548437_2D847F88 
X-CRM114-Status: UNSURE (   8.44  )
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

Il 14/08/23 09:10, Eugen Hristev ha scritto:
> dtbs_check throws a warning at the dsi node:
> Warning (avoid_unnecessary_addr_size): /soc/dsi@14014000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
> 
> Other DTS have a panel child node with a reg, so the parent dtsi
> must have the address-cells and size-cells, however this specific DT
> has the panel removed, but not the cells, hence the warning above.
> 
> If panel is deleted then the cells must also be deleted since they are
> tied together, as the child node in this DT does not have a reg.
> 
> Fixes: cabc71b08eb5 ("arm64: dts: mt8183: Add kukui-jacuzzi-damu board")
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



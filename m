Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3C5C43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2026 16:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QnP6PNd6WRyB7kPJNMlC4SXl7tyK1hr7ex9BOdYMSdI=; b=YzQKweh8Usj6dZsJ13djHgJtn1
	lpH4vYih6DgwjFG2rQRs7ccKNjU+bBi65Qe7wqJqOKOCdHz1693gFwyX52YVxvltpIKmM9pSy3VHk
	0EcqK5sXVBCkBKXo1TiGGn9WLH43GUiK0QlBqMEXfkMac7xXeazVWYAyfDnjrd9fhT3zg1le6qpA4
	3ivnOfNZBaTHMOSTfywt/AjQpx/Kwu6uFKM9N6m3aL708Mp+Gpfeu2KSRO2h3P2Nj7cVMDzT8xaS6
	iIegja863/+n21y0AZsbzcVEpoqyn0pcbOFly4hOS2zs2DaUQHX6oldnOb7ZVcdVFIDi/6Acv1Z2k
	b1nbn22w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyDb-00000002ciY-1gtX;
	Wed, 01 Jul 2026 16:55:23 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyDY-00000002cgW-0WOe;
	Wed, 01 Jul 2026 16:55:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782924917;
	bh=cmD1OfhdgkZYg7FYTHmyqOWvRC0DoAw418/B4w7hUhk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D+AH1r5GH9ujUL8tJqGzluGTZjxMS5fgy+Mx3d5Wu0EpUIXgHUujv9ZVhrFxkM6ZA
	 OyP2X/uPDUMjVzm7v7F/V62Kg8F1/YZxXJgUldYQFPlnin6R8UlmhQjiLNkXFrKBUw
	 aX/lPqElceZtAcp8QH7GXZm97tZMh+MSlyLSX/As7EZ5n4YS19uFtpGRLoYFDRRr52
	 NXZ8t5eawRotF76S4FBDym7zg3EKOfiXPrj9mzfFfY5fp4FUKRCEakEyEh3WWugxTl
	 9k20ZxuPuRnVqca5w4ndppDaXLKXv9R+t3BSFWcmigiQqK4nb3bH8XlNWlpG5cV0SB
	 3Bkths3eO1adQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4B9AE17E0521;
	Wed,  1 Jul 2026 18:55:17 +0200 (CEST)
Message-ID: <672ed995-7386-457a-a013-9816ed413057@collabora.com>
Date: Wed, 1 Jul 2026 18:55:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: phy: mediatek,tphy: Add support for MT8189
 SoC
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260701-mt8189-dt-bindings-tphy-v1-1-5848a2be8303@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260701-mt8189-dt-bindings-tphy-v1-1-5848a2be8303@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_095520_505617_E11DD782 
X-CRM114-Status: UNSURE (   5.56  )
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

On 7/1/26 17:36, Louis-Alexis Eyraud wrote:
> Add a compatible string for the MediaTek MT8189 SoC, that integrates a
> MediaTek generic T-PHY version 3.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



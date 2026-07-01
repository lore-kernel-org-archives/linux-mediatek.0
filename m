Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8FAC43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2026 16:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X7TuWzQIOjHmKT1FMT38CFoTAWhpdlYqwhXo8zCWcfM=; b=s8H8G+veM/SdHuVYolU4TFix2N
	RtFv/v4Dn3OyS4Fe23fR/lFs1qI2S2vjPPtNl19xQKIwcLZBWZ7bxR+L1Nm4hNvCha6PbUMRu2qnd
	m73rZtDf5ZL0J3pLFwCyHi6/EyfpjYz890MadLU4PTiv0LvM35U68VekdavZcSePly2TaGAdlujGL
	gCk6hCgIjiSF1T+/i2p9LTPG9SXlQH43XLAgu31vWwMSAXqFkJt91JmTkneg3RlEjXvBS/9AEjZee
	qYvidmvJa445S4YlansBB6dxiqVS9NzMowU/8kzxlHNIE5ZpUuvy/rmslvlY1ifhTBwwdm+VvzXV8
	4gma8JYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyDz-00000002cy6-04DX;
	Wed, 01 Jul 2026 16:55:47 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyDw-00000002cwE-2fiX;
	Wed, 01 Jul 2026 16:55:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782924942;
	bh=ptNn3aFC0Z+kps7/VxGR0POA/bIx4QVuPCUXJBIkA9I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dCCUYnbzdnzmG9GsYI9cLJNK2ZX7jWuWnAOnj716NZ2qSXiuT1NkPiTDBuB2gUJpw
	 VH497QKq2u61vTlBar/l40NhfE9ooX63W8V1q2Zs4Obc6A1mNaCyPvehBUcj48wwA4
	 OmBrbJgRSS4xDbS8mRYqvFISXebiJZ3WeBbNIfAtkbT63wg/KOJDduyuE4pR5WAhAW
	 V5F5sscuyXEY9RxDeTv+4ElXwbGaIsEA8Y/SnH/vkMVGG+U1gMiby8G6jFA5SX8gZf
	 K/WkhY0qxeYqdUccy02MN0STuMJTpmPvPd8DkG4kMcgOIsvkLaUaLWkSrlTf4xH2cg
	 WC4+1KRTaxfwg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 181A317E0CA2;
	Wed,  1 Jul 2026 18:55:42 +0200 (CEST)
Message-ID: <c5fab7d4-a4e4-4d6d-a9ff-51cf6e8d5075@collabora.com>
Date: Wed, 1 Jul 2026 18:55:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: arm: mediatek: add Mediatek Genio
 520/720-EVK boards
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260701-add-mediatek-genio-520-720-evk-v2-0-19d5da4ef984@collabora.com>
 <20260701-add-mediatek-genio-520-720-evk-v2-2-19d5da4ef984@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260701-add-mediatek-genio-520-720-evk-v2-2-19d5da4ef984@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_095544_832991_9122C08C 
X-CRM114-Status: UNSURE (   6.68  )
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

On 7/1/26 18:35, Louis-Alexis Eyraud wrote:
> Add compatible strings for the Mediatek Genio 520-EVK (based on
> MT8371 SoC) and Mediatek Genio 720-EVK (based on MT8391 SoC) boards.
> MT8391 and MT8371 SoC are less powerful variants of MT8189 SoC,
> with identical hardware register maps.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



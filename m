Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F7BC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Nov 2022 14:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1KAYCLzkHmSn4Dmkp031xJFq1Sg7C20fdvyRyyluwuw=; b=5BQK+QzEOBFBvXecDI/Ub+S7MJ
	+SrO5TTQOsJ7sUuzJt9vmQwqUNBl+iL47EDtn0pnASGzibymUw2hX7UO65gNuhwqKyrRWVvM+rCl/
	MHuCqZRayPB2vyo1Kv+NQ+Jw4GIhvhoJfcHTL0u/rQY7hvjiK6aBNc3IDf9xUXMvkJqGy72YGt+QX
	og8EeZlB2MflEOqEY7KTAibBGNtWsDp6TVd2iFGB5nbrIhjJH4V60Qw9EH22+zdoTFNvEATRAsBCp
	UmEl7l2mWPik/w89CslTAEB/2zevSaRy13myEnpEtqZoq0z/2msw3VNLnFvyS1FZE+fYjPZgkTMlq
	L+fRCC+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqbAG-0004YH-52; Thu, 03 Nov 2022 14:25:52 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqbA0-0004Rk-An; Thu, 03 Nov 2022 14:25:39 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CE7B0660294D;
	Thu,  3 Nov 2022 14:25:28 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667485529;
	bh=V/lrvTevc4IJp5UcDZQsx+cZatS/QHb6/HH934WSbtk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=apgnt2Fj0WevICWRfwwwzURMMEeLtibvGDP8URTDqPQCrugbAIbO9d37xWbX8fZ5p
	 82lWXBTUeNjSh2tH98SL1LZPV3g2jBfZn75Flue4TIOBuQbOEzad/EZPP+VIDx+OYw
	 SVbm7CVhdzN4rthu2L0kqH1okwLPCJRivCBCBGuWzIv+1eTCh1mlbvtCtWvQKbfXfU
	 ipJriuk+lmQcpZC/4AH50W0xvvowSXsDlzzur8NSZx0pkRHkH/t6Rmc5biB53WgZvA
	 FpBmLz5kWv3frBmlMqopUpPPlHL71WapWpLyT174RVHmYN3Vs+pkwATSEHcwBRilSR
	 G4dYzUCbKhv9A==
Message-ID: <357eb6c1-b8ec-34eb-5333-3a98cc5d6841@collabora.com>
Date: Thu, 3 Nov 2022 15:25:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v5 1/3] dt-bindings: PCI: mediatek-gen3: Support mt8195
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221103025656.8714-1-tinghan.shen@mediatek.com>
 <20221103025656.8714-2-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221103025656.8714-2-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_072537_036450_7E1BACC8 
X-CRM114-Status: UNSURE (   8.75  )
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

Il 03/11/22 03:56, Tinghan Shen ha scritto:
> From: Jianjun Wang <jianjun.wang@mediatek.com>
> 
> In order to support mt8195 pcie node, update the yaml to support new
> properties of iommu and power-domain, and update the reset-names
> property to allow only one 'mac' name.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> Signed-off-by: TingHan Shen <tinghan.shen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




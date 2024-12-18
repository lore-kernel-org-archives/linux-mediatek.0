Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA5EE77187
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Dec 2024 15:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/VMyo+ORsonfVivw22etmfojzVrOLox5oxIUwq+Fnbk=; b=X5O9k0SQ77Zgeg7M86f6RBYe25
	Om5CeSeEywCVvAKbv9VCiyE1usrNbNDCG+vjOczbrMZWnEydf08UoFgK3ix0tWGD0j7q+IsO4LjuK
	/UOBc8YZ7U1T06kjD9Obftq4y2UGj7aUJRXBWoJUVBFwyTg5ajNnzqKrueFsxG87f+kqVGWpoiCFn
	k7kx3i27UUdLDfyEczQAuUpMP82twNOD3E+lRXpgdNtENsa0pEbs6HL+QDvKQMf8gqpJ42xwu+9zO
	qbFsnlKF5TmwnxTyRlRboyleKAdTuVyzIWJn+4e1Zblrs4/DY08rL6dgft1XOpETTF4NIXTo+izum
	Gc3+qx/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNwDi-0000000H45A-3KOc;
	Wed, 18 Dec 2024 15:44:18 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNw4n-0000000H2K6-2de6;
	Wed, 18 Dec 2024 15:35:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734536103;
	bh=DG5Uydk1Hvw8FVpZxUIigNGD17tSbGmGCQHmGMHwuqQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k6XM9zP/gM9gkkcCyB8vtKl1bj9B4jIrcwvsd3dYbF2nvbO4pbGcEnHC8H8P3OL6b
	 jn2kxmChKvWi7HYpjviQbH5mI9nK6e+7ruMMAwe4PQvFmAazo95WpqDBquFKKnihXA
	 JxOPh0CNTyc9BLNdrY9PkycApngwiUd5Rg+vXiM6fGW4aYHkw3WMYUeCTsJ+bnlbKY
	 HIZJTCYMq02O44AcL31+TY570HZsPK08P6eDtuEVzEKhpnxXwTfr8tV/W3lrx4NHv0
	 6UASO5v/CodOvaFYljIT59x9FlFhYC/USq0GSCLPG8O7kto0ucfLHw8OPsqZSpCxsR
	 Pd5Rg8+lnWK5w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B0E4D17E3784;
	Wed, 18 Dec 2024 16:35:02 +0100 (CET)
Message-ID: <54598909-979a-40b6-aa68-78ad87105088@collabora.com>
Date: Wed, 18 Dec 2024 16:35:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] soc: mediatek: pwrap: Switch to
 devm_clk_bulk_get_all_enabled()
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jingoo Han
 <jingoohan1@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
References: <20241217-clk_bulk_ena_fix-v5-0-aafbbb245155@collabora.com>
 <20241217-clk_bulk_ena_fix-v5-1-aafbbb245155@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241217-clk_bulk_ena_fix-v5-1-aafbbb245155@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_073505_833092_A1F6050C 
X-CRM114-Status: GOOD (  12.22  )
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

Il 17/12/24 22:41, Cristian Ciocaltea ha scritto:
> The helper devm_clk_bulk_get_all_enable() missed to return the number of
> clocks stored in the clk_bulk_data table referenced by the clks
> argument and, therefore, will be dropped.
> 
> Use the newly introduced devm_clk_bulk_get_all_enabled() variant
> instead, which is consistent with devm_clk_bulk_get_all() in terms of
> the returned value:
> 
>   > 0 if one or more clocks have been stored
>   = 0 if there are no clocks
>   < 0 if an error occurred
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>


Stephen, sorry for missing the discussion about needing an ack on older versions -
Cristian just pointed that out to me.

Anyway, if you want to take this one with patch [3/3] I'm fine with that, so

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


Cheers!


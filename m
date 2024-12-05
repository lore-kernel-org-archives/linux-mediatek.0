Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F93E7716D
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Dec 2024 12:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kka1KRxlPniE1+qfkSHTMYJRa7gFBmPzdY69PIom+TM=; b=gfO2O7pULmeEQLuBRc1YZZITec
	Zi9Z9qbLbHYh5XjZuimqxQrlZ9c8O+ea+FBeRHnnyK4kO/+HW5qZTpfDEYcl3SwPz+xpL0YyHvkDv
	mVC+9kiMgweltGHonT9PGOKngYClkIDuOdRqegPhWRQtZHFgW2gI8CTThSicoatgR9F1WiAQejJ/F
	TkKvBiLzE4wiemYRv5aUoh6A1iUUdD6gXIszmUJQZHOfQyINjDrLd1a1Dugc+tvGP5lgG3YEosacl
	1kSuXsblDoEkgg7nKxJ/asKBXvOzMP7J+nmBvvStDike8bibXGZxCJvx6oGP9ddGcZHz3WH5zvFT9
	KxZprZ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAzC-0000000FxNB-0kOC;
	Thu, 05 Dec 2024 12:29:38 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAwL-0000000FwLg-3xOE;
	Thu, 05 Dec 2024 12:26:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733401600;
	bh=yv6kXWoX6zCZnGgVmuBzAEHQVjf4DNee2d2sj9FyKf8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QQY1QRvJt5UF4dXBbAbfdA2K8AfIS1pe4CFasRzlQx6+PGAeumT6imI2GiVswq6Fr
	 zQWzNdOUbi/FGBUPI1YIHJZrnlPoWfZZY4aKFqxkaV5psTrg9hCusoCF/K3B+WGpkG
	 pv5DqQsjRi1SMm3vbk7VLQJP//NThbQLEFdvTjm3fu7G6ewmTX2MKniPSi+Hw/Noq9
	 ZeBiiPa/XQwf0zG9dLTTr6jqOnxtqdPqxhlJ9fEMq+GIDWFrNimwH05+QiXyo9IPuq
	 93PWcIt3LhDAXuP4BFDysyszqcNqfZ9XI4JZsUUes2Jd1lgYVTfIFEtUKoGwcmzeND
	 duMYAOPR1LtKQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 32DA117E3684;
	Thu,  5 Dec 2024 13:26:40 +0100 (CET)
Message-ID: <1f2ce323-92ef-4386-a678-07e641f9a20c@collabora.com>
Date: Thu, 5 Dec 2024 13:26:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: mediatek: mt8516: reserve 192 KiB for
 TF-A
To: Val Packett <val@packett.cool>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Fabien Parent <fparent@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241204190524.21862-1-val@packett.cool>
 <20241204190524.21862-5-val@packett.cool>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241204190524.21862-5-val@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_042642_127591_2B7F6F14 
X-CRM114-Status: UNSURE (   7.09  )
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

Il 04/12/24 20:05, Val Packett ha scritto:
> The Android DTB for the related MT8167 reserves 0x30000. This is likely
> correct for MT8516 Android devices as well, and there's never any harm
> in reserving 64KiB more.
> 
> Fixes: 5236347bde42 ("arm64: dts: mediatek: add dtsi for MT8516")
> Signed-off-by: Val Packett <val@packett.cool>

That has changed over time with new bootloaders, yes, so there's no harm
and it's actually a necessary change.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CC3C3DA6D
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 May 2025 14:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HIHVOwYjlD76rQ2duiRkQzdZBhHv+O52G0C6H9iT3l0=; b=UvKKCxkkre4Q3GF7jGkD1FsjG/
	X3Psiy49AMhwavCef5XmYbopSHkzwR+qOSFwn0VYjJYP9oHbODrEKvx5TsEZ/S//i21AnTBb841uY
	eB0aEoZixb0SjvtG5LFT2DZK5dIkPwTmyXDS0dilL1IL/RBWIr0jDhJcFptDoRW4XMDBwQ/0VO9tt
	IReFLARYo4Zcx+4zGV1YXZH6rvaa5CoX4u8XHE7I0Hoy1NbHt9HdstGBDa9zvVz5djQpuNhOODk5G
	of+xmDQ5VO+HMF8yjBNVQWXGZtIPsvvJPhE4/b21+eoGxFysnbqkowTNLGxDlZ1uF1/ZiT1YiELbl
	sag1VAtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFa3v-00000000yK0-2SEf;
	Thu, 15 May 2025 14:59:55 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZx1-00000000wtK-2xcO;
	Thu, 15 May 2025 14:52:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747320766;
	bh=CvoF/nyQr+FhuB2AV/wsBQ217YYKKLFgLA5T25rONfM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BYCWfe68f7m9+wktZHjXNHPregZKTWhqWgiNZtQbBok4mc7onCiocfV39x3Cr95+v
	 zb0KcIbGln0WdwVVCaoHHx2fhsv8bF/GVAVIkJZlVbFHKI/NdoSF1UM1Yubue7iYwK
	 KyOZiJNV5bJkUN4knYVlkATd/8pSnycp1//fg285VUXy/91XrZcr++0WAonAjfcUuA
	 U0B57ZbuHv8dFMKfnlFWxCmOnxmwwNJPZChaa3QuUKld7XZrkWukYCzDokwLWVgOmr
	 qPVoIy27d5OyY4/e9gPz8dcsD2fe2lErCg0N77tPC0ek1mqs00qMctUvGuRNIlVJ96
	 e31vux0tUy5yA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3C62A17E0062;
	Thu, 15 May 2025 16:52:45 +0200 (CEST)
Message-ID: <cf86023a-3dd9-4205-9643-89924114e85c@collabora.com>
Date: Thu, 15 May 2025 16:52:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: clock: mediatek: Add #reset-cells
 property for MT8188
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Garmin Chang <garmin.chang@mediatek.com>,
 Friday Yang <friday.yang@mediatek.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250515-dtb-check-mt8188-v1-0-cda383cbeb4f@collabora.com>
 <20250515-dtb-check-mt8188-v1-1-cda383cbeb4f@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250515-dtb-check-mt8188-v1-1-cda383cbeb4f@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_075247_888759_D9713770 
X-CRM114-Status: UNSURE (   7.34  )
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

Il 15/05/25 15:31, Julien Massot ha scritto:
> The '#reset-cells' property is required for some of the MT8188
> clock controllers, but not listed as a valid property.
> 
> Fixes: 9a5cd59640ac ("dt-bindings: clock: mediatek: Add SMI LARBs reset for MT8188")
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




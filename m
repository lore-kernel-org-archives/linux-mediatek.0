Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1750E77197
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jan 2025 11:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pCz5EG0Ke0tUEV/fcuEezotKv7XhfgnAw9CGptD7Jfg=; b=YKeNH3mnL3LCrBmnPPT1JohgoG
	x4ACzWrqI7EG5Q6fYNfQrtqWHQ2/WqOFqsXmIMBSlL0dLx1OHZnL9/jsOHcwiX+aOe35w92W8Bfaq
	qmz7H9KFxlLGdNfBka26Ot7uIjpJ+s4tOVQxWHdMgmrPZdeKaqcWP5y1xlW27vJxhB7Ow4Y0Cwmza
	VmYNXfonRcveougE0BeVRvgK4M1otWYFdknAJr1BXUjPaucebSvAWi8BVf2YVv0CaIWOm5eXnonVu
	xSKmNdp+KyTn0LIdy/KiFsznSAFPJwtywykU1Rsa4WDvkwJ63eKwxhvW/EVHU//Odp0GZn2I5u/2q
	vXu9Ndow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVqia-0000000Bitg-3vTa;
	Thu, 09 Jan 2025 11:28:52 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVqfa-0000000Bi6w-1GIi;
	Thu, 09 Jan 2025 11:25:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736421944;
	bh=9JdmXeouo0BLG98KfepszqgJ/edFg7bc7O3ujS7C+ro=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=nJT2WrECbWz8ZIqYRAUE+K3DjE0ByA41rGlhYisnKxfI1u8KSn5auRpFvDBAfJBSD
	 M6gVmvTkGLuVJbGcEQMF8Av7yMbJskkVpa4SFDmI/6XF3OxSFUqXWkSInAMAqJresq
	 MX/iyazGkjdOwnoYYwo60rg6/xCNEe66GQiSv177OX9+x44f0MU31BiLeg+7e2JHUl
	 eNhE8JYIyu1DHoI74XdmfiFAsmYOQbm/bYgp9Rx/HqMIpl3uLcvU1RcT+Dy/y+eXN5
	 WQOEKIkPrg8twI+pBbBOhfAEadCV5GjzjAzznUKtanmDrg8WGvD8Lfqq7CVTFIIH+S
	 zOMLaPs05Yvmw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E74E217E156C;
	Thu,  9 Jan 2025 12:25:43 +0100 (CET)
Message-ID: <a84a9a5d-3574-4b57-b076-d8358b939764@collabora.com>
Date: Thu, 9 Jan 2025 12:25:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: airoha: en7581: Add SNAND node
To: Christian Marangi <ansuelsmth@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Daniel Danzberger <dd@embedd.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, upstream@airoha.com
References: <20250105150328.15172-1-ansuelsmth@gmail.com>
 <20250105150328.15172-2-ansuelsmth@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250105150328.15172-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_032546_526648_37E02CAF 
X-CRM114-Status: UNSURE (   5.70  )
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

Il 05/01/25 16:03, Christian Marangi ha scritto:
> Add SNAND node to enable support of attached SPI-NAND on the EN7581 SoC.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



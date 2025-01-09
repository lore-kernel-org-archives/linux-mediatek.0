Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A68EE77199
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jan 2025 11:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z3fP1jF839rSIDeFTpMsj3jSpAIOhnkLrbuY4znnibM=; b=D0dVcfBo8sb76zDy/YQ+GEtYiO
	g4Yr2R88kmK/qwncSr8lminUAMKxTkF/uoHR4h1/DzpylTKAAgADx7AYeMKidBKAF8GmSEfVQEF9X
	9cEMhPjP5so9w+EZYqstq5RCLGklV3KI3QlqG67nt/AzhnviaCJNDBewCDuHVhsGiphu9xQnDg1il
	Ae2iKyA3csnk5wZ6NpvNDg+ekWTKOSxR/JJB3IjDmqyR6QbRPWxXiB36Mf12wk9dGB2UJgcfrI0kW
	gg+VRWlt3XhA4rzMBurrppJZLeJp5vp8iZIQSruqIDBzwBEJSqRjwsp2ppRcKFziCZMiHQXl4o4oX
	LEldi8YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVqhO-0000000BiZQ-31si;
	Thu, 09 Jan 2025 11:27:38 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVqfY-0000000Bi6H-2eTy;
	Thu, 09 Jan 2025 11:25:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736421943;
	bh=iqXpgp2fGvu3tg/mddpVycP/Hki4wjs3IgZaA1W/y1g=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=OQ9QTgk8pzTbDRLiIw7wpB3DR4020axAGcDQUbSskCYfPjhlF/hFGEDxQQft65HJT
	 BgzdMnLVdF6+w6SVhedOWjAmIpwDpAC7nbz8QjSVcilHGTk7AZO3pbkSk8L+TcSYLo
	 jRWBadIsJ5VLiU9+fmPi1CNAgfTXyLzs/Flhwg43HgwchyMRuo88wE1cPwn4APjxnv
	 cOl0y6pSeO4dHLvGpm4wdHwype48vvW4sBc1RGU27tOIa+TAq5GXNnDoAlV642dYYY
	 9B4cm0ftStMXKmcZ9SBlECotbqYaCpyI5JRSZhwJF9jQmo/nX71uVokF+sOXL2QTnJ
	 5QJP7lnAFgztw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9F88417E1555;
	Thu,  9 Jan 2025 12:25:42 +0100 (CET)
Message-ID: <a93249b1-b550-46ef-9ad0-0465916cd7af@collabora.com>
Date: Thu, 9 Jan 2025 12:25:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: airoha: en7581: Add default partition
 table for EVB board
To: Christian Marangi <ansuelsmth@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Daniel Danzberger <dd@embedd.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, upstream@airoha.com
References: <20250105150328.15172-1-ansuelsmth@gmail.com>
 <20250105150328.15172-3-ansuelsmth@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250105150328.15172-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_032544_817731_561CA095 
X-CRM114-Status: UNSURE (   5.09  )
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
> Add default partition table for EN7581 SoC EVB board.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




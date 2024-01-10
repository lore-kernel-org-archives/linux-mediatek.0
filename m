Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC532C4707C
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jan 2024 14:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lK9saYlqunX96PB71LwKtTslBp8vH9ptiV8ieftmyLA=; b=YnlkH0MjLBxpFSU3ccgNr68Y3D
	S/BuJSZE3VO9oORACeKv6G+eBERnzphEc6+YK+IfvLGMrQwI8kz23/tY9ewshMhRqfulgsfJH37W7
	Of5LFkrV26Ns/1zzj02IOqwygNIGRxKC0di1cLgEO5v9Aq+cKeOK0Hou8DWPTuAsTZEXJtjtd6d6E
	mivND0ZQzHGYv2a7iyWQN4fiLnwCLdgRia9/VVpVaDSv3jPb2+aix9IfnULrBY8jgZA1VP/lT78yR
	OVWVy2xKuOhKLw2l1+uzsqkn5p/CxPDjgiZJuFFvi7j0OWjlMW02SlM88gCT26uixHTp5M2PovCW3
	UdEnLUvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNZco-00CL7i-0n;
	Wed, 10 Jan 2024 14:32:10 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNZci-00CL3u-29;
	Wed, 10 Jan 2024 14:32:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704897123;
	bh=92+NEWE1LDViP0h1iQCswWVx0PEJNeyVVBJSKlW9510=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ska20mzoexdmYqZc0UW3LJoWQugjfNTpAWMAbFXbuBcmfsJOm6S2+29FUorGfgc9Y
	 SBlaqk0gbA5h1nBJd7qFWTWICnbbH12/OhsSJCMU8ibgwCY/aGFNeWU87SLvOFrPQU
	 NkAC1PmvT0kt+cBd8L3d9HgjjVL1ohVp9DKj6/1IRZj0gx/FN7KJ8e3pd+M2BX9fel
	 wU0eq4VrHDaHzpkTvA2DKs7gbLzvq6lZ6ewXzi8koDnPb/NWgKnnhNhkG7GQTE2nMK
	 HUaSDbl6OuEosM1dzN5GCBledWkk5iD+nrQ+EERoYoePiabqlbZi+8DlomoQu/0Cu/
	 5QRIgKZiVw4xQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 68742378045F;
	Wed, 10 Jan 2024 14:32:02 +0000 (UTC)
Message-ID: <e325a4d4-0df7-499c-9d55-7da093b744ea@collabora.com>
Date: Wed, 10 Jan 2024 15:32:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: mediatek: cherry: Describe CPU
 supplies
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20240110142305.755367-1-nfraprado@collabora.com>
 <20240110142305.755367-2-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240110142305.755367-2-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_063204_849568_D5B38915 
X-CRM114-Status: UNSURE (   6.71  )
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

Il 10/01/24 15:23, Nícolas F. R. A. Prado ha scritto:
> Describe in each CPU node the regulator supplying it.
> 
> Fixes: 260c04d425eb ("arm64: dts: mediatek: cherry: Enable MT6315 regulators on SPMI bus")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




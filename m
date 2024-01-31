Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E3EC47DB3
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jan 2024 11:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ZaqDTMg+xvgvGBNWrecy0twPhQzmr6OJw57xmwrPRE=; b=hjqytxbwBfRf3/+4hd3YBDCXSb
	Cwdd9E1vS6On7fbgjXeiX4MgOoqbKxvasP+JvZvw0pSeJOu1zpeW2gzkqoiSlFRZ1Jt/bMXgZ/BhN
	Ejeal86i1bzPxtTI33mkizw8WZWVdJUidFHxz1gYeerVsYftwxDSHsr9+MWB4W1XFsCfp+WUtkkZz
	tnv1dGgFxo5NzrN9JQnv/jVGMenFytO8C3TyG+aZX93zouMmKc+Wqf4hxbIhC/WytPnBUc8TE+XrC
	Q3JO7hGgm67jG9HTp8xxvjlJcvJi2VPO1/8Rb78SJ34Ah9ZIJh0SiN1GKUTJKHjL9yQvJ4FWVFvRE
	mK32sYZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV8on-000000036zV-0I58;
	Wed, 31 Jan 2024 11:31:49 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV6gX-00000002NoB-35Nd;
	Wed, 31 Jan 2024 09:15:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706692507;
	bh=vw0BizcmVJNTech9k7+lv72FT42A03VfqewLKVt57OA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Dzzx9yYQ4NlDZtjv4Hu8j/wZzNHep086PNouK99Ho4cO1aS+eamCDsPhOocwVyKTe
	 1GIYcHymsvTIWw5VESooTY3CxJedPoIctFhMtFfStgJWx/25rQwUm1r1q+No1KdY18
	 qd6piQZKdOTjtyxb+ZlM0/U+NS1MSYY2Zr+DHpjE/zLUyW686CZ2XEbBc05qYyuEO+
	 MoBiF29I8GO54NHyyLrBBiKp/zQWxpnSJ3Df6qaMS4HcOVqgdLsmqlVZrp3jkRocWm
	 +sgQ4YkvDs6Cl6nirmdpPnpQUuNG+WRfOQUSFFajHyD2vKm1JELKt9UWW1AiKXX8pH
	 dDX5vJCKIKKwA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id BFF2E37803EE;
	Wed, 31 Jan 2024 09:15:06 +0000 (UTC)
Message-ID: <1a94706f-b814-4993-b495-40d3fc019abb@collabora.com>
Date: Wed, 31 Jan 2024 10:15:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183-kukui-jacuzzi: Add ports
 node for anx7625
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240131083931.3970388-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240131083931.3970388-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_011509_936596_626A6A84 
X-CRM114-Status: UNSURE (   8.61  )
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

Il 31/01/24 09:39, Chen-Yu Tsai ha scritto:
> The anx7625 binding requires a "ports" node as a container for the
> "port" nodes. The jacuzzi dtsi file is missing it.
> 
> Add a "ports" node under the anx7625 node, and move the port related
> nodes and properties under it.
> 
> Fixes: cabc71b08eb5 ("arm64: dts: mt8183: Add kukui-jacuzzi-damu board")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




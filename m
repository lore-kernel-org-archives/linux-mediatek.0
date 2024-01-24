Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35736C47E49
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jan 2024 08:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OGk5rp2O/xrZXP1UnM6tl1iS2mrZIvbhYdrZvxo3Eo0=; b=hGXpGaft5N5Zbc
	m/wsuuCm3joLQ4E7L2qkeh+Kx8djk4ZCtVNpsGXDhLO9hDA0MTEuyFwcGpk4dccVUm5eYT8SoQsBB
	uf+3c0T9zm0r0aryBEylhSHaUi11b0bytNEOHwXNe1m+0RTZNhQpxFgvClh3ilPEp9e1KjP3U8ndA
	OuN+Gf9S8KPJl5A6sGwDIPwVo2bJRoTpohTEE1fsrAm8pV5apn8F6wKFKWTf8q7ky2EPVhx6F2Fc7
	K6obhF9fbBMHvwXZh3zxP0w9hXu9qwfn5RHfzHhGo8i1CtXIjEjTlyR6r4cYaO6D7CrIRmGgZFDQS
	ubV8LCqQHjn50BpMF/FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSZ59-00254w-3D;
	Wed, 24 Jan 2024 08:58:04 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSZ56-00252T-3D;
	Wed, 24 Jan 2024 08:58:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706086678;
	bh=DxcDpKLmIS5x9C8j3sVwB34LceUIhcJpP8hPAp0icRc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GJ/V/n9+L10m3msD+8IihP3z8WSWlWYz50CFsOgYZJIvVKAKvIlXIECU39pE7gwg3
	 F83hzM2GAUwGahvJMjty2HVLdiDpmYK7QVgcuBL4NSleoO4cZ1B7jYT2MO8OyBNPiV
	 C+MZbFRx6FuM/j+4Q9nIBf5RIJRr4a+U2FpXB1DzHL6LYQsNL1f9dO4WnwXh0Aa57D
	 CfnBmeDTM9ctBehYivow1KyaPGUThoMuSpujq+3srvAV8umH4reTztiPKW05i+A+40
	 EiUrthbSSiMjXajTDOIvl+LDnu7eiH1/LWWlTxt5Y3yJCuei1Y+MLuJJuxPpIQTLdJ
	 AzQy/hy6xyf2A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8840537802F2;
	Wed, 24 Jan 2024 08:57:57 +0000 (UTC)
Message-ID: <0d11d506-24f6-4f1e-b0de-1d229988545e@collabora.com>
Date: Wed, 24 Jan 2024 09:57:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] dt-bindings: soc: mediatek: Change
 mediatek,gce-events to refernece
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20240124011459.12204-1-jason-jh.lin@mediatek.com>
 <20240124011459.12204-4-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240124011459.12204-4-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_005801_165853_89F25A0B 
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
Cc: devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Shawn Sung <shawn.sung@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 24/01/24 02:14, Jason-JH.Lin ha scritto:
> Change mediatek,gce-events property to reference mediatek,gce-props.yaml
> instead of defining itself.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




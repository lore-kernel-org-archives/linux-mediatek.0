Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38370C4828D
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Feb 2024 10:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7nAN0wOYMZbReFcNuS9hdMwX9wSCCEjeDflb75R7kCE=; b=0VRdUdJuzadxuoO+LZwnnqRUCJ
	4eWVrZjHu89rNnSdpwHaxkYbYxhJlxbw0jLrvDShAm9tXzdfvOLYyAQcpUItPwvd3cFx1Y29D0lWv
	L9ljheXhxSrDRrVzkpLDOiWvhGoi75IQMyBvrvkyl3kZN+mtaD6qGlox2EwFZggHU/Hmkwnl8zPTY
	8Qf6yqdMTItYrJBvS48l3mtEsW0ekQuASx/Zjd50rBnkwNrRz2bbZuBQXKkJBlhW4teeH9i98lj+S
	frvSdCGftjM/rxnQ9XU9e9BgJtYzZ89zx/1QXWnocDA6tauKQJ8egrYwUfj0No9OZqaXOzsBEoSxm
	SekYwEuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXIjN-000000073S4-3Wb4;
	Tue, 06 Feb 2024 10:31:09 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXHku-00000006iIs-2Q6q;
	Tue, 06 Feb 2024 09:28:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707211719;
	bh=2Xrzre9dmcGOoIHcHGMvLHKHKLzHYCWIXe840+0qVeQ=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=x+EkDserXeZIDx38jSRNE1m5SBpssqP7OemvhDAealPBtoDg/7KRAi0mLRnQ09oj3
	 Awzrne9T9AA3bpqNmjyvbSt94DaMPvVgysDgCbL8ZkB+wz5CJnsl1jdqmBUUVK7HwO
	 4nMlEaZCfYd0NS/TarfVpqURG6zdGli5mq240MD1bMJzQZW6rhOmac/fCCMcZpW8Qf
	 iTqfHsMtWtpEi9epF2Ji5auQTAvgA9J2JRKZF7wfXuy7Ua+0F9zpL1SB+ypCrEsTk4
	 /8q4aTGrOha+feqIsXNDTx4WOVxbenIXuOItHIy5j1GCArn+LIHfZ+QB5JpzbutXhj
	 ikgZF19ksZe3w==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5A7DD3782039;
	Tue,  6 Feb 2024 09:28:38 +0000 (UTC)
Message-ID: <98c6c8ae-f7cf-4e5d-895a-18cb2dcc5d35@collabora.com>
Date: Tue, 6 Feb 2024 10:28:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: mediatek,mt7988-xfi-tphy: add
 new bindings
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Qingfang Deng <dqfext@gmail.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <3251ac3db1a739e0c18ded0a824edae981c1e2df.1707153425.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <3251ac3db1a739e0c18ded0a824edae981c1e2df.1707153425.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_012840_775249_914EC853 
X-CRM114-Status: UNSURE (   5.82  )
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

Il 05/02/24 18:28, Daniel Golle ha scritto:
> Add bindings for the MediaTek XFI Ethernet SerDes T-PHY found in the
> MediaTek MT7988 SoC which can operate at various interfaces modes:
> 
> via USXGMII PCS:
>   * USXGMII
>   * 10GBase-R
>   * 5GBase-R
> 
> via LynxI SGMII PCS:
>   * 2500Base-X
>   * 1000Base-X
>   * Cisco SGMII (MAC side)
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




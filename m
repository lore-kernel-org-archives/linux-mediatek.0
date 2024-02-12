Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E76FC4829B
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Feb 2024 08:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nt8/eSaLGYy5YrGVNab2jYL+kmlJXQgYJNKDLUGicxM=; b=iyou/JnFu40/X7Ic33ogRxkFm8
	36UkvxXJ+ClM71JflAczxPYj6BP0n72sZ9wZSy5iz9uA+xZhJwM5162bBqFJlaIxgGL/yNqTohhO2
	0zcSXOLWQZ4fFAttIV7GP4/e4wdH6ZuutaL6k2ZYrqMvnhaSCBc3Qx8ZWWxSVDRs/PNydQ6vMgSi+
	ElhphjPAAYyPjoBgqSgvsmoSRL4EyLh3OJMOazrvOQC0ynYMMhTU+o0cmD07fVUNucx/B2Tdz9/Vb
	9NbL53l86sH9K5Pe+v3sz3x+GTXpL1rkAylsldp2956N1rBU+v81NF8t5DfUvtxGWdbdFsMyK2HpR
	hJ5yYmiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZS1r-00000004fSI-0YqB;
	Mon, 12 Feb 2024 08:51:07 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZS1o-00000004fRB-1ZWe;
	Mon, 12 Feb 2024 08:51:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707727863;
	bh=JfOQqLAkSvqpY8InqNZrSpNTGBxtk7MPqEk2psMnHnc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WPdiy/GTbV7ftpYhOdATDPnX8DbMbe/fcmli9lcD5SUC/9/X5ps2bEDi7ntRQOcEJ
	 vpJog6qEVW+f1DJD6kbZW3QVlMRy3dCuXna3zz6ftF83Xo52aC4zXIQvEyDJ0I1wP2
	 +bg6BPMGtsVjk+6RzbzHJzCNcKVLtRNR6kWvibqSc2r4AFi5AUENsUewN6cS0P5zYa
	 0fm6zC/K7Vafiwwh8s6TM+6MfYpgPHjuxag8wxusSUj/ZnoH8/L0moGr/LVChadZMv
	 1Qbr7VzYaMNW6FTpnz3b8Qj0cg5aWMVCu7DVT4dXY6qCaveGJWAJclphF3uaUvQTDq
	 RCBj14PPxdEDA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 211D1378203F;
	Mon, 12 Feb 2024 08:51:02 +0000 (UTC)
Message-ID: <c3488bc9-f55f-478a-b8fc-274f40fb0818@collabora.com>
Date: Mon, 12 Feb 2024 09:51:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] dt-bindings: net: wireless: mt76: add interrupts
 description for MT7986
Content-Language: en-US
To: Peter Chiu <chui-hao.chiu@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi
 <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20231221032648.641-1-chui-hao.chiu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231221032648.641-1-chui-hao.chiu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_005104_586764_FFE0688A 
X-CRM114-Status: UNSURE (   6.57  )
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

Il 21/12/23 04:26, Peter Chiu ha scritto:
> The mt7986 can support four interrupts to distribute the interrupts
> to different CPUs.
> 
> Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42410C71131
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jun 2025 14:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8FVl7iw2OPmUTyS5YxK4bwWFOWwYw/pSTt4UiTlbljo=; b=BawwEfBqD4c2UQ
	WVNwTS99FPwQFdnZ5UXoENQWvr3LSZHjYK9kR/sg6xLs5yMrjbKaw10vFNj07TQUzErjjj9jnhkbl
	jM+YL3jKbEttaVQqFAzd3WcT1kKFE2EB+knCthZC19Kl32sD8d67tCQdoSy3TdcorzghTMMGBRDM0
	+XNIjbAQDokxt/uy+leEEg3NV/QSVUWNyzO98/7Fj7xSzxmfAU50g5/hkQBMjxvOBIoXqrVLlLkxM
	mFxcE2U4lpkTbLtRvbz3chIhKBMMUzqA6ZebwrdjcBZaYhzu3kqw/cg42rMrcoC4frWHSDJaPF3D9
	1id5gh0GaIz5FUE4TiHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMkt-0000000A9YM-0cr5;
	Wed, 11 Jun 2025 14:48:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHqF-00000009UBB-04Kc;
	Wed, 11 Jun 2025 09:33:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8FVl7iw2OPmUTyS5YxK4bwWFOWwYw/pSTt4UiTlbljo=; b=YssMNAqcgprJHjw5rLnQkNNPNi
	y81DQnTtPLl5Kue3YHRCZueIl5Uo2lSVu4J+N+bNu7CgcE9KNWyIeM9RSgliKOfQYq/gkm+iX3cuw
	Puo4AYJ7RPffdr9D8ke2fe+/EB3C09RU37DuDmmyvB0M2NYHo+iFXWdt2LOaSzDt1R2Ay8oLWQ8HG
	x7xOEz4POBssiZMHZL/38jSsHevD+sXO7GetGXrcXBSQMnlQFWFoN1FjjEYRcJ83DFXERH4BOvjUU
	3Vtdb00FMzoTFc2KMZrmpncQw6MhsQl4AhUKesjWYp2AzGpqrMwqfNA5uZiGMnPL/2v7hENvC4EJY
	L9pkfuWA==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHqD-00000002EaE-0WNd;
	Wed, 11 Jun 2025 09:33:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749634431;
	bh=aVqfa+rUoywoe8vYl+T8e4/6MblA1+D7SSSfmwI7pFo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jwCAm7igJDiNWfPFK6ayvAuRcMPlY1z66lq7UJ37mZGM1K8yDZ4nqgA81Uz5ClO94
	 Yzdv8bfwZ3FT1vBwtw1s/47Ihi1g6glMmOe9uxtuK+gD5LA/JLAVg8rBoLRO9WzkOv
	 Q0S97y5n4zSgKyw5C4rgcBcbQ/C6R0NW6C3hcaKsjUV87IX7oyJHHNZJHzFi6y3v/V
	 KMg5JLdIgSNAKaubYqbj4lmf+bvGoMKowCP1KMm/EgKB7oCB4e0agMFUpkrHEusU4P
	 m9dHi+OheXfchlPaOy/nVPO67AeQWIS9XrAPyJVUfrs4xcBC4UyPggXuLwNVGa0jaZ
	 IRF9KrlWD95JA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C3D8517E378F;
	Wed, 11 Jun 2025 11:33:49 +0200 (CEST)
Message-ID: <44c53bcb-3df1-41b2-a5ba-8024cbad4aa4@collabora.com>
Date: Wed, 11 Jun 2025 11:33:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/13] arm64: dts: mediatek: mt7988a-bpi-r4: add
 proc-supply for cci
To: Frank Wunderlich <linux@fw-web.de>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Georgi Djakov <djakov@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20250608211452.72920-1-linux@fw-web.de>
 <20250608211452.72920-9-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250608211452.72920-9-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_103353_375758_B225D3CB 
X-CRM114-Status: UNSURE (   6.11  )
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
Cc: devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, linux-pm@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, DENG Qingfang <dqfext@gmail.com>, Johnson Wang <johnson.wang@mediatek.com>, linux-mediatek@lists.infradead.org, Jia-Wei Chang <jia-wei.chang@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 08/06/25 23:14, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> CCI requires proc-supply. Add it on board level.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




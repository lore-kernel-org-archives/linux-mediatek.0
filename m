Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5C0C77B7F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jun 2025 10:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rdv1PxmvFCh9wiNgGRosrM0Uc3xj+4CFvasqWSPAQqQ=; b=vZzKXtT5f26pAX
	25+lC4Mqz7l5xWfRFbdZZnaJ3vROi+m44vN2nOLwxryGOUshlEl7Z6HM0n2TGhmGIbpITX/Cxzkby
	Bme0d/CYgQQYmW482KM+qWsQJ99WQKUqAby8ri7h52R7qLVOUsi6G95xWCPRsnp+TDi7y0PxM8Jv8
	KMOfD95as5sm4UhYismVcdZpGhy9yQdle8jMWTfelXRDIwdOZu5K/3LK9JUWwdbMZB7F+Et32lE93
	7f2Gr/WIxckEI8lY2cboKZR5Mm5n7Jpq6LFaCL4aZFr0zFpMqQSfXK6EzpUR/ZmyL/ZS8VttW+GHD
	uR4MtopuZK1VRSVs3v5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTeDe-00000002Jdu-3DQD;
	Mon, 23 Jun 2025 10:16:06 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdXB-00000002BPt-1Ite;
	Mon, 23 Jun 2025 09:32:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750671131;
	bh=Uh1SmrFE3wdw/cPkwQjay39ohrqiBFdxOB2U7Xc19d8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=B2AkBD2+MPg1Miz03CgmE94LPkTv+3zBIl2so/3V/ZZDm7qxsKOhnnN4SGNHxBCXP
	 xcgnJEfiLj4/pdM9jaw+0GvsUIkVLMxrB2RXW5BnBL/9Ad3QCfUq0jZ071XFy4xbVq
	 P8nFJTXbg428VGkr98cZfUmEeoBw7clNt8AMSZfvCFWhbO+13kply1YnVUpMpHcZR6
	 363+CagJx8mjHgkAxSFXKc2yq/7GeeGCzSx2PT3GN/jVQfza7kHozxhJyXhGwuaLc8
	 AmuB01YrL4whEGQ3JWwzFXCNmx9ejr3z+22vjZPl6tVsuwFb3Wmii62QElaPHBFg3N
	 TBFx4vB8zwIHA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6AD1E17E05BD;
	Mon, 23 Jun 2025 11:32:10 +0200 (CEST)
Message-ID: <61ed8a51-9714-482f-ae92-184a991560ce@collabora.com>
Date: Mon, 23 Jun 2025 11:32:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/13] arm64: dts: mediatek: mt7988: add switch node
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
References: <20250620083555.6886-1-linux@fw-web.de>
 <20250620083555.6886-8-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250620083555.6886-8-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_023213_497062_C517AC5A 
X-CRM114-Status: UNSURE (   6.41  )
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

Il 20/06/25 10:35, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add mt7988 builtin mt753x switch nodes.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




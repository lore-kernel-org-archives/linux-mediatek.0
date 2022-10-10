Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A111AC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Oct 2022 08:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kuzcmrK2QmAgGk8O1qYZ8+Pz8p3e65yKbTmSIEk+7xo=; b=m8DykgEHcjMsSFW0dwrq92qlqJ
	KWw2A+cU83V4Sez5TPmzpctbnpoK2bL9ejmSkeaIg8ED9qtCEPa1cNHnwt1AkNL2pSagg/kMIdiHQ
	UatLLINSoSU168psmsSkbfUHPl7D4JlMPkbcVtGJve7oVQNPJRgAuu4xOGN7tnjED8Xw1CkPt9cQF
	DPo4lq9VzwTDmBVkWhwrNI2FAsitiqBMxqGbkSRvjSJnv3HyBpOo3wYlTSoTW35Xd3H6ZNUpp0/sW
	yIJ3t0U4+o6v5WE9jxrkLYCBVO3Njo13itJXTH3Si6flGn37rZICmJIQXbDUKADm7x5Ti3/CVk1Ji
	u1t97knQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohnxy-00HXNo-5s; Mon, 10 Oct 2022 08:16:50 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohnxW-00HXBl-RK; Mon, 10 Oct 2022 08:16:24 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 28F1366022BF;
	Mon, 10 Oct 2022 09:16:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665389779;
	bh=Q9eAREEHziP8nHQElTxzJ8wlawGSUGr+M4Z+PjHuEcg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l6d7M/CqNsJ+afzGm150hXhd+/y9B+f98iadTxGubmrSRlEri38Ue3RzLcuqAFjU3
	 a8mGkeUqPucq8MRl+NPkvd7/irygiyVxmLe3np0ATdNhRB1AJIS5dutIQfmMSJTta4
	 i4X+AhQC89zmkRSB8uOBINRt0U7qrXs36YvTl4gsy+AvMeBqeZ+ClvacZDyWjFwXBG
	 fZD56zihuLAhQStbJ/9hX76TZ22iZS+lrNS51AvlAY/fbKmcJlQSnT5dHPZ7xiBT9C
	 SKaGnnzLJ2Ujk6urujJQFVd9+sQ5+A7zXjbjXgAe67vNLVoyHFjRhzTboGGKrjyzCS
	 Ji/kaX3enBg0A==
Message-ID: <2ccaa072-a224-241a-ff2d-c38a5cd07dc8@collabora.com>
Date: Mon, 10 Oct 2022 10:16:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 04/10] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Add MT6797
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>,
 Andy Teng <andy.teng@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
References: <20221007125904.55371-1-y.oudjana@protonmail.com>
 <20221007125904.55371-5-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221007125904.55371-5-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_011623_088848_38E09E33 
X-CRM114-Status: GOOD (  12.19  )
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

Il 07/10/22 14:58, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Combine MT6797 pin controller document into MT6779 one. reg and
> reg-names property constraints are set using conditionals.
> A conditional is also used to make interrupt-related properties
> required on the MT6779 pin controller only, since the MT6797
> controller doesn't support interrupts (or not yet, at least).
> drive-strength and slew-rate properties which weren't described
> in the MT6779 document before are brought in from the MT6797 one.
> Both pin controllers share a common driver core so they should
> both support these properties.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




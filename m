Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7FFCFC500
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 08:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPuYtMvO0cdSoefU54xnwsztOt4o9nA+Yedv2BH/No0=; b=nvElbQvmT0yzkNb6LeOn6DEn4d
	eaeyqaVfSIlZZSrxKBBgZ9w9BOjc/rzFp76bWSLjw2B13LgxfckFzlY7GmIKSp3rICb8qzcr7Ir6L
	E1DFBQYksUMjyb9L3CQUDVvbVIAfw1gLNwlqBADCseCk6ccmTxq2IhEq1y33pIosvZL8100ujds71
	amFYlG958wWVgBf2ZpXzI70NIA+rEdjx3w0wryDBCzmyZzk7OBkXnbSwt1om2pHg78FQFaSvPy+3z
	GLzET+LqxoOFP8nzlaJd9nUsGPuJ5zaLQyp4RT6wx7D7f7g1R+FeL1eJUqYgJB3Fr/onNSk+IZ/3P
	WeQmWpWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0GHW-00000004ElC-0aRh;
	Mon, 14 Oct 2024 08:18:22 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0G2m-00000004BwL-3Vbd;
	Mon, 14 Oct 2024 08:03:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728892987;
	bh=SyhQsYUVHECUxhjoE6eiAt+DlVG70JsuMxqwJVecDtM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DBM/qrU7VChjgNdwqwukRbBPv28OLN0nzNeh/5pwhFKQPAQa5x36fidH6wyi312ND
	 Vz66Tn07h/l4kgT4RUV1SpxdkqgUz8dIT+l3eftDlISTVcNtujmiXDPdLwz9NuIl6w
	 +lnIlAKOpwo5eIxPk0Gj+51L4BehfpaZJHnYlrG0ANp5QGmNdcQapoNiG41mO2c1s8
	 lgeoukFwqCWckqUtcfS6uEoeN4oIcdqENM7xWfFQ/c0aGO+wNldNc5ssHY89r64yDH
	 IMyS4jK5wOzvlB+aHCJBo/fVxH10h0Gpt2OcAnEjEoxfwPbvGmOks5/Iox9gxzvWKj
	 I7rI9iJIlIGkQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C340F17E10C7;
	Mon, 14 Oct 2024 10:03:06 +0200 (CEST)
Message-ID: <70dcdca0-da9c-44fc-a701-aae1159d369b@collabora.com>
Date: Mon, 14 Oct 2024 10:03:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/8] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Document MT6735 pin controller
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 Andy Teng <andy.teng@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241011120520.140318-1-y.oudjana@protonmail.com>
 <20241011120520.140318-8-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241011120520.140318-8-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_010309_854002_9B4A9DF2 
X-CRM114-Status: UNSURE (   7.05  )
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

Il 11/10/24 14:03, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add bindings for the pin controllers found on MediaTek MT6735 and
> MT6735M SoCs. The pin controllers on those SoCs are generally
> identical, with the only difference being the lack of MSDC2 pins
> (198-203) on MT6735M.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




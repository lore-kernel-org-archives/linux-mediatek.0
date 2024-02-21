Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F56C48BF6
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Feb 2024 09:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LkZX757mbhMOSlqIczeHYiipNTUFu6vSfnsHdaNZwQ0=; b=pN+be//m7sY4BnpNhXr76TbnBF
	rXe4yEcyBPzJtBEN8aVkRf6ZJzpzZDGjgPI2rveJjYeyPd72uUZwTDI3y5Hu9dRitps8og8vXJ6Tk
	K35A95JttcVSVL+OCF+VBnJdq5d7yUtwIAVCgi5IeWc7w8uK1DJzbBOM2Jl6vuSPYog9T0Jo1zZEO
	VFQDz5jtDhi+sQeCkcaKNfuzXZqEg72y0pBRvRQs8A2/P8mt32HS9V4XHPhZ4mcJzxHYB4le2HPnW
	Uj8ufnLVh7JS4K8TRDW1FK6kphi1R/eICBhnvCykZhH2OxmU+2wvRDGrdBNiBvJzO+iISJf1VND2E
	jIpoaUrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcjM8-00000000OO0-1hys;
	Wed, 21 Feb 2024 09:57:36 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcjM4-00000000OMI-3n35;
	Wed, 21 Feb 2024 09:57:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708509450;
	bh=CBRwI7HgCvtHtSggfcJjCRi/PajFPLcmhsfXJ/u7MmQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jaCxejWQxJfIe0hBE5Ipck3zFqSAN2f5oVJ5kE3mOF62mPU7gXwn/RTGIEcEXOjWo
	 3xQ7qtwotsYswBNxtIEQz9/7cULc+M4P9EKJwekfhJorFym4k0rWsCan01Z6biCSFT
	 fFcfZwZ9M5RFxdxJmZPrqkmGzKNJu1wKj/qF9nWWjpbJCcr+GsaxmaSs6lySkQrbNe
	 9RAJVu6PU2p5ONwG7qCgpWJFXLQvwIrf0ewX6Soki30P3Ef2fMKMUI4CUJQxehi1pL
	 oi4pGyhmH6fTvrjFl+w1CNObPh5uWVRTurW5OmBAHE26wwd//zfT38D3QDI2IDTj0Q
	 nfVfA1Ex8YDuw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6E4CE37820C8;
	Wed, 21 Feb 2024 09:57:29 +0000 (UTC)
Message-ID: <8d80be8a-6ed4-48e3-b792-454e11b518c5@collabora.com>
Date: Wed, 21 Feb 2024 10:57:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: arm64: dts: mediatek: Add Cudy WR3000 V1
 router
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chris Morgan <macromorgan@hotmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Wang
 <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20240221073524.20947-1-zajec5@gmail.com>
 <20240221073524.20947-3-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240221073524.20947-3-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_015733_092390_2AEEB9C5 
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

Il 21/02/24 08:35, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Cudy WR3000 V1 is an MT7981B (AKA Filogic 820) based wireless router.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C931EB64DA
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jul 2023 10:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=misGHIVf2WImt/v/RxP32U872J2HOdsRmN6rzP/5YHU=; b=iGc1wGtmIH0aDjfnDIZQqPIfSR
	XH4mDBMiMMchZLE+TwfDsAKRoZDEnsUKVzw3yxrMEukQmkCFwv5lJQIXFTxuGV0WX4CtedG9n6a2o
	mc741LFCS7loHTA4cR8TXzVQQLsE5/xkPEK9MrN/h0pLGEmOI5+RHNpzRRIh9emQHklOdQJ1p+cpL
	iQBzOmuF3yol9HUo/carfzA7aUTup5aOAKMTbq2qeR7C1ONJ3r7X++1iliFKlFIp4babQadVnb2uQ
	0puj5yUfHd2WATp1+X+DZ2vZIyDvGcMiTDQPCYSXx3pJ+vD+oNxpXHlDp07S7CIXCiT/GUwzNGCKA
	Ql8eZJPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGdEK-00CrzU-2X;
	Tue, 04 Jul 2023 10:25:56 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGdEG-00Crvc-1s;
	Tue, 04 Jul 2023 10:25:53 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D474D6606FA2;
	Tue,  4 Jul 2023 11:25:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688466344;
	bh=nT2uf1MFk7FRsohO81UYA4Y0xYqDh68FYplOOt/abkE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BtCUnHP4hzO9jy1LIGSIQlU0ejsKn/Py9CRl2FKR7FfoMsO92xxLTxWA2awfF0dAm
	 OVs9//jN7Vbnb2hxNjqPH1BNDMREx+igrNzMZneS1EinhUpZQ41bKgBTe0S1MGecwo
	 FEpIYGG3zNPmNu0K63yRfG+nXqBxaYhihqqOCKIgzaElhqhBQn549kdoqm2SvC6XMM
	 uG9DXceoYaonlRO9OT3MwgZBjyq2FJ6q9Xelk5vqLsm/jAMbwrRQcZY5lLCYQGl9zr
	 PjlY3xVKiaEejRZlhIQxVP+0Qu2ZZXXOOJ7bxht9Eh70nC2fpnaKR1h/n9qYU7ri+K
	 GxfHR8Xb0qH8w==
Message-ID: <2f9949ed-36dc-964c-f25d-8c945b335bb0@collabora.com>
Date: Tue, 4 Jul 2023 12:25:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v6 1/8] dt-bindings: power: Add MT8365 power domains
Content-Language: en-US
To: Markus Schneider-Pargmann <msp@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>, Fabien Parent
 <parent.f@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>
References: <20230627131040.3418538-1-msp@baylibre.com>
 <20230627131040.3418538-2-msp@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230627131040.3418538-2-msp@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_032552_746779_617854EE 
X-CRM114-Status: UNSURE (   7.48  )
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

Il 27/06/23 15:10, Markus Schneider-Pargmann ha scritto:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add power domains dt-bindings for MT8365.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



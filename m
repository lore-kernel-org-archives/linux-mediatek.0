Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0CD1C43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2026 16:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1EJKo9UZk1nbA1V5e3Sc7KHXAi+s10Fhy29nL6iSjQY=; b=BW0bIdP3RxOZgNd1CUL9Id/pHE
	RATsS3N8g6jc6mrm5uU49USVNIvTEYQeOjyhsyQRliusNADQOykEbquQ3IVKN9cUm6UWLJQK8B2mR
	k8cFQkA+WKI4HSB26lMQCcB4Lit2wofTO7mlheDndFR02JxWvldYlyGLZffxD/YXtlemIemuzt5+T
	Eq7Za1HklNX2HbWMHDT13C39HGe1irIHyEYOaITbf82OMb4T1NU8nGVRPViOLw6T6BbFGRJdbinFQ
	xxzYVbELE2ZJG3g0NagtHjdGCy+RRjzTHgaQbFUBCtk5MFaBNSr1s5rOVv6bN5N71LcDXVXwU9Uiw
	3GT2xJ0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyE2-00000002d2M-3lpf;
	Wed, 01 Jul 2026 16:55:50 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyDz-00000002cxQ-1JKn;
	Wed, 01 Jul 2026 16:55:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782924945;
	bh=y7gtTI0ydq98AZsQ2d7PtGJojxoKiDUQ/aGW+YI8xuU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D1Ra6Y3ScH0xOht1DNftMgZndiCg7oBVferRNeiE0ZrnhpWK4ZS6UzHCCJKys6PMJ
	 bzbyH2rTDQ3wyiq+hanKMiRfUyGfVHTWovIDIPuufmE9QOQP3vtYd0ge79mwOVPRer
	 Gb470Q/pgc/EWeKmR6du/ANew24kWcsFF5tGSyY6XV4uyVOIdjwcBwC+OBxmejgcOw
	 GbXJD3tqTuDgpTkH1Ug5GzfC09goJS4/SDh3jxX0/U9tuTt0/IOm4PKqJYl+FIhChK
	 aMB1sIcM8cGSrm9Ps/ZvNWEyiLVPOL4FkqXJwmue4zHSI6B2rho99CxRwIBFr9Am98
	 7t2asgpe4Ft0w==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D93D817E0CD4;
	Wed,  1 Jul 2026 18:55:44 +0200 (CEST)
Message-ID: <94632030-6204-4403-af8c-13aca3916857@collabora.com>
Date: Wed, 1 Jul 2026 18:55:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: serial: mediatek,uart: Add compatible
 for MT8189 SoC
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260701-add-mediatek-genio-520-720-evk-v2-0-19d5da4ef984@collabora.com>
 <20260701-add-mediatek-genio-520-720-evk-v2-1-19d5da4ef984@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260701-add-mediatek-genio-520-720-evk-v2-1-19d5da4ef984@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_095548_371949_FB4A7145 
X-CRM114-Status: UNSURE (   7.47  )
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

On 7/1/26 18:35, Louis-Alexis Eyraud wrote:
> Add a compatible string for the MT8189 SoC.
> The UART IPs in this chip are fully compatible with the one found in
> MT6577 SoC.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



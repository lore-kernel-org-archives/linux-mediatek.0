Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF71D1266D
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Dec 2025 06:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9aDPLWk/OgQOeUSFQ764uKQUG6YhHel40mSErpACxzU=; b=NVpnU8N3d++yxFehFI0UXoDNR+
	7SoUenXmT/RBJHD7GvD3Q7khSc+wEEgh01xVKyzCSZppPrAGMd5Va+FZQzBApw1lGwR5GZmrOAIDJ
	7PuwJOnQswK+ySUkBzjeIFHsx71Dxqv+U+s7UoczVg828++hriJuDISx9HEqA3x53oAkK28VwcPcW
	TWcpaam3OfzUFneBzJ9Uk89n0H6sjWFK+hW5m7e3hLP2Oos39Oy/nr299+6k9NgOrXNitstT/Jb9h
	whkVAqoPagCwnyyyzLF8JmkLDNVZ3tB3ey20UIj3c5FBelh6u5kaNFC2JNf0BUhqZa7CVdiO3Fv5f
	GUPzPqtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQgmN-00000006Dtt-1C2M;
	Wed, 03 Dec 2025 06:55:59 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQgmK-00000006DsA-1U5N;
	Wed, 03 Dec 2025 06:55:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764744954;
	bh=Jr3cLN07BBBACpo2PlbpyKSvyKJvAvyoTJy/BiaPrWw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NaO9rnjTYoJeEBZ+ro4jHNYOVm1U6K1E5lujJy7HHDQJk+hmfxL/wbu2J4sXNzI5M
	 umTA8mPn91ULLAi5MhVgUY46aq8OaHMIz+51r6ImtHDAb0N54q4i03Rjc6CLrfAUy7
	 UahC+DjeKR6ZehQlf5Ssz4IIGbsG9sKyfdJTjISqDUQ/rP+joyT7OBKaFkahr5GLwZ
	 RxKKtQ2n8gJtYHPm/jtywhrYhqa+MJ4D9EGU16B0887Y7BaygUAQbcpNOwk9MVKiYQ
	 /18I8NSPM6CeZ+nK5saSYYYEtpi/ROHtso+2Rhen4D5QP0KIrx0QTEpKS8WAkl3NMP
	 keG00c9V3X7qA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C1B3717E0610;
	Wed,  3 Dec 2025 07:55:53 +0100 (CET)
Message-ID: <81ea7372-9172-4ee5-9a90-66cf06c40062@collabora.com>
Date: Wed, 3 Dec 2025 07:55:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindings: vendor-prefixes: Add Ezurio LLC
To: Gary Bisson <bisson.gary@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20251202-review-v4-0-93f5cd2a0d4a@gmail.com>
 <20251202-review-v4-1-93f5cd2a0d4a@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251202-review-v4-1-93f5cd2a0d4a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_225556_580976_8B7A6D7A 
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

Il 02/12/25 23:08, Gary Bisson ha scritto:
> Ezurio is the new name of Laird Connectivity after it acquired Boundary
> Devices.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Gary Bisson <bisson.gary@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




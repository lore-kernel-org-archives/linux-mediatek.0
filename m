Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46528C77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jun 2023 07:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mCCv9YpqXjYWeHlIxqrnMT+plJIo4mhPlNtlnaS8TJk=; b=SXPj58QqilFUvoO3xHqD/o/lDX
	AqxHT8cxgXJXDNPgZoQqvZrOtiL4XiUs54mecfuQQVh3CLyg/fYJSfVHC+GyoLqbni3eYFccjEQWO
	actwm6mHULfekC6rycy13eyFkACqOL+l1k7hh2YR9PD8nn1iC0Yfnd/Xm1vBagiylI4ass94XUuZW
	xqrhg8PqVjv0+3JyMCozVpK38AQeWVm93+McKEctrzSRm9iHPHzH3uyY7Ao+N6BjiU0iOPDD/9sJB
	y8HpyYcsFcZeFu3BETSf4uxbX1YB2JPm+8iz8Z2mDfmGoE74Xh6n2Ra/X2croX/D1BiozicYGHT2k
	lt2x3u5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6njv-004lnz-0Z;
	Wed, 07 Jun 2023 07:37:55 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6njr-004lmY-2N;
	Wed, 07 Jun 2023 07:37:52 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B32C16606EF8;
	Wed,  7 Jun 2023 08:37:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686123470;
	bh=gIcMYp3O7FdAHtN8BtUN+DUj+kni/8m9bxwj2IZrZl0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UMn2Bo0iiBsXGoBFnTlJWQzYjlpKhaZ46hBT+eqlVyPvbxPloNjxFiy4KgHWAmMl8
	 dAA8OuyOj6QPrT1RcuzIFTs2nMgdTo7fOuK3Ia2C3evaUk+XqpfzsmK8iithC5fSfd
	 L2Kd56dqVp6iiuMSvGC3CEKHATtX/72SRahedJYz5H7I3uHoKme1WWgdcSawgTWf97
	 RxkFi6VJAWWTqVzH19VBxR98Buellb8egSQn2qoMorfEeOwH+rReq6zx/69kfugWDU
	 JF2ljdYdSHwuO7KGm5+W8bXleU+lzoJIEbIemJwejCIaas5aE2hzt6DbsrLwCl151a
	 Lpv+15ZBo0ozg==
Message-ID: <348ff172-4a29-9dc1-3bf5-0abf86d64acd@collabora.com>
Date: Wed, 7 Jun 2023 09:37:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v1 2/6] dt-bindings: reset: mt8188: Add reset control bits
 for VDOSYS1
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>, Fei Shao <fshao@google.com>
References: <20230607061121.6732-1-shawn.sung@mediatek.com>
 <20230607061121.6732-3-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230607061121.6732-3-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_003751_902498_59AE1466 
X-CRM114-Status: UNSURE (   6.85  )
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

Il 07/06/23 08:11, Hsiao Chien Sung ha scritto:
> Add reset control bits for  MT8188 VDOSYS1.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




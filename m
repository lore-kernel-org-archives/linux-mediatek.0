Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C53FA3742
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Oct 2022 13:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yrN+ivmRem7KSXNMotnARkTAHEinvOpTvXXPVTXbxHo=; b=1dpEJ+HjRX+Fj/hdJbSa98ormW
	1l3WrNvrRkQOsR1aYHvYegFUc3jz2Fm9d8GVLem0wJykU8fofBXe7d+GHndMLIheCtgd2QB++1tHS
	r3/u8arigJPnVkKtK7G2sgoOnyVq6wXtEbBLQzgX3p9DDdV0knN0chZBshxpGJhEuit12gcm+Rhia
	XJJK8ttksbCoLtrPwUGyfuV7q4hYR/ZlvrZca85POeDdk/pg+CkKBe9mJpL/uDxIoIMwxXb/ZeBm+
	GLfFUJNfVNRG8ZzX9JlaKgYakqnCKzUB5vSR2YJQWd0pv23lDdH/MaIvhUPQVk2KsM6cAU9U3xVjL
	I+wOIxLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opUfm-00Bxz6-GU; Mon, 31 Oct 2022 13:17:50 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opUfZ-00BxiZ-FJ; Mon, 31 Oct 2022 13:17:38 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 362D3660036D;
	Mon, 31 Oct 2022 13:17:34 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667222254;
	bh=ZmPmZv72wbYQvxzOvTCOXp+TPJj41VSYJO29iqOZ//o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KYROdDtJRqd5mFhg8RKdHIF6Fh6pJCaZ0IjRgBZZyvg1agyrVjRmoCYbHYeapj02g
	 3/oiCJzKv0+OU3pNDx7JL7HCml7gYzWJX+2fIokgSlg47GQ/nvZZeJ+Blinpp0DCoO
	 C3c5VK7AF2H7sHZfR9RYU9OOH5g8gzaCc6XNostRPLqrj+OFc18mIg10MHJ+iWk6lK
	 CSD5PruhyEthiTQA1B+WpafUme0VGm/2Y2z200hrF1lfq7z52sjCNBig98NnbHY/Pf
	 59+J5tH/g3v9l1B72StI3IJml8vAuJOOoGFaBmYcpJYrMqC0vvAJDGm5rUCB3EfMqM
	 18rr2tSW0gg3A==
Message-ID: <bc2e7eec-d78a-dfc5-b7f5-cf5bab001593@collabora.com>
Date: Mon, 31 Oct 2022 14:17:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 2/2] dt-bindings: mailbox: mediatek,gce-mailbox: add
 mt8188 compatible name
Content-Language: en-US
To: "Elvis.Wang" <Elvis.Wang@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Houlong Wei <houlong.wei@mediatek.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20221029105017.20734-1-Elvis.Wang@mediatek.com>
 <20221029105017.20734-3-Elvis.Wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221029105017.20734-3-Elvis.Wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_061737_667277_F216400A 
X-CRM114-Status: UNSURE (   6.84  )
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

Il 29/10/22 12:50, Elvis.Wang ha scritto:
> From: Elvis Wang <Elvis.Wang@mediatek.com>
> 
> Add mt8188 compatible name.
> 
> Signed-off-by: Elvis Wang <Elvis.Wang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



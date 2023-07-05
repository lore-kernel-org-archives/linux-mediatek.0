Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213D3EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jul 2023 15:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v6I70kh7fSktez3qIdBUs0MY6DUtSkIGXiSWqS/z4ZM=; b=OnhDRyg64Ly2GbQOzxbcKRPI7U
	WGwLSPvaDflezNnlH5PrCoOX8yw9HXt7b5vpB6Mc2r7Rmq10qIcBwoO8MSyDsLI/VLYl9qzv9P8cw
	3DIIL1XVGOC+vLrZ8yUvdjPDjILOB9UVPKIr6UTDEGvpnzK5qyqsHfWrqeR1dMVzVS8FlEu+P5lbu
	VOKROw24PYTDDkfcW8WaDkMDu6XzyevtRWS7MopfxIuPLxYulGj+DUQKOFBxWvpgtMmN2IOhnvjNZ
	m7NU5itXH8kQ1/Paym9+bB6yMrM4tLsqSCCKq0jvFCA3cU9Cq+tm5IXgbzSGnp4gWvPrhcpMina4C
	13rImvVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH47n-00GHK7-2d;
	Wed, 05 Jul 2023 15:08:59 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH47k-00GHIH-2Y;
	Wed, 05 Jul 2023 15:08:58 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 20F2A6606FB9;
	Wed,  5 Jul 2023 16:08:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688569735;
	bh=DAB/xdBSvdk3RQQGk/co/EsQruolCJBIE0IeITasuzg=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=H+RuK76CTC+QqMt3GE9bTfdoI5f9y4aLREMsq1fvrfZh5+GCQMW4zNngSJ5QLpp7f
	 7T7uwV6eN9jqj1uGVjqitMbqfzo/o3ki7ZarLD9u6SpbOsJR+CJZ5kIqnyCAcaOYBm
	 fOc6XKowB0oZ/FU40d2ehg6FfjCyOl7SFOB/ybOwg+X/xTxvd5X5eC1R3cl2f7aI+B
	 S+Qxir/ZtCWmpwlUCnSRCNrdUhhLh10/BfpYX+qPNlDGkfIfBpItNOuLN+0dMKZN8D
	 Q4TcoBth4YdZwPKkZ/lfiOcXy8NxZ8aP92LYwwVywrJGQ/sAPOiJw6dfjrPbb+bKiL
	 hfFd4a8pHykAw==
Message-ID: <09f599b0-acdb-e946-3aab-27f9dbffc3f6@collabora.com>
Date: Wed, 5 Jul 2023 17:08:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: add missing space before {
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230705150006.293690-1-krzysztof.kozlowski@linaro.org>
 <20230705150006.293690-2-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230705150006.293690-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_080856_958804_DC62781F 
X-CRM114-Status: UNSURE (   7.41  )
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

Il 05/07/23 17:00, Krzysztof Kozlowski ha scritto:
> Add missing whitespace between node name/label and opening {.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF63ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Aug 2022 07:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BHFzKw/sqCREjnMUju9w+9IlBZh0I5OKgGpQqXGycpQ=; b=iR84T/itKLvqPqkhEsjOp+dCXK
	7u0g+WJ2mxFvU6TAPCeHDavvqo15YcBX7tdUvzsGCR0/QNVRCwB3tvdMbVe9Q3OuKe5WcIkb6+VpC
	MGyXrqk+4XM7pAuSpEkm22tzYkPvCW5CzOxmnEhFfqmmlD2AvK+D5L7ZRSbqIlpiYQybTxkratKfx
	E1c6ucMd7856y134ffzyQlCJskb01kP0ARe513vDczXsQ5dBQtmuTlN2endpAnr97aIfx7myk1uaY
	/w/dEiS2wi9lYCMzPoWdYHOqTfhJ1JmEQmYYd/vvoqK9gzSKB26gaHliBsfD6uEOBL3qfcutyHby8
	pgp5XpmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSw6b-00ExnH-L1; Tue, 30 Aug 2022 07:56:17 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSvzo-00EuRf-9U; Tue, 30 Aug 2022 07:49:31 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 686806601F01;
	Tue, 30 Aug 2022 08:49:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1661845755;
	bh=ZtcFXim2qq7Y5hMJ+YdDBhB84JBbL99ub5L+GYg2dh8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LFeLUho0SjjplBBxWPqOqI+WNcbEf0dHrzy9EW7kzePaGPZJ5CsFWprHVa8eLbDu9
	 HhHz9tKLM64lYNcTcW9yP0h1EpdbsmCoIjcrg90kCKS0+oYS2UWwZuK1ptqH4BIwBA
	 JdDkLMB8o+w63OOGvzREOnwD3alI16HCrwDhRIV1UOr3ZbxmF0zylfdsUgZlnxAXBZ
	 LmeEcNRw+VVKc3AP0S30IdLAs6nO7NkkA+4RYT2iyrbWjnLxftsC5kgk8RcYi+cYKf
	 xW4gK1ntZMvCPPupmrb/YrgZ9AayF4/fMZuM2tij6FOqnCzZpV3nH9Ae6FJUbgcijt
	 B/WQ+7RYucKIg==
Message-ID: <a209aea3-bf23-4670-91d0-e7f41ac57833@collabora.com>
Date: Tue, 30 Aug 2022 09:49:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 3/3] arm64: dts: Modify gamma compatible for mt8195
Content-Language: en-US
To: "zheng-yan.chen" <zheng-yan.chen@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220830063929.13390-1-zheng-yan.chen@mediatek.com>
 <20220830063929.13390-4-zheng-yan.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220830063929.13390-4-zheng-yan.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_004927_470145_01CF7288 
X-CRM114-Status: UNSURE (   7.77  )
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

Il 30/08/22 08:39, zheng-yan.chen ha scritto:
> Modify gamma compatible for mt8195.
> 
> Fixes: 16590e634f1d ("arm64: dts: mt8195: Add display node for vdosys0")
> Signed-off-by: zheng-yan.chen <zheng-yan.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D080DC04A95
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 13:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ACJdSCHvtKNxXUZcY+F5UqeT4wYyLRGmjKjdLOdVqPQ=; b=tfpC7ifRPH3MSCJ4KiwhH0gBs0
	Gdcj/r49YC45VglP8mslxg3ayhpwOFEiUG6zt3bIv5LzH9ZuqXqui8TgBqHB/mUZ1GNCdPd0baZSt
	uEgz0QxtHEW48iuX4Ey7R5K5TU0bCxHII2i98YwssJmhBrcZm481gj+XEbQyfGJy/gJkAU+RjZ2Q9
	ulcYrrW+jon8lrTNtsFD2MuvsD0b+GJk79KJFmC2+ZM6Ar8eu0d5QoYmQw55/zaGyHEv8fweGxoF2
	0E0sP0R3UEkVgaBeBLe415URo6rGhY8LdnYi0q3quAvYpxXW+7S6nPD1MpGjaKO90hAyd2hDD1HP+
	tu3P2Vaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odWhw-00GPDC-VE; Wed, 28 Sep 2022 13:02:36 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odWhk-00GP50-6i; Wed, 28 Sep 2022 13:02:25 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 37358660036A;
	Wed, 28 Sep 2022 14:02:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664370138;
	bh=y5PLlxgX3Iexv58efRMWa8bC+TbN2PS43te+OORk4YI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mgHAZ/IiDaV02YnIl52F9VGR0hRBEtXBCwXUjNOhirIV/mr5QLUrBE+2O7A1AM6EU
	 8mTETUWiD3mAblou31Lwqj2LaAE75G3yUjU424cym73Qxfqmq3sx3+5I9BZQ6iDtHB
	 ZzB1u6f15pGBqPYPNDo0fehQeRIA9YCfEzdNyObHaVP+yqyuGksdJJtNJDpIPm+TtO
	 +lpd/09rf5e/DEdcKN2nHq3g8vEUUPYJ7e80JLrcC9SqstWJRyiWF6D8fc5bgEi9Hu
	 BZoq/41lF68xfQosN0vqCRIV0cTLB1sEJFEufmXAJAXGQex7vkXtGbza2cMefP2Dw4
	 aV5+7EeZ53RPw==
Message-ID: <9c5eee7a-ddf2-b251-72c8-0792f46b24ec@collabora.com>
Date: Wed, 28 Sep 2022 15:02:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [resend PATCH v6 2/4] dt-bindings: net: snps,dwmac: add new
 property snps,clk-csr
Content-Language: en-US
To: Jianguo Zhang <jianguo.zhang@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Biao Huang <biao.huang@mediatek.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20220928092308.26019-1-jianguo.zhang@mediatek.com>
 <20220928092308.26019-3-jianguo.zhang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220928092308.26019-3-jianguo.zhang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_060224_401423_A5C06E02 
X-CRM114-Status: UNSURE (   7.32  )
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

Il 28/09/22 11:23, Jianguo Zhang ha scritto:
> Add description for new property snps,clk-csr in binding file
> 
> Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




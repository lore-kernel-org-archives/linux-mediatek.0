Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D88CA0ECA
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 10:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AR2PId7d1YYlec/KSHhJ/Je5hHylpQP2AIsUVGBLYi4=; b=TSXWqqabjCcosLC0QP9o4INufW
	ofXohDHz6fYj1BDZphiMXV8C3aN2gcmRYqRj7SX9y4/ew+YNVbsKpUirrsaGIQrme+wiSKBrZdj6Z
	p0c4WuYdtbO50u1H95W47jryuf5UnOhJQQE0zkq6pHT8wC8lt5hZtyJ+mdLQ58jkSJE8wWqrzLk8u
	4nMGWmodIoxOfN3AcQiUWE5b/GmycyBw9xELIuHDqg58VIHnlQNl+99iTU06BRI0QKLxTxuK7qLhm
	W8IaiMADypGxEwgdiaYudD/kNOG6HEWf/OZ+M+X0YDNPz6kN2XkPbUIDwYpaglvJMyNE8N/H+UIPX
	PwmJTJ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg0Ek-002qq6-2O;
	Tue, 12 Sep 2023 10:03:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg0Ef-002qnS-2J;
	Tue, 12 Sep 2023 10:03:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=AR2PId7d1YYlec/KSHhJ/Je5hHylpQP2AIsUVGBLYi4=; b=MrNNVB4fq2iKS7tYgxu9vyx5U2
	OYL2NWe10INHzhgx6I0UpaSCvkaiTaCHSSWam5idHwZHUclcJIq7v6erRtWdpBefSpKMxFcHrtLBH
	tOLnfaYliWm9SubnGbgNENTo1ScT3O+87Ti5QdcYj8ZcZDPBd59RlBWNXhziEjmihQ4QBSzMPIy9W
	G8OuCP8EJ/Bq66i6zAduoY9iAptjSvtufTtX05JoCO/fpj+/oblINA49rSZ54gHlUjGQTyBAcMAFH
	lBWxnsy9BqKCfLB60DUZdpl0Q9i9+Ecg8TRZzBQualr9tttZiPU+dAX/mKhXF8ok/Le2pIbxMB1Ad
	XLOUPqOw==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg0EU-00611W-0E;
	Tue, 12 Sep 2023 10:03:08 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id ED0836607323;
	Tue, 12 Sep 2023 11:02:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694512978;
	bh=4xz6Szx2cylj0/jy1E9nlRbuyxqN2NyY/h3Y3/JNrd4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YN3r5AGSobwaP8QJ50wV4fViTzFF4D0sOKkXRMFHO4zOSHNEJqZzkziZ8qYJZvZJm
	 5k8boUM7fjL6JCe3pYTBMTZ7/TAkjE9QnD4KINDv/AmlUTNI8n1R2ZboYsUCJCkUmq
	 n4C8TkeTs07cc6Nqu1h83t1LoR7lbZTFMSM6rS7jVVjFN79Ekw3wFBwbzL7ztc6cM5
	 q65aPqwaN1xbgNfQB1/w9EvmqBV0+zG57PsvFbJXU1DhJshiBSn5S6IBCOFn6ZBZa3
	 jewSxUI+hvVTx8C+5uIiBu67SdCLg9NMLb+Z30Z8MI/vHDp7COfT+pAje2B9owSdPL
	 r1xg0+3QULqkw==
Message-ID: <cfbe3332-ca36-613a-7ba1-f0c17da5cbe9@collabora.com>
Date: Tue, 12 Sep 2023 12:02:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 2/5] clk: mediatek: clk-mt6779: Add check for
 mtk_alloc_clk_data
Content-Language: en-US
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, mturquette@baylibre.com,
 sboyd@kernel.org, matthias.bgg@gmail.com, wenst@chromium.org,
 msp@baylibre.com, amergnat@baylibre.com, frank.li@vivo.com, robh@kernel.org,
 owen.chen@mediatek.com, mars.cheng@mediatek.com, macpaul.lin@mediatek.com,
 cw00.choi@samsung.com, u.kleine-koenig@pengutronix.de,
 wendell.lin@mediatek.com, luca.ceresoli@bootlin.com,
 kevin-cw.chen@mediatek.com, ryder.lee@mediatek.com, wenzhen.yu@mediatek.com
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230912093407.21505-1-jiasheng@iscas.ac.cn>
 <20230912093407.21505-2-jiasheng@iscas.ac.cn>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230912093407.21505-2-jiasheng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_110259_759213_6F58D0B4 
X-CRM114-Status: UNSURE (   8.51  )
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

Il 12/09/23 11:34, Jiasheng Jiang ha scritto:
> Add the check for the return value of mtk_alloc_clk_data() in order to
> avoid NULL pointer dereference.
> 
> Fixes: 710774e04861 ("clk: mediatek: Add MT6779 clock support")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




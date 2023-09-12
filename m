Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787EBCA0ED3
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 11:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2i3I1X+4Fx86xDUOZC46T5gqNZBA/9GqlhFqUY2tgp0=; b=XWm5j8V7NrhfrNtMQ46fM27Bgt
	UrXWEF/INRw58hw+pxe339fPW/GHF4k3rMYaUyi+XEsw3yAaoLNmQcSg6niERjSl5vD9I4EfFN5Qa
	5EHdbiGmpJJFQHAupgG8CJy2MluQzjUNGc1kctKNQamP7kRijwvt24cY2k80wHHqCf+1tDXfnCbIC
	ENCmuqBveCeYf1Pu1Ph0fhGDcsShKzEx5bwzs0z4hY+K1KtYdX3/EROSWXvoOcGmU2kbWEy24pDDt
	rz19DvhFXBXP7YrlS+NNfW8NSB8qrohN2uIKPdjiybfzzu0178B3AvSo/uAyxul/KHOdfhYTc+5K1
	2yFysOQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg1Mc-003Bcc-1k;
	Tue, 12 Sep 2023 11:15:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg0EW-002qix-0q;
	Tue, 12 Sep 2023 10:03:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2i3I1X+4Fx86xDUOZC46T5gqNZBA/9GqlhFqUY2tgp0=; b=T/J7fRSyZWB/rH0fb6ft6vh4kH
	Uq3g7EAyPJ2xgqxZr3DBHsbXNpjD39J7Cx7lCoDJm8QhDEmlPi/ME+m8dkkt7SQQymDHSWE0/DTtc
	S+f0pD6KaDzQz2YzMIDTFySz0g/CfugXEpQMzAPKVfyehNAd4sE5Xx/awn6MZGB6jpTcrk4PZ+/zC
	7ZNJU3bBf6PtJyrvUV6lBvRg6LKV3dfq+nfDMnlMK+WHSAp7dd+T1cUcfOOP0U2jbLVO8X6kocXgo
	HO2lUCZ1Z+DIg1BUyNWR6s82HgkiTVorbAeMVyglLlL8jXdou3+/f+9IqrafT5JrpJIJMucw8NDZc
	EMrD0oRQ==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg0EK-00610R-0O;
	Tue, 12 Sep 2023 10:02:53 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9404D6607320;
	Tue, 12 Sep 2023 11:02:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694512968;
	bh=KFTpQC/A7VUsLib15J+EGZdvXTKuNhYXeMQivKrdSI4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f7lQ+rcyz1WTNWJSyX9xaVR2Svj4OKgMcYb3LA7VfhJ9aeVtWS/v2TdbfyqX2tqPl
	 LuuS5QZGx8DMh7e52XLiMDQedv1dGOBTLSa+5TEmTnlhH01gRt1fBMmkHvoXEGV2ll
	 W44qPWb1U7nE1tzd6w+Ni68URPxJOU+3oYcBDBYqC+MSy+0ZMF71HDT46mXuk8IKsi
	 kWunlPSBN7I5f/IElZBVIJBQ86q0I3e+9JdtGC378XbsMNaQngc1DyLdNoUxrMuYgg
	 k+KCk71MVIA5XEJ866e6+zlVZIuRlXIzlJXhBmhftm68h+K8K74Ttc/J74heAfk6Tg
	 45g98LuUy0Ipg==
Message-ID: <caff237f-0f84-81df-e866-e49034261f9c@collabora.com>
Date: Tue, 12 Sep 2023 12:02:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 4/5] clk: mediatek: clk-mt7629-eth: Add check for
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
 <20230912093407.21505-4-jiasheng@iscas.ac.cn>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230912093407.21505-4-jiasheng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_110249_711175_AF138469 
X-CRM114-Status: UNSURE (   9.01  )
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
> Fixes: 3b5e748615e7 ("clk: mediatek: add clock support for MT7629 SoC")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




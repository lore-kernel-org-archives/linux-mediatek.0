Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 052CFC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 09:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SRbVSBSBL2pSD4KGSJ0k8i8PSa4VjzUsghs+f1PD9so=; b=aIBn+eaWkuJX39iJzxaXgrnJcw
	9uuT8JCMgb+wna1Rhr/Zhbm2StLSHXeoIcVCq7B+YrgAJ+QXgiie6HFD0ntd/udutD2xmmPKObQlK
	RNLb4BeK5tf2KyhDyABOBzIko1FuBraekfcUENEou4Jc51oDGH7QxXAUkcpoyB3oCwKiJSzq47+fv
	vQBntRqH8FAZ1MMAxWpq/Wne9w3kGldh6wOgzhvNxjhcwVJdWqg7AwKVX0BF7PhAFwA7WYUn3aJd2
	rnDS06rTl6B9DbytCEsC6cI3H+KnUH9fxRfh3iclwudqpXMLONH6Np4bL8+2r4CAZrvtvX98CAG2I
	k4vHIgsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ousRX-009VG6-0n; Tue, 15 Nov 2022 09:41:23 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ousMQ-009RV8-Uj
	for linux-mediatek@lists.infradead.org; Tue, 15 Nov 2022 09:36:08 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 84EE86602A3E;
	Tue, 15 Nov 2022 09:36:04 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1668504964;
	bh=q+ZtEe2gAbMLgo/SoudisOAWtVyTQ9OSYRTvGEKSsjI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U7fY76wCqB4lozgw/vz8QjUeMGvcUo1481/cQlM7woHGM7bN6CKwZWg0dsRgGTInP
	 Sd3TEp///hx6oQ4e4clhfHB8VygwN7BE8YlXBckr7/AGgklS+lTkODDxT+IKdKVZ5e
	 /FycGnobmAKnUMooNazqcLi2DMF8BrMdE8YLTnStqA0oaspvmET9U0/1Yi/fWUN9aL
	 pZBLKOuvFqsyG/kzbY1tYQzihSqqKgs+UoMeZ58cyONbm9hmDCh+SDwgNVClXj5xAJ
	 zeAD56daz4WwkpDL02qcTFcX9fLgeSkjhzJUvKAUM9gntmQxGxro6/g7i2UTu6OJNV
	 8pkeJlSQggWhg==
Message-ID: <f38db97d-3c52-8e09-3c47-ccb62cb15ddf@collabora.com>
Date: Tue, 15 Nov 2022 10:36:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] clk: mediatek: add mt7981 clock support
Content-Language: en-US
To: Jianhui Zhao <zhaojh329@gmail.com>, mturquette@baylibre.com
Cc: sboyd@kernel.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org
References: <20221115021039.46642-1-zhaojh329@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221115021039.46642-1-zhaojh329@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_013607_186726_52DA3E2A 
X-CRM114-Status: GOOD (  11.31  )
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

Il 15/11/22 03:10, Jianhui Zhao ha scritto:
> Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>


There's no commit description, and you definitely need one.

> ---
>   .../bindings/clock/mediatek,apmixedsys.yaml   |   1 +
>   .../bindings/clock/mediatek,topckgen.yaml     |   1 +

Documentation/bindings patches shall be split from this one and if you
ever ran checkpatch.pl you would know...

>   drivers/clk/mediatek/Kconfig                  |  17 +
>   drivers/clk/mediatek/Makefile                 |   4 +
>   drivers/clk/mediatek/clk-mt7981-apmixed.c     | 103 +++++
>   drivers/clk/mediatek/clk-mt7981-eth.c         | 138 ++++++
>   drivers/clk/mediatek/clk-mt7981-infracfg.c    | 323 +++++++++++++
>   drivers/clk/mediatek/clk-mt7981-topckgen.c    | 431 ++++++++++++++++++
>   include/dt-bindings/clock/mt7981-clk.h        | 253 ++++++++++
>   9 files changed, 1271 insertions(+)
>   create mode 100644 drivers/clk/mediatek/clk-mt7981-apmixed.c
>   create mode 100644 drivers/clk/mediatek/clk-mt7981-eth.c
>   create mode 100644 drivers/clk/mediatek/clk-mt7981-infracfg.c
>   create mode 100644 drivers/clk/mediatek/clk-mt7981-topckgen.c
>   create mode 100644 include/dt-bindings/clock/mt7981-clk.h

...and your Cc list is not as it should be.

So, I won't review this patch as there's too many wrongs... but if you really
want to contribute (please, do!!!), you should start by taking a look at:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html

Best regards,
Angelo


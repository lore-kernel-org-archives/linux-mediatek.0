Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC69C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Dec 2023 12:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VQ9+X8UPHQ1C4KdlT7sb5rWe9T6k+4CZlMLjRudRS3c=; b=TVfWnvuEfbTzs/
	aPgCWyJ7btvc7Hqmc2Py4hReS4gU7XjlicErYOfXT0u+mgLrrPZG98upKuM0EcX0mdAd7S4FaIM42
	uD2mKKehvTaRDY9pWSYVVX3MD9+RUmNxG8V8/vphF/a0RuU/GgdZ3a7ssmxxKMZjByD8wS9ZgV8Se
	OlvXH0GFZ063NyGv1yn9kIFBJS5a7AOoghAy8xV0uE7qcBvPJnObEgCtCqxQ6jjN9bjUb68QzQtoE
	2I/fZbYEsur2CwRzG6Pr5yMIHQ1lOeiRNkmTDRTt7snpZEone8w742e18NdM3um5VE+GExJH08b3D
	6Rf58/Dve1wNTm/xQCOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEqAI-007mPf-2l;
	Sun, 17 Dec 2023 12:22:38 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEqAF-007mOW-1F;
	Sun, 17 Dec 2023 12:22:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 296A660002;
	Sun, 17 Dec 2023 12:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1702815753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VQ9+X8UPHQ1C4KdlT7sb5rWe9T6k+4CZlMLjRudRS3c=;
	b=P76naHpD1ejJeFeHEeU02JVcJ4Mw7kDeqFc+q3LbT0mYGVKMQErzpJ6D3Ud0Eyd8nESW3Z
	OafvuwKIUMqp/3NU3DNN3zGrrgzaDXn4Aheh4nWBsg0LvIgH250awevxCF2IkCz3cg3S98
	18iRVuQfaaxwn/xSU1BC/SLzssPafOZrS3Mkx4dZK9FC/ZXFDM1gTD5zoAdL68hy9VmlOY
	TtZ5zy0a6hjlcaB/sTzadHUHVLi+dc6/WsN61tIEW0svDyaXFkxjPWiv+C8SqvajS2YZFp
	wc4bjs4FPpKKuShXmGHbtZBidjGtHUUtPMRccgUZC2UvVgsszl7DTyHFBCDBVw==
Message-ID: <c3a0fc6a-825c-4de3-b5cf-b454a6d4d3cf@arinc9.com>
Date: Sun, 17 Dec 2023 15:22:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 07/15] net: dsa: mt7530: do not run
 mt7530_setup_port5() if port 5 is disabled
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
References: <20231118123205.266819-1-arinc.unal@arinc9.com>
 <20231118123205.266819-8-arinc.unal@arinc9.com>
 <20231121185358.GA16629@kernel.org>
 <a2826485-70a6-4ba7-89e1-59e68e622901@arinc9.com>
 <90fde560-054e-4188-b15c-df2e082d3e33@moroto.mountain>
 <20231207184015.u7uoyfhdxiyuw6hh@skbuf>
 <9b729dab-aebc-4c0c-a5e1-164845cd0948@suswa.mountain>
 <20231208184652.k2max4kf7r3fgksg@skbuf>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20231208184652.k2max4kf7r3fgksg@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231217_042235_684309_1D6C42FD 
X-CRM114-Status: UNSURE (   9.27  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, mithat.guner@xeront.com, Russell King <linux@armlinux.org.uk>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Simon Horman <horms@kernel.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 8.12.2023 21:46, Vladimir Oltean wrote:
> Hmm, maybe the problem, all along, was that we let the -ENODEV return
> code from of_get_phy_mode() pass through? "interface" will really be
> uninitialized in that case. It's not a false positive.
> 
> Instead of:
> 
> 	ret = of_get_phy_mode(mac_np, &interface);
> 	if (ret && ret != -ENODEV) {
> 		...
> 		return ret;
> 	}
> 
> it should have been like this, to not complain:
> 
> 	ret = of_get_phy_mode(mac_np, &interface);
> 	if (ret) {
> 		...
> 		return ret;
> 	}
> 

I just tried this, smatch still reports "interface" as uninitialised.

$ export ARCH=mips CROSS_COMPILE=mips-linux-gnu-
$ ../smatch/smatch_scripts/kchecker --spammy drivers/net/dsa/mt7530.c

   UPD     include/config/kernel.release
   UPD     include/generated/utsrelease.h
   CHECK   scripts/mod/empty.c
   CALL    scripts/checksyscalls.sh
   CC      drivers/net/dsa/mt7530.o
   CHECK   drivers/net/dsa/mt7530.c
drivers/net/dsa/mt7530.c:217 mt7530_mii_read() warn: call of 'warn_slowpath_fmt' with non-constant format argument
drivers/net/dsa/mt7530.c:454 mt7530_setup_port6() error: uninitialized symbol 'ncpo1'.
drivers/net/dsa/mt7530.c:868 mt7530_set_ageing_time() error: uninitialized symbol 'age_count'.
drivers/net/dsa/mt7530.c:868 mt7530_set_ageing_time() error: uninitialized symbol 'age_unit'.
drivers/net/dsa/mt7530.c:2324 mt7530_setup() error: uninitialized symbol 'interface'.

Arınç


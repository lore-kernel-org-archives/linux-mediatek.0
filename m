Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6DE3C67871
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Oct 2022 08:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OsEnGH97jGMao9f3i97ovov8kA6rD2I2/bEAUgMpJEU=; b=vPCsZTygI6JyxQWxlY5lu4ets9
	mj3MNHmb+ZE/zxBLRyGm8qiK+AsBYU9YS+EsaoLfw7TAEIxPQRWh81isuEUaFXEny7b2Va3qgzKl1
	oeIzHZRtE77E9IdhfmRMEZz7qnkLvRdsL0UCBo3eNBP1XCToReUhB1QlvSOaa/6KksMnhVJfTz2tx
	PEiSE1YzJzSBapN5beRveNlY34FDjEN1CzyeIAxqMuWDw3awYwVV06u2rJ7sVACAIOP2P3iAFox6h
	gNQmbqKF/Cg2ffiptHQ5B4NXvblaCsF5uV0mTbM3AzxaIFlGsQerG1kSEjTSRHnaIX5ATE2vxFeKa
	PbjyWLPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onxt4-00CIZT-La; Thu, 27 Oct 2022 08:05:14 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onxss-00CIWM-Ud; Thu, 27 Oct 2022 08:05:04 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E5E8C66028BE;
	Thu, 27 Oct 2022 09:05:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666857901;
	bh=+smk67yhakV3hxipjrUTxVzYtY9GIM7JZQJ3ATTLcC4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fZyAlKQ9ZfkMh7FjaFL7A0bmOftuz1Hsmk/Hsx363FPFZHFRcuuylkKfKH1uRhy4U
	 M9c0lJm/xckvYQ/UdNlwWx1+FHx0mPKmXLdJkR9NJLy7B+4bCs5+doTLjUgbqfCrMq
	 VM9dThe+A38pfRr2zAr7rdr93yZCqFFo0Vsg/pnDifwROdlvaPESbFtQ+n105OfNAs
	 FIwJaVxvPuBP0ffeMs8Suz2uIGxSab1CPa8buiY7Uy6/I2yh8eaLPg7V2zWkbc96+v
	 YQO72qEr1VOU8voxRXja4sPz2zjg0x47pcf6b4bm1z9NMVCI4odbrH7nA9X5uHztFi
	 TzyMjTOfHDGHQ==
Message-ID: <bc89b373-8ece-8d58-6ab4-3e474d3265d8@collabora.com>
Date: Thu, 27 Oct 2022 10:04:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] arm64: dts: mt7986: fix trng node name
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
References: <20221026085144.107430-1-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221026085144.107430-1-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_010503_147716_7DB5842E 
X-CRM114-Status: UNSURE (   7.95  )
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

Il 26/10/22 10:51, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Binding requires node name to be rng not trng:
> 
> trng@1020f000: $nodename:0: 'trng@1020f000' does not match '^rng@[0-9a-f]+$'
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Please add:

Fixes: 50137c150f5f ("arm64: dts: mediatek: add basic mt7986 support")

After which,
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



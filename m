Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94679C3DA49
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jul 2024 15:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a0PoTqjxhwfvNPHYUca3cz7Fhu03ZaGvIO7gfFZZJlk=; b=fL67V763qNrxFzD4Ra0E67SAu8
	Unxozk7ZWiaJBoe8PBrxFE/f02tHlsWcD+8WxBCdGzkaRql4g/zuRyEn1mlIhseinVgBs8wz7JECm
	tU/rKKqrmULJ+HSX6flpucGmAkqPxdyjNPIHGHnqX5ds+MRPwBUP5ZhMz3nDMNC+8bTuXkv/tRjET
	L+DaZo/GWdy5VoIbHO5aoBa3DSIhuKvN6KNxf7bHbuIpkmQy7DwYBndaDv4vErhobq+0/ZduGh/RL
	N0ewxh9dVwGFVRRFuiahcUgSbANJLFqXreGdKeCnV4EfuLeXwkRlkSuojZJE6u8vtteld1pUZEv4b
	kf2SwzJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWH7m-0000000Cpze-0CFW;
	Tue, 23 Jul 2024 15:08:22 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWH7M-0000000Cptr-2ICT;
	Tue, 23 Jul 2024 15:07:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721747273;
	bh=/lVStPkNk6XMmx3e7OMYCyn50o2TQ7gMZ+zwB/HKA5o=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=awQ2ya2bSQM5g4rMsgBwjcHpedmVWy7S2vn4I/TlEgxgZmYVllKmGg5y/ecKYTzg4
	 VQmlGS1vEwbDLnPwgCjAsw8Qx7xjJYDMBeB4JrE4sIJcDYg/xWfYMSQk9GXlTj6dWl
	 sHi0on4OcVmNFC+fZDH77dfogZ2J8kwqHfJiEkrbSSknw2JxAQLK06Nkn4GQu1n8BD
	 +KgG6Xy4/R9SgtMJihlJve/mvtH2Bl61svU+/xRIeHLfGscvrfZx0UZcD5wZq/LTFP
	 jgK1kFazgmp2AwFucis9Ml2nLm+MKmtqx2jUHxwQu5R6IzLGsQImhpTXxGUKS7MO2i
	 aprAzUYDaCbHw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3B0D637804D4;
	Tue, 23 Jul 2024 15:07:52 +0000 (UTC)
Message-ID: <207e558f-6f36-43cb-840c-7548d04d180a@collabora.com>
Date: Tue, 23 Jul 2024 17:07:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: drop clocks unused by
 Ethernet driver
To: Daniel Golle <daniel@makrotopia.org>, Felix Fietkau <nbd@nbd.name>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <38559102c729a811dc8a85f6c7cee07228cffd3e.1721739769.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <38559102c729a811dc8a85f6c7cee07228cffd3e.1721739769.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_080756_926531_67FA7879 
X-CRM114-Status: UNSURE (   7.44  )
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

Il 23/07/24 15:04, Daniel Golle ha scritto:
> Clocks for SerDes and PHY are going to be handled by standalone drivers
> for each of those hardware components. Drop them from the Ethernet driver.
> 
> Fixes: 445eb6448ed3 ("net: ethernet: mtk_eth_soc: add basic support for MT7988 SoC")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




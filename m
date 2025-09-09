Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABF8CAC58E
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Sep 2025 17:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zV1mDqPpDW17ktwFRnc6MSEsENBzIp7XJuQ/ntSiR04=; b=PXsCaQ29ldkhIMNLKFzobJ8gnt
	N/RSDz6f/sbjBapzN5bWUwx67PW7CbJdpAQW5cC8JepYR9KPwU7r3TrwVKULW97affzKGLjvMpsOG
	FwN9nW383I2QOSSzAunQLR8hllf7ZbRDYmfC5NleJJorpU5kV77RkBnfGglWrdLZAh43UW7Tp+2fM
	F2pjzyUnowOnkQyx5j3MRrtfT9iBnWUEIG3mHRaHPRIAbnDEsXqCv+8NQCdA353jW6f7rE64+wzqO
	ej1xHLj27Pmy8p1zyxpG+W15Try5LyvFZ2f2PZMVshFRuTf4+d64CPXBW7m0SzkXgplLOArxCtV6F
	Brr7DmhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1v9-00000008mdx-3koA;
	Tue, 09 Sep 2025 17:14:19 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvw6I-00000006ZcA-3PSZ
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Sep 2025 11:01:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757415684;
	bh=/H0hDZTXJaQsF3wo+YdB4vDsf7w2WQqzw7+YSSGO5mQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E1ZG7ia1KW5AXN4oYkSA1kFv4IfwItMU2QZp8Ts6S/pd5Yeh9S5FPAC9hxoKXN8JX
	 yimYLavR90KmVHhWtlgN0SzB3iBBDt4//YHKm1GCWJlYSHePLfec7zmzhiCqYWLRsI
	 ym5hoYWLM8AKS1tpdNTqvCgGVTlTIrkmL6I1UOl74zXqtVho6B2yikjsF8HIeN4CaB
	 7Y3sMYxEOCjOF1UvHc7mGa7SEOmI0fqzdjtZsWS/DYDuzoxlXUmswXuRB+QB2PRjS2
	 3h5W+trWHueiuwH4F+W5KAF0KVvuAF1atVAnCt1M3y+p+W/nd3yRqT5Lv5uNbJh5QA
	 tlGmuUbKIHyXA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7F2DE17E0FAD;
	Tue,  9 Sep 2025 13:01:24 +0200 (CEST)
Message-ID: <58146679-6b64-4a46-919a-a86615765cec@collabora.com>
Date: Tue, 9 Sep 2025 13:01:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] soc: mediatek: mtk-svs: fix device leaks on mt8183
 probe failure
To: Johan Hovold <johan@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Roger Lu <roger.lu@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250909095651.5530-1-johan@kernel.org>
 <20250909095651.5530-2-johan@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250909095651.5530-2-johan@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_040127_010273_8677D0B3 
X-CRM114-Status: UNSURE (   6.20  )
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

Il 09/09/25 11:56, Johan Hovold ha scritto:
> Make sure to drop the references taken by of_find_device_by_node() when
> looking up the thermal sensor and opp devices during probe on probe
> failure (e.g. probe deferral) and on driver unbind.
> 
> Fixes: 681a02e95000 ("soc: mediatek: SVS: introduce MTK SVS engine")
> Cc: Roger Lu <roger.lu@mediatek.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




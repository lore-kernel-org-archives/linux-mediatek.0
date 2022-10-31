Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99ADDECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Oct 2022 13:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UXK6tGcHjDFvugmuVqAqiLp805ttFZrJ4Mi9HpSHGXU=; b=IOG0tWh/0U1E+EDIubwgPP3+uW
	fMXEARPamvgk5OMDMokgJG0TOK5gLGz9s0ne9/eYWXbbascHY0xwv5L9JBUoArm/V3361DhgN1rR8
	pkaqwmy4Io87PoH0X15PpGqvyZB5MVhH5a18sT4esR6csaIV7KEWbAwHoGMiorGRlXX5iphbLgFRz
	mshjshnLLYw3Lh+ndH5wRMqkFmp7V/lTsUloF4nYV6VDLSWFEkq0r+PDa31z2kUUmMVx/lGx4VaVM
	rNLmXW/Ryu5t7zdYJ9cH6cCawOTufRfvLnuhuvm5XRDZXB2qDWxR/EoAyDtzAbzXpyfU9LYioOKcw
	WcL+S1ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opV6a-00C7UY-Ms; Mon, 31 Oct 2022 13:45:32 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opV6Q-00C7R9-No; Mon, 31 Oct 2022 13:45:24 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3E7516602253;
	Mon, 31 Oct 2022 13:45:19 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667223920;
	bh=FqG5Q9Uq9BODSoedqBA3YlNqZjPSGiArJ7cELbg3dBI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q+BkQP4mwRLmQ1tdn6vLsPc96vlTiWTXoDR3oAn+hPGADvHLXKQ7xIQwCBGSxh+i5
	 0oppqtccMWm7GDIxLgq7STRH4DjocOKPdoEfhHcT3xHgmavC5P32fQDA7ySsgifCjH
	 HXk4HD8GMr50Ag3OuwcDC2rsJSS/lUjAaCUfY1wl1LpPOhimRmtLeuWk2lgixQarS/
	 UakTBK0eWkW+7XKlxjcnNcsm5MDDx3isM2maXebCimfBXi6fcbCaA69IcuFw3VE8vY
	 jR4BjhHz2AdIfevEvrFNoSjhIhIbqzr8H3fCHns4DPaUALb93eYIion+xmK9vbfKxa
	 SEEVtIi8/pt7A==
Message-ID: <5329430d-fd58-0872-50d3-b0558f6868df@collabora.com>
Date: Mon, 31 Oct 2022 14:45:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v3] dma-buf: cma_heap: Remove duplicated 'by' in comment
Content-Language: en-US
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: yj.chiang@mediatek.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20221028065533.23856-1-mark-pk.tsai@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221028065533.23856-1-mark-pk.tsai@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_064522_944843_5980A745 
X-CRM114-Status: UNSURE (   6.28  )
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

Il 28/10/22 08:55, Mark-PK Tsai ha scritto:
> Remove duplicated 'by' from comment in cma_heap_allocate().
> 
> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> Reviewed-By: Mukesh Ojha <quic_mojha@quicinc.com>
> Acked-by: John Stultz <jstultz@google.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



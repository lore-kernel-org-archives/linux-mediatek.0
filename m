Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 660B9C05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 12:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PogVn1gjLYrUlpRPnagtn+6QijLrO6vpa484dGdyr84=; b=WxsPkSmHll0gAAu1YsFycvrgMN
	SRN/F5IRWXa4f0EfxaymXH2pxM7U6t2+TTiyRfYdnqQ0l+/DgiGzMu/dQ25SAHG5UfS4tti0DKM/t
	VZrUB0k3S+XkcSflyl5zsfw4Dq+6edUriISALQxYGzSDOjfiOlCzqjL2e003wAQol5DlUzGbLbxcv
	kxykCeU4FWmKLYs5YNwbmcG3jPltUdRjXL754WqEEGzM/JGDnQLD2hVizF0oIBYQyvPiXG9UAKB+w
	W9tkLV8HqXzeuVwMVQsyVSjwfgXJ5L8QrTDvBGFNounngkdULNjXcmkg0pQN57vnZ7ObZvbBJJrZ6
	JasRA/3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQS4d-005aH6-NI; Fri, 10 Feb 2023 12:00:15 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQS44-005a1C-EE; Fri, 10 Feb 2023 11:59:41 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2BD4D66020E8;
	Fri, 10 Feb 2023 11:59:36 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676030376;
	bh=Tn9xYmtgar3kk3LWRQa6yUVsWWnVfupv+40dXvOCs/8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bYYziQjzfdrrQIoqwl2g2Mkj/IFOHUqyrfQsLVkTO5m4ntxbWh2LMGTs8AQQQyP2e
	 rIQzfL6yFjLuTipRQcy5jVv6i4DgwQejN7qD4bHMLrHCK3l3H//gBudKpmB7Q1/1rO
	 2OU2vigneJlObtFiydsmWb8n6GaQx0LVH403EtUsnX1ZOEjER34v1SecIYdRT3qBJn
	 DdxJYbiEJOyJHPwUJrEUV9wqDpliUWwkrM3N1JHVEQVg+aq6Ijx0/GoE7Mw0SbMEXE
	 +zgnXDGi99AGfah+gW3eJrtDFlyQW5UB0iw17PArEV7j5QE0+/hUWiNW/U308/Tyjt
	 1i+N9Imf+Qzig==
Message-ID: <7b381380-706f-1641-4164-58bd477c207e@collabora.com>
Date: Fri, 10 Feb 2023 12:59:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v1 2/4] arm64: dts: mt8167: Align mmsys node name with
 dtschema
Content-Language: en-US
To: matthias.bgg@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230209160357.19307-1-matthias.bgg@kernel.org>
 <20230209160357.19307-2-matthias.bgg@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230209160357.19307-2-matthias.bgg@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_035940_636492_DFF932B6 
X-CRM114-Status: UNSURE (   7.05  )
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

Il 09/02/23 17:03, matthias.bgg@kernel.org ha scritto:
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> The node name should be generic and mmsys expcets 'syscon'
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



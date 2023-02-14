Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4539C05027
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Feb 2023 10:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VE0v4yiFycADp1Gi8WNI7kBHgSVsHQiziIZzfnZ/ZEY=; b=sIrV79Ny37eD3a
	HlqlObOE8zU55ssNeBaSRCVDHMXOuNsmeEL0s10sPD3lzi6kduGCgXReWwSEzgH7PUkVE9ylxDgQC
	9lgRH3xhgNnPZATLFE9aAvvHa3K2qON3A4HnV+WaEKC5QnIYWOgwdwjFAvyv85rOwsN80FdB0Jio/
	6rNfQ+/3OZrv4LgMTjh1/NtVhSJyw7BW6eF34zQUvaHgolKaFotJdK5czCMYaZYmylbtUqNzCTL44
	igxoZ0YKF5AsXG6HeThExpNkeC2z82JN/RdeKE6LRGmfXETSQGMrKy8doKV0ivOpYyJdcuvBmOPUG
	x+hm8rZ0MjAGE76+jelg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRsWK-00101a-M0; Tue, 14 Feb 2023 10:26:44 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRsW4-000zuT-S3; Tue, 14 Feb 2023 10:26:30 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DA1D86600013;
	Tue, 14 Feb 2023 10:26:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676370387;
	bh=UwRyJPcY3Vp1BIUavLxKo7iU7vVnsLS38wSqjb+DE5g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=djqwfV4RbXjBorok8Kv/dr5gi/AQt3B/L9zbIXhzgwIEI3B4Lr+PPYeDmLih2onR0
	 3V60BYLLOZbsfMkiAyQJMThpi+1MAIiVO3IOVi+wORivGGUC5sa/WyVHBTaW36C5v2
	 0ggcQS9hj7tyGg+3pWjJNCnOgUsCCuf2vvuAc0ljP27xhJ9Yk+L3tgvPQ3T8evVjNK
	 hFMCvMKNaf+DFHFeJjiUxZoMn7kSu8OFL69Vtj//rndNSiNtq7sEB3GY89y6ytBpnD
	 29KBaRtr1gbGXhYDc7RtWD7GR7WRYgWsk6a849zYUUoOV2R255Obua6nxCyPLNc71c
	 /WPeGNAKPxVaw==
Message-ID: <57133cc9-f00c-c480-c99a-36db78ef561a@collabora.com>
Date: Tue, 14 Feb 2023 11:26:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 1/5] dt-bindings: arm64: dts: mediatek: Add rev5-sku2 of
 hayato
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20230211002626.454844-1-nfraprado@collabora.com>
 <20230211002626.454844-2-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230211002626.454844-2-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_022629_060701_7280C2F4 
X-CRM114-Status: UNSURE (   7.46  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 11/02/23 01:26, Nícolas F. R. A. Prado ha scritto:
> Add binding for newer version of Google Hayato: rev5-sku2.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




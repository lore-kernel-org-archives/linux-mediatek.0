Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B95C6379F
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Feb 2023 10:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OPpwyL1h3hTEcQhH6E5fKFqU83Q24B/O5z78KRwYfM4=; b=cMAiCvlXMf0+3Q
	RbVatFBPweqmADnXIeC+OflTgMApBIo6swaBGCO6jpSmXr4Hx5fa9QERADxRW1savoX9B4X8ql1ec
	7EYLSPtBLH3gNYJtcEITM9p9zPyTPdYTmBfhfqnCbQ0RBv/or5+kj/H0u0ewY5LINeLU70dSnDFBr
	/l9HkohkdLCSTvL9RmAAvKKHcx8BvyBAlohI3qK91wmphpMAV/F4UpMLGNnkI9+xFjraYXJG/U5Uw
	U8hM3iyBo4j4URKw02iEPr/osLoneMf5Wr8dhSIOZIHH3r2X/zfWQjKL+SX8YAZlGka4f7TO5SPId
	0dxlm9+Rm4mORo6LpTwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRsWh-0010Ed-En; Tue, 14 Feb 2023 10:27:07 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRsWN-00102G-AV; Tue, 14 Feb 2023 10:26:48 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2C89E6600013;
	Tue, 14 Feb 2023 10:26:45 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676370405;
	bh=XwDKmNn28mBHiDmFHlKFhPUeK5/LAwt06zJ6rA1eP/o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kUhQXF5idxG7uO8tqNbGYuHGJywLVyA0J3evJX07xvRnAC1TFNYj8B71p4ypBkh0V
	 ZqArOrM2wBJTL+ZgS6SO2tt/DjnRSD9W0GqD3TjJezDr9RQ8/3qg0dIJMIpyYIVO5L
	 BLj6nAFYJ0IEwN0KNONYwdnytQO+LCbtdEKQJDiCuIqATJBEVlgrvAaEgfdwE2IcfY
	 MMIXQE0G+QjTgEx2lgkQRxBkfZD72xIKzDUsc8rh0JhK6+7LCqx/H/bT/hWd9RrS/+
	 k2Xkhi6UFaKUU1KbStKj/hgS2B28A1RlOFUPTOufBUBQeBA/ECE1pxTB5IFYpl1JkN
	 K80VyIOjJOFtQ==
Message-ID: <6a7ac68c-5dcf-7049-8f73-aaa40479de18@collabora.com>
Date: Tue, 14 Feb 2023 11:26:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 2/5] dt-bindings: arm64: dts: mediatek: Add rev4 of
 spherion
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20230211002626.454844-1-nfraprado@collabora.com>
 <20230211002626.454844-3-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230211002626.454844-3-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_022647_524100_9B46D4C0 
X-CRM114-Status: UNSURE (   7.21  )
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
> Add binding for newer version of Google Spherion (Acer Chromebook 514):
> rev4.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




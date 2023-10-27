Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DACEC25B6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Oct 2023 07:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9JL9IwD5ye1Btu0NaCqN+ccGrmFmvTOZqh8v+cTMMLI=; b=oW6b1KemmWU1ltAel5X2XQZXnj
	UEjeRs1JR1Rc25J8CVeh/X7QZbQv5sMbiudBic1hCEUH5LJW1rfNxWvZIDd7M90yldWBwT0hgITF2
	5hsDdl1mmqRIBAvx7eTwHzb6foJ1ftPPG6Bl05TLdOZEdCSauEpzTRhUwpBOZUSk9Hmm1H0QaIKk4
	0BcLnwcwjBIwtn1Gsj6yo+GAkSveSG3glHQKC1nCkNnex1iKq6N0g+S7ZNhOPiYuFiPf3bdrcytM2
	QgwQ+yH1wkdDweP+Wk8Dj0EbvQmph4YPMcpB2UgMeuw6sWscrxQ8HV7pmE9P3w4mImzZxuYnN0o2m
	9RNPZ67Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwHNm-00FoTB-1Q;
	Fri, 27 Oct 2023 07:35:50 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwHNb-00FoPs-2j;
	Fri, 27 Oct 2023 07:35:41 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0835566072FC;
	Fri, 27 Oct 2023 08:35:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698392137;
	bh=oFJbGwgnT4XBm+CPLnIrvOvd1dL6gLt3RoWlBIVTEqE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IUbkkp2+4x0Hj0zH0B3GbP4brjI1gkJDa6pfKKxGn5kwUZMgQutHFQ+qBljhmzszk
	 Ob5/fmHn7YyW7oXc9v8oWwmsqtepMwCqPUDgnPhsyKiNe7+UOglSwezFoiKQPusDLj
	 gMkPGo3vTcbHOvS8NFWASKIQla9ObpFjqmXT0o0E6RCxKO/2KFgXKfDj6+rYwb9jQz
	 AYQZznsy//c9TRVDOIMRDr5jyxO6iWUu4SlIelwStNtZTXgy2FvoB+qyn2YINPAXn+
	 ltL7Llwmiam7U80+SLGz5O/uEVCATFn1SLSl+XF1Yx0CZkrtibTD5T9C82MZQ8DRHi
	 OF9C2y+4X7OWQ==
Message-ID: <786024db-15fd-4600-a79c-5f5b3b2d952f@collabora.com>
Date: Fri, 27 Oct 2023 09:35:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] arm64: dts: mt8183: Add jacuzzi makomo board
Content-Language: en-US
To: Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231026191343.3345279-1-hsinyi@chromium.org>
 <20231026191343.3345279-6-hsinyi@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231026191343.3345279-6-hsinyi@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_003540_089312_442ACB47 
X-CRM114-Status: UNSURE (   5.98  )
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

Il 26/10/23 21:09, Hsin-Yi Wang ha scritto:
> makomo is also known as Lenovo 100e Chromebook 2nd Gen MTK 2.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



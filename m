Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EEB0C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jul 2022 08:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vs/7a0vDngRnsFMXV+Y9lodTgfhBsxQrIznJGtD5VYg=; b=jpz2D+87ORy9vh5wX4LUNnW6pC
	ago2oWH+KIAV0g8kvFHdsh4bxlQpeG5zansiziZklJG7Zrl1dKocJ2YT8PMHdl9btZ5jm6FU0JmQZ
	rABmk2QcQ1xKj82vPD5JuODSx0RAt1ivCff8U+mgKnQWpeono2pFhMvhFkWcKR8WR+pLMkmSaXzt/
	B3DJup0Yf+hG+f/O6lAdqsOslklE79ZumEJvU65npzeJxj1JZy5KaSO4+jgN841EXjh4Ul64/6MkK
	+rPK+0nRM2WsBxdKzCggqCnYAnhqQfGM/pENf5Xm813IdGKjgOI9HR8DbErV+sJKyd5kNMz2MHuzp
	3neK2I8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBXc5-001b1Y-AI; Wed, 13 Jul 2022 08:20:53 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBXbd-001aqO-Kf; Wed, 13 Jul 2022 08:20:26 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7F2796601A38;
	Wed, 13 Jul 2022 09:20:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657700424;
	bh=yUZfFeWX08WQ/h5QZHogA0CwHAk3IBZ1IURWDjXkS94=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=khuBMLoFTYzGB7cWlzNd6mF6vKuHAyJnQAYpzWiDtyBL3aj2pahqgwvfWG4YsWbBb
	 5plNZNtCLN2aNVHLY07BlTDzQcM7r+GpEOMg63+na0OOmxN/+YB5YM5QAOPGDj1bmd
	 PtixwRkB2fydejmOlqHUzd7cXYPC0CLZp7AZuG/WhzVUeRnpCeY9Z/d2CfyzLiklTH
	 /TH/i6I7GTuNMfKHMeK4ceg4Oz2y+8qt7jvWGWmiLCDt/inmgTh0OHYVt56PzM5fU3
	 /vx4jZZsqYzpM1lZ0z6lfjRIfCF44sQSC4G8dIhSgzfpS3/yYq17GHAd53wKyZIzea
	 TtWQEccGBo7rA==
Message-ID: <4b6a4a1f-2e33-f037-6736-b2dfb1750ed6@collabora.com>
Date: Wed, 13 Jul 2022 10:20:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: mediatek: add mdp3 mutex support
 for mt8186
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Xiandong Wang <xiandong.wang@mediatek.com>
References: <20220711123247.15807-1-allen-kh.cheng@mediatek.com>
 <20220711123247.15807-2-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220711123247.15807-2-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_012025_840445_1C2D6708 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 11/07/22 14:32, Allen-KH Cheng ha scritto:
> Add mdp3 mutex compatible for mt8186 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Signed-off-by: Xiandong Wang <xiandong.wang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA8BC25B67
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Oct 2023 07:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fzmfEu/031MpAVXtKwZaTJED8cYEInZsKtVNNlAByy4=; b=Ocg5Jxh5zRLKnYEKNbKU8xbFK3
	BLtMk5uyHD//DZsWnd8gjIn9TT53qCKthS3bT5rBEx0Zd4Bvq8gC/jvnocCKWXZ9zGOxGs6fA+gvF
	UzyQ9v8HWuOX0gqQFl7KCDu5oA7I1Gfg3i88By/lkFbrz5s2JQBbXtE5AvgHauvPtLKTZYkPApO5g
	e6lir/O8Wf96pfhmrrpyFCY0x1BD8VhBwJBm4MdsGzcioJEhhiEn5esG0/07jAQgeh2yCEb52IX1w
	zC19NL+qqypvEcFKomCEk5C/ApxAi+Pe83HpL6sS+yJqWj//kCyZO6mamo1psGKagQzkDjuV8RZVv
	TK8U+iMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwHNf-00FoQs-1L;
	Fri, 27 Oct 2023 07:35:43 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwHNa-00FoPe-2Q;
	Fri, 27 Oct 2023 07:35:39 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F1DB566071F1;
	Fri, 27 Oct 2023 08:35:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698392136;
	bh=xEpYiK0xVyTMBqOzwCeP5X9IsjLo0irTTedERKnouYY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ChUL4J3GS/pemysY8XC4YUYZuFod0r27a1ChKWKer+wPyr3TuR+AYU+dq7j3MylKg
	 FbREfXUA2L3gTz0UOXcOYtcK+7j680gh2eSluw0p48KiRQzOK6b/svolYVNxuaxXQs
	 1Ip1eDmvfbTlK7gM2hnwdl37bdYOdvR0WGt+eYVLES87Zns91OWW4Jz+hQFruYtcaZ
	 3Usn3bzZTyZXnGkTr7acCkXtkvWLG4/VOhYOWjc4ele4HI5N0Eb3ARCoTID9SRnadK
	 Qvk5qVe5o2EL5MI0OR/EwwiHUEDLATW4FUCW0L57HC8/WXyrsUsy8oXAl4Phz1nh1U
	 I5YJoWzYC7unQ==
Message-ID: <9e446cfc-c99c-4e26-8315-357d5ee160ab@collabora.com>
Date: Fri, 27 Oct 2023 09:35:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] arm64: dts: mt8183: Add kukui katsu board
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
 <20231026191343.3345279-4-hsinyi@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231026191343.3345279-4-hsinyi@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_003538_913355_73A647E8 
X-CRM114-Status: UNSURE (   6.82  )
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
> katsu is also known as ASUS Chromebook Detachable CZ1.
> 
> Let katsu and kakadu set its own touchscreen and panel compatible. Remove
> these setting from the common dtsi for readability.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



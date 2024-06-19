Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A56C2BA15
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 16:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JxBQPyp294WdJOaKjvrILoY2bQCynYd9C3Svbe+msl8=; b=IBRNGyrQhSRSgrdxisCHqViNxp
	WOw9JAk+s6AvKTqU/dP1a0xGQyxx1mrLpKBTmd2nO3+D4co/kkV2xBpfn6ARG0FwYJUfvLQyUyuR5
	8n9GBaeO2EAbH488uCj1nUMwQAgPeOBCdrIQmWdpl52PribTw6oe21vNgZF+Dc82X/y2e33ZBjZHF
	Bb0luwV/DrxNUKtw6qDSDvP9Kkgn7MkcoJU0yUmvlaOcnX4m4xFRZClJT8mcBTR34vu3OEqrrHVC+
	W8oMgk2buzUjcY1CPuGaewZufiYVxU9oyYQ/M3HTqDQfvYWQU37SnMu7Ko/n+SVBu7IFKr3ZvAOgN
	bvxH2AmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJxlY-00000001xRN-2mGL;
	Wed, 19 Jun 2024 16:02:32 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwoI-00000001hwh-1Qy0;
	Wed, 19 Jun 2024 15:01:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718809277;
	bh=SmW8jSoigqN6cXoH7/DH+OEqxD9eVzAWpC7UQd+YfOw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dAXHebveT8Z0LIwwrZndAskYgi/KtH9bd+ORG3mdL1fEJCpMndK4S/UwvEFgrUVYA
	 sbWfxMS9jtr9gPUy9ZCz8bBypgNp5+H4wB1mrWyAq5Ra7A5WeDMUBbn07SVUsxoeL0
	 OuDkCK6wv8xelfg8wY2ehNC2OMQmBk6mlrM4P+uV0xzm+1dFYbFSjGAAl5htKAuTwt
	 z6f+QHvb+dw5z43BEaW7C9YTl3cNrqQst+kTNHrz8zuB8Q/qhKFUu6loz6sIg+JaFU
	 +ygZomYwr34YzE3gyG3odXSObZqVqQQXJuVZdXuhjN54/q2HM/lbD+CBDBsdtjdBNB
	 /antbN/BpvPmw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5526E37821D3;
	Wed, 19 Jun 2024 15:01:15 +0000 (UTC)
Message-ID: <27eefef0-4485-4db4-9336-2f01b9187362@collabora.com>
Date: Wed, 19 Jun 2024 17:01:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/16] ASoC: codecs: add MT6357 support
To: amergnat@baylibre.com, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 Flora Fu <flora.fu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Nicolas Belin <nbelin@baylibre.com>
References: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
 <20240226-audio-i350-v6-12-f754ec1a7634@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240226-audio-i350-v6-12-f754ec1a7634@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_080118_908842_BF63A3D9 
X-CRM114-Status: UNSURE (   7.51  )
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

Il 19/06/24 16:46, amergnat@baylibre.com ha scritto:
> From: Nicolas Belin <nbelin@baylibre.com>
> 
> Add the support of MT6357 PMIC audio codec.
> 
> Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




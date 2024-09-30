Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E040CF6497
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Sep 2024 09:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4U2ZUhuxD+Y7X+o1IU+NtnoAkP//u+fUV3UvjGxQNBg=; b=F+sZf4kmYDU+eE+3V7UxXTSjel
	KP+Dje7enaEk6cS+/7OpMrvlTO3qz8BcMY500r+g2wrI20p16QRbztY3f7V+7zb8CnChbWFTFW2O6
	3JW8ff5I5HO+whFgUhKyNtOtc7tjcUcJx7XNwmMOShs1sVCgsb9KTs0ybGdlaOkcke1LxsGOyp6gO
	VI5sisra/QE8GW0VK26fiAC8Mp3ZZ3QK/+VkZ+yxNUMP9STWrow1br+IzhJ+AlPGtnobXspTGdKw/
	rU4brfrVXV2xojUBWP5v/R/jK33vhs+L5tHvflQdpiZvi0WmTdjnUefNtyTaDvwY2pOps/o4Yxuus
	GAg4gJhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svCqD-0000000GYpv-25qt;
	Mon, 30 Sep 2024 09:37:17 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svCiZ-0000000GWbG-0cte;
	Mon, 30 Sep 2024 09:29:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727688561;
	bh=VSv+BL7uOVtpOXmL+Sgph6olDDv+H2bs6l/TX9i1ebY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DdvWzEcC/f5lVkAF5i7dhMZZcUL4NVZxCRRPeVfZxyyg9HACYPQp4g3tKWvswYD7c
	 GoxD+POtGMREsd7mcil7qEtNINqkOX87IclwUNJLxwtLk9wt+z7QfUNzjhG6+1j3mq
	 FwEI9PEPnKyf9tR03De9b2vubmGdBWjf174bdWsNl9u5CXro67EDvoO0N2cbU0LTrF
	 1wwibw8BeNU34tsQXSMgXtqOEVbEbaKPjRb0usZKxv0AMlofbVLqIlS/2fri1QKgRt
	 WmpYynCjCuWzqniBPUQ2O1PCx/7upVMdKZVZ2XEHIkCpUe1uuLSmOZ7w262QkyrSjw
	 9222KbigmGOgQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 28E0D17E10AC;
	Mon, 30 Sep 2024 11:29:21 +0200 (CEST)
Message-ID: <d73ebca6-9254-42c6-958d-e45432de1b1d@collabora.com>
Date: Mon, 30 Sep 2024 11:29:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] soc: mediatek: mediatek-regulator-coupler: Support
 mt8188
To: Pablo Sun <pablo.sun@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20240927103005.17605-1-pablo.sun@mediatek.com>
 <20240927103005.17605-6-pablo.sun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240927103005.17605-6-pablo.sun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_022923_372438_6B89EEDC 
X-CRM114-Status: UNSURE (   7.57  )
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

Il 27/09/24 12:30, Pablo Sun ha scritto:
> The Mali GPU in mt8188 also requires coupled power supplies,
> that is, the "vsram" voltage should follow the "vgpu" voltage.
> Therefore add the compatible to enable this coupling behavior.
> 
> Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




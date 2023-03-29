Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B54CC6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 13:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7eIqdSbI0Wb3eqO16iRp99gJ1FYzbNxBHnuhgyosV9A=; b=3i4EwutwXRdWHo6+KdMtM7Hb3+
	hOpAkJopR16M5iJhKfiPcSjhMOKekDds60CMWr8S83NEnZ4x4ecV0E0Pmj72clkIpR2Yxy+UohN/H
	Nn6DDHodu3/AH6gVyAse/QpLYgFErPZ+mMW2DAHTZzv/ImUZLM4yl8NH03CXxsLb+xXKTOy+xiQhc
	SYVqHmFBSCHrItwfYgd5lxE88Hp7NNTSiks4OXMdjtuzL85F2V23TmOutlDNnwArX/n2MpCWtwXIe
	bhZQ5uzxDLZJQ5vso2ZlLF/qwY4mA75n0LIpH1E4E8S8AKsQOF7lX1YF0OFv78hPEhLm5iDyyhAwh
	ZHRhqh+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phVuH-000Q0Q-2b;
	Wed, 29 Mar 2023 13:32:05 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phVuE-000Pz0-06;
	Wed, 29 Mar 2023 13:32:03 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9E4626602EDC;
	Wed, 29 Mar 2023 14:31:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680096720;
	bh=Pib6qE5F4Lg5qFO9xEESVqnMdlCKI+dvN/qGSBLYOKk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kjYvSga7RY2S3by22nBTNlGCuhkRVhlXXJNedHVKkcqpVDD2ymQdEVy6yUIoMZuQ3
	 LkXkrTJPaTEavy37Mnq/RW9Cs8bNRwJiQ6AbvjqWoYg2HfoKxnFcNsDeZi7Nio15s/
	 3lgrrL5XACVWK/93tDg2dvtonoxOORzNUQKf2VMHMyhKFzcaDUHQNL9grjQVKTCekV
	 X+Hy45SK4ISpIbNLejEAAuFFSUgTDpWg9YjjA04+WEnB0xwDl+Uztjv6ZytxnR5adP
	 83/EsfBUKs7oGEjcSRXbkPVQUL/yIL6oQA2Y6NrNBIdhfpxZY8HuA8laD4y2gg561u
	 WscoqlSJ+58/w==
Message-ID: <8c1f5991-e220-95b7-c605-03d3c3442c21@collabora.com>
Date: Wed, 29 Mar 2023 15:31:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 17/17] arm64: dts: mediatek: Add CPU Idle support
Content-Language: en-US
To: amergnat@baylibre.com, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>
References: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
 <20230203-evk-board-support-v3-17-0003e80e0095@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230203-evk-board-support-v3-17-0003e80e0095@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_063202_196408_A44A02A1 
X-CRM114-Status: UNSURE (   9.60  )
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

Il 29/03/23 10:54, amergnat@baylibre.com ha scritto:
> From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> 
> MT8365 has 3 CPU Idle states:
> - MCDI_CPU. (Multi-Core-Deep-Idle)
> - MCDI_CLUSTER.
> - DPIDLE. (Deep-Idle)
> 
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E831C982FA
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2026 11:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZ5nQRQZlhW2H+1iGZcEsOBuK6R24/iM/XPygJf+WUs=; b=2e8aU0cIFeDzJQE55lM1+VuulM
	nrGHoAACQspa3LKN2+5oOr01uLAOrza777T7/w66HIpWEjwIGfWF9Oft1sRuQGKeHdUGd70iv7/T3
	QShdcHlCmrCMzuahLP1Znt6lH/784OfhxG2g+TqLYkXA7Nhk5eoR9hIY9wL57RH5uBee+GfuSrnUg
	9jGf3TOXulVZwxYPATqcNBSoEdAYjXMQ8e/vi4ZvjHPmx5OIc0i7u//GiVh5NBWERuRUmErmUFH+1
	NYG5AUYrOh6dpg5U+Jrs/n3qNYrLzwi7/ykKIW396UW8T0dZF7wTbLURckKXW8Ww5/KIRURJcuyAq
	H7SCfo6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yxG-00000005Ed7-2wP2;
	Tue, 22 Sep 2026 11:46:34 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yxD-00000005EbJ-1SWW;
	Tue, 22 Sep 2026 11:46:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790077589;
	bh=te2JAZugR4Cday7luW0127qIkQZLtCEubZxNQ0OLhgE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fqdtkySabCRzSaWqtTdrlKXCEer1OK37ujRXvMxkRKNIJY6rgzyDRlSBFHZdA2nh6
	 bgpJiRyjZOs7/w1/70BIz8HcDfZKbpLFpfSnAXR9wozZ2u3un2EtDTNxK64IovEk3m
	 8Q+BXqFB35o7swuZsnWwAnYWLZjJ4wEI88pVUK73209oc2sP1/t5bwVsKv+ubs8y3f
	 4sm69h9eNtRe0PTQTUebmx7L7TuSZW41hPDAKmfr0S8hkBNBBKlboUoT2GbGticQfz
	 qyNk4P50MkJ4E3qF2zx1E7pSL+4tdkIJrrYPflZ/MG4pssnMNzoYbnqrJb74HbA4TI
	 ZdfmK44fFJe1Q==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E410017E03B6;
	Tue, 22 Sep 2026 13:46:28 +0200 (CEST)
Message-ID: <433d8c01-ad33-45cc-82a2-0b5f2a14c2a1@collabora.com>
Date: Tue, 22 Sep 2026 13:46:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] usb: mtu3: add SoC platform data for FIFO quirk
 handling
To: rva333@protonmail.com, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260922-6595-mtu3-v2-0-71203a362b36@protonmail.com>
 <20260922-6595-mtu3-v2-2-71203a362b36@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260922-6595-mtu3-v2-2-71203a362b36@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_044631_544750_4A8DE4D3 
X-CRM114-Status: UNSURE (   8.35  )
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

On 9/22/26 12:36, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> Some SoCs, such as mt6595, require specific quirks for the MTU3 to
> function properly.
> 
> The mt6595 IP block doesn't support multiple slots for the FIFO,
> resulting FIFO wrap.
> 
> Fix this by adding platform data with a field to handle FIFO limitation.
> No functional changes for existing SoCs.
> 
> Assisted-by: LLM (debugging)
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



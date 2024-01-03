Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120B9C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jan 2024 13:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pL6QOc/Lh13FIB7BdGmr5aRiysNfGsKjlBJJ+o41t2g=; b=U0TIeqSBcbxlTJ
	nArnpBt2a7gl9qGr6wCXrHdWq8F6XO/FF81ivYLPDCEAGcWp575xmI1Rx6PfLQn+hFNf3TRjX1gHE
	YZpSkInOkonlmoLqUZ4QIiy4umgXvzhp6qvzGo78tLpIm/u7XjFnKWA2L+jJJUJBLrPOpPDQBr3ac
	K5KFVNY2sQ+ZOLiI8osBW511tR+oFcbMvIMcJ1Sl+9mIUR8CnxGkrj6xOAw9bMfZU/nZobohg94y1
	2FRA557IkiIlAZeatc+SYjMCT9VpPaJEzkomTJDJJjhUDDKuQvF4lBFqeynccKVsuyD8uJQStni+d
	qtvRYLsDC3IeZf3WW6sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL1hu-00B1nR-34;
	Wed, 03 Jan 2024 13:54:54 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL1hq-00B1mj-37;
	Wed, 03 Jan 2024 13:54:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704290089;
	bh=sQ66QyW+xMaePGko6IiEu9l38fnfyRbQ6WKJNcgwFQk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qXpr3a5sFLiv9Sz8oAdpRKAHWrXlFschvWY2+bAJR1jwqUGm1+pkRKDwGedEsVZ5o
	 DwYtE+4OnTOzVcU26AjIIy4BKvV+aZYeWWAnpaEYLKfync8UM8VBR/1D9+hXSAfWvE
	 /C4EyQ4yN1pt4tudl72fK5MDAB0XwXSRJ6XyMEChK+TJi9Sb1XJAGVyZ8vDHyTGKo9
	 rHJYU9ZximEoXLgjs6EYvTDak2iDxuuihHERyAbHUF+G/xeJPxBUL+XVrpjtQGue+U
	 hQeT7itI3GtqHua8zrNxTTLTo/B/ARv7we5g4RxyiYEIMNArKVrOmKvuManeuWQ4jJ
	 rL+vYBTMspZ0A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B845737813CB;
	Wed,  3 Jan 2024 13:54:48 +0000 (UTC)
Message-ID: <6b3ac221-ada5-4ff5-9a65-97ddfff59495@collabora.com>
Date: Wed, 3 Jan 2024 14:54:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt7986: fix SPI nodename
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20231116130952.5099-1-zajec5@gmail.com>
 <20231116130952.5099-2-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231116130952.5099-2-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_055451_212262_35E06528 
X-CRM114-Status: UNSURE (   6.58  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, linux-mediatek@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 16/11/23 14:09, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This fixes following validation errors:
> arch/arm64/boot/dts/mediatek/mt7986a-rfb.dtb: spi_nand@0: $nodename:0: 'spi_nand@0' does not match '^(flash|.*sram|nand)(@.*)?$'
>          from schema $id: http://devicetree.org/schemas/mtd/spi-nand.yaml#
> arch/arm64/boot/dts/mediatek/mt7986b-rfb.dtb: spi_nand@0: $nodename:0: 'spi_nand@0' does not match '^(flash|.*sram|nand)(@.*)?$'
>          from schema $id: http://devicetree.org/schemas/mtd/spi-nand.yaml#
> 
> Fixes: 885e153ed7c1 ("arm64: dts: mt7986: add spi related device nodes")
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




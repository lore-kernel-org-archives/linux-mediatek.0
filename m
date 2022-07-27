Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F2B2C04A68
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 07:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R3tUlxKD6pqZMGC1QD93QIh14w111y452iSZwxv0h8w=; b=OcdYh1EjOdb37sTaAc3+DM/dvC
	FoYMAG7WBatkLviQmQQ3KY6v+JIN8jEpa2POb1AUCOeRGtiPHA0/QerqKdXYNcq0XrnluZyeiNXET
	7Ry+R7343L2cV1Kr9zvABCBgFQdgdrs4ZM1mzALbSdIL/nzrkxSZQd/aqr1Yg2EfQ/iJA3xdq0xDW
	6/ehxEm7z3rlIG5rKZzaqHC0atFEpJ+KOc+jc4kzCZxLRYxzdhh4J8o0+OY2v3aXzbLowqHBCNjDq
	+v1mqhNb59+grdIi935TA5tqM2uTjoIqjOEuckXNN8GKXNVAd8gQjvTwGB5RA/qc7lgrErKCyMdmN
	pLAK+SEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGbZ7-00AaQz-CZ; Wed, 27 Jul 2022 07:34:45 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGbYt-00AaD7-HM; Wed, 27 Jul 2022 07:34:32 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8D2CA6601ABE;
	Wed, 27 Jul 2022 08:34:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658907267;
	bh=6ps4uQowS8HpISETXvtaiicTxwDeXzdtMPrNeVaDsvk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ToEX/wUgUB/m4F2DIP7ruKo6y+qjdkYa3nKiNumxyrfxYQSnZRpIz57UFxXNkTLv5
	 v50V4KAS4HbXimDKUYXObvJj6LL8dZ9oJjvbuDppd7NCUxdNqEdcvjqaVaPyUwJBhN
	 UMTLo7HkUIKVdTAhY+eEO+wlI5NTIy5vPMb+ZsowOCqcP9mz7KqIb5snaUuKekZHD8
	 3fFhkvQsKj72T1eQ/tDhsD8IiKZcCW7Z2X70QNpxh6ZSu6TbZMzYm4d8CIhhTKaeI8
	 mirvQmENKSZujpqyBvi22L7EDKvF/Fbo1sC7eOMcjp+mQmhkgSUhNcCDWxbm85GTTj
	 4rB8vRSImBbaw==
Message-ID: <47f90532-c115-61ad-1203-5658430b6a7a@collabora.com>
Date: Wed, 27 Jul 2022 09:34:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 5/7] Input: mt6779-keypad - support double keys matrix
Content-Language: en-US
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, Fabien Parent
 <fparent@baylibre.com>, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, Fabien Parent <parent.f@gmail.com>
References: <20220720-mt8183-keypad-v2-0-6d42c357cb76@baylibre.com>
 <20220720-mt8183-keypad-v2-5-6d42c357cb76@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220720-mt8183-keypad-v2-5-6d42c357cb76@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_003431_734381_119D1B36 
X-CRM114-Status: UNSURE (   8.79  )
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

Il 26/07/22 14:56, Mattijs Korpershoek ha scritto:
> MediaTek keypad has 2 modes of detecting key events:
> - single key: each (row, column) can detect one key
> - double key: each (row, column) is a group of 2 keys
> 
> Double key support exists to minimize cost, since it reduces the number
> of pins required for physical keys.
> 
> Double key is configured by setting BIT(0) of the KP_SEL register.
> 
> Enable double key matrix support based on the mediatek,keys-per-group
> device tree property.
> 
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



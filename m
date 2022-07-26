Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEDEC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 08:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6exF3OBLVwbRc0uE+3pWSJbfbRnCNfKNxGahvnq5nL0=; b=kNGv5rbFJemkkSIeabAWEHBEQq
	Ddoturl9HLHFg0VhI8E3x6tOCLypEkzGHWQYtiq6iOc4YZ0PQprxA1beERd9G4JPx3MFgDVeGbw52
	0GiPyR35XRfHSaku0r0NECe7UmUUEUyqg5XpwJyB61WGDGeDJWLHnLepKtWJYv5r7N4vkO3+H+GQR
	oLwD0D/X8/HjcI/ibpsY49NFLfWZzTrjrYularmoinRFS/kG8Igfk8rcbKOdIfdl93uMjZWbbDNAS
	i6uPu5rlLfnRQeQMj+hXuy4s442I/zUunTjPF3aoY3DQRVZ7MzvNGnfOWnofASMhc0kn2zsd6GX4e
	pvWhEPzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGG7N-00ANnP-EE; Tue, 26 Jul 2022 08:40:41 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGG6e-00AN4U-Eb; Tue, 26 Jul 2022 08:39:57 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6CD1B6601B15;
	Tue, 26 Jul 2022 09:39:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658824794;
	bh=o8COaf1WnhJ6CshvmVXvwffuBdxhwn1zG6mdYwCYbMM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KfouyMIC5PPMPw26mf23O0tIb+iVGaFLkR/kg5SB28fo7Osxl7Accy9z/wZHXYQnk
	 L24vXFgaA/XYKaa3IsxSYyKsnKEgyYL9jTnRyVpsEmVVwA5oULUZF3k2f+dsxmVoow
	 HBzyIv3HeNEtJUR8UjGTME0UWjueCXvKQ8oroEOvbbfZ0PyoX5gm3+Z5dXo/W6lJKE
	 jc5QZ5DOiYEpHd8GC9S77tdmqazQZNWTe4B/UmSfHmwBW7UsgodnHlgD7jQaNzvIT+
	 jQK3EFXz8bj+zPlxYitKVRByCuewBJMP3J8YKoERVUMevT9FBVBhTxotsCXUxbmJ7C
	 K8812Sfxz5JEg==
Message-ID: <14ddcdb5-cbfc-1215-ffdd-85df8d9d6acb@collabora.com>
Date: Tue, 26 Jul 2022 10:39:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v14 1/3] dt-bindings: mmc: mtk-sd: extend interrupts and
 pinctrls properties
Content-Language: en-US
To: Axe Yang <axe.yang@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Chaotian Jing
 <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Satya Tangirala <satyat@google.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Lucas Stach
 <dev@lynxeye.de>, Eric Biggers <ebiggers@google.com>,
 Andrew Jeffery <andrew@aj.id.au>, Stephen Boyd <swboyd@chromium.org>,
 Kiwoong Kim <kwmad.kim@samsung.com>, Yue Hu <huyue2@yulong.com>,
 Tian Tao <tiantao6@hisilicon.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rob Herring <robh@kernel.org>
References: <20220726062842.18846-1-axe.yang@mediatek.com>
 <20220726062842.18846-2-axe.yang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220726062842.18846-2-axe.yang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_013956_715109_5CEA4D1B 
X-CRM114-Status: UNSURE (   9.27  )
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

Il 26/07/22 08:28, Axe Yang ha scritto:
> Extend interrupts and pinctrls for SDIO wakeup interrupt feature.
> This feature allow SDIO devices alarm asynchronous interrupt to host
> even when host stop providing clock to SDIO card. An extra wakeup
> interrupt and pinctrl states for SDIO DAT1 pin state switching are
> required in this scenario.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Axe Yang <axe.yang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

P.S.: R-b tags go after S-o-b tags!


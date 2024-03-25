Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E60AC54E58
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Mar 2024 08:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nZnVediVqPjk5rTfocyVOshqYUOD0r4ZHzi56BSzzLI=; b=YOByAUu7qeBuM69/3xTbLjsdxu
	ZQyiZ7CSbHMUwl+eK+9j1iLymOSh2Ozdj1yLGi55efnYv3g0m3zzIM36WB84Cwfmcw67Yfk9rC2fA
	eP3foJvivNiKY3vZc/cJbaaWaTMJ54H+6y7wc1X3Po/MixKTR0ih91LAsbye07auvOcUk6QKcffbH
	ZNTAoYgpcIK86HI0fcdiXbCpy8h0ScbkHD1ZYPipPlDWJQB8l8KZkxYSqgY6495hRqWyallvvlPih
	ZML6bFkQCZg9Yc24Uzs6VUcXtCwaECyCXktGken5HihLTRFD6pN9H+52Hgi8jZ8TDnYxNWyVlBICk
	boD4Ktpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rofLi-0000000G45H-35oD;
	Mon, 25 Mar 2024 08:06:30 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rofLe-0000000G44K-2JdQ;
	Mon, 25 Mar 2024 08:06:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711353982;
	bh=4zmNwnO+rlwZyxMm6+DHyTmsDyPlSk/+VuFi7C20klI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NneBBH1/h89T+j8vTmT6EtedvI9yYZAzutka6W/6D7Azt/SpnEBfLrj3Rf31qe1BK
	 8pNlfz5pMi5SVO6por8o+Tf2Vfu7GXRczRiPuFme4dA5azM07gValBgJiWdv+wX7j3
	 liU7jCVPtS76l3gIFZA0nNGmcPcsJU9SXbxn8USTUWt2pIelgXDmY+/61QgG4Ms5nq
	 96eFz9So1oipSkAyUQune5KoKumV6TmMCThnk4koZ+dEE38vVNjoHMeeP0oepeWx0J
	 qhCp9hYxXtyGNfX58ByaC70YyMA02/AMmx5wNCly91HUdhTzYlgpHYsUUx0Otw6RCx
	 q7zcTbJUhk9yQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1EE313781013;
	Mon, 25 Mar 2024 08:06:22 +0000 (UTC)
Message-ID: <97b5904b-af1f-48a4-98b4-13d0531beece@collabora.com>
Date: Mon, 25 Mar 2024 09:06:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 37/64] i2c: mt7621: reword according to newest
 specification
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org
Cc: Stefan Roese <sr@denx.de>, Andi Shyti <andi.shyti@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-38-wsa+renesas@sang-engineering.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240322132619.6389-38-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_010626_800938_4C8F79D0 
X-CRM114-Status: UNSURE (   7.66  )
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

Il 22/03/24 14:25, Wolfram Sang ha scritto:
> Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
> specifications and replace "master/slave" with more appropriate terms.
> They are also more specific because we distinguish now between a remote
> entity ("client") and a local one ("target").
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11C9C25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 07:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rUkloy3cr7s1g/r9jUPyC0mMCcivf+7fvCTOA1/0I6o=; b=QV0+ydcGuNi/s7oO3Qb+Ho0yk4
	U/hDgmotFox+wBo+DaExL3M4HZV3D9JFvV8/vlC1xeHXe6fcCsCmQ9NrA071KVg2IS/+J+MtxPK+E
	rowdHsx+W7eN9Iz/wUwo09ZnZA6Gqzj96hdZCNayRtqOB4xTk5GtSdP8DbjbWkno33ayIvjPGAS/q
	nX/adbd9YFtkPMGRpwco9YULo56dlfXz6t2SQt5XMOQCtL4BhZ2l4SOQYsZJxXp9P5PT74fFG1FZy
	thOJsas92qGdX23y9VhdbTO2GgViptlxHF7a78DlBPaVM1MduttN9O+pK7YIz7nhas5fzy3N6BKur
	iycYRUFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCE4q-00000003DoU-3X1x;
	Wed, 29 May 2024 07:50:28 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCE4a-00000003Deu-1FaL;
	Wed, 29 May 2024 07:50:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716969011;
	bh=YwrBrQBcvTpTydqwx/3BrbATRqTX/3arrlFSkJJkj0o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=zHwV7YqKboVksBk1H/fFOxMLCR+eFI/6fhziE9xOl0mozz48T7pYwqUGEcBESQ4/o
	 neiz3WWCjnDLmTWvFpill/DYwOsn2yxJCpkAVNH2ZdqoeWRl/qhJiwN4WlJS43qypP
	 X8Gy5Jz/uQ+3MEoAj4BEUcziLDPKuiOwLfU6rqqD/uQ+2/aefsSjg5D9yr7udpEBcz
	 6IaKIvtPTgoma+80FqvUjzGIVzHjkmzrQWkqBhGA4NIOsP5tjf+ikNjnUJFhCwLjHc
	 X+nOQn7pgduCsJj+Ok0T9TrXh+2SHWaesUxMYNfptflfFkaGsl0vOsLGSYzbC+XyBr
	 1ItasfsljEMiA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C0C36378216B;
	Wed, 29 May 2024 07:50:09 +0000 (UTC)
Message-ID: <a621f422-d5b9-44ef-9001-ce6afe25eade@collabora.com>
Date: Wed, 29 May 2024 09:50:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: add OpenWrt
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>, Sebastian Reichel <sre@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Wang
 <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 openwrt-devel@lists.openwrt.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20240527115933.7396-1-zajec5@gmail.com>
 <20240527115933.7396-2-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240527115933.7396-2-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_005013_061474_D0621449 
X-CRM114-Status: UNSURE (   6.33  )
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

Il 27/05/24 13:59, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> OpenWrt project (with the help of MediaTek and Banana Pi) has produced
> its very first own hardware. It needs its own prefix.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




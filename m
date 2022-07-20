Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F3BC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 13:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xSx8x7LO642GhglaJOVKvZ47pcRVbwTQ6sZIfsQcqgI=; b=t64H1YmJU5g2ZW/kko6yY652QD
	sAoO4WenLOjoDRl9EFkpFRezErV7FmA6P90yUxtewCQ8npNO/ypllhGhiJJkntZWdDoU4FZnBXsc6
	xyU4d7s+w/V1nPQQfCRnDIc83kf5MIBjih7CeiAUwJyIZxKsFGOAfRtjueAFYh9WFvQXjqbsQOFpp
	f/wZ998tq4wX69+Hxsy2ArUeyCD2uFVZPeseAyZF1zbfztKQRNmOniLPotou/EPcp7PLiiteVbXN+
	PoeKmhqNBUK5rkJnQyaxL7PgEbL/OLGjXsgE9M1orwALIvr5m/SrXwTYxwt3zD9IN6fNpwyu2uHcH
	0RkT1V8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE9VH-005opK-7x; Wed, 20 Jul 2022 13:12:39 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE9Us-005oM9-6G; Wed, 20 Jul 2022 13:12:18 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 54BFB6601A88;
	Wed, 20 Jul 2022 14:12:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658322733;
	bh=cy9CGHgqudLNo61Fmsl3sxpvn+cV59KH4fqka9jc6+w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FI84RkOq+tEMic+IJkcaL9HfaYnzxa16LAjdkHogv5GYzCd3UbctCGjlyAp3PU49K
	 EA4L7iGTZrYx6yl4dO+WrYL5kWKdwpxXqIiJJF8x73Sq27RAwAqOYu5Qp0VTSVCbem
	 TLeJbB86aFjlcejONbQXqr3+f3p5JatKPcDOlfthTCcVU/eGlhteWOO8CnikoPUaql
	 DqsHlvkACls3iIMz5Tq8p72OeFi8CmQl7ybAUX8G1FH7bPQrwA0LyynCsb/vA+cTpz
	 W/oa0mWLIcN7Gdapwf/wvnssu2OP6X0prtirnQDeIjeNX0Oe18ofhjCXcqfakpL90P
	 YYj4dqhMU4m/w==
Message-ID: <17b679a2-1248-c9a3-a372-f15f6350e662@collabora.com>
Date: Wed, 20 Jul 2022 15:12:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 4/4] arm64: dts: mediatek: Fix the watchdog node name
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 nfraprado@collabora.com
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220720125015.13797-1-allen-kh.cheng@mediatek.com>
 <20220720125015.13797-5-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220720125015.13797-5-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_061214_410031_DCE9634E 
X-CRM114-Status: UNSURE (   7.76  )
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

Il 20/07/22 14:50, Allen-KH Cheng ha scritto:
> The proper name is 'watchdog', not 'toprgu'.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



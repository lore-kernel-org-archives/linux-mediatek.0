Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D994C7EE2F
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Mar 2023 15:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QXIQx5nDcYkbNo6H1p3ii2JPlqk9YKmkZTQrpf27vXo=; b=xJI30cgunvHTLp2Ae3/pekrcg6
	mHlhNE/BqrD9S0+QEu5QAKB8tYWvnifb9is36aUl1cqJY+4WzpXhLToMgAzwwDQG6Ni9Y7/RWWOlX
	A464faDTeaj/jOUe4wTNFUteTiGffBYogJoygBV6VTesckzBV+V3deJvywIV0yd9b0FHwO2bLDLuT
	Gr9LutvphHeA/+NV3X3IzzyAHzArB14nvYXQyBNVFVwhCmwnxDtw9+W+929I7LGClcXA89Uqxhbwh
	mnU19ppJgKs94nmFLJXEecef5oAYp8wNP62tYaoYb3f24yZYEQo47Ag1ef+sm18mMgnBS5JDDpesc
	2mtS36OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXkvC-002h0h-Ke; Thu, 02 Mar 2023 15:32:42 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXkv2-002gzD-Vb; Thu, 02 Mar 2023 15:32:34 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D1FD76602F90;
	Thu,  2 Mar 2023 15:32:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677771151;
	bh=1f/oX2S4XQLn2VKQigkcWoRHEZPUsJtOVJNHPLo3jIQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LdKMV36r4oIJvm8klCfUdNbkFj8uuY4Kr2bS3kYTEZwUOTQZHO+REiLSaXfXRZIAb
	 xZlFc5xXX4RuZvxW8tSH8gSC7WlScnFbo8nAEOgnmDgttftKZpkbLgsyvL1TPqUhCZ
	 D3a2CfXtOfzMuujSJuZJjlW0XnEkTqwT0YH6QTZF0uyQVThXT6J1iIXncNhoepphAO
	 waxlTYUCqm3eyc2yVhpD3h8zPTE7QftOO20XEFtNJtOToN0K2AUeFPe1dlytO7t6tf
	 AlSSRJcb7cRgPw4A404XBZ2NcHc8fEjTorcou4yoM2acIVdCG44sPwByUj63CB7CFb
	 wK7hImM6+tO0g==
Message-ID: <c15c9766-4a46-04fc-ab42-2396d0a6750f@collabora.com>
Date: Thu, 2 Mar 2023 16:32:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/2] soc: mediatek: pm-domains: Add support for MT6735
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 "Garmin.Chang" <Garmin.Chang@mediatek.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230302122708.73848-1-y.oudjana@protonmail.com>
 <20230302122708.73848-3-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230302122708.73848-3-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_073233_192589_34DCEB40 
X-CRM114-Status: GOOD (  11.52  )
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

Il 02/03/23 13:27, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add support for SCPSYS power domains of MT6735. All non-CPU power domains

For the CPU power domains, I was cooking something locally.... but then I
stopped for some other higher priority stuff.

I'll make sure to ping you when ready, as I think you'll be interested to that.

> are added except for MD2 (C2K modem), which is left out due to issues
> with powering it on.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




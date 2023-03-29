Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1480C761A6
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 13:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WJLcrI/7rR9Es0XCYv2ONJUyzWrwwoM9uvDEV9oU+k8=; b=2ToafJMwg+VUzdpZZqz3PxtgdL
	eGZoPx/DtVK/aT+c7Ke+ppNYaiHeSvyhz4hrvOC1NwuZppgG6RerqMz0z+iYpeXc/GSfL8kE6o9Z9
	2+LkORgk1zS9AD8s2Asi9dyUwOtNQr2FYIWxvTZy2BCnmgbLY87FmomCW4RJjM0ESbRNx/jC7sg6K
	OSPc72hpzIRfZWNFy43XUEQ14S/o4Ag4pjZZuDaAmVjHQ+Lwgj/GyfXSZbPgmtW3yqV/VnYi+puTB
	y3Wl2atUzFS2itiVAJgLFDQik1kHkU0QW6QPLlEJlfSz2n9XR8FJPcdw/U5MlhcchVt6I1O4vxmmu
	w/QVIl+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phVgm-000JWz-1z;
	Wed, 29 Mar 2023 13:18:08 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phVga-000JPb-1q;
	Wed, 29 Mar 2023 13:17:58 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 647C96603171;
	Wed, 29 Mar 2023 14:17:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680095874;
	bh=+a9nJ+Gmk+pTlbG1fRUJCo0aSMEq658EZ0Tl+tG2DfA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AzFC/TmqJxEoXH3Cau8jnLBeCmKloH+ObTtbEfNVWxJy8M4/vzZUriFx8QiSymWxk
	 28xk6LdhKdyFjinEUhohWO97A/ofpp4JdwGkPXWS+2/qPQ4QBnJTm+J34BDNK2pRbs
	 sryrGhXxE/ArMZyK8PXv77bgjGhYVjAwxxURsmFHE4nz1Red9ZBUC8ZTE5e5wGkdAx
	 6w/OTSwX9Rk+AiS+httMUa/yctqNdM8mVB9umd7d6GT72HJPMK2SnBNbH5W6mYEtZ7
	 oPl5FLMOF7fWDtANYVX9bG8PQHMfVpHGDLyyopEKt9Iaf6gVebmrikTIP08iEZQkUA
	 1wRGIcv4+RlSQ==
Message-ID: <2e9748fd-2c47-60fb-8c8e-05bb1a2896c5@collabora.com>
Date: Wed, 29 Mar 2023 15:17:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 03/17] arm64: dts: mediatek: Increase the size BL31
 reserved memory
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
 <20230203-evk-board-support-v3-3-0003e80e0095@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230203-evk-board-support-v3-3-0003e80e0095@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_061756_741613_E49CBFAD 
X-CRM114-Status: GOOD (  10.63  )
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
> From: Alexandre Bailon <abailon@baylibre.com>
> 
> The reserved size for BL31 is too small.
> This has been highlighted by the MPU that now restrict access to BL31
> memory to secure world only.
> This increase the size of the reserved memory.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



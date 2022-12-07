Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39EFAC352A1
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Dec 2022 10:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=essp93k5d/kMrgG0TmxUrEDjP0tNXrAp2FXmfZnc3WE=; b=vJbXnCwMEcchUMqTbAFD4k78op
	83iXRUc0nAF5dTQf8HudanxPSDzYBKMIipkvqqCwOYBZyBux5PPbWuHwoif8HXWWDp+/HeM9sa3kU
	x0rRgpeZt3q3h5lSZottNVC5AAzQu19oDtRCWK0bcHJJqas8Me6bFh41IrnyvCzW9B3Go6t9E1gFZ
	AuqVGLlQh+ZpC7djcu/htGhsxbfwHs1JWdM8tvjGldq173b/gDqezeZLhDU+nmtq3/UnoXwu+Oldj
	miVibsQ2GPfulIva4Q/ch/1b/Su5hAorZTOLuel9eZdIk0cJuyQacHssVNoW+z5CF5LUzhpf7eat+
	x9wfF3Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2rTH-00H2zh-Qv; Wed, 07 Dec 2022 10:16:11 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2rSt-00H2XJ-3j; Wed, 07 Dec 2022 10:15:51 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 533C46602BCE;
	Wed,  7 Dec 2022 10:15:45 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670408145;
	bh=+LjBCBUFrmoCf4jsuAmPTeQcDLe0z20Y7u+s/Cq3KsU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=L+LJ3Qe8NYPriv1jiBI1ZG2iMmY4lm7AG9CxVuCGfHG7SWNtTXElbkpi3HrLPQCLO
	 XJnusTBHqbFPBPUsrkopWZSCVnDnCjJtRIQdbkR2qlB9jz7qSTLeh8n1Joe8f1CKlE
	 /qHZBmAxVql1FAgsGSySL39rNj155F/czH9Ndad0e07aZdwrmBUUYbLvEaTD4mX4Vy
	 8Co/F7Ea0OkmkrUVzGwO+aWRl54XXa53Cs3ZqUeXfk/4SQ1G3a+iStuV6VAkcVmxXi
	 9SJI1M3rlJABj5/5rCxNGIWEd115GqdbDQoVQCF1vM3068rT/rPz0FGSFIgSeGhr+R
	 tN7/tbad9e4VA==
Message-ID: <5c1dbeb0-c19f-cf47-a272-3346913a30c8@collabora.com>
Date: Wed, 7 Dec 2022 11:15:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 1/8] dt-bindings: arm: mediatek: mmsys: Add support for
 MT8195 VPPSYS
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221207094921.15450-1-moudy.ho@mediatek.com>
 <20221207094921.15450-2-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221207094921.15450-2-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_021547_310746_C520796B 
X-CRM114-Status: UNSURE (   8.37  )
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

Il 07/12/22 10:49, Moudy Ho ha scritto:
> For MT8195, VPPSYS0 and VPPSYS1 are 2 display pipes with
> hardware differences in power domains, clocks and subsystem counts,
> which should be determined by compatible names.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




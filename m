Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A5CC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 12:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KQ9BGXO+6kvar2Z7jnzrF+0ZWz8DjOjfbgB+M+nJEws=; b=jVxh+CNqFGEJsehTQppHdhH8rl
	7l40bBwc3WpqxtuLFhOVNOaND5D+yeNGZxzfH4FNZnbjk4ZF6Z2f4hiecBONtkAyLoY4Z8LSO/SEb
	toqxxi14senZSgGuNcA74CtjiMVuIA3W0HoetWH1V83yTnIGfm1Hpsr7l41le0jedMRyjdetQ/Rur
	kpqhiMfL2ZsuvBy19l8qk+A9swlNzisRgUBbNuoxQkPwXSVOXAlahUALtnnlLtjlfaP5hW0oPtNEE
	oJ7lRRT1930fqmrVRW/tYHWnHYtaOMY6CAShdLn7WdNSqgwZrCiL2N87sLyrV955LZ6H4sFTTltG1
	7+NHVuOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogPyH-002G6G-Eg; Thu, 06 Oct 2022 12:27:25 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogPy1-002FwX-PM; Thu, 06 Oct 2022 12:27:11 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9B15C66022F9;
	Thu,  6 Oct 2022 13:27:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665059228;
	bh=pTOa17syGcTn7Q5FCCjR0Pa3bJOxI8Q4e+HnhGoAweE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YdIrTuAxmzDH2b7YZLpYY6X1p8sDLthcurc7lFHuFEy7CyZbFwu3ScotyVB0a/HS+
	 f0SW9sbdozdxyP7ehABQIZ95Dy1SRmaP6urQoWKcbCA/BpY49seCbCxTtFFJA9g1NK
	 VMNWzXta91z8zWy6TLeh8yKZjRvYFzStULajVDjWGAHkqNz+zPEsBWQTdOz6w+BQYi
	 R0hqSRQAlpNAafFp3sCn3uVCIS0nnaT6m/2CATMBzZjJXDE5ZfMvJBfolo57Fmnegv
	 1MNpDdi29HqiiT1f7ddnwEwBM6XgsGrVCCyEBYZpQh7YYr0G0xoQKFIW/s/BpVeba2
	 fcPo4eAUVTJaw==
Message-ID: <bd9e6cc6-6ca1-ff7d-55e8-b78bac2401b5@collabora.com>
Date: Thu, 6 Oct 2022 14:27:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 8/8] dt-bindings: watchdog: mediatek,mtk-wdt: Add
 compatible for MT8173
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 nfraprado@collabora.com
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20221006120715.24815-1-allen-kh.cheng@mediatek.com>
 <20221006120715.24815-9-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221006120715.24815-9-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_052709_983373_092FB3D7 
X-CRM114-Status: UNSURE (   7.60  )
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

Il 06/10/22 14:07, Allen-KH Cheng ha scritto:
> Add the mediatek,mt8173-wdt compatible using mediatek,mt6589-wdt as
> fallback.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1720BC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Oct 2022 08:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w08FE6NF8f4DFQC7Ccj4waCIjX/6A1mhfwfvhwYT/KA=; b=I1XVeUPpJhAk1PliNjynEfgUUT
	7xzpdimytYGxahozfxzMTebiKWPN10qkaL3MOp6xw/5kTeuWgFs5hBsLTWPjumpSRbJ1IR/zcKD0s
	kFWbs5vGdl8eUGtiX0Lm+VlY5DfQCfZT5ClFC2OX7HzSQBINL5oHo4LeaYskx/dVQdPFZH3VPd4Cw
	pJNG23i4cRJN8NrCFFpkhcY/9OXnpeuU8SobN00xkX7+4ReaRjVdrcDWfSz7h3WdSeCAOTWHj1xd4
	KuGJXFGmyIQ/nidRgHfvfg10YHqEE3Dk+B0AQ9my2JK2Nsc67Ojg2h2xgWb3VPbS4ooTMsoS39JNf
	dfvaADkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohnxb-00HXEG-NR; Mon, 10 Oct 2022 08:16:27 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohnxQ-00HXAt-1y; Mon, 10 Oct 2022 08:16:17 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D3C726601F8A;
	Mon, 10 Oct 2022 09:16:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665389774;
	bh=F/bcGxKiauiDx1vMCcWjag85x/grkKbttemub2VO8Gk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ooOqjjbMKm12bFagBtZNjLwEY7FtVWk2ZXemH5waJVk1FHcIWpihO4+H3tQbKneuf
	 wbC12JPu01BNSANQQ9XBu5WY2MciiCDzTo23h+GqBb+EVhA3XXiYzSidplMDTB93LH
	 p67gnZIesjsNEn1Th5Y7geF5vV9lInxZH3t7dIeroqHA4cqP6m3GJ8VYMYofxn+d/M
	 tPtErbesrbc8ZNT4knsvJOav79/gvkoetuNZnatr4uP9fhlWCyt77azDFo5H4ezQNM
	 rFQwEIvr5X0lclMoOibU7JUIe3b3PgXv6UkeGGvdBgCxBPyrmRU2OfrUBfnFSRdDiF
	 nan0+fX3xQp8A==
Message-ID: <2342cbad-48fd-88d2-81b7-f68a5978ddee@collabora.com>
Date: Mon, 10 Oct 2022 10:16:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 10/10] pinctrl: mediatek: Add MT6735 pinctrl driver
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>,
 Andy Teng <andy.teng@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221007125904.55371-1-y.oudjana@protonmail.com>
 <20221007125904.55371-11-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221007125904.55371-11-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_011616_266583_90F84BA4 
X-CRM114-Status: GOOD (  10.19  )
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

Il 07/10/22 14:59, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add a driver for the MediaTek MT6735 SoC pin controller. This driver
> also supports the pin controller on MT6735M, which lacks 6 physical
> pins (198-203) used for MSDC2 on MT6735.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




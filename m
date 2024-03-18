Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 535D0C54E58
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 11:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3yafBlxfb1xWbD2B08eO2d1ClI58x5KT+sWxVb8l/jg=; b=TwPme6ccxk6yCLLiMkW/IRVd11
	ywr0UwuX8ZVR9qxM7DuEsIAqxLDd+y7FMzEhdnF+QY5JkWqoWGcZC1YV7266joUJRur6a6RgMkAq3
	KCHIbebZfqu8f4ycSzENzxZvmC6nTXx/wGN8nrCsC1U9yXGTYzIdpidftfdvAYCGx+vHZdxnoWgYj
	UCALOkf9R2G6rLX8XQpH7WEq8Z9HyCrL5pD7jPbFRAZDOrApc1gHBiItEomfEdaNso5wzc2rAL13h
	HnC+JsC2KAnfV/bQT6NaahO1TSO5yYzS2g+5zJwsAyyPvwhHGWRaaPsntwCHPRfJvpkGc0jvBWdzV
	wEJU4Z3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmBDu-00000008NmP-1t2u;
	Mon, 18 Mar 2024 11:32:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmA6U-000000087RL-2z5S;
	Mon, 18 Mar 2024 10:20:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3yafBlxfb1xWbD2B08eO2d1ClI58x5KT+sWxVb8l/jg=; b=gwXaf/4p0SLT5lyLoRZvF03mZp
	RyzVAA1cQHJUJ8YwUR2CkcGyvHe9LOObFtufyp9rlNd5AoDXBNy0RnPaZnE97MZnN1oZA8szmCPX/
	qPRVdn5OR5rhgIQtu8KDux6x2nVAi6jLi9zuBMyu3GoyixJX3p64mDgTGsh5Qj8OzLl3rrkR3nSrT
	SKIE9c5btoTqg/7h4+njsR+lv+08mK2EqfWqcRLGUO25oqT2cu/66+ywl+A6wePMjVPNKlPqFC3YO
	tbqIGwAu/DuxiKgqhARrvCZd3UHsSeGNaWbWwsPjaVcUZkvc+NqWJhLbMCeTfR3CDdBfc7btyBuQZ
	e5TLG4Wg==;
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmA6P-0000000CZtf-0EeU;
	Mon, 18 Mar 2024 10:20:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710757219;
	bh=8m2I0qNbHMrcATAanngbx08yTTqbz0dDFcQ2Aeb5DzE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YihJS4Wt5/45v2WATjRSkSpRyeASPm5XmnY+udTikrrZ7JiCbIQ483ucNsLiPtgZh
	 YgA1KPhpEQWmq5cSNx9vQ3FReq1a6KBX3BNSJxuWBPwk9wzLNcnFd7CnwnoebGcyeq
	 b1AiCKAAqNiCS9DjalEFQioV/cIREf6GLQ47M3PRN4WdOxBTD771jP4GNgYwEyZyb4
	 FpbD6TwfmM+6yXn7Me8oqCIF4q3EhGPTwI4wCenr+mgReQq2b/JV/S/aUYDUzA/vwS
	 aBhGs2raj0/ZiSJH/gXVY/ZFLcSyN4APHyLdM7fKNi4UdAU6pICJJ4VZeS04PSLRjZ
	 R6r23lUNTN6NQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0FD1F378107C;
	Mon, 18 Mar 2024 10:20:19 +0000 (UTC)
Message-ID: <c37a1b6b-0170-4a9f-95c3-2588f0f61585@collabora.com>
Date: Mon, 18 Mar 2024 11:20:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/14] mips: dts: ralink: mt7621: reorder sysc node
 attributes
Content-Language: en-US
To: Justin Swartz <justin.swartz@risingedge.co.za>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240316045442.31469-1-justin.swartz@risingedge.co.za>
 <20240316045442.31469-5-justin.swartz@risingedge.co.za>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240316045442.31469-5-justin.swartz@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_102023_810277_79E7360D 
X-CRM114-Status: UNSURE (   6.64  )
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

Il 16/03/24 05:54, Justin Swartz ha scritto:
> Reorder the attributes of the sysc node so that the
> ralink prefixed attribute is placed after those which lack
> prefixes.
> 
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




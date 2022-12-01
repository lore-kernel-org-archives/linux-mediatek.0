Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC6FC4708E
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 13:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wVeH6p0kCSXCsZdbvdWELLMi4kyHyCpGniuNAY03w/M=; b=MFdJo+N2d5lI7y/8ZtRxM/LHB/
	jXRIxjCjTpF9Hbcey3xiOhZHD75vywR/H/l/w9F+AVejVVh/QIAmR7tJy/Ma8tvgM2rgwR91HW+4U
	t5zNdPpxCqYtbTSzgkNTnvG1QnOpXL4to2OyEDMf3RICIwkypbl1+WJ3u0+8fKl8AkET4JV0PF9r7
	3zHc4rdpHY7Ugk/H1Po3BxW+r7JZcccacMff4DhdcaM8BB62MSbIKMn0r67NXTO2Q78g+DwkC2cjo
	MynDzg9cnRazbx+0Qtpk227VytTkXkRzSX4OybSOJ5J883NX0PoQebF5RTDj9OYyASTtC102yMgFF
	1uRNLBQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0jLj-007cf4-DR; Thu, 01 Dec 2022 13:11:35 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0jLX-007cbd-N7; Thu, 01 Dec 2022 13:11:25 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CB8A46601601;
	Thu,  1 Dec 2022 13:11:21 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669900282;
	bh=rJX/OvkJvH5IhNxH/xMksQl7S1Jl1zglOwTTa9llV2c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ghOktZk8/TjxXBxTxmavsyTF7g8EyMimJ9ei5wFANPpTUpZZ7+pWIFhVnYXoRrTCG
	 TaPnKfBYXrrzuTyhsnvZBk1qfzmZzZ2BI/waFWnGShlFMikrAHvgLga6o2l/E8e5Iy
	 loPHSYI8+P0Q7oDGCcH7F8gv9BDkm41L1vK1LfE84Ms9yiRFLe4xJszN0nN/yVSUDk
	 g5YsKGUxSdH0a0FzNz5TABRcXXcy3gOCbGeE9ut5Ngt85tQ6YKYpigE0N6oN5OUheF
	 79JB83VsBDd8Pi2NZo/1Sh0a8hFSFqhLsocItzh5+N/P4USgAhFrnLxsD1Qt1BCPxr
	 /lVRT1pNTAIVA==
Message-ID: <e3299122-8977-de7a-5030-6519bc99f658@collabora.com>
Date: Thu, 1 Dec 2022 14:11:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 08/11] pwm: mtk-disp: Propagate errors in .get_state()
 to the caller
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pwm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
 <20221130152148.2769768-9-u.kleine-koenig@pengutronix.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221130152148.2769768-9-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_051123_921926_932EAAB4 
X-CRM114-Status: UNSURE (   7.73  )
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

Il 30/11/22 16:21, Uwe Kleine-König ha scritto:
> .get_state() can return an error indication. Make use of it to propagate
> failing hardware accesses.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




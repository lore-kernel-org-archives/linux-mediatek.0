Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70222C54E49
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Feb 2024 12:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IhXQ9+wkGNXWdZbwznewetqB0D5iIczcH4EEF7ouiWE=; b=o0L2vkRbGxA0qBUeRGrBxuZ8ZY
	hez3BTI9nhWFD/KRpHd+R6MpAz8FALwxQZC3TePRd2sCl9mfYmEVu5vQePq6fNoARFgiTg5dJGNRE
	G4oIkig1ucg73BSNAv3dsGmE94edVqQvvn9x2X/gCBjARJQACUN3FzwjtYubKvIye0z9Mo/NUfXTq
	y+lGGcr7hIYCMLugEv/s74c7ILyl5lt43Pcps8HEAaB366SNi1Eu3u4t0HP+8FF/fCG7mwlnAKKC8
	9oZdoXzaUaoZz0LQBhmxeha7AuyChnlH+Gn7zTG+83lgXmg/5r9mXP884TgyYBrpdOJqjGavqReHz
	nCNQQ7Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reaBH-00000000bVw-0vlw;
	Mon, 26 Feb 2024 12:34:03 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reaBD-00000000bU9-1wiw;
	Mon, 26 Feb 2024 12:34:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708950838;
	bh=yTKK6qTVp/S8l1CYnLD9a4Jr8ZrucjT94QlJdY1OCxw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jsmsxXwVeXseXIYn86JQZ679HZED+QL5moQjh1DVj9GbMGu5KYHlE4tY0t1xFylXu
	 OKksilY4tr5zFGMmMaQUyt3yDZGNiqy3vMMcS/Y+HdUoS0C0hYFBIV8cQ3eKUT7hqn
	 xMBHfjl4y+CnUJMvC3dhRFr4vuRGUrWDsMylvifSwcVJNtyEto65c/rc0p58TNFq34
	 rTABcNH/qNCicSUQzUaIZ8+zhxMtGwHzMvIKAhSZksCdTduBs14HdfYdPDfIvs7x7H
	 PotQQlaIrTwAzMPbdLa1mY4wQis4X1G8MRcBmYCZzlVRh0GVadxzIGENsQeRLc8weh
	 hOUDq3V1f69iw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 414BB37803EE;
	Mon, 26 Feb 2024 12:33:57 +0000 (UTC)
Message-ID: <7866fd9b-6f68-402d-abdf-087b1088d28b@collabora.com>
Date: Mon, 26 Feb 2024 13:33:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: mediatek: clk-mt8173-apmixedsys: Use common error
 handling code in clk_mt8173_apmixed_probe()
Content-Language: en-US
To: Markus Elfring <Markus.Elfring@web.de>, linux-clk@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <6a64e7b3-b1ce-46c4-9c85-89f731aee592@web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <6a64e7b3-b1ce-46c4-9c85-89f731aee592@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_043359_681612_1E77803F 
X-CRM114-Status: UNSURE (   7.51  )
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

Il 26/02/24 13:26, Markus Elfring ha scritto:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 26 Feb 2024 13:10:37 +0100
> 
> Add a label so that a bit of exception handling can be better reused
> at the end of this function implementation.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Reviewed-by: AngeloGiaocchino Del Regno <angelogioacchino.delregno@collabora.com>




Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60035C44508
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2026 13:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ajz6QvfIPoWST2gPobUz4JJMn5hIHPMN2q0uTcAYj8=; b=vpB3+/WHbf+SfFL/uXZdTd2tqT
	x1VzNaZ+FgiCacMweVyDDqFDuktSAGFVOXGo4hSg0s92e03wBRXfC/P+/SC1M18O1b/TWOe4YcTq2
	Vp/PmyH/hNVx8b3PdVK8GbBLIGIcrWXgC2H7Ni0YidgLk4FyYJUO754Kk4z4DltxGvMfnyejidI5M
	sINhPM7Pu7QQ2E+xO0SOabFapb028sG7BpLodA34+FQZbjqru72LA4HXzK9lMR47lJdX5PfU4Vu1v
	hMMY0laQ0PjRuOIvUXto9zkSIu4YsB7aiT5DJv302GxfQcacrscDk8eppfyCrvPsFdTqmUYD/ysb+
	05qCgDfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzby-0000000EwGo-1KYa;
	Wed, 15 Jul 2026 13:25:18 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzbu-0000000EwFP-46Q3;
	Wed, 15 Jul 2026 13:25:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784121912;
	bh=X4hQ+PvvpEFhGE9C06CCHumxc5qZ+hbNEyoPw6puCII=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oXumkldPtd+e+lBP2cMWTV4Ri8iZUa5BqPUvQpqEoi09jZd+Z+fozCyBlv3i7buBm
	 0YhLBlvIADf/Rrg+TW28ks9sCjqpTLKRqGN31jUR4NQePGOGEN6Ps1fClmBiAj/Jss
	 uvuviNrBdHRhichf9JK4C6pt5+2ahBzZkygh4KwwDJvr8sAuufHL31c59v//drDXWb
	 EF3oUnOuKmjuunj8uy80HKIIr6pW29XMOexWQmokxrSz2S4ZrVnD0BlAB25uWYXBgg
	 iwU9O+kHn6z0LCtaJrwzRaDLeTLQQvNvL1SWcIrpGWSFNU+MCgunihXM8xrnQcMMfl
	 wr+jKqU3LQ4pA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2D4BE17E0DE9;
	Wed, 15 Jul 2026 15:25:12 +0200 (CEST)
Message-ID: <0f719c00-3cf5-4403-afbf-713b07255981@collabora.com>
Date: Wed, 15 Jul 2026 15:25:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: enable hs clock during pre-enable
To: Esben Haabendal <esben@geanix.com>, Gary Bisson <bisson.gary@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Adam Thiede <me@adamthiede.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>
References: <20260120-mtkdsi-v1-1-b0f4094f3ac3@gmail.com>
 <8733xko1ms.fsf@geanix.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <8733xko1ms.fsf@geanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_062515_179831_8A07C8E3 
X-CRM114-Status: GOOD (  12.46  )
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

On 7/15/26 14:53, Esben Haabendal wrote:
> Gary Bisson <bisson.gary@gmail.com> writes:
> 
>> Some bridges, such as the TI SN65DSI83, require the HS clock to be
>> running in order to lock its PLL during its own pre-enable function.
>>
>> Without this change, the bridge gives the following error:
>> sn65dsi83 14-002c: failed to lock PLL, ret=-110
>> sn65dsi83 14-002c: Unexpected link status 0x01
>> sn65dsi83 14-002c: reset the pipe
>>
>> Move the necessary functions from enable to pre-enable.
>>
>> Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
> 
> Hi
> 
> I have run into the same problem, but in combination with another
> pipeline. I am seeing same problem with an i.MX8 using the nwl-dsi
> bridge and the dcss driver.
> 
> I have submitted a fix that adresses the problem in the ti-sn65dsi83
> driver instead. With a bit of luck, it can replace the fix proposed in
> this thread.
> 
> See https://lore.kernel.org/all/20260711-ti-sn65dsi83-fixes-v1-2-d85eb5342b98@geanix.com/
> 
> /Esben

That clarifies a lot of things.

The patch on mtk_dsi shall be reverted then.

Cheers,
Angelo



Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D0EC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Aug 2024 07:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o4hAv10eTczG/p9L7z/itYfE+K0OeUaX4itGH10J/gU=; b=i4nmheMlSlrTNwIAe1rdkPVol2
	51hfFCduJkKM8AhiSnQtGGnC82Vq8K1VM5MlyAtygoOkOmBlVw4vGBfAAibGfsvzaC1w/7XaDdpKk
	ybWIMi4P6sDoTLrW67nmZC0D6VVsSgt5pNg53fnReFfSrFtJvNM6ZiF+MU+xcE/uEnBVNF9FY/WRE
	ANXR3flJCX8otnGLQw8ngRPnM6TGLLo3cXLEmihGBbKOJJGb/nGTt9b+faD5PcFORv55cSe/hrlJ0
	zao7FZYaPLnrWs07P3Wr98MMYpIHjyKgXmymHTlPairoGPN+haVtqOhnNYpkxKiaU1ZTpecsN5/qT
	fvthewBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZPwv-000000047R4-0vuD;
	Thu, 01 Aug 2024 07:10:09 +0000
Received: from mout-u-204.mailbox.org ([80.241.59.204])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZPwR-000000047K2-08y3;
	Thu, 01 Aug 2024 07:09:40 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-u-204.mailbox.org (Postfix) with ESMTPS id 4WZKpM35cdz9shY;
	Thu,  1 Aug 2024 09:09:31 +0200 (CEST)
Message-ID: <17deb48c-6148-4e3d-aa0b-6c840f55302d@denx.de>
Date: Thu, 1 Aug 2024 09:09:27 +0200
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 1/2] net: ethernet: mtk_eth_soc: use prefetch
 methods
To: Elad Yifee <eladwf@gmail.com>, Joe Damato <jdamato@fastly.com>,
 Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Daniel Golle <daniel@makrotopia.org>
References: <20240729183038.1959-1-eladwf@gmail.com>
 <20240729183038.1959-2-eladwf@gmail.com> <ZqirVSHTM42983Qr@LQ3V64L9R2>
 <CA+SN3soUmtYfM_qVQ7L1gHMSLYe2bDm=6U9UwFLvj35odT0Feg@mail.gmail.com>
Content-Language: en-US
From: Stefan Roese <sr@denx.de>
In-Reply-To: <CA+SN3soUmtYfM_qVQ7L1gHMSLYe2bDm=6U9UwFLvj35odT0Feg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_000939_234758_E4E4BDE8 
X-CRM114-Status: GOOD (  17.27  )
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

On 7/30/24 20:35, Elad Yifee wrote:
> On Tue, Jul 30, 2024 at 11:59 AM Joe Damato <jdamato@fastly.com> wrote:
>>
>> Based on the code in mtk_probe, I am guessing that only
>> MTK_SOC_MT7628 can DMA to unaligned addresses, because for
>> everything else eth->ip_align would be 0.
>>
>> Is that right?
>>
>> I am asking because the documentation in
>> Documentation/core-api/unaligned-memory-access.rst refers to the
>> case you mention, NET_IP_ALIGN = 0, suggesting that this is
>> intentional for performance reasons on powerpc:
>>
>>    One notable exception here is powerpc which defines NET_IP_ALIGN to
>>    0 because DMA to unaligned addresses can be very expensive and dwarf
>>    the cost of unaligned loads.
>>
>> It goes on to explain that some devices cannot DMA to unaligned
>> addresses and I assume that for your driver that is everything which
>> is not MTK_SOC_MT7628 ?
> 
> I have no explanation for this partial use of 'eth->ip_align', it
> could be a mistake
> or maybe I'm missing something.
> Perhaps Stefan Roese, who wrote this part, has an explanation.
> (adding Stefan to CC)

Sorry, I can't answer this w/o digging deeper into this driver and
SoC again. And I didn't use it for a few years now. It might be a
mistake.

Thanks,
Stefan



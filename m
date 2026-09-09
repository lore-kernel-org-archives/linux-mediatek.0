Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC278C79F8C
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2026 09:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a1Qjg46nmHCVbooCZPCrDuWX3aehr3OoOopE6rMLjvA=; b=l/VvuTwKVYxJ3U86UxH8SMsCjP
	DvoMllzhbIMUbDlinFNclxBdVYj1JU2UJDhqQI8yj0i2TtigGVfnW17LD8EfwE91VgInKdRsEnNxs
	JroX6qiLZbYqgz9iiRRfrsKhflbtu52BZSceyo4scZTO130Eie8omqNaTh03Pc479xptK1vOjrcDB
	KzTXy0CaZmPAzhmFc/7yq65zLrT7J5h0U9CkbKznjkOl3XDRLzo23WeIJyPp/nhRQJEiwtXbIknRg
	chmzJN+4yFJ48IMKzA7biHgrSnA74OMJiGLnVjGSwt5exifTzjFzuy/dSlzKzdpN9FHWytnnmK1hX
	gkOZStdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4EOx-0000000BGAE-1NDB;
	Wed, 09 Sep 2026 09:15:31 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4EOu-0000000BG8x-0qg4;
	Wed, 09 Sep 2026 09:15:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788945325;
	bh=Q1hPFcHkvswbhbdcsLOQX7sUlSGIB2PG8xMG+T49BdU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dT2IlqVYjgDxGh0a45aUg5OLWqBfn58Tqt+giiqkH/WI7jCVZTpq39H7OPXvyc+9k
	 Y7bmq7IYqc98Lfkus42umstvLW4rDYwwLXiRDBWrE69flsMPUEkSDwRLTQoQrqN8//
	 3gASZwZWUVen+9+pS4SKdmBNCG5c+lkO6TUtRKxiYEJZJKsrvxI1xHnCxH0caEpkRh
	 KU0WcYboDKQFpEtc3jES2L/YVxBFQmtLHoyU/mNFh4FjPzvLP++Mw3sQ+cFhpeBHUe
	 tWs4wzGEGcrtF51V24DffIbEm8ehBowmunz6LbYkd+S6ntCu2Oarxo8mfP7KjcYC4j
	 df2B9WEsk0Qpw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CDED317E06E0;
	Wed, 09 Sep 2026 11:15:24 +0200 (CEST)
Message-ID: <3bb91821-e618-4992-8f95-8e2631568bbe@collabora.com>
Date: Wed, 9 Sep 2026 11:15:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] ASoC: mediatek: mt8188: mt8188-afe-clk: Propagate
 regmap update errors
To: Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>
Cc: phucduc.bui@gmail.com, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Kees Cook <kees@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Douglas Anderson
 <dianders@chromium.org>, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>
References: <20260907120310.135693-1-phucduc.bui@gmail.com>
 <20260907120310.135693-4-phucduc.bui@gmail.com>
 <e011cd74-7c5a-4cd1-b412-ad11765ad11c@intel.com>
 <a88fbf17-faac-4902-bd39-ff0a616a7d2d@sirena.org.uk>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <a88fbf17-faac-4902-bd39-ff0a616a7d2d@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_021528_461958_B60AE8EF 
X-CRM114-Status: GOOD (  10.93  )
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

On 9/8/26 20:52, Mark Brown wrote:
> On Tue, Sep 08, 2026 at 07:49:00PM +0200, Cezary Rojewski wrote:
> 
>> I'd expect someone from Mediatek to verify this.  While I agree with the
>> change, some drivers follow "ignore register update result" arch and,
>> what was previously ignored will now cause basic operations to fail.
> 
> We don't really get any review from Mediatek, AngeloGioacchino used to
> try to cover things but it seems he got busy recently :(

Yeah, sorry about that, it's busy-busy-busy days here.
Also I had a summer break, so 1+1=ouch :-)

The changes are fine, those regmap updates always succeed, that's why it works,
and ignoring an error there would actually break things.

Cheers,
Angelo


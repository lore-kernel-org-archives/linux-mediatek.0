Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0547C6FA90
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 08:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Lu51fual+umcflh98oaVL3GuaBNujH/GNY+Xr4o3LY=; b=mCDVRnFYWUEdXpSD7eZVFc3k1N
	wLJze3KaD09DAWYvzDz4ixEPkd5j+8G8MY9nMB3J+RDZV4+Wv+9kOWoD8wCnxtASCtkv7SoJnrEsK
	IbHZGz8iRYyN0isDwRsjjvGB7jmJrQWEU1HkGzmxp4NFLbRbGO5LzAzQOqyqbm/SnZyN35fCUzt4w
	kHnKhdm5ByFIL6zVmxJrPojcEbfG6/dTmbwDmyXPZQQFiv9jPnMkMwDOQD7bXBFmki6rK24VjClzw
	RiusFqxC9bfXj8k+dGs8V2tOqPHvHW6gUmXK15PuKX6hXp6NZ3/9NkBHMnQRwQwr2m/9NQ4vwq98z
	rqlYZBfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obeVz-0036u0-Ig; Fri, 23 Sep 2022 08:58:31 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obeVe-0036j6-09; Fri, 23 Sep 2022 08:58:12 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B8481660223B;
	Fri, 23 Sep 2022 09:58:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663923484;
	bh=HojcwP0javbKhpGvdwYvvMIBYQZE3Xeo/wFOgWUndY8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iD16nnr+RBRce4iSEjLfgXsSPpjxVUhKVYNDIXj/tboj1LMFvkL2WS4pBlSJH/Wj3
	 JIzxEDdPjGy0cQxcs/wWIQwfxLLn3KpQ3DWI0EHTSJ+DM0sgJuYpQQTTooQjBC5ync
	 V+jtcIxZWGSJwPBpRmWLzSCC4EIFR7EigEopN26wCAZxAsUsMzqMCZnaL3Of4+yfIL
	 45wDe9NSPnTFsVNdDOHEOlgT1imX6pPELEQPQKDUpdbv4sMj5gyYgGAbbGYGgpq7TR
	 5dL9kwI+BZSq/5PU8wd7MWc66JnIOTlQzF7TIe/EEZF+jA4FfCNKU5arfF2gZL95jb
	 RMyhMhX7rjMiA==
Message-ID: <c8205995-5398-6b23-7e35-c441c42232d1@collabora.com>
Date: Fri, 23 Sep 2022 10:58:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 6/6] ASoC: mediatek: mt8186-rt5682: Expose individual
 headset jack pins
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>
Cc: kernel@collabora.com, Jaroslav Kysela <perex@perex.cz>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, "chunxu.li" <chunxu.li@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20220922235951.252532-1-nfraprado@collabora.com>
 <20220922235951.252532-7-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220922235951.252532-7-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_015810_187543_3DE0C3F9 
X-CRM114-Status: GOOD (  10.36  )
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

Il 23/09/22 01:59, Nícolas F. R. A. Prado ha scritto:
> The rt5682 codec is able to distinguish between two event types:
> headphone insertion/removal and headset microphone insertion/removal.
> However, currently, the mt8186-rt5682 driver exposes a single kcontrol
> for the headset jack, so userspace isn't able to differentiate between
> the two events.
> 
> Add a definition for the headset jack pins, so that a separate jack
> kcontrol is created for each one, allowing userspace to track and handle
> them individually.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1435C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Nov 2023 08:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jKiBQPmxlYyP9PbYN7O9fm1NX4rZHgTW/MVcDSQpvyc=; b=DBRghYhpuEUxO1ix2TkxZPzhzW
	8beKjlydw81iEesk5QAa8QMsyT92C7iT329EXcZj9fASY92vha/58cABLfcqT/SugVuzP5pRiCepc
	Xh93Q/0Sz+01SUYqgW+TQHhToOUYQKXKqWB8MUXUPTB3/di0LFs8VuxlfzS4yd1Yc9xe0JJixRl2d
	n5Afkn3XeIrqYg0HJJEh2cbRcVYqaWkIe5qO7uwfRLjqeB32jQFqm+BqjmBkWGgPewWkbB0zBk4lP
	jT5UxdfmVRekB6Zi9cgRfAFxBD1YhB8RBU+PRzsvFdUa8vr9iZFB06JJdHbfV+ZE30+kc7/Hgww0z
	eFR2zC7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qypa4-00AzQC-2N;
	Fri, 03 Nov 2023 08:31:04 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qypZy-00AzPJ-2u;
	Fri, 03 Nov 2023 08:31:02 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1C8FB66073C9;
	Fri,  3 Nov 2023 08:30:57 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699000257;
	bh=hLNERQKYSutn1+nzWzkjaZyBsSN1vmekpilQjSSBvnM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a5olgv2+2bKK9cdt3dTFCVaVCWwFsldoYKQYekZhFqRkLjFoYyMfAZtAbVIHPob8H
	 gjmglpPAsAsfPfQ8GZ5NVXC81IM09i+WmxKOkRW9fMk2gT0w0IXq4yhBwrngzbG30n
	 Kz62r1vExIyg/wmwUZKjq6fP0a7pkmG8f1iwMGxSFY/gqWw0Bu0ISiYDzNbxDdpnzO
	 ESXyiqb3KTBrmfD6OCASPQKGHcEGfuOrL+nmXPmyZXFTYjEpfnbLZhQeNo9qqpeoTe
	 hRXA+wjog+6i69RUnJy/vm8KPICEXgWJh2NistTjPzYAPQWqb0Hm4HxTD21XcQld69
	 L5wn5JNOAAvjQ==
Message-ID: <ec054c43-f4c2-492a-9da0-65a8235c7bb9@collabora.com>
Date: Fri, 3 Nov 2023 09:30:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: mediatek: mt8186_mt6366_rt1019_rt5682s: trivial:
 fix error messages
Content-Language: en-US
To: Eugen Hristev <eugen.hristev@collabora.com>, broonie@kernel.org,
 jiaxin.yu@mediatek.com, linux-sound@vger.kernel.org
Cc: matthias.bgg@gmail.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20231031103139.77395-1-eugen.hristev@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231031103139.77395-1-eugen.hristev@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_013059_065418_B7B497FC 
X-CRM114-Status: UNSURE (   6.14  )
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

Il 31/10/23 11:31, Eugen Hristev ha scritto:
> Property 'playback-codecs' is referenced as 'speaker-codec' in the error
> message, and this can lead to confusion.
> Correct the error message such that the correct property name is
> referenced.
> 
> Fixes: 0da16e370dd7 ("ASoC: mediatek: mt8186: add machine driver with mt6366, rt1019 and rt5682s")
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




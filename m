Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475F8C64ED8
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Feb 2023 08:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+qmdLrPLJ8b1lA4ppcVO/AF4QzV/x8izxaHXLboYOc=; b=AAK8oucyEGAU9VhNDt4+y8IUXI
	d9Hnayav30Kqb/GQtA+5ivk6Hp66HZTjtlfpibfV3nWChPm0wIgE1RYFpgHvWMOSHM5s1kYMXTJ3u
	Ni36bl8KJHkD3mvfrP0O6yF9kXKtbKQu6XTzWCeOmvfNlRag+YFBZHUuJqwNEmfOkJns9CWpjgvg5
	xMJTiDkKxb8AR8ETh5vbyB72vyVMI83kkoKPGob5wYTDhvri/DU+5oh47e7IUW+nZL+AM3infL9rI
	WGieUo61PPpnz9/Zj9GLoc9jEoBBPoOwikjUWDncodq43BnjkChl7nKA1Xt2GFD/PIxME79pXHzvz
	vflnlXXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWZFR-008upL-FT; Mon, 27 Feb 2023 08:52:41 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWZF7-008ukQ-HD; Mon, 27 Feb 2023 08:52:23 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 27FFE660230B;
	Mon, 27 Feb 2023 08:52:17 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677487937;
	bh=1cjR+Xq8SfKyd+hm/j5K52t9SjZ2Kqz/fBguJHl9Mrw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XIyPZGUS8NuNQhjSRdzFXQH7V5W3pLmlbZbKtXq601AbToU/PdBQ459erH1nO1gTi
	 A++sXxNeBe8oO7PVeH0oiUeeAfPQ9nfqdPlZOgd/yxYiTQXPqCuDF4YEfsbu9VhplK
	 mVir1CDVv66TueYNfAJlivi/XeEo2hPpbj+b0Xkh4O1TkNqMbQOIpun0gRHR4/LtEF
	 AmvwOZQjuQHKoyMDobuourF4wxH8j0Ip3eHkexHUXpuk3PFEgE5CVgAODAn8NQJl2K
	 UcujQrVARxpKEYvU2gOI+lOcy51hjCyZHxPZX5RgKb0gb4Sh8piRU5OBTFqoq5hV+q
	 5cNu18kR8a16g==
Message-ID: <14138157-aff8-2a60-ec97-12495f30dd8f@collabora.com>
Date: Mon, 27 Feb 2023 09:52:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 4/4] ASoC: mt8192: Fix range for sidetone positive gain
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230223-asoc-mt8192-quick-fixes-v1-0-9a85f90368e1@kernel.org>
 <20230223-asoc-mt8192-quick-fixes-v1-4-9a85f90368e1@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223-asoc-mt8192-quick-fixes-v1-4-9a85f90368e1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_005221_831026_9D84E647 
X-CRM114-Status: UNSURE (   9.65  )
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

Il 24/02/23 15:03, Mark Brown ha scritto:
> The Sidetone_Positive_Gain_dB control reports a range of 0..100 as valid
> but the put() function rejects anything larger than 24. Fix this.
> 
> There are numerous other problems with this control, the name is very non
> idiomatic and it should be a TLV, but it's ABI so probably we should leave
> those alone.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




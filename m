Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 760D6C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jun 2022 08:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TT+rFvz9yooV8UAwF5man/gNYrhWChruFV2EUXnuGt0=; b=UyFn48jO8SLZg3b12KqNoHd3Od
	Xt+Fdmh4g5EEnyTZWB9uQPG64iie32jm6FbROEEoeMBfks9DDuoK1v92ENtso+mJchZkf51MwXK8k
	fSpEkt9/Vse6hrFJ43W6gwPqVH36TKnOJITY7pZyBBdR37VLHEi2fTwQ4PMejn1yp9TObSYIlYvnx
	mYG5XXrIwNc8Qt05cmr8fEkulp2kldI4O1dOQlGr04Wm2v+HKeqRaaVOOd+pyCoqWzEvLLyZxqc6D
	J+ihiP7swg9uxhgr8gRWeMYESkMItH+v9L6FIDW6zjOgfBBqLMomeQ+ltC8//MIfmEfgKjMms6LfJ
	LZaTZP1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3CMG-00Gp0i-Aa; Mon, 20 Jun 2022 08:02:04 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3CM3-00GowW-Oz; Mon, 20 Jun 2022 08:01:53 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EA044660166E;
	Mon, 20 Jun 2022 09:01:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655712110;
	bh=g5QlZVQ9AY69dLhGJBI/NoglBgUUwPY0hqE1JlNdASQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WA9wKi/gQWlt5xFzenLxlqRm5TK6T7eh7A/TO5GztVNNvaN6+rQKhhrc99jX2EBCp
	 yYgDzQ46twRQlBTVl/L9HYqQTrGsaB+YZ2SdhCNnuKX/EQipNH9p4th8+uaFhYfNfb
	 E4WbOyuMyrL1wfQRDOtBHAg+hDnrFEBvzI7xKvtw1OR8EdnPtdFr2ip8tsELDOPOt5
	 5EstX3ZSuqIjEBjXnAJpz8gmvgBH/Ygwmocnhxtbg3xTeP8nESsh+fcsYkSGvemRry
	 XrExpreGrzI0rDTG/Ni1RSCzT67uJn6Op8YuSf0cYHr6S3gH4NBh5Ji7qZvVFd3C7R
	 BHcZTwSOC5xww==
Message-ID: <61b06602-999f-b976-097f-895907798b40@collabora.com>
Date: Mon, 20 Jun 2022 10:01:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/2] arm64: dts: mt8192: Fix idle-states entry-method
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, James Liao <jamesjj.liao@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20220617233150.2466344-1-nfraprado@collabora.com>
 <20220617233150.2466344-3-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220617233150.2466344-3-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_010152_019000_EF845322 
X-CRM114-Status: UNSURE (   9.27  )
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

Il 18/06/22 01:31, Nícolas F. R. A. Prado ha scritto:
> The entry-method property of the idle-states node should be "psci" as
> described in the idle-states binding, since this is already the value of
> enable-method in the CPU nodes. Fix it to get rid of a dtbs_check
> warning.
> 
> Fixes: 9260918d3a4f ("arm64: dts: mt8192: Add cpu-idle-states")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



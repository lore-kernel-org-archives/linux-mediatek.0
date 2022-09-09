Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68586ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Sep 2022 07:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8js4mY5d300D2EyukYdZlRY9QVgM2/Mfjy00bOlTl4s=; b=EvfQ30xTOdpy/RrTr3Hp7fY03i
	XqJku+7qJYpew82AK9/KxVsxs62NA8+2OBQCkWUix/zMhd54x2/Bj+u3x2siTdhg+ZMbXGKv4Q6Hq
	zg/dbnIaAxeuoHrjoMVhB9UICQXp/NJbM4XjgOSIFAoqo1zOLVcy55FlQHxVtxeDKUpP1s+433fhQ
	A/+5B1SmJZhv9DAq0u1Etd/c4FxCyz8NsXmG8rWLBav3DaCRK9Bsxw+RjjMgmJivKkzkgYGJkTep6
	ufr3XBtGYyaCCLF5zDdtm2p2w+XaHGLpJzWzDGxBFL5MmKKEAfiUsJbfTie9t4J9c4i0EEZGGbJ/f
	WpYbnJug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWYXL-00Dysk-65; Fri, 09 Sep 2022 07:34:51 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWYWt-00Dycs-FE; Fri, 09 Sep 2022 07:34:24 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A9A4D6601FB2;
	Fri,  9 Sep 2022 08:34:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662708861;
	bh=zNSBueW1a9+ysgM0uoEjVV/0yBh6M55W7WUMoLNV9iU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hVi/M4OfDsOClQHIHRxGdUN6r+kDmBjqFhVpdzqFyhLMXFzquFsQUJL9xroW7hWy7
	 V6PQYpJq98BI4U2VjYGd4GDdmkWzKuxg7xMnKVW/RrIuxvmxnhCoq9HeprO77IwBe8
	 b4SoHT7kWINV6Trz6Mc6EcfN/HZ3ZCO9CTU+ce/eZxpGn1BjzZv77Xeoc7S7upbzqu
	 3YltU28Ww7hKTP1nDsHhbJILW+39sw5LC5tLPw7qVd35yHKICX03eXrHcPW4lh4ihk
	 pzCD6gDDVY+0njb3CRAi+arcmFS/o8t+nMXu9If7DCtzxz+sGOMbFVMykD44LuwREu
	 qHfu7O6aI0r5A==
Message-ID: <37b895ac-2876-4821-b3c7-6bf75c4d701e@collabora.com>
Date: Fri, 9 Sep 2022 09:34:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 09/10] ASoC: mediatek: mt8186: Configure shared clocks
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, Jaroslav Kysela <perex@perex.cz>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 "chunxu.li" <chunxu.li@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220908161154.648557-1-nfraprado@collabora.com>
 <20220908161154.648557-10-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220908161154.648557-10-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_003423_658465_D96613A5 
X-CRM114-Status: UNSURE (   8.50  )
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

Il 08/09/22 18:11, Nícolas F. R. A. Prado ha scritto:
> i2s0 and i2s1 are paired input/output connected to the same codec and
> should share the same clock. Likewise for i2s2 and i2s3. Set the clock
> sharing for each pair during the codec's initialization.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




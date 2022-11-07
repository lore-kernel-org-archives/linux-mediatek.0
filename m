Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A867C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 09:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QTvJ4IAM8ntYaar8yFwLeP9P45F7xUHPiQWrWd4A/JI=; b=SUhB5VEXrIjyeUZZqPtfrVFVoC
	Z+KCEefNdfCuspgFFug3ft4liqXtIk4wyUw6qh4NvNNhABCv5FUqTAcikzHZRBmdskPOwO0n40E8o
	piSOA8UhK/bAR8h5b+tpdpmYP+RnKNFjHGYSkqosGqWFxJSPMOFD4EyRPq7Q6y3+k0mJLBqATnogy
	5RJxgxAGlUn1l3mImaUIvjncEUvSIpcCqkMC12BjQ2b4Ui9mWcvb6KmjIMEf5D5rfQrE0QczIQ50v
	PazoDwhokXPkFK9J5yee089L3v0kxjG+I1mmt+AbkKQ45bzuL4oGSzhKVK9lphsLk3CpKazGOpzc4
	FNnYcDgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ory74-00D6pY-LX; Mon, 07 Nov 2022 09:08:14 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ory60-00D66d-En; Mon, 07 Nov 2022 09:07:09 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B3378660239F;
	Mon,  7 Nov 2022 09:07:05 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667812026;
	bh=prmGmYokfxjatbKpcc4DQXf1AZmk9zVLfrXHS15NugY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JY3SBDqc0y+wUpmIZtCHEyo/Y2S9DGJBc4bzw8gaJOf4eOE0ng0bVT+aFGsIYg/oo
	 BYDCAb9OgYO5bp2DBPTUvwxCAx9Jqn+HCvVQCFGjpkv4rGgwhMgSxBY73g2zBH2Y+0
	 KB6ess79kEPv/lnwLGFL2iVICMuaIZu86Mbm1V3vF0ScgXNTc1vwx0SYBAN0LPIA5f
	 WerpxNGiElXw9P5Iz5SI1s7aFkqHSRqExET7dkoqS6luj9mYbd0H0IaXo7puG0WFzM
	 iy/gz+AIGkWJdT84jbR3TEB4qCh7Cxxv5L6KRt4gV6rqRUFuajw+K9zYiIeGqCy/lz
	 KKuxkxUVCycxQ==
Message-ID: <b4e53cc6-ad6e-dfc1-608f-ce9243f73bbc@collabora.com>
Date: Mon, 7 Nov 2022 10:07:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 2/2] ASoC: mediatek: mt8183-mt6358: Register to module
 device table
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>
Cc: kernel@collabora.com, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Tzung-Bi Shih <tzungbi@kernel.org>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20221104212409.603970-1-nfraprado@collabora.com>
 <20221104212409.603970-2-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221104212409.603970-2-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_010708_659002_10036D20 
X-CRM114-Status: GOOD (  10.67  )
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

Il 04/11/22 22:24, Nícolas F. R. A. Prado ha scritto:
> Register the compatibles for this module on the module device table so
> it can be automatically loaded when a matching device is found on the
> system.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




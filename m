Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F82C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 08:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=19inQixE+cAajKKNusigFmsdUj+SJA6P/T5pzhRONLM=; b=ujFPcQHYM1Z980UBnYWsBRgBOh
	DfYPo0WpEOXPTyII8JDecABraFUKywpx1qbQljDYX4d/r24DF5Rbpj0Fjk/lw6b/AmOJ9+swH58FO
	alj1CiefZs1DWK5dFmsWxkoezwrze63dPjHof9CQmICbSIHpTDUT0CkaxN2jYROIWlhm5IxwHDZH1
	kFKXCC1rGBdlY+/mJQGtmCm9FAxj5PMmlEXcQH92uIvApzxKJvrLbqnQqHoEHetfdMwC1HJQqvLBR
	2Q1ImHHFTHQUgcbWdxqGSIDGJOdLjCOpRkLGT/q56DvRXTxQN23KNtljxqpll0CpDekQdo+wXvGIQ
	eqkjWugw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osKDl-003oCb-Ln; Tue, 08 Nov 2022 08:44:37 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osKCg-003nhQ-Hl; Tue, 08 Nov 2022 08:43:31 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B6562660299E;
	Tue,  8 Nov 2022 08:43:28 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667897009;
	bh=q6qqpBqwMQgI0Wus+7X9VLIEmROhuwDUjEYSYZTBgvA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oYHJb2lTtqeanl6/Y9ZrUQ/UJ9GPs8dEAkVygeid7QP3yK1A3iW0ewETprTusGvQA
	 EUiH2eSsegxiWoAuH4UcLIVoplcxzSeI5fNUey84OdSYLa4aQ4UIOYme7HHh3OALJ9
	 F5qJvAfNjK/p6E47pf256nA17fzT3sF1ejG2UW0YoPPZNjrIPWug7d8Zge2i3lEke2
	 fjN5qWlAt1pjlSfjXa3R/dlMRtCOAyjBqBdWmCatj/8YwI92VCaJMHxwF06WU8YBVh
	 nCJI7sSkxabOrk4YipVua88Am/06tIzHRBeNWerQosBF3OK//CNKQZMfsFe2AdHhXA
	 fV6KgjFShitcQ==
Message-ID: <f329d007-1b67-1010-fccc-17dd0174fd83@collabora.com>
Date: Tue, 8 Nov 2022 09:43:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 6/9] ASoC: mediatek: mt8186-da7219: Register to module
 device table
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>
Cc: kernel@collabora.com, Jaroslav Kysela <perex@perex.cz>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, "chunxu.li" <chunxu.li@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20221107160437.740353-1-nfraprado@collabora.com>
 <20221107160437.740353-7-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221107160437.740353-7-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_004330_781952_8F8DF568 
X-CRM114-Status: GOOD (  10.82  )
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

Il 07/11/22 17:04, Nícolas F. R. A. Prado ha scritto:
> Register the compatibles for this module on the module device table so
> it can be automatically loaded when a matching device is found on the
> system.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




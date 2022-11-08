Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA30C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 08:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=19inQixE+cAajKKNusigFmsdUj+SJA6P/T5pzhRONLM=; b=t+yyKJoehurStMPkdteP6nvrNr
	hS/INbYnsucEhvzjimtVLtPI592A73zIO347zEtwEKbUvmdrmFrHQZquOhWnZ6gPDIu7Zl5CBqxcB
	sXp0sPYgli/jxzPIjiqxD6eW3iOMJ/h3eiE6T5cKW9qSXutZN6OY4YnZGQyS8uZNGk29Ob/YjRRYr
	CoIRZ/mzuYWEwyiNe89ka/SR2DYdTyp4osTAlgE1UICGsery3LfzPDgGHwH+JpKHrCZlpfjw23MAc
	+7cvU1IHlM6bJaim2COpH3LcoBwPToTi9yB3QjkXGFEGnbRctsSnaHdH3vOk13q491D+h67DuxvoB
	Hf5NFySg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osKE6-003oQp-1G; Tue, 08 Nov 2022 08:44:58 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osKCi-003ni0-FH; Tue, 08 Nov 2022 08:43:33 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8CDA266003EF;
	Tue,  8 Nov 2022 08:43:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667897011;
	bh=q6qqpBqwMQgI0Wus+7X9VLIEmROhuwDUjEYSYZTBgvA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kHYgo+ZfVVeNHM+XU/s9aYJLPn5XF2JrEarPfga85dei003HizH/3elmkMSzsBSMY
	 K+hzj3pVzzG7QBw4lJVwW82aKIedPKqA7j4VB+YBHbKxRgIJJZplhq758wz6BWfix2
	 AQYbvm+7YHPo48R1pcPqGuGlfkaXxnr7pff8C6ObTMF2b/0/xzBawm+0SfRR06Ruqt
	 I96Jb1nzEGSSZMijUFFQzedcvhSXxJYJJPVlr3NpMdEsncr05E/UVS2EtPzMTVTR47
	 1fW9+YS7M/j2llVVvHdTDq4q5uy24vTyC2l7yAQo/7WxijGTD+Lnq9FyzLwBwKlraK
	 wlgEH6RJS9fMQ==
Message-ID: <1814aa2d-a2fc-fd38-9341-000080e68311@collabora.com>
Date: Tue, 8 Nov 2022 09:43:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 3/9] ASoC: mediatek: mt6797-mt6351: Register to module
 device table
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>
Cc: kernel@collabora.com, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Miaoqian Lin
 <linmq006@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20221107160437.740353-1-nfraprado@collabora.com>
 <20221107160437.740353-4-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221107160437.740353-4-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_004332_682846_07BF03C1 
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




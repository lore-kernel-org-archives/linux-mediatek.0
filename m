Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D47C05027
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jan 2023 13:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZPvdfbiaBnzPJfah4ONGzijXEOAUS2p3wuJaFvaEGQI=; b=iJQPH2PkCAJBHW1FBcBocIeWgW
	JOfcxr3808497cm/FOoVOfVtc/nMWn3cbw/GqoXcERI4C/PULGneG6tOeNAI5pdrqsy9lzIqekn6/
	dVPyclxFmfF+oxD4tbKZmm2kqnDkA2tAcJjINUnCX7CCpbITmmmDYoGY1v/gckCzQxTEY8Rc3qnmS
	1lxREBcx8VHGvt/vr3CZr9InLUXgRQ5swPGsW4Vk83uf3vIeQ/zIZnLW7scA/TvJivUXLvkiiZX9v
	59kjsspjP2N9Z1dWzqEGNuxkYVZ+Bu8Xnjifn5j6vttsg7iUKjo2O0f0HAfHssIQC/+cy1j0iFgvo
	qtaPBlow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL2Cp-00AvPP-Ci; Thu, 26 Jan 2023 13:22:19 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL2Cm-00AvOi-Vc
	for linux-mediatek@lists.infradead.org; Thu, 26 Jan 2023 13:22:18 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 23F5C6602E70;
	Thu, 26 Jan 2023 13:22:12 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674739332;
	bh=PFjk7Lwomgg5i2CpzGsGjt10RBQ/x3BeqMztijLbhMw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=L1rfx53K/+HWdvL1cFrlzGxZv387Xj8Ya90h3fuTz4wMoksDSXelcJszna55ZhRbL
	 g4USt4nnYYxPHhEAHfCu8fQxK6Q8cfPl+A1FEMKC1MUNkbEBBYVhYcbM8hsLjRQmtc
	 J0aHr59lUYz6GUfuZrH5I6yJAoJtJEV1kr0aGGPtn94D9nwsBgUYIRvQ31PffMO8HF
	 EkgrUEk2lau+3IpH6suc9ngYFTg6cp5dWk7CbOnYXPbiTCRuHZdmcikQmU8lD5e12P
	 7kFZniCswiQV0vwKifCAMoeMwEEnuTWVZ+GzvOCW11ZOkxyvrHGkZy8ULBaUAyBpfp
	 a0PFtoVdaPJmA==
Message-ID: <6f376bb9-2f44-b705-6843-795c0c1da742@collabora.com>
Date: Thu, 26 Jan 2023 14:22:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] ASoC: mediatek: mt8188: remove some dead code
Content-Language: en-US
To: Dan Carpenter <error27@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Yang Li <yang.lee@linux.alibaba.com>,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 kernel-janitors@vger.kernel.org
References: <Y9JHSwcfdNcfMjjt@kili>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <Y9JHSwcfdNcfMjjt@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_052217_173735_5F84D92A 
X-CRM114-Status: UNSURE (   6.32  )
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

Il 26/01/23 10:26, Dan Carpenter ha scritto:
> We know that "irq < 0", so delete the unnecessary check.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



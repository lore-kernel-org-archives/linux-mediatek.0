Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB38C0015E
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 08:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=51+nQcVdhNNa5VFT89AMwLES+Miq8wkFQwHXgc9N9iM=; b=BhhA8er/KfWmK8oxZ5wWv1ObFO
	7VP+Be01eGqUAPZuGm+64mxGmXqfTLJ9kZMiL7F96Wzhkyk4cbcUbsZBIIy307pEBCUkhFOBtQELr
	/Obta1aUtY9ttJTtG628NaT1QHwpdW+ittDpOtfhOzKIrI1v+VCATCwaD4zkaO3oSCmdOY5laL8dZ
	p9/KF0Bk6HBTlIBoCLIpBf6MLhD7zcB2R+I7VFesyDRSXYEKiII5NFo5nO+8rvePoJsIDSfB+Y/aJ
	2jpxDYCn9lUXIOchtdeGkSIllywTI1ZxI1//QiaVV9dTzH39yee+y/Z/ynYsOTnE0h1ujeJB81kRx
	Ywwbk0lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRTxJ-00745a-0T;
	Thu, 03 Aug 2023 08:45:13 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRTxF-007452-25;
	Thu, 03 Aug 2023 08:45:10 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AFCFE6607194;
	Thu,  3 Aug 2023 09:45:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1691052308;
	bh=vxO92imHE2Z6sjCwWRr0/ol9TddebHGfHxEdF6lX4Po=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MZiaBWeRUkj5aVVhzsRRnycAHQC7M9XDtCl9LBSlklYRbsRx3RkjVcHXEeimdh87b
	 Dt4zDkg6tBESami9zmzfy1Q/UdD3uACQOfVv5QXJBMie2UGDPHuV0b7psTJ6HVr/46
	 CcOpwZhb4z0Ng69N4sE0QX/Gq05f/IEMvMcfe5HmAgMte1AVoKzZzODx4L/2Cco5+e
	 abolvidM70Q3yO67p9Gm4gaTE0afk/p836YgCyIRTeE8l8BXjdIUYVdmIZ5em6+kV4
	 RveIKgcbHQO8IfwqY3DcPX7tNdMaOIFzkqo/WfIjTT/VMAPGE/OwYWaHFTren7bk6G
	 5+dAdWJVBWAVw==
Message-ID: <4a340bcb-0459-f616-9a7e-c80f4b2ac21b@collabora.com>
Date: Thu, 3 Aug 2023 10:45:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ASoC: mediatek: mt8186: Remove unused mutex.
Content-Language: en-US
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Thomas Gleixner <tglx@linutronix.de>
References: <20230803083908.9DxbPvOK@linutronix.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230803083908.9DxbPvOK@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_014509_874138_AE5B33B5 
X-CRM114-Status: UNSURE (   7.73  )
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

Il 03/08/23 10:39, Sebastian Andrzej Siewior ha scritto:
> The mutex mutex_request_dram has no user.
> 
> Remove mutex_request_dram.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




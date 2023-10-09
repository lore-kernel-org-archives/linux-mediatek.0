Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C50E95A97
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Oct 2023 08:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cl+m81BBVLBnWMs8qGfsFgosQdSsvuWO4U10ZQdu/E4=; b=L0jp9C0lN0WXMyAW/ZFqIG8Oel
	miOdxJ4J2JN/y4ewbAvbxiXQoRC2adSoGfMznml38JDY1f3pbywHVO6RXnjLI4PJIPSOedT4O0ycQ
	gYdpmIGUfURLaaVm0/ac++U57Fm58dD+fWzv5QXXZxJthmZaAyLIcnodB4GgKgCQ2hHCV8qBgDBcw
	814fH1baOGOn1u2qVZWOlvBrqDtlB/lUV07frdCt/Z6jFOeGVFUYfgfVz5NK2dwNySl4RPHmkPSzK
	UCprdcWG9O+kdIjPvOq65EPUkJUzXUPbJh51ZA7a7/vKnWEPBpeBQD2THR+AIQZ8yfl/TIj0zyBWZ
	1mXsCjZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qplzP-00A1GI-22;
	Mon, 09 Oct 2023 08:51:47 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qplzH-00A16q-2W;
	Mon, 09 Oct 2023 08:51:41 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DF581660708F;
	Mon,  9 Oct 2023 09:51:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696841498;
	bh=1gNhaObHCLIYEZDj3EhK4FrxanyZDjIo1h+E/Gzi1n4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T2qHtnQ8kryfd85e/V0SXXGnyo6tZ7ZqoyGsRS+B6S4aL1YlSfY1Of5dxlhl+Od6h
	 GfGgeT48fUGv9e3sz6ghyS8HLIYHKdFmbI4WCPV7LWfRK61KmyA1qZTnD1Se1B+6gV
	 Zoath4IUrRiBlDzP7qTxdfctpLV5gW5+G3sa6OVpg6A5+a8zyUFCl+bjwHRN+Di+Li
	 aDio7E2mXB8UQWIo7YB49VM0A6Wh/Kp5Os3JP0UpsvAHWw0Dq8j6Z4lJLC5lt+Ot+y
	 tOHwqsO1JdVvUkWPwM49+CVehRPcpSlgud7VRQjGTg1C+lr5Wf18AUgY4ifNOVMVbe
	 fTF2KnSFcYNbQ==
Message-ID: <6134be37-b1dd-d0df-6b45-00aced9e1685@collabora.com>
Date: Mon, 9 Oct 2023 10:51:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 3/8] ASoC: mt8173-max98090: Drop unused include
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 alsa-devel@alsa-project.org
References: <20231006-descriptors-asoc-mediatek-v1-0-07fe79f337f5@linaro.org>
 <20231006-descriptors-asoc-mediatek-v1-3-07fe79f337f5@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231006-descriptors-asoc-mediatek-v1-3-07fe79f337f5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_015139_973654_5A9F7E55 
X-CRM114-Status: UNSURE (   9.61  )
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

Il 06/10/23 15:46, Linus Walleij ha scritto:
> This driver includes the legacy GPIO header <linux/gpio.h> but
> is not using any symbols from it. Drop the include.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CFCE95A9B
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Oct 2023 08:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tzox3PJckWEkKL6d3K5RAyuNMVQBmiRwRGcsTD1SfhE=; b=qqA83ZTa3c4YfoiDIXnx2etF2L
	u09B072vi6b+iI610WhZlboreEWqGaz6KV6yg8Uwp3PE34RffgIw1yjwH2TVRyMlcPIRONu9uyUno
	Zvb4XgsNjJxjOu04MC7LLuzP2rXJXLFEg+aWMiZdRFuUKC7Rqwumulx5eSheoB51aR+DX6vATKFnb
	tWbbuDTgfT6Y9fZOvmLI1BIp8uNMUn0bSI1NxkhxzXs7rUi2XjE1SX9NtDwAZELSDSpuFL5lg/Sjr
	FexEaz+/bnfMJXs7fkrX1fS4xaD/tSAiV4vW8sf+FeVEh4Zy+nD/SFn1XGBB2E2hdhW25H2Ay4Ecd
	6BzTiRRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qplzM-00A1Ca-01;
	Mon, 09 Oct 2023 08:51:44 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qplzB-00A11y-0e;
	Mon, 09 Oct 2023 08:51:35 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5F2FA660708F;
	Mon,  9 Oct 2023 09:51:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696841492;
	bh=UY+qgo19DN9smM4tqXBzZgl8bnhNBRKEjaxnMvjZtpA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jYdMYMkOIpjeICvEe1jn7aDn3VoCBm0LIn6BRupMI+SriDgip+uUGPWy4gFFwIKBg
	 1tIMw4vChvJnGQIpqatgs8c0b/qTUnFJdhugdSGxoD7Ba1VZDlg8WfK3Mol2vd1CuY
	 CF4TFb2552NXR1FGjPAPIlfcj14v//a6LE+gr/fsS5slZlB9SBoeTpq40xElLK4LvG
	 N7MY8r7uvOB5knB0nqyrRihBb7Q2CgCtAecq3vAejSx9ykrzHFI2tg972C8RfK1HGp
	 JRZSua1pQ41tO7/a9WVAkpGa7XYECoafr8a086tNxp580s0jv9S7hKg8bQxN4Lx4T0
	 lir5OYOu8L1Ow==
Message-ID: <3c226979-3a26-ca11-e6a9-984e278d9cb9@collabora.com>
Date: Mon, 9 Oct 2023 10:51:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 6/8] ASoC: mt8173-rt5650: Drop unused includes
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
 <20231006-descriptors-asoc-mediatek-v1-6-07fe79f337f5@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231006-descriptors-asoc-mediatek-v1-6-07fe79f337f5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_015133_367846_679BFBAC 
X-CRM114-Status: UNSURE (   9.84  )
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
> This driver includes the legacy GPIO header <linux/gpio.h> and
> <linux/of_gpio.h> but does not use any symbols from either of
> them so drop the includes.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



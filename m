Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12266C64ED8
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Feb 2023 08:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dH1AQ2qOFK8aYT+l4D8K00c5QZNibMkrWJxO+JLIL2o=; b=EZRYUuSMgDNJqLdrtyTDhBQEeN
	/BfNTCgp+63UJO6I5u2oXzKTUzjiyASVzimTD3EXqiQLXsfh86qzHuiSkzBi3Dd91ZSJMGWaHQkYY
	xx6fC0VJ/8fY1dtb7E13TD5zZZqjCNpmM62ylP0pizY8ICszrYCzx99Q6pZbu89jX7MFD66RodpJS
	ywKFfCazwncQII/vBLB2qWX1/7JlX8XJNDJFcslgZ8i73ul72dTjki1McfrnDUV3hgfUaeNYJtiJm
	8qJFphhX9+20LjzibYddNg0sw1kBxAeRvHE13+dJ594bJPk0fU7/jr1CBE+nrk6DvZWNWgg2Q3j6/
	jdQsTkgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWZFu-008v36-Ef; Mon, 27 Feb 2023 08:53:10 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWZF9-008ul1-B4; Mon, 27 Feb 2023 08:52:25 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D6EB76602E52;
	Mon, 27 Feb 2023 08:52:20 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677487941;
	bh=BulOGLOKzlIB0+/bAVSjgDvFC4bHgyqkAhu6rkh31DQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=njnlvTLpOGdWTryKU0CHx0XFsjCMXGGkKJC2DUDrB1Ph1wmQm7+HWX5HKu7J9HVR4
	 61d7snZ6nI9f8y85tt6ZUpU9wD/copiLHxIzwsEAWZu+vr/DV4jzG1rWJMLJkM0Ta1
	 FYqyoOENA62kKpbVIbYKJ6rSOHTjXE9JyWHn6RNvmyuicVRknNjwikWFnu9m1rd/as
	 mYVdDpd8e7/EjS3EiVIUmWOFUGIROow3iBIoROZ0yqMLje3pjeBBqB0JlF7vk7ayrZ
	 feZw5r3p4KK1aNlPNpxSx520yKUt9XAGa5AcnFY4YasSWxb9RvN+I8uFLxJBGKRZMj
	 ei1fYei9WwLnA==
Message-ID: <b3a31d51-527f-dd77-6e27-6b75d53367e9@collabora.com>
Date: Mon, 27 Feb 2023 09:52:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/4] ASoC: mt8192: Remove spammy log messages
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230223-asoc-mt8192-quick-fixes-v1-0-9a85f90368e1@kernel.org>
 <20230223-asoc-mt8192-quick-fixes-v1-1-9a85f90368e1@kernel.org>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223-asoc-mt8192-quick-fixes-v1-1-9a85f90368e1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_005223_698733_E0C59321 
X-CRM114-Status: UNSURE (   8.25  )
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
> There are a lot of info level log messages in the mt8192 ADDA driver which
> are trivially triggerable from userspace, many in normal operation. Remove
> these to avoid spamming the console.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




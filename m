Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79073C5479D
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jan 2023 10:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OhzdySPOLY1Xrh164RsRj3n1veQAAzSokfOR26ztCmA=; b=MblMqhYfCNwnxqhCr5ygS7P2Fc
	IknZ8dh0oHZyhpKyLTGLhpKmnq9Wro3mv+fB/SzY6uxKWbUj4L++/VsxRG3GPcxYtQN6xRcIDScG1
	UWpZauJ8mXRHkRhWdpMzEB72oevPGrKOHXUROkEVXlYt5M0H0RejdE5T8Bv1C5Q9zw3t057Qedelu
	RPxXJXtC7eM9tyn+TxlGAU+JuApfJVRgnLy/hMn/BidDaIn1bC/XSbwiynzsdGdejNNnl596+gx4J
	GUbv6MBXdPqbonKWEXwTNQ2Q2aGkr4mCr8idv25MT5M+1/MyGlT8bbb/5yPR/A2XshMICG8SyDu+4
	VH7qnDvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFYTd-00ApkX-DF; Wed, 11 Jan 2023 10:37:01 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFYTS-00Apgr-RN; Wed, 11 Jan 2023 10:36:52 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C29C56602CEE;
	Wed, 11 Jan 2023 10:36:40 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1673433402;
	bh=H6zzHJpHQe1KvLuxZKBTil2t46+1H+8k2jz3su1ylJM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Rx59Oac2V1EYhsjboFmG7hLyyIMkP+MOnbiyspABilPj681rqxLlV1XHg9GLsSgWs
	 jsnxNcGF5hx2JB4OssIvba/es9sEMyyD9U1hPITXMBc5qXdk+Pfuw5NEpfeL1v9M5I
	 lO3hH7ezSBT0nQ482mAIL8HT59w2s9Ipki4bD5REZcOwrhxXpbsMzvpEYzQDDmSVNF
	 cHZSZ3EmBOZ2peeEEUwQs1ieAHRKWZl1lb2d2ojvVq0QfKl0GF/9jD8DZ63cpOW8AF
	 BKuJ3QUxMBhrBUMa8BhzTudZgdOB0/Q5coLVnULtXZh6hbWAEi3GqaRM4qvWPpKZ4V
	 0kylkWTLvW+KA==
Message-ID: <e263490c-8ff3-d19d-bcb8-8a81ab7f6245@collabora.com>
Date: Wed, 11 Jan 2023 11:36:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 11/23] clk: mediatek: Switch to mtk_clk_simple_probe()
To: Miles Chen <miles.chen@mediatek.com>, wenst@chromium.org
Cc: chun-jie.chen@mediatek.com, daniel@makrotopia.org,
 devicetree@vger.kernel.org, fparent@baylibre.com, ikjn@chromium.org,
 johnson.wang@mediatek.com, jose.exposito89@gmail.com, kernel@collabora.com,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 msp@baylibre.com, mturquette@baylibre.com, nfraprado@collabora.com,
 pablo.sun@mediatek.com, rex-bc.chen@mediatek.com, robh+dt@kernel.org,
 ryder.lee@kernel.org, sam.shih@mediatek.com, sboyd@kernel.org,
 weiyi.lu@mediatek.com, y.oudjana@protonmail.com, yangyingliang@huawei.com,
 mingming.su@mediatek.com
References: <Y74jNZbjpopT2rNY@google.com>
 <20230111085645.30683-1-miles.chen@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230111085645.30683-1-miles.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_023651_048721_E432D2CA 
X-CRM114-Status: GOOD (  11.82  )
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

Il 11/01/23 09:56, Miles Chen ha scritto:
> cc Mingming
> 
>>>> Would this get cleaned up even more? I.e. have just one driver left and
>>>> we could have the nice *_platform_driver() macros.
>>>>
>>>
>>> In the future, yes - granted that I find someone that can help with the testing,
>>> as I don't have any MT2712 hardware here.
>>>
>>> Not in this series though (please!).
>>
>> Got it.
>>
>> Maybe Miles has access to some EVBs, or knows someone who does.
>>
>> ChenYu
> 
> I do not have any MT2712 board.
> Thanks for Mingming's help, Mingming will test v2 series on the MT2712 platform.
> 
> thanks,
> Miles
> 

I'll remember to add Mingming to the Cc's for the other series that I will send
after this one gets picked.
Many thanks for offering testing!

Cheers,
Angelo


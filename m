Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4285BC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Dec 2022 12:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=stw085RXin8uz7pckB1ssGmJu4n3Ys83eq+XrCwRNdI=; b=F+mLissKg9aFa/DGy8psGRVgaC
	7EUGneuHV2L0QaJY2k5nVl6iYc2Q2x569NpAQ1EeWxK+3KnRDQPF0vASIA4RI0V+ahDELjrGLAJ8S
	jNVR0VTqRrPgujLn5v2OefoGSGZ7ViTqtERp3LGQ6vR/WsMX2zT8hQtgdOgl43wFyCTOJ9OHyp2zV
	JFmjNiBJ0CiBUm3SwhWqBpmpHbWomXPykEeJ7ntqp7E4osQnKw4oqQoDrRObs+fdemHyEbB2Lbwks
	/cf1sRxW7rb4yUpluN3nmKHL472WgemFs+YyOOOsHr4JlJoTaeL9Aoh01p14y/EZEaAJlAL7ulIjc
	yKeOsdVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7c45-00FCPT-0k; Tue, 20 Dec 2022 12:49:49 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7c3e-00FBiJ-85; Tue, 20 Dec 2022 12:49:24 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C12FC6602CAA;
	Tue, 20 Dec 2022 12:49:17 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671540558;
	bh=uGXlE36mRq/BYyoqodZ5pF44kBFR2pVAybg3QahvF7w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XViJ7ZV5NaLQlEGP8eaRIxYWLWtxf9gx24I/KKI7E04Ml0BoaLyPIc9cuERX1rvEl
	 rISkZ1FATOKl2h4S36BBSDK5kYXakBZGizsfZwm3ixB86Xyxw/c4E6Ogw5hV+mRGPd
	 KmiIQ/fIcx/q7PA8xu6lHjd4qMvmRvtztS1jsX57wLEV3puU6+EapWtXjk6/CimwgZ
	 5FTvewz6h6VC+fAHTG0Xy1kVz2R8ShnQyAMgmtlmh5PtbiOsr4NKmOlFNQWklb7ox2
	 cvkNPao1/LBEVKh/botVicByQ+E4yqU/i5rmvmn41kMV/1cwhRKQKRRTMw9CySuZTu
	 FcETm8w4a2USQ==
Message-ID: <068c2537-2563-9e81-e92d-f1fa18a0206b@collabora.com>
Date: Tue, 20 Dec 2022 13:49:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] soc: mediatek: mtk-svs: Enable the IRQ later
Content-Language: en-US
To: =?UTF-8?B?Um9nZXIgTHUgKOmZuOeRnuWCkSk=?= <Roger.Lu@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "ribalda@chromium.org" <ribalda@chromium.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
References: <20221127-mtk-svs-v1-0-7a5819595838@chromium.org>
 <d683a2e7-b886-9bf6-27df-d8c67cedbbdd@collabora.com>
 <b8b14bcb-845f-aa18-f8aa-ad0bed9fb0bb@gmail.com>
 <52fb6ccf3fe1cb11f3e330ecc4d9c6cf1225c98a.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <52fb6ccf3fe1cb11f3e330ecc4d9c6cf1225c98a.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_044922_505881_B2CDCF19 
X-CRM114-Status: GOOD (  15.96  )
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

Il 20/12/22 12:03, Roger Lu (陸瑞傑) ha scritto:
> Hi Matthias Sir,
> 
> After applying this patch, SVS probes fail as below on my MT8192 platform. If
> thing isn't too late, please do not merge this patch. I'll ask Ricardo how to
> reproduce this issue and give the correct solution. Thanks in advance.
> 
> #MT8192 platform SVS probe fail log
> [   10.209430]  SVSB_GPU_LOW: init02 completion timeout
> [   10.214402] mtk-svs 1100b000.svs: svs start fail: -16
> [   10.219479] mtk-svs: probe of 1100b000.svs failed with error -16
> 
> Hi Ricardo,
> 
> Could you share us how you reproduce this issue? I have MT8192 Chromebook and
> can give it a try to reproduce the issue you encountered. Thanks a lot.
> 

Boot a kernel with Kexec to reproduce.

Regards,
Angelo

> Sincerely,
> Roger Lu.
> 
> On Fri, 2022-12-16 at 13:47 +0100, Matthias Brugger wrote:
>>
>> On 30/11/2022 12:00, AngeloGioacchino Del Regno wrote:
>>> Il 27/11/22 21:22, Ricardo Ribalda ha scritto:
>>>> If the system does not come from reset (like when is booted via
>>>> kexec()), the peripheral might triger an IRQ before the data structures
>>>> are initialised.
>>>>
>>>> Fixes:
>>>>
>>>> [    0.227710] Unable to handle kernel NULL pointer dereference at
>>>> virtual
>>>> address 0000000000000f08
>>>> [    0.227913] Call trace:
>>>> [    0.227918]  svs_isr+0x8c/0x538
>>>>
>>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>>
>>> Reviewed-by: AngeloGioacchino Del Regno <
>>> angelogioacchino.delregno@collabora.com>
>>>
>>>
>>
>> Applied thanks!
>>




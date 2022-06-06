Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCDB3C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 10:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lPdcpRcE9hxu6MWaFow1Rf7oE5kHgk1AvSprPjw/sd4=; b=Nik1MNIDzUcp+S
	KLhEBKtmJAu6Jt2GoL1xckqzQ18tSA4zi9+lIhsujHBZbRlrljlku6HPVFYF8yEqJ16PYqpeI0Zwo
	fl7rTmM5Zk2zoTCCyjEEFy7pDJLnhg7u6YMjmVAZR5XPDqofZvSRd0mCKAhYIRc2tc8MHCEq0jwT8
	NEcFly8uwGNtJP2Coui9g/awDxeC+898oKGCLiXLOC/CUHSemjE7aWiIhNqoH1foJbSy+0M3BWRu4
	e4qb4nPANOjJhTmMfV80/GoY6LZ+hafKHW28UXu9UkenmVyjePuY1TGs+6fpn4WiNgMQx+gi+Aoyl
	yLC0JhMa8EPnvetPD5+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny9kV-000fVd-Qv; Mon, 06 Jun 2022 10:14:15 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny9en-000cqR-5e; Mon, 06 Jun 2022 10:08:22 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7E5046601E55;
	Mon,  6 Jun 2022 11:08:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654510098;
	bh=6Uvj8oSgSh3XaO2x3wCFADsMs6ooqEZD3nKhYNDXhaU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ddmp06anVxj0htfEdxrQB9l1y8xBbyqy8NggFB1A5XDgxBm7VWo6W7kkYG9k2S2hb
	 q9IT4CktJcVWrqVq6XkUuGcFoR+sSPhuUJaNewUwBNsk73dIZuMDMOqCj8oNuqc9jS
	 TzCR7/np/ULwlYCTf+77J6Rt6B0La/iLi1puO//xoS+VpHHRfDzITe+jqMs6ETSDCu
	 hUv0ETuyKgrVEyfk6QPgw4YLCqg8p8XaWMrGt7cV0iRPoMhgO0ifYdJjQ4ap3Ju79n
	 CaOQsSK2KjzcB9YJmeCPUwEeedRqRN8eTevRGLOAVKc8biC6FGnQJK8t1ZAX+1VKYE
	 1tIETrX9MCmNg==
Message-ID: <4062e8be-3ac7-c6e5-dc15-bb11bd6051fc@collabora.com>
Date: Mon, 6 Jun 2022 12:08:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v1 05/15] remoteproc: mediatek: Add SCP core 1 driver for
 dual-core scp
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Daisuke Nojiri <dnojiri@chromium.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 "Dustin L. Howett" <dustin@howett.net>, Tzung-Bi Shih <tzungbi@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Prashant Malani <pmalani@chromium.org>,
 Brian Norris <briannorris@chromium.org>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 Project_Global_Chrome_Upstream_Group@mediatek.com, weishunc@google.com
References: <20220601112201.15510-1-tinghan.shen@mediatek.com>
 <20220601112201.15510-6-tinghan.shen@mediatek.com>
 <dd12145b-bbb3-b771-b8f7-075ea20bee17@collabora.com>
 <fe9fae165443f0db55f2bac2bbe214f3b018052d.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <fe9fae165443f0db55f2bac2bbe214f3b018052d.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_030821_417687_00D18A63 
X-CRM114-Status: GOOD (  23.31  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 06/06/22 11:52, Tinghan Shen ha scritto:
> On Mon, 2022-06-06 at 11:15 +0200, AngeloGioacchino Del Regno wrote:
>> Il 01/06/22 13:21, Tinghan Shen ha scritto:
>>> MT8195 SCP is a dual-core processor. The mtk_scp.c driver only controls
>>> SCP core 0. This patch adds a basic driver to control the another core.
>>>
>>> Core 1 and core 0 of the SCP are housed in the same subsys.They see
>>> registers and memory in the same way.
>>>
>>> Core 1 of the SCP features its own set of core configuration registers,
>>> interrupt controller, timers, and DMAs. The rest of the peripherals
>>> in this subsystem are shared by core 0 and core 1.
>>>
>>> As for memory, core 1 has its own cache memory, and the SCP SRAM is shared
>>> by core 0 and core 1.
>>>
>>
>> Hello Tinghan,
>>
>> checking all the patches that are introducing support for the secondary SCP core,
>> it's clear that you're practically reusing *most of* mtk_scp in mtk_scp_dual.
>>
>> I don't think that adding a new configuration option for MTK_SCP_DUALCORE (nor a
>> new file just for that) is a good idea... the code is "short enough" so you should
>> really just add support for multi-core SCP in mtk_scp.c instead.
>>
>> After doing so, I have a hunch that we'll be able to reduce the size of this
>> implementation even more, as I see literally too much common code :-)
>>
> 
> Hi Angelo,
> 
> Thanks for your review.
> 
> This series has 2 new files, mtk_scp_dual.c and mtk_scp_subdev.c.
> Is your advice to merge both files into mtk_scp.c,
> or to merely merge mtk_scp_dual.c to mtk_scp.c?
> 
> Thanks,
> TingHan
> 
> 
> 

I suggest to merge both into mtk_scp.c and commonize/generalize functions inside
of there as much as possible... including the removal of #if IS_ENABLED(...)
macro usages, as you can simply check that during runtime by setting a bool
variable to true when it's dual-core.

Let's do this first step.
I'll give you a more exhaustive review on v2, when this main step is done.

Cheers,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

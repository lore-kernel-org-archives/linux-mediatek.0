Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE90DC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 07:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rm5Ex6ht9DJHEfh4332bWwu9u/AlndJaFO0I81Krli0=; b=DU1NBzEY9HPdAS
	YCiSDd5QZWiGOWfmaDgSObq8RJlyYXaO0reNnLi5G+Ks1OcYpJ8KoVHE3e73RIG+FvIwICezkKA+x
	GTUcVPQoSSSMlHos4Grs4vKgmuHbDzY3IAJpi9FkhAzSXW6p/HpJM5jDQDKFEVW30T8DrdinB2uzD
	aqDmmwkt+8NtZw1XdCJ9AMJQknfu2v7WSZVS9zSXS7os9aymTRETmCm9Z8GYP5BaPkOv6yuvJ2oFo
	vHZrRd+xSgtpVtm/S5UVWts9fMqlPxUsZc3hrQ7Hy89OReYYUpaFx7tQnWqinPz1FJST4Lj0FVZvE
	SEKmnEfx54DWVJ4FiC3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noKmX-000TuE-Ms; Tue, 10 May 2022 07:59:45 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noKmH-000ToS-PX; Tue, 10 May 2022 07:59:31 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id A101C1F43DAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652169565;
 bh=0/8USldqeWAsxzFJkTMe/8nTLoFf3bblkE2WDOxfPaA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QsSJbWxROhDdXBTTpKGk8WfomsV9vGvfl5NVqtQMOcuI4iJMx4XMSIXTGNnpEzlLp
 LWdFgEckcYsR0PXF27dkvzglxnwhf3XmzbaARO41Bd1v7NLCYZG9vkSkbTqPRsr3l8
 7aNGkc2g6uhsfHplnw12egiZBdv8eSYeXYzKWHvgyKXJNC58znt2w92Leeli4C1+GV
 HisD8QyimlyMsqzky7MFckxo7NhS1/LPbtz1gLNL0pkmj9MeZWap9Su26u99S1ExPZ
 +76bFGfHVMTL/okru8zzb9WqInBShKFX8TpFnde4UfnAh/oj277gTFn5RedoDfAdW+
 UycI7AxSIvj4w==
Message-ID: <5f61f655-e5bc-9e70-ce11-431b630a5331@collabora.com>
Date: Tue, 10 May 2022 09:59:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] PCI: mediatek-gen3: Assert resets to ensure expected init
 state
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: ryder.lee@mediatek.com, jianjun.wang@mediatek.com,
 lorenzo.pieralisi@arm.com, robh@kernel.org, kw@linux.com,
 bhelgaas@google.com, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, nfraprado@collabora.com
References: <20220509171631.GA605998@bhelgaas>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220509171631.GA605998@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_005930_130252_7778E907 
X-CRM114-Status: GOOD (  11.49  )
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

Il 09/05/22 19:16, Bjorn Helgaas ha scritto:
> On Mon, May 09, 2022 at 02:18:34PM +0200, AngeloGioacchino Del Regno wrote:
>> Il 04/04/22 16:48, AngeloGioacchino Del Regno ha scritto:
>>> The controller may have been left out of reset by the bootloader,
>>> in which case, before the powerup sequence, the controller will be
>>> found preconfigured with values that were set before booting the
>>> kernel: this produces a controller failure, with the result of
>>> a failure during the mtk_pcie_startup_port() sequence as the PCIe
>>> link never gets up.
>>>
>>> To ensure that we get a clean start in an expected state, assert
>>> both the PHY and MAC resets before executing the controller
>>> power-up sequence.
>>>
>>> Fixes: d3bf75b579b9 ("PCI: mediatek-gen3: Add MediaTek Gen3 driver for MT8192")
>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>
>> Friendly ping for an important fix :-)
> 
> d3bf75b579b9 appeared in v5.13-rc1 (May 2021, a year ago), so I assume
> this is important for v5.19, but not urgent enough to require being in
> v5.18.  Right?
> 

Hello Bjorn,
no it's not *very* urgent, as MediaTek devices that do require this will be
in v5.19 anyway...

Thanks,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

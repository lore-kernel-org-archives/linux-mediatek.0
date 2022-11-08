Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7781DC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 08:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=19inQixE+cAajKKNusigFmsdUj+SJA6P/T5pzhRONLM=; b=X6A2x1U8i+kCDXB58KhQklQ94R
	tErycauL8NJwPdBYEmhWsQlWhF5CG95zJJF/0N7US+VRYzmOj9aFWdAdxOKY9fdQd1ELMdtw81X6A
	N/zRAcWFn9/tOORwZH7Cp41F0L/G/5kEXKRq5EIrpEsQSDYAseTdYI74IZ0/4KUQi5D5Zvl/B8abq
	xIJ3tHsWwtAbt+/EVYLQDC/hYI7KyiWGBT0+j6uFNjT196W2HsCrWknMOj/l0rTC7RA2L3DTyFsu8
	XlCnShDFJCRMeQIfrE97Dg+a+bbN+Z7AJmRgTb3RfBCknW5/F3JkwXU0InD3Zrrs+jSrpvenOd1So
	A3e/6Sgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osKDI-003nvV-FF; Tue, 08 Nov 2022 08:44:08 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osKCd-003nfq-LB; Tue, 08 Nov 2022 08:43:29 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 05D0E6602980;
	Tue,  8 Nov 2022 08:43:24 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667897005;
	bh=q6qqpBqwMQgI0Wus+7X9VLIEmROhuwDUjEYSYZTBgvA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mUbc3yBBHku2VdIaAo2zK8wAverPR+rNeuv3I4JuM4pkmygyd8hko3hQ8A/QTmDnn
	 rwpxdy8cmk0ZOuAZzdRgrlV52acTaFS9qIUQ6oEU4laGuqkuaM/qZdkmMgiN7MsriA
	 Tm5GjSDbmJB5J7jKALTi+pd4K9zOW5h3CHAWSEZt8AZ2o3J3aYN5l5izaLY1WhoUb/
	 p6W2ZekMDFfKBtZYAgaIBOH0KJOgw3PVotTIMkV2PiHDM6Tefk/dzlsFMd2aGzPpq0
	 FIQs+xQJx6vKxIbPmxyeokq+V1R4HWJC2EdnnAWYQk46JM1hwpNNIQZzJlxs7zxEaG
	 O+ZtEphDA4gcQ==
Message-ID: <c8a9af53-efc7-dbe7-115d-b4ab1930c8fd@collabora.com>
Date: Tue, 8 Nov 2022 09:43:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 1/9] ASoC: mediatek: mt2701-cs42448: Register to module
 device table
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>
Cc: kernel@collabora.com, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20221107160437.740353-1-nfraprado@collabora.com>
 <20221107160437.740353-2-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221107160437.740353-2-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_004327_851444_0AD2E7B1 
X-CRM114-Status: GOOD (  10.90  )
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




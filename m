Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F77CD5BD4
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 07:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BY/pCWy4LafV2v3RXc6tBW2gc4uFTCG3lw49A8hB0BU=; b=hL8eXFXEE6top+nq+yGOX5YNco
	soai5r/YCNIhj2rj/XN1atqP1M1EqS5b0yivsDqnshHg62EmIEUkOQt4YzSma4EO6OSWewnP0WR14
	80iXVTnXBd/tVeXuhRRlI58oMols8wl1PupAMJ+nMN7ztZs9IZUXFw0Rc+UXDO6rOgMF6Al4Q74PM
	pjsctHTWoS2aRUIDsw86ZMqfeynox9hA8evGJmJaCJiq6rSyRFt3taAsCMeT6M6VzxR2Mf9tyVmS4
	Alle0FQjDc3/xbSnJQU+zAXJ3Q4JtAj4b3/6q0qa+DmPgXAIuuQ6W0aOisXQmHKPjPypb/LqTdPSl
	5honpOyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjDwu-005MEq-1Q;
	Thu, 21 Sep 2023 07:18:08 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjDwq-005MEM-2q;
	Thu, 21 Sep 2023 07:18:06 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 67FCB6607285;
	Thu, 21 Sep 2023 08:18:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695280681;
	bh=u+SDF/PNL5Ju2+whiov9Et6DghwzY6lUPs+GJOtpLPk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RL8DToJNQahbJaZooqiEqG8PJe63aN8SdCp6AfAplEVykYDHO7c3GVAVMpGB74dO1
	 a5ljz6v7vbGTqnOhJTDOy+iZi8ldmc5h69baoWulk54LbBJ2OtyWvia73/YgSrfm0K
	 UXtHYcmXE3SqUiD4Ba/G7UShpSWFNS7VPSOAlEs30TiabER69pZBp//qX6uDlfMUZz
	 QHc73AxBFMZrr+ZKUj0fc5FgjLSR/mCImmoC+umJnrzk5NBKZGapn8MryzY8H0Llpz
	 t2MFNh8zL5BcMRX26UpBymze5ym+bTB2AeWN2l7BbGDmJSM0hcJ6lx2S0wrEHr181F
	 pDDJWBQ8q0ugA==
Message-ID: <c9780f70-62b5-e151-0ac6-11d97a694439@collabora.com>
Date: Thu, 21 Sep 2023 09:17:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] remoteproc: mediatek: Refactor single core check and fix
 retrocompatibility
To: Laura Nao <laura.nao@collabora.com>
Cc: andersson@kernel.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-remoteproc@vger.kernel.org,
 mathieu.poirier@linaro.org, matthias.bgg@gmail.com,
 tinghan.shen@mediatek.com, wenst@chromium.org
References: <20230919092336.51007-1-angelogioacchino.delregno@collabora.com>
 <20230920150332.318851-1-laura.nao@collabora.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230920150332.318851-1-laura.nao@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_001805_120958_C06C533C 
X-CRM114-Status: GOOD (  11.92  )
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

Il 20/09/23 17:03, Laura Nao ha scritto:
> On 9/19/23 11:23, AngeloGioacchino Del Regno wrote:
>> In older devicetrees we had the ChromeOS EC in a node called "cros-ec"
>> instead of the newer "cros-ec-rpmsg", but this driver is now checking
>> only for the latter, breaking compatibility with those.
>>
>> Besides, we can check if the SCP is single or dual core by simply
>> walking through the children of the main SCP node and checking if
>> if there's more than one "mediatek,scp-core" compatible node.
>>
>> Fixes: 1fdbf0cdde98 ("remoteproc: mediatek: Probe SCP cluster on multi-core SCP")
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>    drivers/remoteproc/mtk_scp.c | 18 +++++++-----------
>>    1 file changed, 7 insertions(+), 11 deletions(-)
>>
> 
> Tested on asurada (spherion) and jacuzzi (juniper). The issue was detected by KernelCI, so:
> 
> Reported-by: "kernelci.org bot" <bot@kernelci.org>
> Tested-by: Laura Nao <laura.nao@collabora.com>
> 

Thanks for pointing out the correct Reported-by tag! :-)

Cheers,
Angelo



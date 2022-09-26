Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71AA4C6FA82
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 08:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QnJ48i7sN4rsnoFe1HRpX12MPO6mHjRFIF1JxpMeuDA=; b=woiXlEm+8qPl/nwh30gIVrPzyy
	RbnCAKY+WPnfFWzxZennszsLv+/pn1vPvHb//SOiqN+IuiHHzv7qNX+Ou0+riG5QnJs7b+dC53CRh
	PD5M8NOe4tweDggCPcmZVnCFu94nBqbd5PQuKDyhRw9hDnWkpE8VEHMCQ2kgd2qnKJc0SKmmekPc+
	SdJb52LFm1ERoTRvFFgghZ+Xvt5m63RNqaP9m63XxrlXRy9sQOOLXoZ9kgyv51WA1kilp7XSnevYR
	06T2CmUu8zejrioezFHpGzsQhKjeenuEYdBnqD7mFZhsmWHxQg8BcWwKaL9syEqBaGB9ksNV4GNse
	69ah4vww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocjPy-0038RU-AL; Mon, 26 Sep 2022 08:24:46 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocjP5-00381n-Or; Mon, 26 Sep 2022 08:23:53 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AB697660222F;
	Mon, 26 Sep 2022 09:23:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664180630;
	bh=mQyvu1ScEHkd61hzAOnaU61WIDBcOrPXfYxLmQ5wJ7Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KfDYT4icIc/2yq/2SgtoNp8u+hOtidbqB4DY8R2vieQGKH9O/XW8Wl1+dV3BX1JDK
	 GqyBAcQR0o8gfDZVNKCuIOA7p3Ng8KSWljWGiVNEXloXkcWaDA1vpk6w3UHI89eDKf
	 Lq9I52r3BzFvIaFytSheCH42Z5usCmK2zKcWYMuMBVnwzIM73JMJQxWhUO0xHFO7uD
	 ouGE1KjFJ/gwk5csTMjM147jBqaKOdijSw/cpbSBdvz1j00EC1ugqfUq/1RjYoIEZb
	 PIsyohUn6z7yDv8EM/qbDzuiNkLzVCCpjwFyeftKZVIjR45epVf97YGWHxFO9/np0g
	 TUGy3xQ7Z3IWw==
Message-ID: <7e752eda-2851-b13b-9a57-920ade4bacfd@collabora.com>
Date: Mon, 26 Sep 2022 10:23:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 1/2] ASoC: SOF: mediatek: mt8195: Add pcm_hw_params
 callback
Content-Language: en-US
To: Chunxu Li <chunxu.li@mediatek.com>, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, peter.ujfalusi@linux.intel.com,
 lgirdwood@gmail.com, daniel.baluta@nxp.com
Cc: matthias.bgg@gmail.com, yc.hung@mediatek.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 sound-open-firmware@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 project_global_chrome_upstream_group@mediatek.com
References: <20220924033559.26599-1-chunxu.li@mediatek.com>
 <20220924033559.26599-2-chunxu.li@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220924033559.26599-2-chunxu.li@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_012351_966777_B16DF153 
X-CRM114-Status: UNSURE (   6.24  )
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

Il 24/09/22 05:35, Chunxu Li ha scritto:
> Add pcm_hw_params callback for mt8195 to support continue
> update dma host position
> 
> Signed-off-by: Chunxu Li <chunxu.li@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




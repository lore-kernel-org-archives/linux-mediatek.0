Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E264C32771
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 08:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DxuKRVNpYfhdCVCZSj4RVOQiSOdSbZ3cfBStLrmriaI=; b=DCtgLRpEO0ZrO5+GXu0nm58jCe
	hqLbTpOiqct5tYzcuUs+oqHUyuwTTc6Q6AxLvLYv5E+/t+yBXDIvo42kWLOSceLJqtRe93AauQLZ4
	YI4E5bMdDpr5f3Z8qi7b4qasPvp8SlAjG5VtA34OGDxNnQNOqgp40ggTWXAohYke38DKca3vZgnHf
	m+L1tnep52lYgtyLM/C4f3z26MfGFujVrBI4j2AvvwnVLEYndPwaCnATyED3hNu7MuWzvivyIxDVj
	U3vfsrsGev1jdoLTnc44VPAh/FcJM5ptUOcqLF0GIXm6Wg6GNRqbe97Q6aeK2Fv+sdrK+aLeBglm6
	vX14Qgww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocjPw-0038Qu-C6; Mon, 26 Sep 2022 08:24:44 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocjP5-003815-Os; Mon, 26 Sep 2022 08:23:53 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6D343660205E;
	Mon, 26 Sep 2022 09:23:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664180628;
	bh=JkMCzYNBMwFiR1kr8tzIGWnW7VICz8110t19kZ3Se+k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e7+EbbsdVJBfK95qRkg/rFlUgtL4cqB8HYCQ/OHRDRhQoz37iOjuSLFglNKU4sPDR
	 wygiqD60y0wpHT0eeraZLqT4M74hvRAt0ZNg6JmwODfQMo5YS8bZYsFif5Z9HUEVM3
	 JYE5+ptfrELe1Y8UOxGaByeE1Q1mycIpUlMRCFcBaorZ7Wj7u2ZydGuxegVSQFxjOF
	 8qR3P+ykX6wjt+xlh52kRvhOSCUuIJ+lnKG3xMn3DBfMD/aLsMOFwnqaEYY9LAWTTL
	 4SFnnDXFRhd/VemzqSeYjs7ROj8sGsg0ny7C30TlhUAJUKJDpSxRZ98H/wtkXu/COs
	 5sIrvtFfqD26A==
Message-ID: <2b8c3749-0e3b-7460-82c8-b2c21ff5db8a@collabora.com>
Date: Mon, 26 Sep 2022 10:23:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 2/2] ASoC: SOF: mediatek: mt8195: Add pcm_pointer callback
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
 <20220924033559.26599-3-chunxu.li@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220924033559.26599-3-chunxu.li@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_012351_968284_CE226B6F 
X-CRM114-Status: UNSURE (   6.30  )
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
> Add pcm_pointer callback for mt8195 to support read
> host position from DSP
> 
> Signed-off-by: Chunxu Li <chunxu.li@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




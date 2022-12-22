Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD1E6C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Dec 2022 11:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pd1MuAAYksrkyvQirzLLBlWy0mBl1uWakhPRyYP0kug=; b=qXuDOaQvzavty+w+bsJAjarKqH
	SEA+PJJ+4/Trhl78P3LEW3cRKnTKc1gd2uSlpfswf//2wjY4foPBoRI0warGu0wxnIzm5AQSum6PN
	s0Y+xbVfJCEDeOW4b6vwRmKHg6zGZnrSDbThJZeAgJuzr7veE3oo1LSQFNlu8QQXFTxIcGWs+1lM0
	0ojVvID5gZzkW0gFKmU39/n8Fvm4DxJb5x48JkTrMYe+cV/Rdg3g2F1ILYcB6M28g3KmrDwEfE2Yn
	iybFbRuxOkaqodvDf7iVTQbCd7nkXAmjpbJOuiOJKUlJI/g91z0aIoTCtBzc1XHaRVLp4xsbb6wvM
	pbHg3wNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8JUR-00AmqG-QA; Thu, 22 Dec 2022 11:11:55 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8JSk-00AlH4-CG; Thu, 22 Dec 2022 11:10:11 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8B2276602C5F;
	Thu, 22 Dec 2022 11:10:05 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671707406;
	bh=ZxlK9ZTzRuaI+IcB1DKLbYNT0sm+mq5gGTXC+Q0nj3s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WdjzxeLNQEpbE5AIFqpHLH0Vg0UbayJ73KKohKjgSRPhSkJXWcbnICh4MIB+fJArW
	 eSFXzVyr8LfscfwPhdClUSs7WJkDd8rf9lWl7S2cwnYuN+6Y6r/EupXJfI9YvbkaW9
	 e9AkdoAmG4uuo8v2ExKlY8RBAqEZH9QpUqmY+uo552T4DzHTC6IigKNmTyuHRZJnVI
	 oPduyqUjuGvB6eIsj8F0mB6Qx8Ea+T5lKtwNxJHXu8ejKW1GHBW4tGVZawUJkwKXgS
	 hFpky/4CmHSZ4JKDbyyDV5epSljPZqXsZAAMvFA8VghfZoA9k1RQrYleWwMjNlBOZQ
	 VSuYTXe1bRxmA==
Message-ID: <2dc5b86a-0bc6-db0d-5a1d-1fa7415f8ec7@collabora.com>
Date: Thu, 22 Dec 2022 12:10:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 3/3] ASoC: SOF: mediatek: Provide
 debugfs_add_region_item ops for core
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Chunxu Li <chunxu.li@mediatek.com>, Dan Carpenter <error27@gmail.com>,
 YC Hung <yc.hung@mediatek.com>, Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221222072150.10627-1-tinghan.shen@mediatek.com>
 <20221222072150.10627-4-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221222072150.10627-4-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_031010_637230_25FE246E 
X-CRM114-Status: UNSURE (   8.50  )
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

Il 22/12/22 08:21, Tinghan Shen ha scritto:
> Set the generic iomem callback for debugfs_add_region_item to support
> sof-logger.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




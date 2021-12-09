Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 234E4C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 15:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sh0cPOjTi2fXeH355/O7u3G0fEnDuI9rcLlNMAC/mOo=; b=WoXQI+PEiVsw6ZGxHbOj3u72Xg
	Zdz/AZpUhcdRFk3931PeMud+159sQT1PAEb/JqyUZdISHfJFXa/MiMLIDwZ4CsPOSa3AeYS1WKKA2
	znCAzgXENznXuTuZnhI9lSIer+41QFP9glU+SbCr0IuMktFWePM1exUHuPgP2mWqPdCaUTt5Jn+/8
	aOBXcKcEtsv/mc57Lu9SVvqL7pOF992tmAodz3LwLFWEPMPm88ylCEkiuSlsUDFTWMGt2Rr6Q8k3G
	J7QAtZZCmlBtYH2XzAkhtlVvEs08npiLFojAnrQj70llx146yJwn6dF90gTiuj+SqCiL7Dwda+ZhE
	X6vzlPsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvKx5-00GSrm-Ta; Thu, 09 Dec 2021 15:03:19 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvKwt-00GSq2-SS; Thu, 09 Dec 2021 15:03:09 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 21AC61F46A88
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1639062186; bh=LS0EtBmRDedhXVuSLcQh/ApTJ6Q0/81sv/fT8nF/E2A=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=FVQCvQU/ydG/1xPks0xTHe4YTI6ldXkUGCqp/nhiwH+WXIcssx2UXBmo0ErJ1JUmV
 GZiwTWw7vbGlex5aQ8q7htE9wfnUc0jHc91QayQ145xc7ysgx5xNqQqO6fvvuTRmC3
 dMEQ1VNpaVBCtXYSmCls0iuC/6Go45BgAVf5nQxe095oaKDPZ45xf9J92aH7Yn3rQS
 bfIq3Q/PzcFJBoncX7fv7dGTTBIczrtI44xSzPXYDR680dFEk1xld1XkvkZaGcF7Xf
 tweztMKaS+EiqfKJRJsaitD/m1PFzG3kRO1RomKim+oLQt0Au8qO8Wi/7XeXRkUqqM
 BPT2t07WchLBw==
Subject: Re: [PATCH] ASoC: mediatek: assign correct type to argument
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org,
 matthias.bgg@gmail.com, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: tzungbi@google.com, trevor.wu@mediatek.com, yc.hung@mediatek.com,
 kernel test robot <lkp@intel.com>
References: <20211209073224.21793-1-jiaxin.yu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <2733d82a-38f7-d5fc-416c-2bfe5dc91a12@collabora.com>
Date: Thu, 9 Dec 2021 16:03:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211209073224.21793-1-jiaxin.yu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_070308_089613_4457D679 
X-CRM114-Status: GOOD (  10.04  )
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

Il 09/12/21 08:32, Jiaxin Yu ha scritto:
> Fix the following sparse warning: (new ones prefixed by >>)
>>> sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c:370:33:
>       sparse: sparse: incorrect type in argument 3 (different base types)
>     sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c:370:33: sparse:
>       expected unsigned int to
>     sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c:370:33: sparse:
>       got restricted snd_pcm_format_t [usertype]
> 
> Correct discription of format, use S32_LE and S24_LE to distinguish the
> different 32bit.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

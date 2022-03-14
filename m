Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D05C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 10:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YaUOJra5dE4CboEN5PXrXIVRmUX9M2zfN6RKxMEYuoQ=; b=Im8zTYDTbUX9MP
	D9sA4SArxrjm+fUSE87TjkMxIFW5DtBIgG0ogwtKg4hV9jE6LFq5rNXh7hTfjoWudLmJyBesdqbd9
	aFkK1walUKAXxAkBPjuMxdhlgUIBRrGHu/O0D4628KoJmzfKH50N23u8ztfAdJNgE1sjxpXp8K2+D
	d6iEPa7GNFhE9jp5Icz5gVMCsiCQ/TA+tx280FtmGzFF0rDa0pn2NbqDbM8guc9fcvZ0CzL/JQYhg
	2PYZwhy2BRfQ9GT7pw16ke+HJQ8xbbbPikuyt/41tdoFEkjxmetYY94L+yUTQaIiN1JqcaIc2Tfl9
	xncvdEaiddO5TOX2ZDLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nThwm-004xgv-Bo; Mon, 14 Mar 2022 10:29:04 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nThwY-004xcH-Ky; Mon, 14 Mar 2022 10:28:51 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id C73B91F4354F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647253729;
 bh=bwHJoPxyu/AsruLxj2fvTwgEqOZ11tvgaKSJ2SduNvU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=C7Pxy4F/H7J0euO4lGClMCo9eeB6EsBAqQe2Cwxtqs/Rj+fZfImezffwz8imhnSUS
 PXw0pBauG13We073OAWMG8HwjQIqgNSMWPxi44sV8xQDZBtIxNjvmSR4RvoVuCApCG
 j4aO7+o67W8/NbD9orC2PYd1bXVjE3R28VC9Vvb5OlCg1lHufKIa6XygCH8F+RLJac
 BbnJa/Cb5mbFm4g0JObcD20Zw2QxqHkV3Mp4yL1UQUAOqsZiP+QMLEqF+C/7sVdXee
 gLfi5vzapDWRvbLc+r/I7kOtDmjp5G/sp4vKMilLGvN9Bu7ZjALK9AMNaA28x+MZ9Q
 tjvCVw2taCy3A==
Message-ID: <2cdd1e7b-d1e0-7cfd-ff24-18320dbe2a51@collabora.com>
Date: Mon, 14 Mar 2022 11:28:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [v3 07/19] ASoC: mediatek: mt8186: support i2s in platform driver
Content-Language: en-US
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org, robh+dt@kernel.org
Cc: aaronyu@google.com, matthias.bgg@gmail.com, trevor.wu@mediatek.com,
 tzungbi@google.com, julianbraha@gmail.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220313151023.21229-1-jiaxin.yu@mediatek.com>
 <20220313151023.21229-8-jiaxin.yu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220313151023.21229-8-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_032850_862788_936FBA7C 
X-CRM114-Status: UNSURE (   7.62  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 13/03/22 16:10, Jiaxin Yu ha scritto:
> Add mt8186 i2s dai driver.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   sound/soc/mediatek/mt8186/mt8186-dai-i2s.c | 1355 ++++++++++++++++++++
>   1 file changed, 1355 insertions(+)
>   create mode 100644 sound/soc/mediatek/mt8186/mt8186-dai-i2s.c
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

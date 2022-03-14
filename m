Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AAEBC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 10:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CDUCvviUUDnbr6qXpiN9n6JmKy6xrB/45NER2cqAphM=; b=sGZvXsPml7XNXF
	mhZegJK+ACZYh/xYuuzzRJavfbDsVT+bw6T3owvUwvWY6zZvi/ZP3Fy9zlUZ6spiVn7+zbkYAhywy
	qt/8Ae95q1LcDGIIazJyzERRqRae4s0autxLel/7nURKOwU4GXkQwDqKjURzXOBsWiTHnOIDA+YC+
	wD+QAOJl9ZRT983bIDNGZYdNpGvUHCpa+CzuWoiSO2MX+Srf73KQYGyt41M7S+XaGFTvvtS2ibhg8
	TUhS56taNyJrq3tqesclhcDecMpFEFgb/BfzChJlnygWRzOtRG8YnTupkvcoN0V8TEGNJufPN7Uvh
	eELyze+RSuK+knrj7gGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nThtp-004wQc-DL; Mon, 14 Mar 2022 10:26:01 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nThtD-004wBY-JY; Mon, 14 Mar 2022 10:25:25 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B01451F43505
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647253522;
 bh=aEs1SFqoEgSqlYmwJeL2S9EUjavPhZ0L4qzqDRpfny4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LzuHfhhhy05sxCVVCJOoPAdJqjRDABOOt5S9sp7Ks3z/oFTmuJB3u1v7UGWtK9Cme
 JXZq+4vin3gzjUZgoB4H5PxuMgzPttAL0rlyXOZ4zYbkqLbJGJdIRnDa6offNrQvJN
 6Axy74Efz4VMD9AUYgIR8k0+fI/42onBtJ1oPN0ilBvrpR+SmckwhT0MZlQba6JG3C
 +bY4g/FdhV3GsnAhQkVxRhaiO59nyOCtKbXJSgznRuZvCOCwc+jAuv6SP1qEk3xfg3
 T/q4AZyawkdTNhMsdPWpNYXgk7tnQQxVGvDaY022TXM6wEwFrJ3v/wZ+CEiWuFK2u+
 qXxMC3JYW4wKg==
Message-ID: <3d980cef-cfa2-6161-9c5b-cd0705d8e8b1@collabora.com>
Date: Mon, 14 Mar 2022 11:25:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [v3 05/19] ASoC: mediatek: mt8186: support hostless in platform
 driver
Content-Language: en-US
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org, robh+dt@kernel.org
Cc: aaronyu@google.com, matthias.bgg@gmail.com, trevor.wu@mediatek.com,
 tzungbi@google.com, julianbraha@gmail.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220313151023.21229-1-jiaxin.yu@mediatek.com>
 <20220313151023.21229-6-jiaxin.yu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220313151023.21229-6-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_032523_856065_F68F87CA 
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
> Add mt8186 hostless dai driver.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   .../soc/mediatek/mt8186/mt8186-dai-hostless.c | 298 ++++++++++++++++++
>   1 file changed, 298 insertions(+)
>   create mode 100644 sound/soc/mediatek/mt8186/mt8186-dai-hostless.c
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

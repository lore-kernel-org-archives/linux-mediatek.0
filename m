Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB71C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Dec 2022 10:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wC7PJSxSpG6vrOJewTwTwMvQ+k0M28BmWaTjScm/ANo=; b=2hTJtAkt8h3d7kXlI0qFIq1sEa
	txis1NasWDMRa2TQOUb2kNEQgu6C2l1p7PSWFIF8Ws4/DWEqLUmZm5FNYfEba1womiZ+IT+fz7WkB
	IZlGScDQMXqLaeyLfpbMvrzMxoy06m16A0Bz4b6JNUsGEmNtPHHGgS68XYlmXTSgW7q85YOXEgOf/
	8qbMY9ypehdB9+tijMZqjChFVWX3qHR7v2j9Th0oJaIIfSFbm4Z5qURbNmDceLFYzCBoxnSbcBwtI
	6qIKHACUVgrYY5S9Ov/jZkOxaOV+AIwdD5I9xaVJwr8edmsvUVP0dOLVDDecafD45Exr38NlXmq5e
	tGT21kbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p52rR-00Ftiz-4W; Tue, 13 Dec 2022 10:50:09 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p52r5-00FtQK-Tq; Tue, 13 Dec 2022 10:49:49 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C346C6602AB2;
	Tue, 13 Dec 2022 10:49:45 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670928586;
	bh=kRGRWMCC3+iUCBdXRdhsHmBJJ5GA2AWIrndy3d0jUeg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lE5buBpDPETeNTsUuqmroR5ciirmyrzZFogzVCJmZoCGyCMiwX/Y3onaP/d40br9N
	 rh10gOwnhiVe5ksdxuF7R94xWHb9YBx6YN8GC90+yFrnkdFB9rYofykX27+jYgABA9
	 zRuuYaZSgfn/+x3SGZ2irMRpY3zECdOdkrxX3oaZ+it4VWZiYXpl9+FPvJJjCfiX1E
	 2WmXti6HD/wHYEc/hl2+ydyyvxHCAPkVbcLxQKXzxdC2NpcMmOEnXcXTxSdYQV/Uwl
	 6thPyxMO1vberoxVI3nuxNKy6nDyM+uAg7/O/BNCnqh0bO09Bu+GkNXs+/JJLqWT7E
	 IIVWv5iV13FTQ==
Message-ID: <1dbda175-e312-52ec-d139-39cc1856be21@collabora.com>
Date: Tue, 13 Dec 2022 11:49:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 06/12] ASoC: mediatek: mt8188: support pcmif in
 platform driver
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20221208033148.21866-1-trevor.wu@mediatek.com>
 <20221208033148.21866-7-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221208033148.21866-7-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_024948_129847_F8C7C4E8 
X-CRM114-Status: UNSURE (   6.25  )
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

Il 08/12/22 04:31, Trevor Wu ha scritto:
> Add mt8188 pcmif dai driver support
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




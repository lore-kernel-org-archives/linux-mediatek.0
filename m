Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6CFECAAD8
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 09:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zwL53FkDZcUCjH2CKao0frj4EdvKBlnSxB00W21bA5A=; b=nLf6OzpkgbxaEghAVr8de5LLXH
	nAWPK9t+YAFXHFeIzqJVELeawZN9098HBmOm6FOGdIeiY0E+1SgxelujZwHMTIQmmr7DHvJLUsupW
	eNobJawnAuEWuqJoHQvpuckr7rCWAvrbimU02mglwlRoHInl8eyW7FRQcbGRJikwFlkLP6IRSjgId
	3iD7D/14C6aI+LU0mFeF8jhXEiRdqcs/MtzWDpi9FkPq5Spuah57tVTBxPdKEK63vLevuNm1UCbDY
	Zbd9vVcpeW6lBy8D7EUgZ7i8iTDbG97fVkAbCSq82Mhjr26A6ud61sls9W0ce7rMM1hA2N9vaxzIP
	kifZadaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obel4-003DV9-0i; Fri, 23 Sep 2022 09:14:06 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obeko-003DNq-1P; Fri, 23 Sep 2022 09:13:51 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 19A456602038;
	Fri, 23 Sep 2022 10:13:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663924428;
	bh=O5Eq5O5jGm/xMQpjO7QiI8PnAOOsQRcDFnut+zQiQ6M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d/9uP7oVrChf5rlUDoIxTSXljBHeD2JE/1wRzcd8Ul85tsdGpXtTm75XTbEAwAhzW
	 przhgoZciIC9i6V+gBbzNVylcu6FdnFHaNC8ZbyUTS6GlI+V8AA9O6NWp/Ho3Jszib
	 MXAXD9e6URBLlAKkXVEBv5VigNuQLSPqPrQEcwNyeUDumCCWqLeSYZcgYoENI0PTT8
	 +Cmodwit3vHGcAnOZfLwtLYdlqoP/194Nz8xSWIBagMRLJh738mWFJ6YaW3RCjZ7Ko
	 vhOIPfAGrVT3egXH9LwFcA+Lxcpzy0Tq9VD7sr0UgD+hxZXkjGJGf09mXg6eDzHLqF
	 KsPLxkZYjdQ+Q==
Message-ID: <35c3bf57-4659-2356-5008-d1422c2d609d@collabora.com>
Date: Fri, 23 Sep 2022 11:13:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v8,1/3] soc: mediatek: Add all settings to
 mtk_mmsys_ddp_dpi_fmt_config func
Content-Language: en-US
To: xinlei.lee@mediatek.com, matthias.bgg@gmail.com,
 jason-jh.lin@mediatek.com, rex-bc.chen@mediatek.com, ck.hu@mediatek.com,
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, jitao.shi@mediatek.com
References: <1663850702-26529-1-git-send-email-xinlei.lee@mediatek.com>
 <1663850702-26529-2-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1663850702-26529-2-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_021350_235631_822D346A 
X-CRM114-Status: GOOD (  10.44  )
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

Il 22/09/22 14:45, xinlei.lee@mediatek.com ha scritto:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> The difference between MT8186 and other ICs is that when modifying the
> output format, we need to modify the mmsys_base+0x400 register to take
> effect.
> So when setting the dpi output format, we need to call mmsys_func to set
> it to MT8186 synchronously.
> Adding mmsys all the settings that need to be modified with dpi are for mt8186.
> 
> Fixes: a071e52f75d1 ("soc: mediatek: Add mmsys func to adapt to dpi output for MT8186")
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




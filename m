Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F867C54E76
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 12:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VrU2ZZst2HUpNT+wFQGd3mh2dkLwwY4u0IvZnBEgg+Q=; b=ZYFBdnnqy74HzYKdT6erwEVc/6
	8gXZsh3coNku8nu2O0n0rIVpANTpyUNoEz82UxmyqqP0XFZmcbs67d0taKqXqCCQHrhOfCTuSVnnU
	1lzFmnhdjtMzDZ1OrdmIdUEEyEiKdenxKOpg9JFcDRYI/R2mKUOcoaIX+b+97YG6Jr9AAOXwvF+Ir
	dx9xrvsHLRa7fRn9PkBPmFl68prt4fy7v9KHIJGLg8M+3Xi7Sq4rqQgszbQJRpNXWHBQat5RMKIyt
	z+hN8Vq9Zq8JpMVAsTDUO6NZyP6qRYNuVht9T/ByDefrYZUkOtQDL1VLiVJabxu347Plgm1bAUZMr
	t6Lb2rrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r53bu-00C2Y8-14;
	Mon, 20 Nov 2023 12:42:42 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r53bk-00C2VS-2o;
	Mon, 20 Nov 2023 12:42:39 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D31AE6602F24;
	Mon, 20 Nov 2023 12:42:28 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700484149;
	bh=jjaPVx0eDtJkqek6Qcbfsk77mrZMKU5PurUc9yQS84I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JB3428zAWwfdw43PhTxaLcOxcIf4+4V6+sSKGWtBUKslsB6egKUY3S2yfCibHjIq0
	 zPmg41BqqBnQ8fL+4iDibby3cEUrSdwRWVydMmIu4iosQRx6GkHyRvWLA21pDgGeh9
	 NnBPdksfrnrZvfZUnMEBVdf1CRd60HX2CrAwbma/Oz7alDhrwqTPUqUVgkvheExXtq
	 cr/z+jQJp6mQ/tUS46CHc1utH2VvkzN+xRbwjbC5UTiGYaGgXWToWaLBoyxT2ogkmM
	 Qu9iTlrxakFEMOk0rzUoZKRL0F9qxB6PS98QPyY6Ztj3AFYOgwfWarlgFWFcYOrNXu
	 rL1mU4/IhM/Tw==
Message-ID: <af969e1e-7412-4f2c-815e-3d473eaf5c8f@collabora.com>
Date: Mon, 20 Nov 2023 13:42:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] soc: mediatek: mmsys: Add support for MT8188 VPPSYS
Content-Language: en-US
To: "yu-chang.lee" <yu-chang.lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20231117054345.15859-1-yu-chang.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231117054345.15859-1-yu-chang.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_044233_528011_18361EE2 
X-CRM114-Status: UNSURE (   4.83  )
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

Il 17/11/23 06:43, yu-chang.lee ha scritto:
> Add MT8188 VPPSYS0 and VPPSYS1 driver data.
> 
> Signed-off-by: yu-chang.lee <yu-chang.lee@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



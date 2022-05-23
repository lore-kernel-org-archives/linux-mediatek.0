Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF48C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 09:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LP8eJVCL6AOwJciUkzvQh3Fb6oZVGrhFpCYoRF3BPTI=; b=XthsfUzncFiWPl
	wyticxkU8Hk5OiKX9ZtVroMIUEB7dNGupgNQ1IEPEGeDaiLVP+AygzfSI4LKpAgwBzhl/mqo38Fv4
	leN0uD11Ta22g8BsQ19HzYcN5ERxxJOQgXSuU/PqEYZCirsjgyCW9oddsd+Xod276w4JWeqbOQAqo
	w3y7Ad2lqmeVPgOcTjNdC9i94b06ihSqmMbqfuN0rwchYql9ZSI4mavlpBiRa+jmD29LOB/T58xpe
	uF6xB2zZ/Qh4qe1q9MKcjA7YRCRYBZdr0hNA17RuzuQiuxmuHCvBAX5exa7/EPrW9xbPshrZqNtpV
	1lITOrjEmpjmg3gLtBhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt4Mb-002qKo-OZ; Mon, 23 May 2022 09:28:33 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt3dI-002WAH-VP; Mon, 23 May 2022 08:41:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D76C31F42CC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653295300;
 bh=0P46duBDuz2b5CE/o2n56812oMHke0Ez/vRylcz7E8w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DnbM3Sz+hSQk0SLXivU4I4uVTqNsW6Afi3aXHedtSkumaqlwPyJt63SeARySgkWhU
 V0bX58p4FClZRwXaMagpvPdcnexlvyUQzwHcdoyDM9FP3wzGJy8BSKlBOBnLr5j+Gc
 vynWi3U5cSwtRMtT621qLvUSJIvzp0Mz+HUtOvZzxCokHVmSohEjaK84FkDEZNZA+L
 Is5i9p8pDEBkr+jWHCQO4ezFkWE+OohHFCF/KWproX8j2MYcLIlDABfAc+FcE1acjB
 c+W92jSNmEJ59Rgudk99ODg8/JxxqS0oiXqcyNjkj99WoSvmpvE5iTbFtg9zvrO4KW
 xnPVw4t4ABqUA==
Message-ID: <e6d5bf20-4ed2-2d98-438e-315a9ed6b71a@collabora.com>
Date: Mon, 23 May 2022 10:41:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] i2c: mediatek: Fix an error handling path in
 mtk_i2c_probe()
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 dan.carpenter@oracle.com, Qii Wang <qii.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Wolfram Sang <wsa@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <8001bcdbee9f8afc85118c99b8166eb6473dcba5.1653222111.git.christophe.jaillet@wanadoo.fr>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <8001bcdbee9f8afc85118c99b8166eb6473dcba5.1653222111.git.christophe.jaillet@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_014145_190419_BC0C893D 
X-CRM114-Status: UNSURE (   8.35  )
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

Il 22/05/22 14:22, Christophe JAILLET ha scritto:
> The clsk are prepared, enabled, then disabled. So if an error occurs after
> the disable step, they are still prepared.
> 
> Add an error handling path to unprepare the clks in such a case, as already
> done in the .remove function.
> 
> Fixes: 8b4fc246c3ff ("i2c: mediatek: Optimize master_xfer() and avoid circular locking")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Thanks!

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

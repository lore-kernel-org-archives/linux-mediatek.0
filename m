Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C3EDC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 10:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=odCn37t5bxX1MyaLCbYnta8X8BSUGFdGKoMzzu4Ipzs=; b=kA2N138RkXF0F8
	OVvQPbK/+I6ikxfMGbJh1w4TVuUGEYdYaTZecN8dvsDX5NOc9glH3+iglB7foQ8/HiWxok3CjI/bU
	zl/u14AqluYMT3q13srWNlDfsa75lMWloFxJx2Bx228j5HVXo7bDcr6D9TGq2bLIw8fsph2vVCUuL
	cfrZY/FezXo4Mq+CXSRnjPciBlIjq+dVNqoJhf0aYSZXW9WxTYwSJTIKWk4yuvUXQbvoEoaaTAk9O
	mCmaZsztlvdi6BQXxzlKwSNvO+B2eDl9jz9mSDVBu51yvk+/Y9Wvt6zeiuk8I5lYHLV0PSBmhOAXw
	ztzEEBA7sw8AWgOMilMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nglPU-002tr2-4c; Tue, 19 Apr 2022 10:48:40 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nglNc-002sgI-Ak; Tue, 19 Apr 2022 10:46:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 8D1601F416DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650365200;
 bh=miYHRwrSfiYZQBPctYUYWsQLZRG1eJ5lKnyCAoRZDKU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VbzXgqYfkge78XHuAUROvfBmnV6GgopU5H+v2XI/sGzcG4DomOxUVKrETu2o1NdW1
 EjLpIFj+42X3tCYm1tPkA6nXS6N61SJh0aMuSnz0mqGQnbAWKRxoIOZg/YxWyrHqZd
 AbQX56pIxFefA9TcPFA8rP25yJAA8Nyo2PxieWhyi46/PJd6Mnts/macCkkyOyKxz8
 o0GKW7Ou/2Dju0g5ExIbXa9/y9n0/1m2jtAjzpIckw9RcEXVrhvYy4B3qQcBeZ94CS
 jaEVOZTOdXLBNVyI69I3Vp6oiMbU6QE4neFW+EqHHqT1K5NI0L1nsyFmAYWStuG+cQ
 4/mzWt5krFI4w==
Message-ID: <20eaaba7-19cb-8f1d-ecf4-bfac14d50f67@collabora.com>
Date: Tue, 19 Apr 2022 12:46:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 4/7] clk: mediatek: reset: Add reset.h
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, mturquette@baylibre.com,
 sboyd@kernel.org
Cc: matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 chun-jie.chen@mediatek.com, wenst@chromium.org, yong.liang@mediatek.com,
 runyang.chen@mediatek.com, linux-kernel@vger.kernel.org,
 allen-kh.cheng@mediatek.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220418132154.7401-1-rex-bc.chen@mediatek.com>
 <20220418132154.7401-5-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220418132154.7401-5-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_034644_813690_33D77792 
X-CRM114-Status: GOOD (  11.89  )
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

Il 18/04/22 15:21, Rex-BC Chen ha scritto:
> Add a new file "reset.h" to place some definitions for clock reset.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>   drivers/clk/mediatek/clk-mtk.h | 10 +---------
>   drivers/clk/mediatek/reset.h   | 20 ++++++++++++++++++++
>   2 files changed, 21 insertions(+), 9 deletions(-)
>   create mode 100644 drivers/clk/mediatek/reset.h
> 
> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
> index dafdf30fe94e..dfb0549ceb6c 100644
> --- a/drivers/clk/mediatek/clk-mtk.h
> +++ b/drivers/clk/mediatek/clk-mtk.h
> @@ -12,6 +12,7 @@
>   #include <linux/kernel.h>
>   #include <linux/spinlock.h>
>   #include <linux/types.h>
> +#include <reset.h>

This should be

#include "reset.h"

...since the header is in the same directory.



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

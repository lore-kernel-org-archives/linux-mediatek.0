Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD76EC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 02:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h4BnMU14doZ6wXLOXuoqkFbxaduHc+YSGQ09bTuTwjg=; b=vNPmyZN5vXKowB
	o13PNOJcyIvSC/i7CL2kqa12TZarNKdqoy7TQxrE/ihLBid5ZeWjAYNgmxkELo8RtEp5KJn6yn5b4
	GzUtUP3PKdTnCXNSKsWUmZFMevtbLyjx9riSSBcG+oAhGqTUZWcrvSduv5FX1hLfUUpxsiHAS50r+
	xR27poE/c7zJp2Hheu35IesiEAlU/Emr3zCoveo06B9kH5nfpEt8PcRxt8bmfLLlEE1fMyz+5is9g
	tOmeQXj9Kj0rkvvHRNZtxzRqFZTBhYXA2qoBG567AZUjH/Fud3f5GFHtOXre9bEKMUJ6iaffmClAz
	CSCudqwF0xYZXKXt3oOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nio6y-007ryI-1k; Mon, 25 Apr 2022 02:06:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nio6l-007rwp-N2; Mon, 25 Apr 2022 02:05:50 +0000
X-UUID: 39f0df77c3ee44b0b5e40c57a81abcd9-20220424
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:67c13c82-02b6-40bd-9a33-5502e146d54f, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:0fa7c9f0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 39f0df77c3ee44b0b5e40c57a81abcd9-20220424
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 869754317; Sun, 24 Apr 2022 19:05:39 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 24 Apr 2022 19:05:37 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 25 Apr 2022 10:05:27 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 25 Apr 2022 10:05:27 +0800
Message-ID: <862706781d408669cd80e7e041d96a878178283c.camel@mediatek.com>
Subject: Re: [PATCH v3 1/1] pwrap: mediatek: fix FSM timeout issue
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>, <lee.jones@linaro.org>,
 <robh+dt@kernel.org>, <matthias.bgg@gmail.com>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <eddie.huang@mediatek.com>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <fshao@chromium.org>
CC: <srv_heupstream@mediatek.com>, <hui.liu@mediatek.com>,
 <tinghan.shen@mediatek.com>, <hsin-hsiung.wang@mediatek.com>,
 <sean.wang@mediatek.com>, <macpaul.lin@mediatek.com>, <wen.su@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Mon, 25 Apr 2022 10:05:27 +0800
In-Reply-To: <20220424025738.32271-2-zhiyong.tao@mediatek.com>
References: <20220424025738.32271-1-zhiyong.tao@mediatek.com>
 <20220424025738.32271-2-zhiyong.tao@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_190547_804935_51555BF5 
X-CRM114-Status: GOOD (  19.05  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, 2022-04-24 at 10:57 +0800, Zhiyong Tao wrote:
> From: "Zhiyong.Tao" <zhiyong.tao@mediatek.com>
> 
> Fix pwrap FSM timeout issue which leads the system crash on GFX VSRAM
> power on.
> Add a usleep delay to avoid busy read for the H/W status.
> For avoiding the system behavior(ex. disable interrupt in
> suspend/resume
> flow, schedule block task)cause if (time_after()) be turn first,
> we change it after sleep delay.
> Fixes: 1f022d84bd19 ("soc: mediatek: Add PMIC wrapper for MT8135 and
> MT8173 SoCs")
> 
> Signed-off-by: Zhiyong.Tao <zhiyong.tao@mediatek.com>
> ---

Hello Zhiyong,

IMO, commit messages should be

Fix pwrap FSM timeout issue....
...we change it after sleep delay.

(=> one blank)
Fixes: 1f022d84bd19 ("soc: mediatek: Add PMIC wrapper for MT8135 and
MT8173 SoCs")
(=> oneline)

Signed-off-by: Zhiyong.Tao <zhiyong.tao@mediatek.com>

>  drivers/soc/mediatek/mtk-pmic-wrap.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c
> b/drivers/soc/mediatek/mtk-pmic-wrap.c
> index 952bc554f443..ac7139a67e87 100644
> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> @@ -12,6 +12,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/reset.h>
> +#include <linux/delay.h>

Sorry, I do not notice this in previous version. It will proper order
the header in alphabet.

 #include <linux/delay.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>

BRs,
Rex
>  
>  #define PWRAP_MT8135_BRIDGE_IORD_ARB_EN		0x4
>  #define PWRAP_MT8135_BRIDGE_WACS3_EN		0x10
> @@ -1197,10 +1198,13 @@ static int pwrap_wait_for_state(struct
> pmic_wrapper *wrp,
>  	timeout = jiffies + usecs_to_jiffies(10000);
>  
>  	do {
> -		if (time_after(jiffies, timeout))
> -			return fp(wrp) ? 0 : -ETIMEDOUT;
>  		if (fp(wrp))
>  			return 0;
> +
> +		usleep_range(10, 11);
> +
> +		if (time_after(jiffies, timeout))
> +			return fp(wrp) ? 0 : -ETIMEDOUT;
>  	} while (1);
>  }
>  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

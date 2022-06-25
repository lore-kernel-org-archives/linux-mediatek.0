Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD39CC43334
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Jun 2022 00:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9JtjR7fGn/AA0lbYuk8T5jCxutp00+/bmAuiaEyX0gI=; b=ZwrrPhrqka+/ah/Y0u41F41b7o
	2Q9HX0m4pqH1bPeXHkljyhYK3UpdAJ+WRaHOy26hKXWI6rBKyPHHTjLyvI4OkNh3maGYhpxZ90K7O
	2cmqGG7GEES2apYz7Hnk8KltwFJ/NVIv1CNZLLNZfJ4ahnFrErfMaG1Av/z01fy9WNqaoKmq6l6bD
	JuWil8eovun1Or5N4QU5mJ+wnkIGQHT4W+mPx/0eFnFekfF27uLrNOpUDSORdtJL3yT19IvEL2Iwu
	mZsc3ubT1eKz+0TbmlK+oTXgdA87ohVqHwmjwp5Hmelk7m3bgbc7je7nYASAZAE5dxSKv90SyzLz3
	FxFW3Gtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4tUS-004CpQ-QF; Sat, 25 Jun 2022 00:17:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4tUP-004Cmx-9n; Sat, 25 Jun 2022 00:17:32 +0000
X-UUID: 061219af95424619a39ee4df9dbe42cc-20220624
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:53ee6c7d-0cbc-4ac2-ac33-9c9d43e043c8,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:d4a084d8-850a-491d-a127-60d9309b2b3e,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:-5,EDM:-3,IP:nil,URL:0,File:ni
	l,QS:nil,BEC:nil,COL:0
X-UUID: 061219af95424619a39ee4df9dbe42cc-20220624
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 976294186; Fri, 24 Jun 2022 17:17:19 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Jun 2022 17:07:17 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 25 Jun 2022 08:07:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 25 Jun 2022 08:07:16 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <angelogioacchino.delregno@collabora.com>
CC: <bgolaszewski@baylibre.com>, <chun-jie.chen@mediatek.com>,
	<ck.hu@mediatek.com>, <devicetree@vger.kernel.org>, <fparent@baylibre.com>,
	<ikjn@chromium.org>, <jason-jh.lin@mediatek.com>, <kernel@collabora.com>,
	<konrad.dybcio@somainline.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<marijn.suijten@somainline.org>, <martin.botka@somainline.org>,
	<matthias.bgg@gmail.com>, <miles.chen@mediatek.com>,
	<mturquette@baylibre.com>, <p.zabel@pengutronix.de>,
	<paul.bouchara@somainline.org>, <phone-devel@vger.kernel.org>,
	<rex-bc.chen@mediatek.com>, <robh+dt@kernel.org>, <sam.shih@mediatek.com>,
	<sboyd@kernel.org>, <tinghan.shen@mediatek.com>, <weiyi.lu@mediatek.com>,
	<wenst@chromium.org>, <y.oudjana@protonmail.com>,
	<~postmarketos/upstreaming@lists.sr.ht>
Subject: Re: [PATCH v3 5/7] clk: mediatek: clk-apmixed: Remove unneeded __init annotation
Date: Sat, 25 Jun 2022 08:07:16 +0800
Message-ID: <20220625000716.12272-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220624093525.243077-6-angelogioacchino.delregno@collabora.com>
References: <20220624093525.243077-6-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_171729_389691_404A5533 
X-CRM114-Status: GOOD (  15.45  )
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

> Remove an unneeded __init annotation from the declaration of function
> mtk_clk_register_ref2usb_tx(): this avoids section mismatch warnings
> during modpost phase when called from functions that have no such
> annotation (useful when clocks are platform drivers).
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Miles Chen <miles.chen@mediatek.com> 

> ---
>  drivers/clk/mediatek/clk-apmixed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/mediatek/clk-apmixed.c b/drivers/clk/mediatek/clk-apmixed.c
> index fc3d4146f482..6b0ab0a346e8 100644
> --- a/drivers/clk/mediatek/clk-apmixed.c
> +++ b/drivers/clk/mediatek/clk-apmixed.c
> @@ -70,7 +70,7 @@ static const struct clk_ops mtk_ref2usb_tx_ops = {
>  	.unprepare	= mtk_ref2usb_tx_unprepare,
>  };
>  
> -struct clk_hw * __init mtk_clk_register_ref2usb_tx(const char *name,
> +struct clk_hw *mtk_clk_register_ref2usb_tx(const char *name,
>  			const char *parent_name, void __iomem *reg)
>  {
>  	struct mtk_ref2usb_tx *tx;
> -- 
> 2.35.1




Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C88C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 13:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bq5OL676oCvXbtlxHLnwMD8xTGzHPaFRbyY8d5MU8x0=; b=t9yX1rDwBbOyNs
	S+zUURViezIN5iL4PLqP6UKYDYhAy2YzKVAUItnj/q6eetyI5OuTlLJYrsMjZFJYBX0P9UBJ6tFG0
	cmXv1WqhNOOfXoWzZkHoXqo6FnClSFkRanAtvWM/EvcQJ/tqfgb//0RDnyAfio0UkhsibBxuUG6a7
	jwDgYiVpUA+iK2WhNsgcFGZFQM4EvYhzcekGGwKL/cIs6eye68qUJiosgrqWnPQr4FbK8LasSghRa
	8ApTsRBmun4AVTgZ9g/6aeDywoKrHIVXgPXyEzDpZT9ldKIIo7ZubyCob5ygOvfti9faiiwJ29aYI
	CY0sAtbcL1xHh+l9eUng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM8nx-005vtm-V0; Mon, 21 Feb 2022 13:32:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM8A2-005k2d-N9; Mon, 21 Feb 2022 12:51:28 +0000
X-UUID: ff6c5765b64547358f1999b0d8e6a292-20220221
X-UUID: ff6c5765b64547358f1999b0d8e6a292-20220221
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 10839794; Mon, 21 Feb 2022 05:51:23 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Feb 2022 04:49:36 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Feb 2022 20:49:34 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Feb 2022 20:49:34 +0800
Message-ID: <238e4347712fa4a909faf6e1aa0f78e33716fa12.camel@mediatek.com>
Subject: Re: [PATCH v2 11/23] arm64: dts: mt8192: Correct nor_flash status
 of mt8192
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
Date: Mon, 21 Feb 2022 20:49:34 +0800
In-Reply-To: <6bcad8b0-7836-77f0-5040-e76b20c04a4e@collabora.com>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-12-allen-kh.cheng@mediatek.com>
 <6bcad8b0-7836-77f0-5040-e76b20c04a4e@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_045126_819273_D893044E 
X-CRM114-Status: GOOD (  16.37  )
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

On Fri, 2022-02-18 at 13:55 +0100, AngeloGioacchino Del Regno wrote:
> Il 18/02/22 10:16, Allen-KH Cheng ha scritto:
> > Correct nor_flash status of mt8192 SoC.
> > 
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> 
> The commit message should be:
> arm64: dts: mt8192: Fix nor_flash status disable typo
> 
> ...and it should also have a Fixes: tag.
> 

Hi Angelo,

Thanks for your reminding, this's my neglect.

I will update commit message.

Best regards,
Allen

> > ---
> >   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > index 4533c794effc..f51fd0f6c356 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > @@ -936,7 +936,7 @@
> >   			assigned-clock-parents = <&clk26m>;
> >   			#address-cells = <1>;
> >   			#size-cells = <0>;
> > -			status = "disable";
> > +			status = "disabled";
> >   		};
> >   
> >   		i2c3: i2c@11cb0000 {


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

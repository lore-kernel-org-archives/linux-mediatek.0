Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FFAC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 12:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z2V6iHGSk3MPqZm9EuAXc/65M7qyGyoafjMUNzyA5po=; b=xpqRt79g69JUAb
	C2/67CNpQI4IRLRUb9hDrFLPj/IooIci84n7t5FyDDUIieeJQH72wcTCkYgq9srsCHsc9Ywocb7lb
	kY+XUFtiPHkSWeS8Y/xK9fN4rPxJ7vRHh/+Rl5CVXXoF0NVplcc9eT0PNKUsWTsrGsmthzVA5Uto9
	1exQJfv+I1B50xDx20F2qIg2lAPpQnyWFImgl98NoMlkAig3UqFIXceif77m7duFRjnokA4dlx8ty
	G0Eti0ZDaelSaMCH2FPo47yesQXo6sihWBNdvSKyHPNl7sI0dVhwDLGk2nkli8C7dA+xsVubOlbl2
	+wBUb0nTZG9PkmP4CMkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njKOe-00EHUL-1y; Tue, 26 Apr 2022 12:34:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njKOT-00EHSe-68; Tue, 26 Apr 2022 12:34:14 +0000
X-UUID: 2a53ca2e14d14f60b0b78f484bb2deeb-20220426
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:2eed6b5e-51aa-4dae-a604-99ebce1b2213, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:8ca8c22e-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 2a53ca2e14d14f60b0b78f484bb2deeb-20220426
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 15727016; Tue, 26 Apr 2022 05:34:08 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Apr 2022 05:30:59 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 26 Apr 2022 20:30:50 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 26 Apr 2022 20:30:50 +0800
Message-ID: <6759af85c79e827f4fbaef26f5bf6cebd2de8c54.camel@mediatek.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: timer: Add compatible for Mediatek
 MT8186
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh@kernel.org>
CC: <hsinyi@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Guenter Roeck
 <linux@roeck-us.net>, <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>
Date: Tue, 26 Apr 2022 20:30:50 +0800
In-Reply-To: <98be733a-62b0-4cf6-ab27-992ea49da5b1@linaro.org>
References: <20220311130732.22706-1-allen-kh.cheng@mediatek.com>
 <20220311130732.22706-2-allen-kh.cheng@mediatek.com>
 <Yitv3IUpCzp1/eGX@robh.at.kernel.org>
 <98be733a-62b0-4cf6-ab27-992ea49da5b1@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_053413_279412_0EF87C7B 
X-CRM114-Status: GOOD (  14.85  )
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

Hi Daniel,

I just want to check with you.

I cannot find the git repositories you applied.

Would you mind sharing the information to me?

Thanks,
Allen 

On Wed, 2022-03-30 at 13:49 +0200, Daniel Lezcano wrote:
> On 11/03/2022 16:50, Rob Herring wrote:
> > On Fri, 11 Mar 2022 21:07:29 +0800, Allen-KH Cheng wrote:
> > > From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> > > 
> > > This commit adds dt-binding documentation of timer for Mediatek
> > > MT8186 SoC
> > > Platform.
> > > 
> > > Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> > > ---
> > >   Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
> > > | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > 
> > Acked-by: Rob Herring <robh@kernel.org>
> 
> Applied, thanks
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

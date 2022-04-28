Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34ACDC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 08:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3WmtGQpOUbj7gUqHNbChi12MGkDq0P6FA/U76s6oifA=; b=JNRdkklOdXuqjq
	CquufkVUQzxBLuEhul7TT9DO57LYH7unCMVr9JUnNsb833is3A7P88nEqwjzbW3uksBbM/iftZ0UL
	vO2aaVHZD348HdSB8BQ3mq5fRdcM0xaOufe/CnJMSAu3og97rKnfgc8meRKn9WPZ7bYC3ttFkFE4D
	SVvHoKLh8f7Mlwb2vjSE36mjR7fKFa6rUlKQxKddaHqC8zzupHbyzgEtASrWfGurZ5JF+4+PRdCsl
	uob+DcQVDZQqsL9N32+nWhYGUe4KyP6F0c1O95lOGygmkK3aKhw7t3gWC827K3XA5scltBTotdyjF
	0hAIjvhZstBfpiv3Q/6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njzC8-005PZz-Ag; Thu, 28 Apr 2022 08:08:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njzBv-005PUB-NQ; Thu, 28 Apr 2022 08:08:01 +0000
X-UUID: 6b2e0f72c2d04b3da6dcee457c71017b-20220428
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:a66f0e52-6398-4744-8da5-4be1e7ac6901, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:367a042f-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 6b2e0f72c2d04b3da6dcee457c71017b-20220428
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1758445854; Thu, 28 Apr 2022 01:07:53 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Apr 2022 00:57:51 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 28 Apr 2022 15:57:49 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 Apr 2022 15:57:49 +0800
Message-ID: <427604a0f73dde94b0415ab3c5605ad37e05989d.camel@mediatek.com>
Subject: Re: [PATCH] dt-bindings: rtc: mediatek: add mt6358 and mt6366
 compatible
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alessandro Zummo
 <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Date: Thu, 28 Apr 2022 15:57:49 +0800
In-Reply-To: <d4fb371c-c204-3ab5-6f38-7c88de30b25d@linaro.org>
References: <20220428064637.28288-1-allen-kh.cheng@mediatek.com>
 <d4fb371c-c204-3ab5-6f38-7c88de30b25d@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_010759_812936_3C0F4144 
X-CRM114-Status: GOOD (  18.26  )
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

Hi Krzysztof,

On Thu, 2022-04-28 at 09:20 +0200, Krzysztof Kozlowski wrote:
> On 28/04/2022 08:46, Allen-KH Cheng wrote:
> > Add mt6358 and mt6366 compatible in devicetree-binding document for
> > MediaTek PMIC based RTC. mt6358 and mt6366 use same compatible data
> > to store RTC_WRTGR address offset.
> > 
> > mt6366-rtc will use mt6358-rts as fallback.
> > 
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/rtc/rtc-mt6397.txt | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/rtc/rtc-mt6397.txt
> > b/Documentation/devicetree/bindings/rtc/rtc-mt6397.txt
> > index 55a0c8874c03..5b012d222f5b 100644
> > --- a/Documentation/devicetree/bindings/rtc/rtc-mt6397.txt
> > +++ b/Documentation/devicetree/bindings/rtc/rtc-mt6397.txt
> > @@ -14,6 +14,8 @@ For MediaTek PMIC wrapper bus bindings, see:
> >  Required properties:
> >  - compatible: Should be one of follows
> >         "mediatek,mt6323-rtc": for MT6323 PMIC
> > +       "mediatek,mt6358-rtc": for MT6358 PMIC
> > +       "mediatek,mt6358-rtc","mediatek,mt6366-rtc": for MT6366
> > PMIC
> 
> Does not look like in correct order.
> 
> >         "mediatek,mt6397-rtc": for MT6397 PMIC
> >  
> >  Example:
> 
> 
> Best regards,
> Krzysztof

Thanks for yours reminder.

Our rtc owner didn't notice this.

I will correct that in next version.

Thanks,
Allen



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

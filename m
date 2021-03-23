Return-Path: <SRS0=7DfI=IV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F57C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 02:39:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64BCC6198C
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 02:39:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64BCC6198C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ew1vXLm5WyeVFKNxaK+WjeI4bj1uIZLRYu6qtRTO3hk=; b=qVtlPcG6pySMUXZMCLF0pwfCt
	XxMpUwZj7cP+hwCG5mZaY+CSJ/NWDd53k6NQXEKo5KeQ9ERg6hbJcrmOMS9Q4UgeCrvXt7X2726Q1
	M/sohMW90iVBZyk+4LqMgZro6ImxeuJnUqriN9a7ZEljSytR1eWJBMrQcuUEDFm2jATo0r2AVS6Lc
	P28ZKLmusSicAvJMLz2tRuJy8vzzyHN4SFG+WOjw1wCSt54Dk/aMOPYFPND1DAAnuNkkbKlavuhk1
	8TjVjnbieGugTzcuoWLFB33cMa14lKgjHg1xwg0VSzcfQ2fnpWvQKOvdErlXQ5ZTdzzBSYGNDYXgo
	r4TDvVocA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOWx1-00DQ2c-14; Tue, 23 Mar 2021 02:39:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOWwu-00DQ0f-V7; Tue, 23 Mar 2021 02:39:20 +0000
X-UUID: 14ad054cd28e4ddb851627bb92688e05-20210322
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ec0Xu7ws9yc4yFZEfVrLx9sGsUsQO2Y5F69pZNql94w=; 
 b=pXJbd067FziMQaTKbvYVerI+m05jIPvtm/33i4t9PnmrbZOdHWenwUvFnNr7fOtDUhZYDfyDhQ0otgPIePnHhaT73wQSxb3I+noyYVcOa4DdUBxypDTFAPVYL9OS+yFfeCaLS4jWF4fBM0Yhttjxe+oZ4NJrsS6XvqK57sS2OOQ=;
X-UUID: 14ad054cd28e4ddb851627bb92688e05-20210322
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1256232486; Mon, 22 Mar 2021 18:39:11 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 22 Mar 2021 19:39:10 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs06n2.mediatek.inc
 (172.21.101.130) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 23 Mar 2021 10:39:08 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 23 Mar 2021 10:39:07 +0800
Message-ID: <1616467147.11286.1.camel@mhfsdcap03>
Subject: Re: [PATCH 06/13] usb: xhci-mtk: support ip-sleep wakeup for MT8183
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Eddie Hung
 <eddie.hung@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 23 Mar 2021 10:39:07 +0800
In-Reply-To: <0e660a28-d66f-a23e-3fad-8fa37b6df1b1@gmail.com>
References: <1616382832-28450-1-git-send-email-chunfeng.yun@mediatek.com>
 <1616382832-28450-6-git-send-email-chunfeng.yun@mediatek.com>
 <0e660a28-d66f-a23e-3fad-8fa37b6df1b1@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1521B1B4E95B0792845FBE36193B2F66E31839D23892065DCC5F210519F582DC2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_023917_915878_38AB0450 
X-CRM114-Status: GOOD (  21.59  )
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

On Mon, 2021-03-22 at 11:54 +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 22.03.2021 6:13, Chunfeng Yun wrote:
> 
> > Add support ip-sleep wakeup for MT8183, it's similar to MT8173,
>               ^ for
> 
> > and it's also a specific one, but not follow IPM rule.
> 
>     Following?
Ack
> 
> > Due to the index 2 already used by many DTS, it's better to keep
> > it unchanged for backward compatible, treat specific ones without
> 
>     Compatibility.
Ack
> 
> > following IPM rule as revision 1.x, meanwhile reserve 3~10 for
> > later revision that follows the IPM rule.
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> >   drivers/usb/host/xhci-mtk.c | 13 +++++++++++++
> >   1 file changed, 13 insertions(+)
> > 
> > diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> > index 09f2ddbfe8b9..8ba1f914cb75 100644
> > --- a/drivers/usb/host/xhci-mtk.c
> > +++ b/drivers/usb/host/xhci-mtk.c
> > @@ -57,12 +57,19 @@
> >   #define CTRL_U2_FORCE_PLL_STB	BIT(28)
> >   
> >   /* usb remote wakeup registers in syscon */
> > +
> >   /* mt8173 etc */
> >   #define PERI_WK_CTRL1	0x4
> >   #define WC1_IS_C(x)	(((x) & 0xf) << 26)  /* cycle debounce */
> >   #define WC1_IS_EN	BIT(25)
> >   #define WC1_IS_P	BIT(6)  /* polarity for ip sleep */
> >   
> > +/* mt8183 */
> > +#define PERI_WK_CTRL0	0x0
> > +#define WC0_IS_C(x)	(((x) & 0xf) << 28)  /* cycle debounce */
> > +#define WC0_IS_P	BIT(12)	/* polarity */
> > +#define WC0_IS_EN	BIT(6)
> > +
> >   /* mt2712 etc */
> >   #define PERI_SSUSB_SPM_CTRL	0x0
> >   #define SSC_IP_SLEEP_EN	BIT(4)
> > @@ -71,6 +78,7 @@
> >   enum ssusb_uwk_vers {
> >   	SSUSB_UWK_V1 = 1,
> >   	SSUSB_UWK_V2,
> > +	SSUSB_UWK_V11 = 11,	/* specific revision 1.1 */
> 
>     SSUSB_UWK_V1_1, maybe?
Good point, will modify it.

Thanks a lot

> 
> [...]
> 
> MBR, Sergei

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

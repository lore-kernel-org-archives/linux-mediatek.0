Return-Path: <SRS0=7DfI=IV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D49CC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 02:40:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C7A2619A3
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 02:40:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C7A2619A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fgJ7R2WUgzJW9wfKFouvx1fUtwHh3z6me4dBECh2zt8=; b=IQ8nCN/4ZxhjA9o/fML8HrfGX
	Sevcrk43tTqabrNlYswx83se7K1HGYkYoCTztT9npUXSIOxcxIetuoXQNXDC2GgIWo705nT2sTZz9
	gTOAwYoPuo4r+9AEUAVNzVy3lhhAGsu6ETEeKszxnkdefvVtgX5MTo0GgFDBHeIBPDSoXeS8AYUKP
	d8Xah5PZLzLYcenglJzS+fOW1lSSlutgBR0QFEioM+SiA93OyXq5+fkMnZUcvHovtdpqZ0TUpHJ36
	BtoCJKcovhqFKnUBE6ltvTY/Vupbb3ZDEMuh5z2PeYBTGsocY4ibE+g4B8Mgpqei52dsRmlpdyqVb
	0OUIouICQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOWxm-00DQGP-K9; Tue, 23 Mar 2021 02:40:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOWxg-00DQDJ-Le; Tue, 23 Mar 2021 02:40:07 +0000
X-UUID: b58ef74b81a4458a908f639d6c84e8c2-20210322
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=t0qU8llNkRDLUgJXViRWMIBmBCKeW0QIxCmuD9wSIyA=; 
 b=sG0lRv2QbVu+xjPq1mxgKkmu/mtyGHHcLmV5k6p3xlNM2jBa6DcMKz3P4mOXS9sPve0T84nVEoZhfvj3PAv30KNP9Uesk+fjgX5aM14SDoPn6TO9EPDNc4VRopPuYYHgUWSctGc7icUCqlgDyVHHa8csNO0U43M8PnRWIfZ7pko=;
X-UUID: b58ef74b81a4458a908f639d6c84e8c2-20210322
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 400318328; Mon, 22 Mar 2021 18:39:58 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 22 Mar 2021 19:39:56 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs06n1.mediatek.inc
 (172.21.101.129) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 23 Mar 2021 10:39:55 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 23 Mar 2021 10:39:54 +0800
Message-ID: <1616467194.11286.2.camel@mhfsdcap03>
Subject: Re: [PATCH 07/13] usb: xhci-mtk: add support ip-sleep wakeup for
 mT8192
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Eddie Hung
 <eddie.hung@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 23 Mar 2021 10:39:54 +0800
In-Reply-To: <f9d14506-5db5-8f97-e3d0-5956cc17dadd@gmail.com>
References: <1616382832-28450-1-git-send-email-chunfeng.yun@mediatek.com>
 <1616382832-28450-7-git-send-email-chunfeng.yun@mediatek.com>
 <f9d14506-5db5-8f97-e3d0-5956cc17dadd@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_024005_118453_7D33C3E4 
X-CRM114-Status: GOOD (  16.45  )
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

On Mon, 2021-03-22 at 11:58 +0300, Sergei Shtylyov wrote:
> On 22.03.2021 6:13, Chunfeng Yun wrote:
> 
> > Add support ip-sleep wakeup for mT8192, it's a specific revision,
>               ^ for
> 
> > and not follow IPM rule.
> 
>     Following?
> 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> >   drivers/usb/host/xhci-mtk.c | 10 ++++++++++
> >   1 file changed, 10 insertions(+)
> > 
> > diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> > index 8ba1f914cb75..1bfa28c9b5a2 100644
> > --- a/drivers/usb/host/xhci-mtk.c
> > +++ b/drivers/usb/host/xhci-mtk.c
> > @@ -70,6 +70,10 @@
> >   #define WC0_IS_P	BIT(12)	/* polarity */
> >   #define WC0_IS_EN	BIT(6)
> >   
> > +/* mt8192 */
> > +#define WC0_SSUSB0_CDEN		BIT(6)
> > +#define WC0_IS_SPM_EN		BIT(1)
> > +
> >   /* mt2712 etc */
> >   #define PERI_SSUSB_SPM_CTRL	0x0
> >   #define SSC_IP_SLEEP_EN	BIT(4)
> > @@ -79,6 +83,7 @@ enum ssusb_uwk_vers {
> >   	SSUSB_UWK_V1 = 1,
> >   	SSUSB_UWK_V2,
> >   	SSUSB_UWK_V11 = 11,	/* specific revision 1.1 */
> > +	SSUSB_UWK_V12,		/* specific revision 1.2 */
> 
>     SSUSB_UWK_V1_2, maybe?
Ok, will do it, thanks a lot

> 
> [...]
> 
> MBR, Sergei

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

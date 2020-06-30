Return-Path: <SRS0=AAZc=AL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECBC7C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 07:04:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAFD3206CB
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 07:04:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wpj2wKWS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="P+OSWT6F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAFD3206CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VdUEafli0IA8AAGznDFuivuyE4sezNCa0c6AJ2DD5P8=; b=wpj2wKWSLB1JoU0SiKq9w8BYU
	m8kf5Gy4I3sDepAUo/wpKBGsKlPQPQiMTpoGp+2V7qAtQDWUlWKIYELOYJ84yd92sZciSh1NMxsfn
	xVRGiP0IvXVXVHoqoX+0VZNcyjqKXEG+4qhCWUDS8mGBI497dxXkRPxwNEtnC3gdnJMtVxQB51kTZ
	tj10zKwTEZ+wMds9JhNuVXarwdqj6wxjR7QZu3rYYe5vLfK4O0aZqXgvbF62zZ7Yvzv6bRTaMxSsU
	MsFJpJX1ygdDvicCzkk7SnHbPe/MmEkgGJTP5Rxx3Bqu4BOKfDClRLKzSAmQwFhJvbO0g5NKfzhqV
	YBYBf+H7A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqAJd-0001JX-Ns; Tue, 30 Jun 2020 07:04:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqAJb-0001J5-Ez; Tue, 30 Jun 2020 07:04:24 +0000
X-UUID: a6a2bc1400774bb49e40b4478b6bb395-20200629
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=85Y8+6bkZLH5yMFgsr9O3/8M6UcByJwt+cBROWXTJxI=; 
 b=P+OSWT6F21j9ksS46fSGcHQdhA/2bejizLU1uJCuAa9XA+6VnvoNpdrGX/F2dNeBvm2rymKbuIQcALj8BS374rJgdXYcXX5pgeQ+0rUDU9GTRmVJ8Qz4fZDThMywhMIayoVtk5luXCsbQPHhbqWQ01EnbfSRB7Hd66Hq8FcktwY=;
X-UUID: a6a2bc1400774bb49e40b4478b6bb395-20200629
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 603420964; Mon, 29 Jun 2020 23:04:07 -0800
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Jun 2020 00:04:13 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 30 Jun 2020 15:04:10 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 30 Jun 2020 15:04:09 +0800
Message-ID: <1593500631.3798.9.camel@mhfsdcap03>
Subject: Re: [PATCH 1/2] usb: mtu3: disable USB2 LPM
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Peter Chen <hzpeterchen@gmail.com>
Date: Tue, 30 Jun 2020 15:03:51 +0800
In-Reply-To: <CAL411-qVjxYk7f+b74XHfj7jpxALS4LYUKe0XdSfwRZcQibNfA@mail.gmail.com>
References: <1593410434-19406-1-git-send-email-chunfeng.yun@mediatek.com>
 <CAL411-qVjxYk7f+b74XHfj7jpxALS4LYUKe0XdSfwRZcQibNfA@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: FC147824681EC42AD367BF2416B37B5EB0CDBAF9C30100AADD32FDD739E780162000:8
X-MTK: N
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Felipe Balbi <felipe.balbi@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB list <linux-usb@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Markus Elfring <Markus.Elfring@web.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-06-29 at 15:37 +0800, Peter Chen wrote:
> On Mon, Jun 29, 2020 at 2:04 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> >
> > A SuperSpeed device shall include the USB 2.0 extension descriptor
> > and shall support LPM when operating in USB 2.0 HS mode(see usb3.2
> > spec9.6.2.1). But we always don't support it, so disable it by
> > default, otherwise device will enter LPM suspend mode when
> > connected to Win10 system.
> 
> Linux also supports USB2 LPM. Besides, USB-IF CH9 test will check
> LPM support if the device is USB 2.1, how could you deal with it?
Indeed need support it for SS device, I'll check it again, thanks a lot

> 
> Peter
> 
> >
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> >  drivers/usb/mtu3/mtu3_core.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
> > index 9dd0216..50d6a40 100644
> > --- a/drivers/usb/mtu3/mtu3_core.c
> > +++ b/drivers/usb/mtu3/mtu3_core.c
> > @@ -604,6 +604,8 @@ static void mtu3_regs_init(struct mtu3 *mtu)
> >         mtu3_clrbits(mbase, U3D_MISC_CTRL, VBUS_FRC_EN | VBUS_ON);
> >         /* enable automatical HWRW from L1 */
> >         mtu3_setbits(mbase, U3D_POWER_MANAGEMENT, LPM_HRWE);
> > +       /* always reject LPM request */
> > +       mtu3_setbits(mbase, U3D_POWER_MANAGEMENT, LPM_MODE(1));
> >
> >         /* use new QMU format when HW version >= 0x1003 */
> >         if (mtu->gen2cp)
> > --
> > 1.9.1
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

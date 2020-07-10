Return-Path: <SRS0=M7U7=AV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7B3CC433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 06:00:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7C6D20787
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 06:00:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2VDJaZVF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="a4qcSH3B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7C6D20787
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GmjsDk4nxqVlrUL8SLgddpbANSBVHP7n2ernMO1v4p4=; b=2VDJaZVFr0Kxup0JkOiZGOPbi
	lgU9EjfT/MaimwjQNfgmKKUnkJNyOrY2wn7y2DfThK4H3ckWwalaK+3Yd1NKWaFLQp80/FMf6H/hP
	bkKlHBt5sKNyQlC4XZVFw09Rqw1oemwCXOIahrx0GlbXINcWlwtkHqWprK4OcLSRgvRDtsSfAq3fv
	LgP7tjFAHc9DQj+RR9JvqjeL6UQo+x5BIQlf75WHeYSCL6gt3qPOYgdT/L1BKhnE2E+QHjZHTlp80
	bpgW4FS8qCirHwm/TZj0Ic5elLDYU2ew1z+k78hSUHw242YTuFWOgRBe2ZReMqnroNhkyrzTg2GFq
	AA6ComoqA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtm4f-00027i-PX; Fri, 10 Jul 2020 05:59:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtm4Z-00026I-IF; Fri, 10 Jul 2020 05:59:49 +0000
X-UUID: 524bca888435440abfd131539beb073f-20200709
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=3J4M+F0supuqFwxgQsU3V/czRpfnA/Zs7qlL02F271M=; 
 b=a4qcSH3Bkk+xS9u9zXIbFDX1ZfhQ3BrcT/SoaqYYHiL0W3KoGQ95Z8XVsBrRxQeW/Z8x1IysnGCvS8ik1FCSSHqJrkaYYochii2H74jCrVV4WWH7iYJ6gCAqZWvjg1HMDRxS9fHLvV/6tBiSURx8MgdkOHZH0fNMy00w4g4f5f4=;
X-UUID: 524bca888435440abfd131539beb073f-20200709
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1389348898; Thu, 09 Jul 2020 21:59:42 -0800
Received: from MTKMBS32DR.mediatek.inc (172.27.6.104) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Jul 2020 22:58:57 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32DR.mediatek.inc
 (172.27.6.104) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 10 Jul 2020 13:58:52 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 10 Jul 2020 13:58:51 +0800
Message-ID: <1594360692.23885.29.camel@mhfsdcap03>
Subject: Re: [PATCH] usb: xhci-mtk: fix the failure of bandwidth allocation
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Date: Fri, 10 Jul 2020 13:58:12 +0800
In-Reply-To: <CANMq1KA2kT1yLGqhJFBKt4sRzzE6r=ABkSX59S-Mjr8Dg8sTOQ@mail.gmail.com>
References: <1594348182-431-1-git-send-email-chunfeng.yun@mediatek.com>
 <CANMq1KA2kT1yLGqhJFBKt4sRzzE6r=ABkSX59S-Mjr8Dg8sTOQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 97B22A963E31DADB986C97287E9D5D6F20148FF6D6DB6C9860D7A8A1AC4405352000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_015948_010369_57E42E8C 
X-CRM114-Status: GOOD (  17.54  )
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
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 lkml <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>,
 "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ikjoon Jang <ikjn@chromium.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-07-10 at 11:14 +0800, Nicolas Boichat wrote:
> On Fri, Jul 10, 2020 at 10:30 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> >
> > The wMaxPacketSize field of endpoint descriptor may be zero
> > as default value in alternate interface, and they are not
> > actually selected when start stream, so skip them when try to
> > allocate bandwidth.
> >
> > Cc: stable <stable@vger.kernel.org>
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> 
> Add this?
> Fixes: 0cbd4b34cda9dfd ("xhci: mediatek: support MTK xHCI host controller")
Ok, thanks

> 
> > ---
> >  drivers/usb/host/xhci-mtk-sch.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
> > index fea5555..45c54d56 100644
> > --- a/drivers/usb/host/xhci-mtk-sch.c
> > +++ b/drivers/usb/host/xhci-mtk-sch.c
> > @@ -557,6 +557,10 @@ static bool need_bw_sch(struct usb_host_endpoint *ep,
> >         if (is_fs_or_ls(speed) && !has_tt)
> >                 return false;
> >
> > +       /* skip endpoint with zero maxpkt */
> > +       if (usb_endpoint_maxp(&ep->desc) == 0)
> > +               return false;
> > +
> >         return true;
> >  }
> >
> > --
> > 1.9.1
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

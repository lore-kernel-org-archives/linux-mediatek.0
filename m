Return-Path: <SRS0=tl/R=DB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46814C4346E
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 08:31:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5547206FC
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 08:31:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C0yahtpq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZagBkT8L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5547206FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yI3R+BQFD+4YJ+1fdamxQeKo0pm2bDJnicQDOQbZAOA=; b=C0yahtpqLnC9rAFuuYOV45h2d
	IVPKTbeQ76FOmKxjs92bay5GkKIc6roNe+EgIyG2sHk6B4hHwofq/acVdk9Jhu0iPJRFUdUybNWHj
	3uRnHCl/nhWmfa/MmZJBQXMa64kDaCdZ+CmlR0KuZc6NhAjJ8Sv8JXzrU5sux6narKgqe3cLZLgY7
	I7QkgGSJj+30uIZgALBjPAnbweHr4lRsgHdefv5lUD/DPOJVtYlnytmRVsNiydfHebuxO6CcIG0Mq
	WHmr6ZWhltwo1Knm/r/DgtKK3zP4GOx1Yzu8lPrZKthjQO/q2lDbPi8Btva/TFcED3Y1d8ZzjkGDf
	fjlITY0mA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLMeu-0004ZH-BL; Thu, 24 Sep 2020 08:31:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLMeo-0004Wl-Np; Thu, 24 Sep 2020 08:31:16 +0000
X-UUID: 5c434188eba1448aac28c14f5af9d886-20200924
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=DVsde8Sxk23MLuOP2061BcZ00WNs3yYnS+BwpO2OdC0=; 
 b=ZagBkT8LsKGA5lk7INzrhXmHg4ALNaUbomCfytyc14roUgl0Art4krlD0eoquvJi8es/V96qqoyoDaeMNNDcnwks2XndgtxPiQSsd2octfXd1SRuWp/Qev5ZpuI5yvqpz5d1Rex/Vwav1po9LccT35Kb8Uzoho5xpStfnnWBw3g=;
X-UUID: 5c434188eba1448aac28c14f5af9d886-20200924
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2073838874; Thu, 24 Sep 2020 00:31:07 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Sep 2020 01:31:05 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 24 Sep 2020 16:31:02 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 24 Sep 2020 16:31:01 +0800
Message-ID: <1600936119.21970.4.camel@mhfsdcap03>
Subject: Re: [PATCH] usb: gadget: bcm63xx_udc: fix up the error of
 undeclared usb_debug_root
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>
Date: Thu, 24 Sep 2020 16:28:39 +0800
In-Reply-To: <871rirehqq.fsf@kernel.org>
References: <1600061930-778-1-git-send-email-chunfeng.yun@mediatek.com>
 <871rirehqq.fsf@kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B7859B15AFDE944996573D812135A52BDB5B7466C5FA3F1467BE71D06B2672CE2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_043115_039762_840A228D 
X-CRM114-Status: GOOD (  11.39  )
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Cernekee <cernekee@gmail.com>, linux-kernel@vger.kernel.org,
 stable <stable@vger.kernel.org>, linux-usb@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-09-24 at 10:50 +0300, Felipe Balbi wrote:
> Chunfeng Yun <chunfeng.yun@mediatek.com> writes:
> 
> > Fix up the build error caused by undeclared usb_debug_root
> >
> > Cc: stable <stable@vger.kernel.org>
> > Fixes: a66ada4f241c("usb: gadget: bcm63xx_udc: create debugfs directory under usb root")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> 
> $ patch -p1 --dry-run p.patch
> /usr/bin/patch: **** Only garbage was found in the patch input.
> 
Please try to apply v2, https://patchwork.kernel.org/patch/11772911/
I indeed add a line code


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

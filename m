Return-Path: <SRS0=zFd5=FP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15CC2C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Dec 2020 06:28:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE0A523ECF
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Dec 2020 06:28:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE0A523ECF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gF9ypIXZVG7dsHjRrqFspbwXu8I+CbU39JdAvVNdZp0=; b=pXIpozF4hLeVdDmnhJ/2f0Hc2
	7YzX245Wxs7F2sScvmXtaNQLixQCXeKj/DtezVMHaRCVgjvzr0cyNQcOxlE56Hq0CJqywcyE9vbd7
	ZlFiPIow2KT8eqA4v/kEW3fb+XSNhOfMqljiREamI/B5SDdc4yO6pI15tvJNWWbaXbNhp98i/xYqi
	5RFtk7tnUKv1wwbTtTlZ37/o4IHD+O8mNqEUW1luNmtZ2kiSmrV2GVINY8m5sBXPuFuMBB9FfzrZL
	C86Ujhh4fMSyykWAOKFYGSv9kYCwY3qzLklHyqBlHsht9iC7zEZTSeFgax81/PVnrAxWODmO77tfH
	yjVrhQ8QQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knbuD-0007Cz-HQ; Fri, 11 Dec 2020 06:27:53 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knbu8-0007C6-Ro
 for linux-mediatek@lists.infradead.org; Fri, 11 Dec 2020 06:27:49 +0000
Received: by mail-pl1-x644.google.com with SMTP id r4so4089394pls.11
 for <linux-mediatek@lists.infradead.org>; Thu, 10 Dec 2020 22:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+NZCqNrXpIQOHB+clR8WgE5i45yw+bOFU7a6qyf9U0g=;
 b=Yj8ERgL7ftmm8JcEBoewVHYgPQQHMrBW7T9cqPbsOUJqWlStcwMOoWjOCDBpo/gH2b
 MNnMTibwIfcFnNGUH1IT66nG6hveH887dJ43icRzCcrqSHs+fmX2ORvCQcdaJWzVCNlM
 yOleujohBJZUz/3XayBixb1wwaOeMS3xu7ZaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+NZCqNrXpIQOHB+clR8WgE5i45yw+bOFU7a6qyf9U0g=;
 b=FtRuo7br+OBCxJLPnUw2QV8ENB1xwm4M+ayyNLfBidbtwcfn3ABA7p0mT9pZOfwo1o
 2CCYU0ioggcYay6YuoDa/Vf2sq92WzIDN/WKRu10AFAoVhbWz2YVQA1qcpV3eOKLks5U
 TQeQRtO4Q9iJaHLQwATjv7UBULm7MOnhS809X9dx2MIkbD1443OFDk92h0kCEBOXAtIL
 NrRTc63Pbs6hUG9LU4+CfYcrU5A/gfquNWJAZYH5BD2pehVT4eb967Do6CeI4vByZAQq
 gfunMqyBGEi2gg2x/aR4tTnSfKBZvTKhLUHbmEY11c1MdxDk4x3amQ3QFROORVzgD2Vk
 uEEg==
X-Gm-Message-State: AOAM530Djdggoxorq7ZFjhPFDFKauYC0G+mNTdvRnXSGdvcHtCDswrXv
 UTA2KJTf7kc1qiKVImHTCgCp1uKCOitIOao7ap+Uug==
X-Google-Smtp-Source: ABdhPJw9a6EUufsiEyEhuZXX3ZGfuxO+oyyeGpF2rgFDPWlkOqpOTbp+QOOQKOzUTUbZHQMB5Q518KWuPZaf2zD/J8o=
X-Received: by 2002:a17:902:a502:b029:da:f580:bc35 with SMTP id
 s2-20020a170902a502b02900daf580bc35mr9802625plq.60.1607668066723; Thu, 10 Dec
 2020 22:27:46 -0800 (PST)
MIME-Version: 1.0
References: <20201210104747.3416781-1-ikjn@chromium.org>
 <20201210184700.v2.3.Id0d31b5f3ddf5e734d2ab11161ac5821921b1e1e@changeid>
 <X9H/ZVpHf2Owd6rj@kroah.com>
In-Reply-To: <X9H/ZVpHf2Owd6rj@kroah.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Fri, 11 Dec 2020 14:27:35 +0800
Message-ID: <CAATdQgCZjzoiiReoL-0X5VgWXcEzPsg5B_=SBFFD7dp1Gmvgog@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] usb: xhci-mtk: fix unreleased bandwidth data
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201211_012748_953701_52BEE609 
X-CRM114-Status: GOOD (  18.87  )
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
Cc: Zhanyong Wang <zhanyong.wang@mediatek.com>,
 Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>,
 Tianping Fang <tianping.fang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Dec 10, 2020 at 6:57 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Dec 10, 2020 at 06:47:47PM +0800, Ikjoon Jang wrote:
> > xhci-mtk has hooks on add_endpoint() and drop_endpoint() from xhci
> > to handle its own sw bandwidth managements and stores bandwidth data
> > into internal table every time add_endpoint() is called,
> > so when bandwidth allocation fails at one endpoint, all earlier
> > allocation from the same interface could still remain at the table.
> >
> > This patch adds two more hooks from check_bandwidth() and
> > reset_bandwidth(), and make mtk-xhci to releases all failed endpoints
> > from reset_bandwidth().
> >
> > Fixes: 0cbd4b34cda9 ("xhci: mediatek: support MTK xHCI host controller")
> > Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
>
> Shouldn't this be the first patch in the series?  You don't want a fix
> to be dependent on code style changes, otherwise it is really really
> hard to backport it to older kernels that might need this fix, right?

yes, you're right.

This patchset also requires
"4b0f7a77fb3c usb: xhci-mtk: supports bandwidth scheduling with multi-TT",
which doesn't have a Fixes tag.

I think I can change Fixes to point to that commit (4b0f7a77fb3c),
as this unreleased bandwidth data is much more impactful to
TT bandwidth.

Thanks!

>
> Can you re-order these patches please?
>
> thanks,
>
> greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

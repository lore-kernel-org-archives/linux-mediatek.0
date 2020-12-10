Return-Path: <SRS0=Sq/6=FO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8D95C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 10:58:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84C3A23C44
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 10:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84C3A23C44
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aOuNFJQRHnMli4lE44xJwrnJ4D5hoIDh9LAYOrNkb38=; b=2Iv25CvZPUNgO9yNAlZu35iUZ
	wcPSDeJuxeBhEgomtttN9NNTJAfz7rGLpb0mY9kJ0Lbf5Xhtlvp1iPt0xH4DQ/mflOQyz/WS3F/yI
	VBvqs55IifU5nkwS11iKc+EG9fP9NkWNs1bSxscgn2xh2AnnBfhRF++dgYHwW8c6Hlrkgj6MqCX29
	40PePdGvu6paU7ie0TY+KidRe3XS4CR1sPfhdUQS8XmBF+vSQAZLyy0+8epzspkXt3uxAo9MI5b3A
	9yRoR0gD+RRpO4Y9tlwuiAx4wB6iO4KhH5SZQm2xHLENZbksK4g9xjUs22GOYjjjAVjj7Uub8bH4B
	v+s2zooOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knJeC-0005Fl-4b; Thu, 10 Dec 2020 10:58:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knJe6-0005Dn-UV; Thu, 10 Dec 2020 10:58:03 +0000
Date: Thu, 10 Dec 2020 11:59:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1607597882;
 bh=fbHLbzX32k54F9e34fx22c90OfpXv/w5Qrd4WvS31RM=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=RnKAW9tf7grXVCjw+8GF3nW1skE/u6PPlB+VWVNg7m84+uPCtrgBbCJhysoyR4SXd
 qSJ4+CoNK67LAqy6Z+5uUVWLtNCOX3995RVDe1saxbqICQph5bKacSewP5CoUGHi21
 l0gKxSMWlEC1FboOCD8Snlsfv0Y3eohrnjeY0ofQ=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ikjoon Jang <ikjn@chromium.org>
Subject: Re: [PATCH v2 2/3] usb: xhci-mtk: delay association of tt and ep
Message-ID: <X9H/hFasN+8GmQwB@kroah.com>
References: <20201210104747.3416781-1-ikjn@chromium.org>
 <20201210184700.v2.2.I236cbd6fe27db5a9c776b6d14fe146748373bbce@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201210184700.v2.2.I236cbd6fe27db5a9c776b6d14fe146748373bbce@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_055803_106859_A07BE99C 
X-CRM114-Status: UNSURE (   9.00  )
X-CRM114-Notice: Please train this message.
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
 linux-kernel@vger.kernel.org, Tianping Fang <tianping.fang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Dec 10, 2020 at 06:47:46PM +0800, Ikjoon Jang wrote:
> xhci-mtk creates internal data structures for representing the
> relationship between endpoint and TT.
> 
> This patch simply delays its association between endpoint and TT
> when it's really loaded onto internal bandwidth table.
> 
> This is a preparation step for fixing unreleased periodic
> TT bandwidth data, no functional changes.

So the next fix requires this on?  You might want to say that in the
next patch as well :)

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

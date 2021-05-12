Return-Path: <SRS0=1nN3=KH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F40EBC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 15:39:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C68961D35
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 15:39:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C68961D35
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Cq+Hgyr6BF8+ZuXgublSVsg5P6rK6OdCQPwZrDucj9I=; b=FhuOGFUClBjgsC7lTaOt5+J0f
	g/IRtoOjgLUV7hw3BMFmYSjeNTAu6PodQAvF2yT79fnMh8qz6ldn1rdsmKhAT7pit/dvHTjLuBB0a
	88+ualVyMfHFxZ5b854mZe2w4T+ofYa+NykQxNhGjbd+eAlvHBHDCYXG9GzGfvIPIoYuF0B/3/tHs
	EWefeImp/QISfR+UPbTkMoVaB9hh62y3d/bBxhIRraPaN4+pujE//gPIxqQO8tv9KqehAIRW/iftX
	vzXYDus2SUopwxYFbpdtMKUstZIKvrnC5wOU1knb4HuaCemhBCGc/py809x/cvX+JX/21VkIDkKZr
	bxaVkeaiw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgqxP-003E2S-0x; Wed, 12 May 2021 15:39:31 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgqxD-003DzH-W5; Wed, 12 May 2021 15:39:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=3RRNtQw/MGQ2xNnrJry8Z8iWUSxHJrYB11eenbS0sNk=; b=3WrNHckV/9wPJKd+sjhmIAdKSJ
 m4DRWgjCtacsfD+4pfq6DAjB16+5sY6bL83UI2RQAD0PpLJtmX1H3aUACLgwTeij7QEQDrC4aahFj
 uPrhRQad1CSNp5/tZR/6Nj51kIT25QcL9lxexGNt9XuwH6FLS9AQQ7/3d0oRLgWYvZK4KeOeoUNyF
 Ns8oxOJeQsk1nXlN0KlI6/VstTJ9n/HfoAoPIcWATIEnRKUpc4h22Sed+DK4WGtp2tiCr+IQMkTew
 JljKcEHRLHdC0JozHLStvuEUOnahy6wXMPdfu8jNBS4RBDrExFdxlTtMET9Lv1AilnpH+LinVytDv
 Xg6QufAg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgqxB-00AXFJ-CN; Wed, 12 May 2021 15:39:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BDC2261447;
 Wed, 12 May 2021 15:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620833956;
 bh=3OKE5hvIdwuXgAtAcX9qP9UHIBPfVufpxaoy+qmN7ik=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ax9+eTqIZr/T8ny36CIMXGA9hNYiTeTt9XbyhxfEPDGXfPAWU5nG5S/zjLcbQdn2T
 qPOwqL20LTk856KlTtKDU367ck3i3dA3AxM4oeR6uX48dP/RFymAX834uZPxeBcu8w
 eUcelaBUPJW2GP0qFvlCmVOjyJtRYoBeyK/GD7wHbr1RbbuwdOc6IS4l25COBK2Ja7
 iu+uG26ufHxyBoZgBdISpfOm8q7sTncmgVeSdropTh79gPy81Kfu0hcfLyGW9KcCnc
 r5pDV9LfJZzg1KLwXF88yxTD8qEgSGadtSIACQ4/iSl9w0RmSOm7AVqyHtG8gaKCby
 4IP1ixvg62zpg==
Date: Wed, 12 May 2021 08:39:13 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Rocco yue <rocco.yue@mediatek.com>
Cc: "David S . Miller" <davem@davemloft.net>, Matthias Brugger
 <matthias.bgg@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>
Subject: Re: [PATCH][v3] rtnetlink: add rtnl_lock debug log
Message-ID: <20210512083913.733f9803@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210511113257.2094-1-rocco.yue@mediatek.com>
References: <20210511113257.2094-1-rocco.yue@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_083917_487873_F93087E9 
X-CRM114-Status: GOOD (  14.05  )
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

On Tue, 11 May 2021 19:32:57 +0800 Rocco yue wrote:
> We often encounter system hangs caused by certain process
> holding rtnl_lock for a long time. Even if there is a lock
> detection mechanism in Linux, it is a bit troublesome and
> affects the system performance. We hope to add a lightweight
> debugging mechanism for detecting rtnl_lock.
> 
> Up to now, we have discovered and solved some potential bugs
> through this lightweight rtnl_lock debugging mechanism, which
> is helpful for us.
> 
> When you say Y for RTNL_LOCK_DEBUG, then the kernel will
> detect if any function hold rtnl_lock too long and some key
> information will be printed out to help locate the problem.
> 
> i.e: from the following logs, we can clearly know that the
> pid=2206 RfxSender_4 process holds rtnl_lock for a long time,
> causing the system to hang. And we can also speculate that the
> delay operation may be performed in devinet_ioctl(), resulting
> in rtnl_lock was not released in time.

You can achieve that with a pair of fexit/fentry hooks or kprobes,
and maybe a bit of BPF. No need for config options, and hardcoded
parameters..

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

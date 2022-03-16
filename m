Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DCF0C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 15:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GyfToEIyyLAIW+Y8FpBDb7XVP68pzfm/VTRFYBjuvNw=; b=pHD6DB2VbPh9br
	kAtX9XqoM2vG52cveTDA0Kjto4PSze3VY/SyY0pCtDDWx92xKPULGjABqVc8pXdrWOYSR6g3hKrH+
	6yHac/7sFOYcybgFKZRKlpSqtCc9gerBIF814sLuw06V6vOCxO8vn5xztIzijKk/0ZVZVTh0V0n2N
	VxfFUmwTeAYjl5Wd11B6rMUVpOJgRRkNuj3K4dEUibc6QxlNOD4I5YgPtps6V3yIvVkNKIFIxkpjh
	Gg7icwEOgwiTmCDLkgCBXADp771XQhOcZdBuhkmzzBkdSQ0V4kp4Ttrd8YllcwTB7vtTJROlHdsrz
	EY21vvy7dVJL6gbTS75Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUVe1-00DaIX-4h; Wed, 16 Mar 2022 15:33:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUVcR-00DZWc-1D
 for linux-mediatek@lists.infradead.org; Wed, 16 Mar 2022 15:31:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 43C79616D5;
 Wed, 16 Mar 2022 15:31:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C7BC340F3;
 Wed, 16 Mar 2022 15:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1647444680;
 bh=9ctp6RO64kNLGedDE5QkD08/qc84M9aO0xsGgkUdehw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rbdgDUxuV20gBW39s5SKCt2nvq2SBNoQ4CZ8CvVauZuAhkOH6ykjfmVUJyK5lT2sS
 siH4lKCSC6pZY+c4rM2Cuf4+hXJA4gGUXrs7LdePLkGUS7LorSIXrgxrWUAeEFAtEH
 gN7mqVQsnmO3N3HccK2YMl4GaQmAThBpy0U5x/ZM=
Date: Wed, 16 Mar 2022 16:31:17 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Waiman Long <longman@redhat.com>
Cc: Cheng Jui Wang <cheng-jui.wang@mediatek.com>, stable@vger.kernel.org,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Bart Van Assche <bvanassche@acm.org>, linux-mediatek@lists.infradead.org,
 Eason-YH Lin <eason-yh.lin@mediatek.com>
Subject: Re: apply commit 61cc4534b655 ("locking/lockdep: Avoid potential
 access of invalid memory in lock_class") to linux-5.4-stable
Message-ID: <YjICxcNVK+1VBNtz@kroah.com>
References: <6eb2052f463d323b0a82e795d765afb9d5925f6e.camel@mediatek.com>
 <YjHzl3Arey7KH0CB@kroah.com>
 <ee1e2ab4-c498-c047-ad70-fc46b508fe74@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ee1e2ab4-c498-c047-ad70-fc46b508fe74@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_083123_141468_B845AA09 
X-CRM114-Status: GOOD (  19.27  )
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

On Wed, Mar 16, 2022 at 10:38:04AM -0400, Waiman Long wrote:
> On 3/16/22 10:26, Greg KH wrote:
> > On Wed, Mar 16, 2022 at 02:01:12PM +0800, Cheng Jui Wang wrote:
> > > Hi Reviewers,
> > > 
> > > This patch fixes a use-after-free error when /proc/lockdep is read by
> > > user after a lockdep splat.
> > > 
> > > I checked and I think this patch can be applied to stable-5.4 and
> > > later.
> > > 
> > > commit: 61cc4534b6550997c97a03759ab46b29d44c0017
> > > Subject: locking/lockdep: Avoid potential access of invalid memory in
> > > lock_class
> > I do not see that commit id in Linus's tree, are you sure it is correct?
> 
> This commit is currently in the tip tree. It have not been merged into the
> mainline yet, though it should happen in the upcoming merge window.

As per the stable kernel rules, the commit has to be in Linus's tree
first.  Please email us again when that has happened.

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

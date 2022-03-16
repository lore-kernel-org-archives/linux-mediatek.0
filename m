Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C966C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 14:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gn1Mw/sIQEod1CdYmTPD6XOqHTAPEPh3IzuEkRkQeP0=; b=FFIu5E7bs+mWze
	ZIfEH20ovDoagAt1IqTzKSk4Lgh03Vc0eSoyqWui6rW4PpLkZtF7nK6ImYrh8QzL2dk7JlXGWXGAl
	Lp0rqjnJ+tMxyfGu76VhaJINaZNaJfnlihfspi3Nb/YDGcEgCffiA0aHO98RrnjPOMk6LXxYvIt03
	b/WST555Rpr7+/eBI8IQYntUzvFQq1qX6muL2lRuFanp6CE3JF4etl1r6Z0GK/2fTq9/UnOHJcyKz
	JdBTm8dug1mCRm4UhGzbqpPTeVn0a8S6W8V/wds+GFnIpFKdfD9UlAfpYGJxzj92i/rg/cJeH8zSl
	a/E1JOm5ETYJ1HebkSKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUUbm-00DGNL-J3; Wed, 16 Mar 2022 14:26:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUUbk-00DGMV-2q
 for linux-mediatek@lists.infradead.org; Wed, 16 Mar 2022 14:26:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E09C261521;
 Wed, 16 Mar 2022 14:26:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9733C340E9;
 Wed, 16 Mar 2022 14:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1647440794;
 bh=JW6d5LJkYtWBuryX3EDJNepPYt1eYaCSXr2vEEtyRCQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C3BiPtAKtITlMJ3sNAkXDmllp06sGntMD9bba5DAnLXPCXEBaIbZbv0+cL0EkfBfh
 EtyO0j6TLOIkwilTuMOlU2zliSuJJe+7Ni/jSI8BKo772pjkhzdhOabeNs6nyKjEjw
 BlOQyQXtrSoF4xKLPgz7jQjnZn9rIfMvh6tn96fo=
Date: Wed, 16 Mar 2022 15:26:31 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Cheng Jui Wang <cheng-jui.wang@mediatek.com>
Cc: stable@vger.kernel.org, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Waiman Long <longman@redhat.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Bart Van Assche <bvanassche@acm.org>, linux-mediatek@lists.infradead.org,
 Eason-YH Lin <eason-yh.lin@mediatek.com>
Subject: Re: apply commit 61cc4534b655 ("locking/lockdep: Avoid potential
 access of invalid memory in lock_class") to linux-5.4-stable
Message-ID: <YjHzl3Arey7KH0CB@kroah.com>
References: <6eb2052f463d323b0a82e795d765afb9d5925f6e.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6eb2052f463d323b0a82e795d765afb9d5925f6e.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_072636_206167_E504415A 
X-CRM114-Status: GOOD (  11.92  )
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

On Wed, Mar 16, 2022 at 02:01:12PM +0800, Cheng Jui Wang wrote:
> Hi Reviewers,
> 
> This patch fixes a use-after-free error when /proc/lockdep is read by
> user after a lockdep splat.
> 
> I checked and I think this patch can be applied to stable-5.4 and
> later. 
> 
> commit: 61cc4534b6550997c97a03759ab46b29d44c0017
> Subject: locking/lockdep: Avoid potential access of invalid memory in
> lock_class

I do not see that commit id in Linus's tree, are you sure it is correct?

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F979C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 14:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M2LYgQ296kg/RH6W3fIC6pr10effDhjfmZ1ndeeFTGQ=; b=RTAM7DkXpRju0Y
	2/RZ4Qgc3IZTz6vAsZbp18LTxSoTxVklg3QWz+hX0XMtScf0ZdmSOEAeUKrEOsnW4EPEiaqk4tZL9
	zo0sIyteclf+H4dN828ifHyn/dx4P0qg9f+L8z8+qKx8OYPVxNPtjEz5XND4ynsFGfbzoGUOr4E5W
	FAzZp23Ee249TybnQ4ZxnR0hegCJstMy/pm6CM302MCaar0MMEM2E3o4XUqvdf+27DlN7pWxY82RG
	PX3+6NgEKD2b0Q2biZPk+UoGrJUkWOo4TJ3VgkVl4m9bNh8zd6HkC+9CEPPsdj0l8/BxPbWLb+Wbq
	r6rTod9lh9t523zfT92g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUUgH-00DGvB-BU; Wed, 16 Mar 2022 14:31:17 +0000
Received: from www262.sakura.ne.jp ([202.181.97.72])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUUgE-00DGt3-Pb
 for linux-mediatek@lists.infradead.org; Wed, 16 Mar 2022 14:31:16 +0000
Received: from fsav115.sakura.ne.jp (fsav115.sakura.ne.jp [27.133.134.242])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 22GEUxXM013765;
 Wed, 16 Mar 2022 23:30:59 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav115.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav115.sakura.ne.jp);
 Wed, 16 Mar 2022 23:30:59 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav115.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 22GEUwhw013760
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 16 Mar 2022 23:30:58 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <fc88e012-ff4b-8746-5f9d-d60018ff88a8@I-love.SAKURA.ne.jp>
Date: Wed, 16 Mar 2022 23:30:57 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: apply commit 61cc4534b655 ("locking/lockdep: Avoid potential
 access of invalid memory in lock_class") to linux-5.4-stable
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>,
 Cheng Jui Wang <cheng-jui.wang@mediatek.com>
Cc: stable@vger.kernel.org, Waiman Long <longman@redhat.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Bart Van Assche <bvanassche@acm.org>, linux-mediatek@lists.infradead.org,
 Eason-YH Lin <eason-yh.lin@mediatek.com>
References: <6eb2052f463d323b0a82e795d765afb9d5925f6e.camel@mediatek.com>
 <YjHzl3Arey7KH0CB@kroah.com>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <YjHzl3Arey7KH0CB@kroah.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_073115_099422_6B386746 
X-CRM114-Status: UNSURE (   8.73  )
X-CRM114-Notice: Please train this message.
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

On 2022/03/16 23:26, Greg KH wrote:
> On Wed, Mar 16, 2022 at 02:01:12PM +0800, Cheng Jui Wang wrote:
>> Hi Reviewers,
>>
>> This patch fixes a use-after-free error when /proc/lockdep is read by
>> user after a lockdep splat.
>>
>> I checked and I think this patch can be applied to stable-5.4 and
>> later. 
>>
>> commit: 61cc4534b6550997c97a03759ab46b29d44c0017
>> Subject: locking/lockdep: Avoid potential access of invalid memory in
>> lock_class
> 
> I do not see that commit id in Linus's tree, are you sure it is correct?

It is in linux-next.git, and will be sent to linux.git when next merge window opens.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

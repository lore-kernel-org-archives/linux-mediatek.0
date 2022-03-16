Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA10C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 14:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A5VUpbPBL912Mk0zvD2gfF1eJA1L2MWGMBQnZoeL7J8=; b=Z80Rdg8gI2zLKs
	OfvCdttplgF2f6sc33jueOxt5hty15HKLXyMGztApfuiGmSr5jpIi78kN0ctFKp8tJHz8+s8m+EB0
	3uniFt8LXvHw9qbtL32WPSjdI1JeO91t7ZIHOwxlEIErBV0OZfnqFb9mFVW+/Fkwl1uXVVgoo/mdE
	i6gk6WvybaIXEhGy8AfBIG28XXFImPLrYsCtfpA8n0mulmT3ERGeWs96MEIsAH/RATwSLqiKuw4L0
	JdGbpdkdHXt99TgBGSDtppSZD6zg+gwbicn9L8k0zvxusTpyvxS6W+OzeQreGUzPr+XU5Tx66D8K7
	inon71meZkKWh1It+Hrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUUn0-00DIDJ-B7; Wed, 16 Mar 2022 14:38:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUUmx-00DIB7-6B
 for linux-mediatek@lists.infradead.org; Wed, 16 Mar 2022 14:38:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647441489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4pZBLggxKdz4L37gBgUJARXj4G+el7mKfdePMsD8X+U=;
 b=S17u8BiFJV3/ZmxJhrPx3Ud2stE87JeczjD1D3QvKrChoPn3pbB8g/qSAQvwRqan+WsLbX
 ZBxv2upY9T3IyAMkhrslFPOl7HfOzOujhnpulJFceSu4eSg6rpizu6CStOdaMcvDpjubkq
 X+KW6eCjkaqRxuI67DQKdQXeptu39zc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-m5rIbwTQNDeiO5ku6RDWHA-1; Wed, 16 Mar 2022 10:38:06 -0400
X-MC-Unique: m5rIbwTQNDeiO5ku6RDWHA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 982AE85A5BE;
 Wed, 16 Mar 2022 14:38:05 +0000 (UTC)
Received: from [10.18.17.215] (dhcp-17-215.bos.redhat.com [10.18.17.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 224F9432470;
 Wed, 16 Mar 2022 14:38:04 +0000 (UTC)
Message-ID: <ee1e2ab4-c498-c047-ad70-fc46b508fe74@redhat.com>
Date: Wed, 16 Mar 2022 10:38:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: apply commit 61cc4534b655 ("locking/lockdep: Avoid potential
 access of invalid memory in lock_class") to linux-5.4-stable
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>,
 Cheng Jui Wang <cheng-jui.wang@mediatek.com>
Cc: stable@vger.kernel.org, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Bart Van Assche <bvanassche@acm.org>, linux-mediatek@lists.infradead.org,
 Eason-YH Lin <eason-yh.lin@mediatek.com>
References: <6eb2052f463d323b0a82e795d765afb9d5925f6e.camel@mediatek.com>
 <YjHzl3Arey7KH0CB@kroah.com>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <YjHzl3Arey7KH0CB@kroah.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_073811_349801_06C3745E 
X-CRM114-Status: GOOD (  16.26  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 3/16/22 10:26, Greg KH wrote:
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
> I do not see that commit id in Linus's tree, are you sure it is correct?

This commit is currently in the tip tree. It have not been merged into 
the mainline yet, though it should happen in the upcoming merge window.

Cheers,
Longman


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

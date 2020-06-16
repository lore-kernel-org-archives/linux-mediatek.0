Return-Path: <SRS0=8HgB=75=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C39F7C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 15:05:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D22A208B3
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 15:05:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W1DF+DQB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FAbEstMs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D22A208B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4wJGqyTauOrXPVovLNiHOqiFOtY0WAbp794rnQLwao4=; b=W1DF+DQBZwDjlHSnux39LfONY
	aNkmQ+VxpdM2tYM/nHinNQcl35dQgd3ChVPUjHtdNgrurGtqhfe/ZHqwfgFWtqgYM7U6RvD7UhTQ3
	NIABWD5+pWVhXyo7Bx2oaYuFeef5SYTwZKckuBndBRzQ6NDOZji3vgGhINUjYBGiyGeMbi+Kzk5pn
	EbMuVEJRFiW1D+5c1r7AfKYSnzLwxi5tpKWekfWgC55w0uoZf/hTjmLmUBGjxv9pAayhlwPH6laoT
	wijUZte20Dt7fkPhsrwoJgDy+L1fPLouL9Jd5VZZZ8FCcnHpj8Bzv02miMStTAkSk83Dtzkobnh68
	KNSyIKdMg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlD9i-0001Fg-UY; Tue, 16 Jun 2020 15:05:42 +0000
Received: from us-smtp-1.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlD9e-0001BU-F8
 for linux-mediatek@lists.infradead.org; Tue, 16 Jun 2020 15:05:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592319937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rXbjvJPZU9GzTq8LOO4SZ69J1AJAOxGiWdFnkvpgDCI=;
 b=FAbEstMs3xNUM3t1yfX5UtZTgC3pSh4qVfuzlekNVI4lvRatJ7Fo3pHxaXB2bIaLlrABo1
 1S4v+sg1QE/6izZf2ZcYzbaRykbu8FofG5u4fG+7DobGPkPpmFEK4Xwkmq66sWDLQBvUF5
 WVOV1UJcYpPt93PA4AkREzK5JBm45YY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-rhm5WjahMFKJc8Xm5_1I2g-1; Tue, 16 Jun 2020 11:05:32 -0400
X-MC-Unique: rhm5WjahMFKJc8Xm5_1I2g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B20C100CCC9;
 Tue, 16 Jun 2020 15:05:27 +0000 (UTC)
Received: from llong.remote.csb (ovpn-114-156.rdu2.redhat.com [10.10.114.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 897CF7890A;
 Tue, 16 Jun 2020 15:05:22 +0000 (UTC)
Subject: Re: [PATCH v4 3/3] btrfs: Use kfree() in btrfs_ioctl_get_subvol_info()
To: dsterba@suse.cz, Andrew Morton <akpm@linux-foundation.org>,
 David Howells <dhowells@redhat.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Joe Perches
 <joe@perches.com>, Matthew Wilcox <willy@infradead.org>,
 David Rientjes <rientjes@google.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>, linux-mm@kvack.org,
 keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 virtualization@lists.linux-foundation.org, netdev@vger.kernel.org,
 linux-ppp@vger.kernel.org, wireguard@lists.zx2c4.com,
 linux-wireless@vger.kernel.org, devel@driverdev.osuosl.org,
 linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, ecryptfs@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-bluetooth@vger.kernel.org,
 linux-wpan@vger.kernel.org, linux-sctp@vger.kernel.org,
 linux-nfs@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org
References: <20200616015718.7812-1-longman@redhat.com>
 <20200616015718.7812-4-longman@redhat.com>
 <20200616144804.GD27795@twin.jikos.cz>
From: Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <75152002-5f02-04b6-a811-29ef79961e0b@redhat.com>
Date: Tue, 16 Jun 2020 11:05:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200616144804.GD27795@twin.jikos.cz>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_080538_594437_17778667 
X-CRM114-Status: GOOD (  18.69  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 6/16/20 10:48 AM, David Sterba wrote:
> On Mon, Jun 15, 2020 at 09:57:18PM -0400, Waiman Long wrote:
>> In btrfs_ioctl_get_subvol_info(), there is a classic case where kzalloc()
>> was incorrectly paired with kzfree(). According to David Sterba, there
>> isn't any sensitive information in the subvol_info that needs to be
>> cleared before freeing. So kfree_sensitive() isn't really needed,
>> use kfree() instead.
>>
>> Reported-by: David Sterba <dsterba@suse.cz>
>> Signed-off-by: Waiman Long <longman@redhat.com>
>> ---
>>   fs/btrfs/ioctl.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/fs/btrfs/ioctl.c b/fs/btrfs/ioctl.c
>> index f1dd9e4271e9..e8f7c5f00894 100644
>> --- a/fs/btrfs/ioctl.c
>> +++ b/fs/btrfs/ioctl.c
>> @@ -2692,7 +2692,7 @@ static int btrfs_ioctl_get_subvol_info(struct file *file, void __user *argp)
>>   	btrfs_put_root(root);
>>   out_free:
>>   	btrfs_free_path(path);
>> -	kfree_sensitive(subvol_info);
>> +	kfree(subvol_info);
> I would rather merge a patch doing to kzfree -> kfree instead of doing
> the middle step to switch it to kfree_sensitive. If it would help
> integration of your patchset I can push it to the next rc so there are
> no kzfree left in the btrfs code. Treewide change like that can take
> time so it would be one less problem to care about for you.
>
Sure, I will move it forward in the patch series.

Thanks,
Longman


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

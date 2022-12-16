Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC9DC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 06:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GtQlmlT1y0KgYEtwMy/vlD0VpGRuWCtEVuBZXK4US04=; b=W6FXjiigoedeMVr4kBBgfTvigI
	u2yjPB/qncPbHRrOo3xqJTnyrbt3I1jCDKkXw6yvJIDjYIMqvArhhLczQYMaX48fIa7qvC4rLBjsK
	tqCYZF/oIfcYN9NUg7H+5rLhIqNdc62IMThyaOWCqcmgbV0OqPKxEIz7YJ9VUKGOP6g9+kEiFQNdZ
	Nrq8pth379n4f0B+XLncs2eBLnKlUrZzsFutBvwKfICPwCG18EBJGqIVSUH0tw2EPJLzJPXAPbfic
	4Txp2xaWCpTTYD4Y13vSM9Hea7deIO9CfLbwVIZif7W2frNy/UCB5T9Bf/wxxnLdHK/ac3aQf3bS0
	X2SaLDhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p64Vz-00DFIa-57; Fri, 16 Dec 2022 06:48:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p64Vo-00DFFx-3m; Fri, 16 Dec 2022 06:48:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 25F0861FFE;
	Fri, 16 Dec 2022 06:48:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 114FEC433F0;
	Fri, 16 Dec 2022 06:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1671173279;
	bh=kAqsVB3oihvjgTUI7ow48/owy2I4GzQsj5y+MgkdybU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q4BEd4DRItkkO3hXpMe28ILEhCOysyPAaFsr6+G1xa/BcInJ7dHMKWWuRpIggj8b5
	 7OR/0E4y7BLGDkSZlyPzqxDJVqFPL9+3VlTmJZoegWWUumBZtx/ti3mq1gkkxp91mz
	 QviIveUhg5xB+153cx7xPOfK5fKrBmrcJQJKJWLI=
Date: Fri, 16 Dec 2022 07:47:56 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Alice Chao <alice.chao@mediatek.com>
Cc: rafael@kernel.org, matthias.bgg@gmail.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, stanley.chu@mediatek.com,
	peter.wang@mediatek.com, chun-hung.wu@mediatek.com,
	powen.kao@mediatek.com, naomi.chu@mediatek.com,
	cc.chou@mediatek.com, chaotian.jing@mediatek.com,
	jiajie.hao@mediatek.com, qilin.tan@mediatek.com,
	lin.gui@mediatek.com, yanxu.wei@mediatek.com,
	tun-yu.yu@mediatek.com, eddie.huang@mediatek.com,
	wsd_upstream@mediatek.com
Subject: Re: [PATCH 1/1] scsi: Add length check to prevent invalid memory
 access
Message-ID: <Y5wUnF0I+zo6TXcZ@kroah.com>
References: <20221216031320.2634-1-alice.chao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221216031320.2634-1-alice.chao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_224804_256742_6D22ABE8 
X-CRM114-Status: GOOD (  24.90  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Dec 16, 2022 at 11:13:22AM +0800, Alice Chao wrote:
> Device reset thread uses kobject_uevent_env() to get kobj.parent(kobj.p)
> , and it races with device init thread which calls device_add() to add
> kobj.parent before kobject_uevent_env().

Note, "scsi" in the subject line is wrong, this should be "kobject",
right?

> 
> Device init call:           Device reset call:
> scsi_probe_and_add_lun()    scsi_evt_thread()

Shouldn't the scsi layer be protecting these from happening at the same
time?  Or some other bus lock?

>   scsi_add_lun()             scsi_evt_emit()
>    scsi_sysfs_add_sdev()      kobject_uevent_env() //get kobj.parent
>     scsi_target_add()           kobject_get_path()
>                                  len = get_kobj_path_length ()
>                                  //len=1 because parent hasn't created yet

Wait, how can the parent be gone if it has not been added yet?  A parent
should always be present, a device can not be there if it did not have a
parent already.

>     device_add() // add kobj.parent
>       kobject_uevent_env()
>        kobject_get_path()         path = kzalloc()
>         fill_kobj_path()           fill_kobj_path()
>                             // --length; length -= cur is a negative value
>                          memcpy(path + length, kobject_name(parent), cur);
>                          // slab OOB!
> 
> Above backtrace describes the problem, device reset thread will get wrong
> kobj.parent when device init thread didn't add kobj/parent yet. When this
> racing happened, it triggers the a KASAN dump on the final iteration:
> 
> BUG: KASAN: slab-out-of-bounds in kobject_get_path+0xf8/0x1b8
> Write of size 11 at addr ffffff80d6bb94f5 by task kworker/3:1/58
> <snip>
> 
> Call trace:
>  __kasan_report+0x124/0x1c8
>  kasan_report+0x54/0x84
>  kasan_check_range+0x200/0x208
>  memcpy+0xb8/0xf0
>  kobject_get_path+0xf8/0x1b8
>  kobject_uevent_env+0x228/0xa88
>  scsi_evt_thread+0x2d0/0x5b0
>  process_one_work+0x570/0xf94
>  worker_thread+0x7cc/0xf80
>  kthread+0x2c4/0x388
> 
> These two jobs are scheduled asynchronously, we can't guaranteed that
> kobj.parent will be created in device init thread before device reset
> thread calls kobject_get_path().

Again, a parent should always be there, how is that happening?

> To prevent length -= cur from being a negative value, we add length
> check in fill_kobj_path() to prevent invalid memory access.
> 
> Signed-off-by: Alice Chao <alice.chao@mediatek.com>
> ---
>  lib/kobject.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/lib/kobject.c b/lib/kobject.c
> index af1f5f2954d4..3cccb8e88d4e 100644
> --- a/lib/kobject.c
> +++ b/lib/kobject.c
> @@ -121,6 +121,10 @@ static void fill_kobj_path(struct kobject *kobj, char *path, int length)
>  		int cur = strlen(kobject_name(parent));
>  		/* back up enough to print this name with '/' */
>  		length -= cur;
> +
> +		if (length <= 0)
> +			break;

Shouldn't you just check for cur == 0 here instead?

But again, how can we have a parent with no name?

thanks,

greg k-h


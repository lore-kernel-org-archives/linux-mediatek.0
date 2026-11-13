Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC3F606A335
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 15:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TQQxkIFB;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MYa4/DHX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Subject:CC:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Unsubscribe-Post:
	List-Owner; bh=aQ8Z58R/hTyFw2ouZE/gUSOiBop//SC/eqGEGwGnljo=; b=TQQxkIFBmBDonJ
	bZfszMluQV/2MZnsFVdjTn/LoRWaPQXI54mvTs+7sAdBV66yWjHiHhORWmsM8fNZ2yIEltCadfbWm
	wKYfugUWQoAjJYxNG6YKM2BuB9yU36hUkd+mNHuqgoTyOULl/KylXVqo8wC66HKrbuQAVw9LQ54ni
	OInpBxpg8xRVcVjGrAVxTEF1JVi1prIpuL5Ggg74BiSsjxHZ9qXT93mdeDRYGashrF0z/AjM41rn1
	1WyDXAPT20CLND+fVVKAV1EdhDAw7vnAH2trQIZEQhyXS1TedUcVHa+cNPmE93DeeQ3LVN8icsDj1
	diwXn0EJJYMJPJ8TKMpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtYW-0000000DSOH-32YH;
	Fri, 13 Nov 2026 15:51:12 +0000
Received: from out-40.mta0.migadu.com ([2001:41d0:1004:224b::28] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtYT-0000000DSLc-2ceG
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Nov 2026 15:51:11 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=A/AmnZWEYWikBqc5eV8eYfvyQwT7TRZgxe3Vx14+ezA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794585065; v=1; x=1795189865;
 b=MYa4/DHX+qGhqVZTthTQbCTyT+/r5F05PjaJQrQBkv7WZYhf9xZSXpGNF/hMq5AvZDN9coi1
 DzaMFuJ/Kz1xmjVfWsSaPN7MJ3AeucmiIdEAtPQQ6YohlZxgzmY1Mhn2seeJzmtreYqS7SBzgYE
 Wthp4yHghqfKb6gDSwyczsl0=
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id af9b908daa4435a9;
	Fri, 13 Nov 2026 15:51:05 +0000
X-Mizu-Trace-ID: af9b908daa4435a9
X-Migadu-Flow: FLOW_OUT
Date: Fri, 13 Nov 2026 15:51:01 +0000
From: Bradley Morgan <bradley.morgan@linux.dev>
To: leitao@debian.org
CC: akpm@linux-foundation.org, angelogioacchino.delregno@collabora.com,
 ebiederm@xmission.com, kernel-team@meta.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 npiggin@gmail.com, oleg@redhat.com, peterz@infradead.org,
 stable@vger.kernel.org,
 syzbot+8fdf0d8e10bdde1c2e88@syzkaller.appspotmail.com
Subject: Re: [PATCH] reboot: halt when power off fails
In-Reply-To: <avWGu4l_nXP_eFyh@gmail.com>
Message-ID: <2D88DE92-A563-41B0-AB0B-5F9EA5CE3EF4@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_075109_860946_1E50F425 
X-CRM114-Status: GOOD (  10.36  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 12 November 2026 09:33:22 GMT, Breno Leitao <leitao@debian.org> wrote:
>On Wed, Nov 11, 2026 at 09:02:38PM +0100, Oleg Nesterov wrote:
>> On 11/10, Breno Leitao wrote:
>> >
>> > --- a/kernel/reboot.c
>> > +++ b/kernel/reboot.c
>> > @@ -791,6 +791,9 @@ SYSCALL_DEFINE4(reboot, int, magic1, int, magic2,
>unsigned int, cmd,
>> >
>> >  	case LINUX_REBOOT_CMD_POWER_OFF:
>> >  		kernel_power_off();
>> > +		pr_emerg("Power off failed: System halted instead\n");
>> > +		/* kernel_power_off() already ran the shutdown, only halt. */
>> > +		machine_halt();
>> 
>> Agreed. Even if I don't think my ack has any value in this area:
>
>Thanks, Oleg.
>
>I tried to find out who merges changes to this file and it is not clear.
>akpm seems to be the closest, as most of the changes went through him,
>and somehow he was not CCed here. :-|
>
>Andrew, would you be willing to take this one?

No maintainer, Andrew merges.

I tried asking to be one, no avail, whatever.

>
>thanks,
>--breno
>
>

--- Thanks!


Return-Path: <SRS0=yOeO=IO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FB3DC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 17:57:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAB1765104
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 17:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAB1765104
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=krbGz50kRyUQyCZcVdK7s4uHSI0/n6sJzWPy8fzUoUE=; b=ajUj6VfQfPVsova6tIpInycIS
	l77e1FXbTKVC1yDmYezBSwPlw1SxFYsBSBUgwGMYa6VVP9Caq6ExtpBzu9csthCYZOCrj2/PLzQ1q
	QXdBjKtR7qIIDa24Rma4jdGvDrPO1q6hnLXdGojXlIAyMPUwcuruxXVgPpsQ4959GZmxoIl7jQmgw
	UB18g79lZCiM8zITe+PGyPUy8/LvLMmANYHb8G74Wdjt24l+pwiQaNk/4s3OkFLo5ZrzJnG+MP0qe
	9vz9bIiWEbK2VPUeEMCGh/s/D04TreB+f4HhSmH7D8OM0Rf9U3oKGSR5HbagY7u71EvpFuBeAXtLy
	jf0aq7msQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMDwm-001Uk6-62; Tue, 16 Mar 2021 17:57:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMDuR-001TnP-Au
 for linux-mediatek@lists.infradead.org; Tue, 16 Mar 2021 17:55:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615917308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=et+8M4fnfpbY0GeGG05MXy/pGLb3+RZRFKGCfdaC3Sc=;
 b=dDdCp/GZFW486vc8fohByMJT6zDl1PnwOB+UBwzrtNgpcvC15SQqkSc9aVEadO1t2GgfWN
 grL1qNLA/H286oZWGz8yHpsnGR0Oz4JJ57yP2M66MOwafgfS7et9YTG0pNzb57luu0iIrZ
 LgYwnDg+zVBMKOKbmINntiSHVGZdiAs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-X_-hKvDyOCOief-DATOHdQ-1; Tue, 16 Mar 2021 13:55:03 -0400
X-MC-Unique: X_-hKvDyOCOief-DATOHdQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E413760C7;
 Tue, 16 Mar 2021 17:55:01 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.40.192.135])
 by smtp.corp.redhat.com (Postfix) with SMTP id 744255D9C0;
 Tue, 16 Mar 2021 17:54:57 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
 oleg@redhat.com; Tue, 16 Mar 2021 18:55:00 +0100 (CET)
Date: Tue, 16 Mar 2021 18:54:56 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Walter Wu <walter-zh.wu@mediatek.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jens Axboe <axboe@kernel.dk>, kasan-dev@googlegroups.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 wsd_upstream <wsd_upstream@mediatek.com>,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] task_work: kasan: record task_work_add() call stack
Message-ID: <20210316175455.GA25881@redhat.com>
References: <20210316024410.19967-1-walter-zh.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210316024410.19967-1-walter-zh.wu@mediatek.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_175511_852672_DB8C9261 
X-CRM114-Status: GOOD (  11.68  )
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

On 03/16, Walter Wu wrote:
>
> --- a/kernel/task_work.c
> +++ b/kernel/task_work.c
> @@ -34,6 +34,9 @@ int task_work_add(struct task_struct *task, struct callback_head *work,
>  {
>  	struct callback_head *head;
>
> +	/* record the work call stack in order to print it in KASAN reports */
> +	kasan_record_aux_stack(work);
> +
>  	do {
>  		head = READ_ONCE(task->task_works);
>  		if (unlikely(head == &work_exited))

Acked-by: Oleg Nesterov <oleg@redhat.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

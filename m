Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D50BC46CA0
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Nov 2023 12:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KWNuo6JI/OYsTU4e3seiEKnPSTG4IX85SKhKR7+RBiE=; b=W0BluZNTEV5jPMDGtGW3xpUi1F
	sJ2K51aqdsqoOF6h+Al0Ey5dXDMR6AGjlyqKnZmiHM8w6/IFwIVHSRftwSIRlvfphFMg7MfO5/wAO
	3dzhj+/55ehIVa8aR78oFv1au17KWqqIycXKfFMrTsFHnr8z+xD0Br316Z0c/XIWZ+IdUhQdqTmm9
	RZNdRQDpVhcmqHUfUp1oxtcJLcq2rWlWRYTVc65+ZpR+QglRS7EYC55soK6aqIix1dsHGWbA/hc91
	hQJqvSU3hVUD0FAy16uWdTJGTfoXX2jzm+q1/pmzXLt7Xo2ptIxGkDL+J9qLQK03lsuNSzsXtUqM+
	BorOj2Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7aLq-002Ph7-1Y;
	Mon, 27 Nov 2023 12:04:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7aLo-002Pfw-0I
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Nov 2023 12:04:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701086670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KWNuo6JI/OYsTU4e3seiEKnPSTG4IX85SKhKR7+RBiE=;
	b=X303t8RWRD6Ef9FW5lKv1VXRrvQWOlwYymHyRWhtweiOWSOu7RhQjHZjlnKpn75pGB5tP7
	8ke551oyxYjOt/yU2H12J1BusCe0x7y1H9t4eaY6FC35kWF9sijVF3P6rwChPEs9LwUvDh
	0Zw4ZNux1FlnfECc9pg7Ozaf2ZT7nNg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-nDYczEEeP4yMToRKl1A7GQ-1; Mon, 27 Nov 2023 07:04:24 -0500
X-MC-Unique: nDYczEEeP4yMToRKl1A7GQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B767085C1A0;
	Mon, 27 Nov 2023 12:04:23 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.14])
	by smtp.corp.redhat.com (Postfix) with SMTP id 731645028;
	Mon, 27 Nov 2023 12:04:20 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Mon, 27 Nov 2023 13:03:18 +0100 (CET)
Date: Mon, 27 Nov 2023 13:03:14 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andrew Morton <akpm@linux-foundation.org>, casper.li@mediatek.com,
	chinwen.chang@mediatek.com, qun-wei.lin@mediatek.com,
	linux-mm@kvack.org, stable@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] scripts/gdb/tasks: Fix lx-ps command error
Message-ID: <20231127120314.GA19669@redhat.com>
References: <20231127070404.4192-1-Kuan-Ying.Lee@mediatek.com>
 <20231127070404.4192-2-Kuan-Ying.Lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231127070404.4192-2-Kuan-Ying.Lee@mediatek.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_040432_216609_3F46F8E3 
X-CRM114-Status: GOOD (  11.17  )
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

On 11/27, Kuan-Ying Lee wrote:
>
> @@ -25,13 +25,9 @@ def task_lists():
>      t = g = init_task
>  
>      while True:
> -        while True:
> -            yield t
> -
> -            t = utils.container_of(t['thread_group']['next'],
> -                                   task_ptr_type, "thread_group")
> -            if t == g:
> -                break
> +        thread_head = t['signal']['thread_head']
> +        for thread in lists.list_for_each_entry(thread_head, task_ptr_type, 'thread_node'):
> +            yield thread
>  
>          t = g = utils.container_of(g['tasks']['next'],
>                                     task_ptr_type, "tasks")

Thanks!

I do not know python, but it seems that with this patch we can kill g or t?
Can't

	def task_lists():
	    task_ptr_type = task_type.get_type().pointer()
	    init_task = gdb.parse_and_eval("init_task").address
	    t = init_task

	    while True:
		thread_head = t['signal']['thread_head']
		for thread in lists.list_for_each_entry(thread_head, task_ptr_type, 'thread_node'):
		    yield thread

		t = utils.container_of(t['tasks']['next'],
				       task_ptr_type, "tasks")
		if t == init_task:
		    return

work?

Oleg.



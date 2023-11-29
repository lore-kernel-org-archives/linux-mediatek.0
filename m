Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76214C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 08:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3TpNdnOe4L/8E2ZYsFFxMsmTtg8QSbXt5NgPNPOgE34=; b=TqlDb59jQvh60n0OsbyFViVhvx
	86EeZFbjWbhO388HQ3iklmHY3b3lxd9wbkyLjAfboyZ+5xwf3GJCXvuTSF00STg/7H2DciMIgbthW
	UyV0MUw40g9HSagRzqrvwL2d1OVHmqu5QaDYdQ4pkSujDBvYdLQ4teTvHsN/FpQVk6zsJPFEzq1Bx
	FSlZ0XPDZwE1q/m1hFUHLJ+xFBvgaWvv7KHsMnDH5b4GF5wIR9hakTy/kSQHBFNnSRJ3KHoUXymrs
	xjb2dmNoOwZPQnjETB98Tn2yBaIgKqIgMgTbw+Go66TLIJnsebPF04CTB6Ll6VlwyM3sp5cXmQNef
	74zirKJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8FfN-007Qjg-1J;
	Wed, 29 Nov 2023 08:11:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8FfK-007Qhq-16
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Nov 2023 08:11:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701245485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3TpNdnOe4L/8E2ZYsFFxMsmTtg8QSbXt5NgPNPOgE34=;
	b=Qw+tFeTg3jnuKsRFeW1QF94WZFWm88PFHFwSaUpopA9suWSjDpPwqk5jBZGFngO1/nAM1O
	qkM9mki3loKWmhhxNuXt8aFeGUZUgNYlkCwKmvgBTscIrZYLicPz2pN970Z1kwLEKgUfIY
	LfrImWMljksKyrQNk2Tgb3yGRngOvsA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-483-YJMkMR_vNOybQcjc5jCibQ-1; Wed, 29 Nov 2023 03:11:19 -0500
X-MC-Unique: YJMkMR_vNOybQcjc5jCibQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48F58185A781;
	Wed, 29 Nov 2023 08:11:18 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.14])
	by smtp.corp.redhat.com (Postfix) with SMTP id 56C6C492BFA;
	Wed, 29 Nov 2023 08:11:15 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Wed, 29 Nov 2023 09:10:13 +0100 (CET)
Date: Wed, 29 Nov 2023 09:10:09 +0100
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
Subject: Re: [PATCH v2 1/3] scripts/gdb/tasks: Fix lx-ps command error
Message-ID: <20231129081009.GF22743@redhat.com>
References: <20231129065142.13375-1-Kuan-Ying.Lee@mediatek.com>
 <20231129065142.13375-2-Kuan-Ying.Lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129065142.13375-2-Kuan-Ying.Lee@mediatek.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_001126_448854_EC086E72 
X-CRM114-Status: GOOD (  10.18  )
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

On 11/29, Kuan-Ying Lee wrote:
>
> Since commit 8e1f385104ac ("kill task_struct->thread_group") remove
> the thread_group, we will encounter below issue.
>
> (gdb) lx-ps
>       TASK          PID    COMM
> 0xffff800086503340   0   swapper/0
> Python Exception <class 'gdb.error'>: There is no member named thread_group.
> Error occurred in Python: There is no member named thread_group.
>
> We use signal->thread_head to iterate all threads instead.

Thanks again,

Acked-by: Oleg Nesterov <oleg@redhat.com>


> Fixes: 8e1f385104ac ("kill task_struct->thread_group")
> Cc: stable@vger.kernel.org

Is it possible to merge this simple change before v6.7 ?
Then "cc: stable" can be removed.

Oleg.



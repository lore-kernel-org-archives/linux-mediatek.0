Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED46EC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 15:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UQ0iU1zNXXHItcQAZLt/hJH5rcKmUiyz7DfyATd7/JM=; b=d6sZq5XeD38gSw
	83Ls/I3wZPZ6gpthr1H2OpYKOfudeMi3AnrDo+6AtB0709qb19sZHhJW28XO1/wGjdBb5+aUmZn9B
	2N/ilUQyiBZ8SjK8Pd7vhpfA2QUGkQfH9An1ecBVSBF3zugCtCJne5m9FujFIC0diwati6WNl+hFp
	1+3Lkh6Y5RJCZGFdWIHNNqDDg5IHiVHJbjWuzkHo5VSpo2yG4qkSKArJKCzdGpQhgMlUP6NOcTZqc
	dpswHb3/O5min61dTH6wuOdlK0u8pdeJEeGgU+I3AayimDBLAYiLk27jX/XYHRtNz8IC0Kt6/yLec
	m1OsQ6j2Iex619i/IMLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncqNq-000ETG-4U; Fri, 08 Apr 2022 15:18:46 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nccca-00ERdf-8c
 for linux-mediatek@lists.infradead.org; Fri, 08 Apr 2022 00:37:05 +0000
Received: by mail-yb1-xb29.google.com with SMTP id z33so12467211ybh.5
 for <linux-mediatek@lists.infradead.org>; Thu, 07 Apr 2022 17:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=1HcF8x3UIKiVVn/nUxJJBAAmWRasyyi8SHqMPG/VXOo=;
 b=oaMxNPsncnAcpTqjMOuO0KwQi4OT0SDBn7pfXGEpdMPaPrLYwKpBZBUYODAZSozbUB
 sxIKaUFbuU33BA2dzhhpejRMykt1RzGUGClcE2msSrrs2Jki6k7MAWCstFYW9FRlFpSv
 1Gq2pVdVXJ4AymSvGzwloiIO/8VW8a1mq9mA78pY6rWIw7DMc2pw6FhKoiGhrOD8k1DN
 owUWeoI1ArpIpiam8YpGd6rPRmQDd2Z6rM7ta/RnQsNhVcBNNohjucbWEzl3+vxsBsP6
 qpVwRmC1W97xbVHWYTEVYQceRg0jt0Y9/gqetveqpSbGOyckPoUOcQ/gS0TFX1dGhx01
 colQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=1HcF8x3UIKiVVn/nUxJJBAAmWRasyyi8SHqMPG/VXOo=;
 b=1tDf34WjRqP4Z0IfUkBQZdVJnxPKbmYgIjkDS2/o3kf5d4IG6WGezQbnF+LQKuSvN3
 CAvaShUFoNicT3LXF9SFImjJ9gkZl/NEVuNYiRW9MRQRlvQLLc/BMg4ZLRRTo39VmrSP
 MJUWTY56F3iey6oT12hSa6z6qya2eWrnGQdE0C1CaU4u1M+tUC+MEG4rBKA6VMdE6zqR
 Cs/dqFMGvXWFfEVs2uuE/gFSEXMtNvkAfPaDtO8eh68RhfCJKwR9ugnOoP/IKVsM1gho
 bQc6Av9gakxVIO+94L3lJDBS74N+N2j7atlRQtHtICDaq8RnBqBSVwcu0veg/uNkBkrm
 mCNQ==
X-Gm-Message-State: AOAM533yilwxqDiHxfZqL86MInzoF8MTtKVapfQtizO5OvSZAYkw04BV
 E1We4l0QlXGCAVr+CsiEZEE8ZGAB5502tPgAGSpg1g==
X-Google-Smtp-Source: ABdhPJzWsXMCj1cr1xBJojZihq5vS7dfcZikd6HI1JCDrpJQ8DPYyVnw3ZmLS5hYc+g9AjciEhkP1I+4TC/Qu7iRa8o=
X-Received: by 2002:a25:b991:0:b0:610:bf4e:1b33 with SMTP id
 r17-20020a25b991000000b00610bf4e1b33mr12978643ybg.352.1649378212045; Thu, 07
 Apr 2022 17:36:52 -0700 (PDT)
MIME-Version: 1.0
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 7 Apr 2022 17:36:16 -0700
Message-ID: <CAGETcx-tH0+WoqH6s=Zw6VSaHwFcBhvaJKLJRLHGtUEs+skCvQ@mail.gmail.com>
Subject: Re: [PATCH v2] printk: ringbuffer: Improve prb_next_seq() performance
To: pmladek@suse.com
Cc: Chunlei.wang@mediatek.com, john.ogness@linutronix.de, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 senozhatsky@chromium.org, Android Kernel Team <kernel-team@android.com>
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_173704_349917_1E2622BB 
X-CRM114-Status: UNSURE (   8.79  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Fri, 08 Apr 2022 08:18:44 -0700
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

> --- a/kernel/printk/printk_ringbuffer.h
> +++ b/kernel/printk/printk_ringbuffer.h
> @@ -75,6 +75,7 @@ struct prb_desc_ring {
>  struct printk_info *infos;
>  atomic_long_t head_id;
>  atomic_long_t tail_id;
> + atomic_long_t last_finalized_id;

I really know nothing about this code, but while looking around
kernel/printk/ I noticed kernel/printk/printk.c has these lines in
log_buf_vmcoreinfo_setup().

        VMCOREINFO_STRUCT_SIZE(prb_desc_ring);
        VMCOREINFO_OFFSET(prb_desc_ring, count_bits);
        VMCOREINFO_OFFSET(prb_desc_ring, descs);
        VMCOREINFO_OFFSET(prb_desc_ring, infos);
        VMCOREINFO_OFFSET(prb_desc_ring, head_id);
        VMCOREINFO_OFFSET(prb_desc_ring, tail_id);

Would this header file change also require a change to that location?
Something like

        VMCOREINFO_OFFSET(prb_desc_ring, head_id);
        VMCOREINFO_OFFSET(prb_desc_ring, tail_id);
+        VMCOREINFO_OFFSET(prb_desc_ring, last_finalized_id);

-Saravana

> };
>
> /*
> @@ -258,6 +259,7 @@ static struct printk_ringbuffer name = { \
>  .infos = &_##name##_infos[0], \
>  .head_id = ATOMIC_INIT(DESC0_ID(descbits)), \
>  .tail_id = ATOMIC_INIT(DESC0_ID(descbits)), \
> + .last_finalized_id = ATOMIC_INIT(DESC0_ID(descbits)), \
>  }, \
>  .text_data_ring = { \
>  .size_bits = (avgtextbits) + (descbits), \

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

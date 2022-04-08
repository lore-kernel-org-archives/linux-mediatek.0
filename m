Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14CA4C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 00:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zs1WpWC8cq/wuPiIgL0FCboyv7Om8OaRFT90LxIA1Lo=; b=hbVuobwBBOzlN2
	18LQVQ/rjg9F0W9tvT/pM9TV1FycXHCx+B3r/pRjJc7Q/BkKTzYABpKlwjTFXdsoFapRTzoJu3Jat
	s/NHZpHyA+VUZaXgx1WslKixK7vrjFup7evSk401KDVJwkgzAFGIXpwbR20NreAfKjYGf0Y1ziNZR
	L1n5ihBS2MS8f91FPa1rKQrzio4fZcPm3b5CcfCKyPguQEqVs3pzfuiPhyq5QbcRP5PSQ2oo0PSGu
	yJiez8dEzMpWVZVb3fKOp2UDsiQgubObVR82KQUOVHrcrZdTdcBNf0M4WUAbqgiw+4lPLRIF/CYJB
	3YHpoiazUY7Yg1KU/UeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nccka-00ES8A-O2; Fri, 08 Apr 2022 00:45:20 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncckR-00ES5b-E6
 for linux-mediatek@lists.infradead.org; Fri, 08 Apr 2022 00:45:12 +0000
Received: by mail-yb1-xb30.google.com with SMTP id y133so3675835ybe.2
 for <linux-mediatek@lists.infradead.org>; Thu, 07 Apr 2022 17:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9o8sGMkfG1jeyFOXZpLH64iA8m+M6x0mckBPZB78tzo=;
 b=fxTAOs+GhjoaxPxbBlMf896vsg3DjAYfwRkWhqPKYkU/sU/QX3SYpF369qI8oRsdnW
 woLa1QozV/d9z0eC9L3JU/0A+aribrkLH4ztc8jw9lhQWMxS831uV9ppubc/d7bKXugU
 QyXyl7Jl58hSrjCPIAWBgqpbZSSFH9bXGL7Iv9NKhx2qKgbkgNI8CS8difiT5eT+VRON
 ENZErFFpoqSvrsSZLFYAYlYR+kSB6/W3/6XL2Yqs/xTN9Wxgv3GTOSQWi57eBWVdeuCX
 dypxNXfkTBmDeW9jVyd+lnOuFdt65mBP3eWqWRUNxyKCfIaAO+mulasGqNdVNJUDjAfG
 TYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9o8sGMkfG1jeyFOXZpLH64iA8m+M6x0mckBPZB78tzo=;
 b=X0qpSDtRPNNgawVj7Jz3YSscAmvpbzVu0AzU8AbGooaYrqdSQXU2podj0MY7pJCyJA
 3Sv5ckjlGe3HCTUkdW5vKQ0UoZ42b7SjdtnyDn2t3yKw9aktdkPSYcehSSk4YSd70gpo
 QeFQ89mBWNuvzLANp5lq2rh7JOp5wH7NjGgdUYWScbBty5yDPhbRTAqkg3g3KsPfnCgU
 aMZkOuWyA6bsZqgnSKGquMO3eElL5/bvQBlyr38SgcNk+ushfEj5Ni8273VlCpLDfmIt
 50TcFOJw/KQomxSPYo2EkL3dMUONY/Ti+ZQ0PzJjJ8YJh7t1FJJc7Zl4NqBATA0JOEDU
 PaIQ==
X-Gm-Message-State: AOAM532A3cIKJRnAX76RX8S8fS8v0DYW6Dn45ztZ512Nf/IjeEhLkfEp
 dzS78LY7+57srNxIP7ZY5G5oD6cJKgYsBPrCzkP3KQ==
X-Google-Smtp-Source: ABdhPJyl1O7lQda//8EbXV5VwDYB+8PqHGnFKUiZ1hcxbXh0ZCvhD5e/KZ0r3XzSRE96KsFP249zWyB1k/AGf6SztRg=
X-Received: by 2002:a25:e68b:0:b0:63d:942e:17a3 with SMTP id
 d133-20020a25e68b000000b0063d942e17a3mr12898845ybh.563.1649378707402; Thu, 07
 Apr 2022 17:45:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAGETcx-tH0+WoqH6s=Zw6VSaHwFcBhvaJKLJRLHGtUEs+skCvQ@mail.gmail.com>
In-Reply-To: <CAGETcx-tH0+WoqH6s=Zw6VSaHwFcBhvaJKLJRLHGtUEs+skCvQ@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 7 Apr 2022 17:44:31 -0700
Message-ID: <CAGETcx_7_r7NJb+uU05YxzJu1QZfvMBxwOo2M_wK6JU_h=wJKw@mail.gmail.com>
Subject: Re: [PATCH v2] printk: ringbuffer: Improve prb_next_seq() performance
To: pmladek@suse.com
Cc: Chunlei.wang@mediatek.com, john.ogness@linutronix.de, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 senozhatsky@chromium.org, Android Kernel Team <kernel-team@android.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_174511_511330_12ED8D6D 
X-CRM114-Status: GOOD (  12.02  )
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

Messed up mail headers. I'll resend this with proper mail headers.

-Saravana

On Thu, Apr 7, 2022 at 5:36 PM Saravana Kannan <saravanak@google.com> wrote:
>
> > --- a/kernel/printk/printk_ringbuffer.h
> > +++ b/kernel/printk/printk_ringbuffer.h
> > @@ -75,6 +75,7 @@ struct prb_desc_ring {
> >  struct printk_info *infos;
> >  atomic_long_t head_id;
> >  atomic_long_t tail_id;
> > + atomic_long_t last_finalized_id;
>
> I really know nothing about this code, but while looking around
> kernel/printk/ I noticed kernel/printk/printk.c has these lines in
> log_buf_vmcoreinfo_setup().
>
>         VMCOREINFO_STRUCT_SIZE(prb_desc_ring);
>         VMCOREINFO_OFFSET(prb_desc_ring, count_bits);
>         VMCOREINFO_OFFSET(prb_desc_ring, descs);
>         VMCOREINFO_OFFSET(prb_desc_ring, infos);
>         VMCOREINFO_OFFSET(prb_desc_ring, head_id);
>         VMCOREINFO_OFFSET(prb_desc_ring, tail_id);
>
> Would this header file change also require a change to that location?
> Something like
>
>         VMCOREINFO_OFFSET(prb_desc_ring, head_id);
>         VMCOREINFO_OFFSET(prb_desc_ring, tail_id);
> +        VMCOREINFO_OFFSET(prb_desc_ring, last_finalized_id);
>
> -Saravana
>
> > };
> >
> > /*
> > @@ -258,6 +259,7 @@ static struct printk_ringbuffer name = { \
> >  .infos = &_##name##_infos[0], \
> >  .head_id = ATOMIC_INIT(DESC0_ID(descbits)), \
> >  .tail_id = ATOMIC_INIT(DESC0_ID(descbits)), \
> > + .last_finalized_id = ATOMIC_INIT(DESC0_ID(descbits)), \
> >  }, \
> >  .text_data_ring = { \
> >  .size_bits = (avgtextbits) + (descbits), \

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

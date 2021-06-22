Return-Path: <SRS0=xI6Y=LQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 821D6C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 09:29:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48077611CE
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 09:29:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48077611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MmJU8oP4tXgQ08fmT3TSt35r0UmOp/cb/Fqqc21qA8E=; b=2yU0f/IqrFB3j0
	jGUIqg3dnQvQXiLN4nOzObyf2l2R7CS1FpBAuE8XICzIAGHHpbOKF0RlEJnqbta5+itTrOus2fua4
	57uCnQ6c+uviUzjCvaWxCzzQq6Z/Np8S5Lrrrl40hkmCtkel8FVAta6V+Ro512VU25b3BBGiYjvys
	nxC5otoqpgXKSFTfeC/gQditmrfc1kxSg6HwtFA/fbblBDtwmgaLNAZE6kW95nPSFZAOq4EtpWOgQ
	eSIppFxQhLXMpF3bTcRjPa6rkwcwldBKKSrF/EslFmAwGa+5Yj5R4zFroP7tTAPLDDY9r6HqRPAfd
	8spC7bfiIWCWIbZ7B5lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvcic-006PGH-GM; Tue, 22 Jun 2021 09:29:18 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvcia-006PEO-DP
 for linux-mediatek@lists.infradead.org; Tue, 22 Jun 2021 09:29:17 +0000
Received: by mail-qk1-x730.google.com with SMTP id f70so37642740qke.13
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Jun 2021 02:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iu3d+Ew+lBuYvRystq+F87ixcBpjW7lHGCUrqjjn8P4=;
 b=p4Ae5VQQTetVu33QUq+WJNrlBWiEu1PazVxU36/DcrVOkPvnk7rebdnxfy4aZQXKI1
 E+i9CdTP7D8DKo2T7m/ityi87O1KVakc5+KmBwnBj9k6DsAIHzlE+tJLgMx3c5/ewr/e
 /JndYrwZ9shKDLSZi+opT9gurc298PPdbwQo0JlhzjhSgoplBM/CUcdLz03MqPHq7TlD
 stumNqOnjM9/YEHKkrj6l22mkKemSBJH8NEL/3ZgcW3eZrCZdibnfFH3JFWj4IVeyCXF
 NH8S5RphPHk4WzqtyrQBjKQ/ptjcX/yKvEP/L747fdHbxAJFvb8zlZg4CzGjDZl1XwT3
 P9cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iu3d+Ew+lBuYvRystq+F87ixcBpjW7lHGCUrqjjn8P4=;
 b=oawRvuQ3xiIz35dEf2LRVVEZLCzNRKibdWCfwSXZ8cYPAM0MRdz07RCeN8n2MeBclt
 xuhKOZ886agXLmbcbdLHeb/CsZrg2trELdWJU7WYmY1IW731wz78HzbIYAxLj4wBFHhj
 j9Z4LRMm2+Xt8P6t1No1NkNGOSCb5lOp1vDVyVUJb/Z2z7e4DiyU3LtdwmKo8xk+NlUb
 2EMcNpBVGJ6x21gfKlP8GA8lAnFXUW888AfIKOo2CJAdbrjufraK6t/AwWDloOfLiI2V
 uc97MQ2H6Y5fgKsPgG6rOYVEzGA/eqdEb5HImqX5wY1v+4bk2NLGP5nMZL732+/4hw6p
 7Clw==
X-Gm-Message-State: AOAM530W9rH3CkmRQ7m2pBr2V31Do6rxYhRREbyuDO08pxbENIoE2ZL+
 QqGIDvqyybgWk6adtvt5OJ9BRvkXvxOHw4NRlAB5Ug==
X-Google-Smtp-Source: ABdhPJwKINDkHhIiMoTOhbUCOSZQgE3ZDGjdG4LxhdluI5hPm00NWcESSEf6cFlcwNKT9t+CNT/63dRe4jTIaZOV/jA=
X-Received: by 2002:a37:e4d:: with SMTP id 74mr3207110qko.6.1624354154077;
 Tue, 22 Jun 2021 02:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210620114756.31304-1-Kuan-Ying.Lee@mediatek.com>
 <20210620114756.31304-2-Kuan-Ying.Lee@mediatek.com>
In-Reply-To: <20210620114756.31304-2-Kuan-Ying.Lee@mediatek.com>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 22 Jun 2021 11:28:37 +0200
Message-ID: <CAG_fn=U8HiKU28goM+yzNrgq_LeygS6m1bz+k_xqGEw8x58sNw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] kasan: rename CONFIG_KASAN_SW_TAGS_IDENTIFY to
 CONFIG_KASAN_TAGS_IDENTIFY
To: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 kasan-dev <kasan-dev@googlegroups.com>, LKML <linux-kernel@vger.kernel.org>, 
 Linux Memory Management List <linux-mm@kvack.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-mediatek@lists.infradead.org, wsd_upstream <wsd_upstream@mediatek.com>, 
 chinwen.chang@mediatek.com, nicholas.tang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_022916_499157_C8E39512 
X-CRM114-Status: UNSURE (   9.82  )
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

On Sun, Jun 20, 2021 at 1:48 PM Kuan-Ying Lee
<Kuan-Ying.Lee@mediatek.com> wrote:
>
> This patch renames CONFIG_KASAN_SW_TAGS_IDENTIFY to
> CONFIG_KASAN_TAGS_IDENTIFY in order to be compatible
> with hardware tag-based mode.
>
> Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> Suggested-by: Marco Elver <elver@google.com>
> Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
> Cc: Alexander Potapenko <glider@google.com>
> Cc: Andrey Konovalov <andreyknvl@gmail.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
Reviewed-by: Alexander Potapenko <glider@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

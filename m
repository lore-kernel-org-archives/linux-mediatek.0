Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4035C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 23:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=evpDBMz1FcTqUJXJjya6l7F7ld+8HKPJZw3AuItg3C0=; b=lNudCw53nLPTOF
	JEfE7ypBoddzGYo5uBY0zdxsatLBEu0BJvq2mTfe7wFiFCUn2SsMHuhbXT8mHkfB3OLi3wehU7oou
	Q21RPqUATF19zVqYp9lmZRkBDDfAnjG1r4wWpVDbNeXQyDQdukocIcxh3t7czr2VWrYJw5GmNVdSe
	owCJxGsB714FjUGJaRB+BMZE9oTzDKcI7dYZAXjOuOgNWwjvsooLdzWD2mh/mFKrmtKWbKJ3Apvlc
	Ycr9xvL6kVWi9hsaMm2z36vw2m0funNSNUufOTfFDciuHtPHYsH/BdQMqkMYRuRymun5juLqfj68K
	Ee1H7lcQZJDnbz+01lPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUGq8-00AulV-8r; Tue, 15 Mar 2022 23:44:32 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUGq6-00Aukl-1a
 for linux-mediatek@lists.infradead.org; Tue, 15 Mar 2022 23:44:31 +0000
Received: by mail-oi1-x235.google.com with SMTP id w2so985693oie.2
 for <linux-mediatek@lists.infradead.org>; Tue, 15 Mar 2022 16:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Nl6Jm5jwM/rVHzRNNh97f8PcjadQYjuZsAfdQpOQyA0=;
 b=LxYOO0RPSWJ4K6iwzOJRwfNMombgLBlr4vAwpGEOYkw2dzq1693vjR1qRS2XBJSKkt
 deml4CTSqowDWH2shKvpncOJLWwxHJRyNaiM5u4IJ6I563znsvqL6DE18GXoyst5m9GK
 8GAger7v6dWSFEZbx5zEg6NRCTe0yHq7Bm0cU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Nl6Jm5jwM/rVHzRNNh97f8PcjadQYjuZsAfdQpOQyA0=;
 b=rETuzZk/7hqwnPo3vPf8Lij1SNrPEWbXuprct+TCueE5ImIW3FuB+Z+izxhdN7ky4i
 RmUhdaDfEWQgD1pSuQ6+9JWmgEorOU1KZuSR/MaFW7dO+E/WLLqP0bNj+hcQAMOpb/0w
 XeueWNxAaRNujzjlE1yXCZvJ6xwGo96FU1mUd43caubMamHqYxQs6y+NW7vuGyvWQpQ2
 Wfj6X5tifwjsOKQcuzijdlRLwCEUZ7Iz9TbEXFHr+L6A2yBY+DHBjwNS4/7uJ16Kq06b
 ra9s2S6OQcVc25fJLrE0rpmNEd7UvH/5FfWMJhEFzmOa1/9pCwXLgTDCwbGyZ83NgPUz
 tIFA==
X-Gm-Message-State: AOAM532eBbeFxqTcHKkXHOi05MJrVYruNToRDvhTCUtGydIeU0IMjyq5
 jG3LAvyR1uqH3V3RtSaSYcO98+IDubpBmSJKW1pxXg==
X-Google-Smtp-Source: ABdhPJwATAVHk6WtwRZmZrxjAV5ap1yBhOFyk+oiJLjCOS2Plq9sWvEpEoc/wJjnOQ7el0ZklA7Lp4p8ATvjU2eiYgA=
X-Received: by 2002:aca:a9c8:0:b0:2da:45b6:b796 with SMTP id
 s191-20020acaa9c8000000b002da45b6b796mr2652734oie.193.1647387868162; Tue, 15
 Mar 2022 16:44:28 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Mar 2022 16:44:27 -0700
MIME-Version: 1.0
In-Reply-To: <20220314084409.84394-1-nbd@nbd.name>
References: <20220314084409.84394-1-nbd@nbd.name>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 15 Mar 2022 16:44:27 -0700
Message-ID: <CAE-0n50tDVmQnruVy5cvseQrH9dWjHWr7qAoLwDnAL=oS9AEzw@mail.gmail.com>
Subject: Re: [PATCH v10 0/6] Clock and PCIe support for Airoha EN7523 SoC
To: Felix Fietkau <nbd@nbd.name>, Matthias Brugger <matthias.bgg@gmail.com>,
 soc@kernel.org
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_164430_125052_1849E0DB 
X-CRM114-Status: UNSURE (   5.35  )
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

Quoting Felix Fietkau (2022-03-14 01:44:02)
> This patchset adds the remaining patches needed from the last Airoha EN7523
> SoC support series

Please add a changelog here, preferably with lore links to previous
revisions. It helps folks recall the patch series.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

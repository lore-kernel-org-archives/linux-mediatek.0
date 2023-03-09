Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F3E9C64EC4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 09:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v8gsX6vrStQeUsH5rKVIzb0ItwKWklQ0bcioQcBInIM=; b=ncMVKP9m9Nmp7Rw+MIqW2i74SW
	fQTRql/UbqPdI+mBOnZcsQnTuel7tiN9Bww46coDfcqEE+6nmy5YBkKfM072Dg8hq9uV62WfL7Voj
	T9cH3s2J+Oi1G0i8xXwEWaWlmQmYJK2hZ2QmURur+N+0UTHzqwMWpJjh2qUdnCHjd7JWYf3+t7t3M
	KdP56Cg4auz9iQVHTlyVE+b2IRS6E/egP9mR1xAFdvA+Zxbw5G0ccjFveluEiH+miEilQLlKYImKb
	yQbuEk7EvSzE1PmS+pdruyGjUO6G7LyHh/GcQDT34YNVWpLtpboq8EpXJe5VMMxOLMHfWQBoZVVRr
	ZYuMAcJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paCDn-008he5-OB; Thu, 09 Mar 2023 09:05:59 +0000
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paCDl-008hcI-22
	for linux-mediatek@lists.infradead.org; Thu, 09 Mar 2023 09:05:58 +0000
Received: by mail-ua1-x92e.google.com with SMTP id h34so661802uag.4
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 01:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678352751;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v8gsX6vrStQeUsH5rKVIzb0ItwKWklQ0bcioQcBInIM=;
        b=EIqqh4WUJAtlIJKJ771rFSqQgKiSfrYcZLZHwsUo1vvE8JiE+4QAXbubHsVrGOdnSL
         5euNxBsrcXw8gcyvMmkmuinOIEt68oVv2COdPyy89xisH3eOUc3Wo199eFiXikoK9+Ql
         WKcYH8AqYwihfM72j7FWRBVxFU5GUN46CEC/sjfZDRsUBJg2OZP4XIyCoZL62zhpxQ5g
         vqOow3L04f+6laqkMm4gk8ZGShc0kKYuJIii7HBe9W1zY4e/rTKoEJk3PqOyeFaeT/B5
         gXQVked/eG/Dru+iA/ReY6JUxlhho5xYorDo5Imc1JKxfau9UvIt636C7WWRY9Sy7tQ8
         mYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678352751;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v8gsX6vrStQeUsH5rKVIzb0ItwKWklQ0bcioQcBInIM=;
        b=JzjC5/2SDaXbTWbF7A4+I/Q9s30MLx7xClTfbCNF8kVHWEbF5qr5Ajd3OMS4E2x3L3
         DeVYQX+KomFuNfK469ZtA3DyuKolsbD2x5hqP7jXTpYoz/IRfV9crDGZKoN7S6gLGudu
         Plv1fZANeq6xDJCGAlxcyV6CW6qVBag+PQzArio+7obQk2Wk35tscZHwc+tfZWWJrv9+
         XxWHy5QzlbTtSJIzQeR+5QlK68KsgdtBpqmMG9kWiW3AWtJ/poQRYYoSmWpzG5fyoyGm
         YKrazQfFibx7xlcVejh1DTmZ0SvosQmMjMLGoVKqi/fWHTE0qwZYvOo0BIYqqo/HOQGy
         +l4g==
X-Gm-Message-State: AO0yUKWgBpa1rmAaX2Q7YCIRDuSOZ6g/dbx0w1n7ccZZA2dwBwGw27qv
	q6/2GcldFYfkoJqJif6IGgiFN74helO3F56g7sO12Q==
X-Google-Smtp-Source: AK7set82OSvQFONVJyN8LBKOpbv2PUhiDRWDVoZ9Up/z/SqG1ikX8WNfSePirnax3JBNhUFcGRz8w7Dqf2d6saiDLR4=
X-Received: by 2002:a9f:3001:0:b0:68b:817b:eec8 with SMTP id
 h1-20020a9f3001000000b0068b817beec8mr13953524uab.0.1678352751125; Thu, 09 Mar
 2023 01:05:51 -0800 (PST)
MIME-Version: 1.0
References: <ZAhkQUmvf1U3H4nR@elver.google.com> <20230309005831.52154-1-haibo.li@mediatek.com>
In-Reply-To: <20230309005831.52154-1-haibo.li@mediatek.com>
From: Marco Elver <elver@google.com>
Date: Thu, 9 Mar 2023 10:05:11 +0100
Message-ID: <CANpmjNNw6utf5ozpwu1keDG92Ew_vL6B=LZoRw12p48eVJeNnw@mail.gmail.com>
Subject: Re: [PATCH] kcsan:fix alignment_fault when read unaligned
 instrumented memory
To: Haibo Li <haibo.li@mediatek.com>
Cc: angelogioacchino.delregno@collabora.com, dvyukov@google.com, 
	kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	mark.rutland@arm.com, matthias.bgg@gmail.com, will@kernel.org, 
	xiaoming.yu@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_010557_132264_374FAF23 
X-CRM114-Status: UNSURE (   6.00  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 9 Mar 2023 at 01:58, 'Haibo Li' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
[...]
>
> The below patch works well on linux-5.15+arm64.

Thank you, glad to hear - may I add your Tested-by?


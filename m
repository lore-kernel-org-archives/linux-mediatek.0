Return-Path: <SRS0=CMHm=JQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC9AC433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 09:37:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54D5F61157
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 09:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54D5F61157
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=K0vKL//pN9p6/VFsM6hMk/rhgziIUwDtSZT6HYVAl3E=; b=CqXRRx3rIJzwfNq+6xMSknX+0
	ibMmyEC2KlJ26mhnwOZsi41tfgIzFYnTOSwMrQ/Xf7kRAI8ScZBPzx2qGncTCIXbk2vf3ycsWzwKE
	x/FBbPP8CEY2Fb2qAtNUNK4Aryws4DZHyINc0X38UDnPd81QEsjJclSdZgoHY87BaklEB4YmUwwQH
	20Ox9i0iddTCHf1X+SseloGQZyXQcEmHruZ9liq8HQ0njPTdYy0PTS18w+zjksHaQu2Wd24iq2FyF
	1as+n3G8sODmBy4Fhy2f4R//WAEo5FyPXXbDK8x8MjUJzKq3wI8GEz+ngm9o/WQz8p6nBdJuNRk4a
	4m36uIj5A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYQLI-009ZV1-Np; Mon, 19 Apr 2021 09:37:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYQL0-009ZQf-Sy
 for linux-mediatek@desiato.infradead.org; Mon, 19 Apr 2021 09:37:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=jOtGaGVljDRroMtL9uxjdZ3UmcQuSpT3iJxdsMEEa7I=; b=1pEylFB/b4/BkHC3G7yq8xwLL3
 QmecjdAg3xIVON6dE65f3AHJHWrR+y7Plhx6YRiUivyyWJ8vsNRdz0QLL5+cE5btJ7sT6LBrzMopQ
 p6XS9W5s7PgeJ/PjBnd9kmkMnj9566BZsSh5nZSPKpSxwA0VBH8f6AIbnBtbE9QEkS1u9Pssk5Ubd
 YdH11cxjjAA+o2fKthQZJ8rBCvxboQQmK+zY3pFHRJBSL8F2Fo0yi3XzkaAlE5IjFe2LBpzsJD3+V
 h3BaeZT4yvWEFvjBOjWtVhZBAiXo3Wm8BEF+F7pgD2wIF175hV9EdokZ+Uog6JdGxQXgjBctenSXz
 X7eVUnwA==;
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYQKv-00BEfI-LW
 for linux-mediatek@lists.infradead.org; Mon, 19 Apr 2021 09:37:01 +0000
Received: by mail-il1-x12a.google.com with SMTP id j12so14656047ils.4
 for <linux-mediatek@lists.infradead.org>; Mon, 19 Apr 2021 02:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jOtGaGVljDRroMtL9uxjdZ3UmcQuSpT3iJxdsMEEa7I=;
 b=eWDXuqodg1bQmske9tHrOI8NsHDlHTEgOmye/Fh7/PyboTl0nFIePRWBJXVaLBLdYL
 BBjNk8q9vyDZezKgDRUmCn1awNKpBYlI0OSF6DUqF9YSVN7EBwQT4ClpVDPrVPjhsq7L
 /cxBzjOn4DB0/2dGz6Ke0Z7XsHYqtyhTb9aFcfzn+qEf3Otcf7rUrNozVwlT9uaX6SPn
 Z9WvX60f2TB21uehcch+M5JUSGJsw4MrAm0Kad+xf46C9sHo3ZJNUNQ9HcxIF1INfPhA
 WoIxZrisApTVtJLVkzVviMmSosJJo7uZgZ9C3LPBtqz63qdUc9AssEsj8K8bF9P3DQVF
 Xi/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jOtGaGVljDRroMtL9uxjdZ3UmcQuSpT3iJxdsMEEa7I=;
 b=NG/+5M15gzazohfCjzUFcVreb1q/nIGmtQmIAErBJtJ1Mi+j7xSn273YrlfbMaU3oo
 wgEUSdfC5ZEh4gN52WH4v9im5tL10uUoX433U/3DkmOhSXh5GBlxX7vPy5rOyS5uHaij
 /2H/mjBkreaLAcW6c0fmHCZ+fZT2o5s3TP0oI5dB0mTRB8/Y3oE2A1GiujWN1g7faQkX
 +D09Y++2nrqnn3L+BUiEN4OpJgl8NrTdMzzCFgZp1YRujS3C+zlk7qJ3cloDsTBnccPg
 QSeVwkLMEg36tbpLeJ0fYT52p0SJiTNWNU7xtGdLCJGnYamuE9BBodjZl5bXCi8g7VOl
 gfvw==
X-Gm-Message-State: AOAM533bWhr2MKYWR3NcS3N3gRH5hsdRy30oxAH+7gdGeDqn82S7hlVY
 MHI4xFNhDCf4sqUJp0/Zpa2VXRNHfe/o4j0grdL1Qg==
X-Google-Smtp-Source: ABdhPJwwakYC15Jfwn61s38W3QBtR83s86sP27Ota3crJt0MVZZtVZ7G2Iwa4wN1Yir0Xa9WkfeUDQ1R15jnMDZu1vg=
X-Received: by 2002:a05:6e02:10cf:: with SMTP id
 s15mr17546452ilj.302.1618825013674; 
 Mon, 19 Apr 2021 02:36:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210419052136.2475373-1-tzungbi@google.com>
 <CAHp75VfgSaRmqg96KSabmwnf6xQRMM6GQi3XAv-cJb+Lhg91cQ@mail.gmail.com>
In-Reply-To: <CAHp75VfgSaRmqg96KSabmwnf6xQRMM6GQi3XAv-cJb+Lhg91cQ@mail.gmail.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 19 Apr 2021 17:36:42 +0800
Message-ID: <CA+Px+wUvrNT1p-pLDKd=2RyzBOiy_AuBfnyyapmbRuZWDdOErg@mail.gmail.com>
Subject: Re: [RESEND PATCH] pinctrl: mediatek: use spin lock in mtk_rmw
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: sean.wang@kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>, Mark Brown <broonie@kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
 ALSA Development Mailing List <alsa-devel@alsa-project.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_023657_723706_36B7750B 
X-CRM114-Status: GOOD (  10.94  )
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

On Mon, Apr 19, 2021 at 4:31 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Apr 19, 2021 at 8:32 AM Tzung-Bi Shih <tzungbi@google.com> wrote:
> > For example call trace:
>
> Please, shrink it to the necessary minimum.

I'll snip the stack a bit in the next version.

> > Uses spin lock in mtk_rmw instead.
>
> It's nice, but now the question is, can you have this function be
> called in a non-IRQ context concurrently with IRQ accessing registers?

Fixed in v2.  See
https://patchwork.ozlabs.org/project/linux-gpio/list/?series=239787 .

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

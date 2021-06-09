Return-Path: <SRS0=WlSZ=LD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C804C48BCF
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 11:19:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9DD561364
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 11:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9DD561364
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=njjOx2PzZallYvM/Fr+rtlPpR5XjbjHWDu4CexehXz0=; b=jZ3pescA2aw2zn
	LCBPe/7Sgnu7XgQTz/i4rCtJ8LEN+iBNXbat1Q5nVMOme1JiL4+O8ze5lwPapcmvVk16GqSH7hZPU
	IshlSzNiADPABwDHriDusPcUK6JNKeeaaK9NEN+Grxd8nE96U4/+4jsS3/dxBLGGpX2fE1CCt1E/e
	08TatvF7zu23Ie4UfPF8kR/0E2NYFnH/2fXVVhwDu0Tr/kZZpF0lDNV5pXw7HUlcjdYbek+fAhR8j
	MmhePH7mi4iJKI+tl75C+kVO9/9ihmzfo9SB65bKM8YfUmB4sB0HPn/npB9W41HJMQRIydcF9blTU
	eIZpBJKxCifioghZwNbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqwFA-00DH15-DN; Wed, 09 Jun 2021 11:19:32 +0000
Received: from mail-lf1-f44.google.com ([209.85.167.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqwF7-00DGzM-FL
 for linux-mediatek@lists.infradead.org; Wed, 09 Jun 2021 11:19:30 +0000
Received: by mail-lf1-f44.google.com with SMTP id p17so36632005lfc.6
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Jun 2021 04:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b9O4t6ei1D8lp6tbh7xKEJ5OiZwVBxTMlh+LjUyHQ54=;
 b=JJZhVBK8XAeaFL6DQ8+82CH3Tn27KdaGFCTgYUZmudfX3Q/cnQXnIZvxUARhticvpC
 JycTC4ZOyQIZfYn0/HlZ6zKqQYWsLVhkD2xM6H21LShj4YIaMowxdtUPl0sHreMG6pfg
 iogNmtktJywuOe7b7Zs/BMrpw2PHEZMoYqW+XS8uqi3iI6xXJgP8NSFZqDZTDnNw+yEU
 qcsSnKO99UJcGNn3K6R3FY7XpYqPCtPh4FcbMjP0x4Lqe2J3Zna34PNL5b4Gnj2QInhO
 2dLE0mxaniEQcolKdtm+vSIkMkMQA3y49Y6nx38isVwhIQsyOa5RKQFoiWJOwEvK9ymm
 6AuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b9O4t6ei1D8lp6tbh7xKEJ5OiZwVBxTMlh+LjUyHQ54=;
 b=KYJUcYPOXOoapDoY0Hzfq5wbwtJlXzOMlTzYxoPe3giKq29hofit4finujnI441hj1
 0SJ/9intH7IbguFJiZ+WPCsbjrUhVNSuv1dI/VUQa0AaaMHbMRXrZSLjQyo/b+hEx/5N
 dmHF/JBTKOwr+SAJZlpS4xZXQ7o0HGZvFPIcliRYDD8Q9EixrIzGtYswHyP0SH16Qgwx
 92DQY1Lf2Fb1Nqy7CJdfxmRgADn/FjXGVCImAScdob8c4P9c6HTJBUl7vjgj4ugeYsJf
 JC8HcmHnkurI+R7HT2K+44F3u/2qEg9EVqIlgSqCD3HQI5psescncN69GyWq2XThmFLF
 oOwQ==
X-Gm-Message-State: AOAM531McSlFrcxjIdTA15NScEsexXUSzoxDaTeGGYhqS33nBpyLerVV
 V69k+0B8JK0HYWSYtPZtSDGIp919tcLbmgJOuQQSsQ==
X-Google-Smtp-Source: ABdhPJz6NHE+0gvKyfv7+YEJSuyHHStlfocuRfWgrhgqSQh4vX6owc1UlB2pSgkAV6u9cWfZUZXY08Yzd+FfgNCdZtI=
X-Received: by 2002:a05:6512:2105:: with SMTP id
 q5mr18131046lfr.649.1623237507147; 
 Wed, 09 Jun 2021 04:18:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210608150656.29007-1-matthias.bgg@kernel.org>
In-Reply-To: <20210608150656.29007-1-matthias.bgg@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Jun 2021 13:18:16 +0200
Message-ID: <CACRpkdZ+9LeokSfZDhMWyR4yE-oq4CSbSPRqwJncOS0rm_f8Tg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: fix mode encoding
To: matthias.bgg@kernel.org
Cc: Sean Wang <sean.wang@kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 Matthias Brugger <mbrugger@suse.com>, 
 Fabien Parent <fparent@baylibre.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_041929_528858_9B397FD0 
X-CRM114-Status: UNSURE (   8.21  )
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

On Tue, Jun 8, 2021 at 5:07 PM <matthias.bgg@kernel.org> wrote:

> From: Matthias Brugger <mbrugger@suse.com>
>
> Pin modes are encoded in the SoC data structure. Use that value to set
> IES SMT.
>
> Cc: Fabien Parent <fparent@baylibre.com>
> Cc: Sean Wang <sean.wang@kernel.org>
> Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> Cc: linux-mediatek@lists.infradead.org
> Fixes: 696beef77521 ("pinctrl: mediatek: move bit assignment")
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>

Patch applied!

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

Return-Path: <SRS0=w0xa=BA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F4CCC4345B
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 14:23:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B71020702
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 14:23:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KHLaaZWp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H4P/VrzK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B71020702
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vph+dHHaIFkG5th7r4oXovQDGREND/jES+n8GP03gyk=; b=KHLaaZWpYs5AWFsX3ZzZiVdoV
	S3PkTayzahnPlPjhYd616vy0zko6fO8VOF5TcEi13V9ORXG7PhPosxRH26GP2tF6gXH2UY+jwA8Bi
	WUAhIuyUrr9WS40/kKhT1nhsamgXTN8sP9sj99XibTgnUf9rDbuCQdad4VOd5GDN+fmMuP/p8e1Ni
	9U3SPytmikk+p7Q9C6AMXq1thxpDVhG1qnFrYUS7m6Pd7B+9jS7BOwA4mlxpSO59eJHHmd4Kr7dC+
	ryuNTPpAYOdrQMZB6DpCNH1ViS5eo+NcQfOAA7KcL1Ae+V9s+PxJHV2SjFH1u7FLCX03liXEgydFa
	3zvF4wLoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxtAy-00019P-Mo; Tue, 21 Jul 2020 14:23:24 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxtAv-00018G-OC; Tue, 21 Jul 2020 14:23:22 +0000
Received: by mail-pl1-x643.google.com with SMTP id t6so10334550plo.3;
 Tue, 21 Jul 2020 07:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CX4eH9/QUA1u4saPv6izPwaTM6OqoGtAPvD7DC3yquA=;
 b=H4P/VrzK9rOD3lnOaNH0hX9ZLYi7AoWW2siJNnBQYE09LI/XQ3Ip5TyyQg8gqTWv07
 PAC/Ag6TGy+gxyN+27SXJMGJMZvmvNugN22G62XJcK180PdWd6GfbvgzV6XYKSbtHtyF
 SLw5opNeUYvfCMqQwtYHHEMj80bXgD2y237FSBJmnmSYkJW4icj8RfwfHqWHhXWcgQUa
 heDatMhgGWyCk8mTjzc4VKQxp40MAnPCBnqyqQ+46IV6IaN6JiIA/Y59DgOhUL7GfkZf
 jjYJxTTFPdJxwXQGHQd4UDocuApmmkZBebHQmCUP85EIuXxe0eS/quSPus108oRHzqmI
 P9og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CX4eH9/QUA1u4saPv6izPwaTM6OqoGtAPvD7DC3yquA=;
 b=KGv7ruvqDUYDAwLhh5X+m/PKtp459MGYk5zsz0kz9Q2eVpDSUUCJ0MYTAucADKsOC4
 8+SyrNRes9ltRUW7ElKVNLuo/IudrE7HhxUcif+FMcInE4Qjh7qbAsrBsKyfVL7I+bcw
 UEtuEU4igg6hW3av4QJw0FS6/ZiAnJJn0I/u4uvYjwQzA2+aTilz0A6aUGends/nVM7T
 a/qVjFJCQNNFncMH5Cq6FQzHOUuSvcibiqKLo6KvXQYqy2ynUmXwjrhqSM2gDbph427z
 jwZigimhZLG/1POFPLhmD19caik4A2VPr4jmx2dYDzqvekXPhWxdBUpYX4Ag4EekgHBy
 +y4A==
X-Gm-Message-State: AOAM530Yx0kO/tjEwuYe5nzv6AK+XbXnQ2T5ivinMzGAOu46FPOF0OmT
 Vdq0n+8zfYx2M1XVd8RNDSrzJu3EJ4QfZNAtlCU=
X-Google-Smtp-Source: ABdhPJxnpuDyH/u9trmPIq89haOgJSMaTcFCtl639VtNm1WgUMH05ZqjfNiwqqUMlBDkoaI0O0cvoy2rFOxsKhLk8qg=
X-Received: by 2002:a17:902:8491:: with SMTP id
 c17mr22040941plo.262.1595341397575; 
 Tue, 21 Jul 2020 07:23:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200721022324.21898-1-fengping.yu@mediatek.com>
 <20200721022324.21898-3-fengping.yu@mediatek.com>
 <87ft9l3v2l.fsf@baylibre.com>
In-Reply-To: <87ft9l3v2l.fsf@baylibre.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 21 Jul 2020 17:23:03 +0300
Message-ID: <CAHp75VcnfF3ucuAJXDDy8pit5-LE42d4ROkL2y3QZroK6RU4Rw@mail.gmail.com>
Subject: Re: [PATCH v15 2/3] drivers: input:keyboard: Add mtk keypad driver
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_102321_794300_645A93FC 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree <devicetree@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-input <linux-input@vger.kernel.org>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Fengping yu <fengping.yu@mediatek.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jul 21, 2020 at 3:38 PM Mattijs Korpershoek
<mkorpershoek@baylibre.com> wrote:
> Fengping yu <fengping.yu@mediatek.com> writes:

> > This adds matrix keypad support for Mediatek SoCs.

...

> > +     keypad->regmap = devm_regmap_init_mmio(&pdev->dev,
> > +                                            keypad->base,
> > +                                            &keypad_regmap_cfg);
> > +     if (IS_ERR(keypad->regmap)) {
> > +             dev_err(&pdev->dev,
> > +                     "regmap init failed:%ld\n", PTR_ERR(keypad->regmap));
> > +             return PTR_ERR(keypad->regmap);
> > +     }

Okay, because another comment appeared, I would suggest to switch to
%pe at the same time.

            dev_err(&pdev->dev,   "regmap init failed: %pe\n", keypad->regmap);

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

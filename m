Return-Path: <SRS0=B6WE=Z2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7486C43603
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Dec 2019 08:12:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7859920675
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Dec 2019 08:12:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uh0UXtwR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="Urf/A79c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7859920675
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7qF3fDvievH5kg4HEPmFC0TZqB41l0HXEJdRmRlHAHw=; b=uh0UXtwRysx50z
	5jpgawThZnulB4+lLp0NhC9q0QNKAR4ia5OtjT7bmZ/oeqpJKFYttfuCJjteAMfWxsh8xfx81L/j/
	XX5olTd74EUZBFBplKRjjaAUOh2lsn302+Sjj1w+v4ydGBx/hZu4gC5S55Sfg2zRuzuHIIIGXf9nB
	ETNhkzLtTFiJVed9yBfvvjDbR+H0HjsUB6/+meMV3XGutKvvc0C1OQhcEqKyegMrho0W6sjsEnLwG
	GTviSQZcSqVyqk7xzcONqb9hQBs2EyYAVCS2Ev2hjnPsF86fylNGaYFVHRt7H1v8bpMJHlrTKyXZi
	aQKTdLbQ4jyesrOvuoOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1icPlj-0008Oa-W8; Wed, 04 Dec 2019 08:12:19 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1icPlh-0008Ni-Al
 for linux-mediatek@lists.infradead.org; Wed, 04 Dec 2019 08:12:18 +0000
Received: by mail-io1-xd43.google.com with SMTP id z193so7041999iof.1
 for <linux-mediatek@lists.infradead.org>; Wed, 04 Dec 2019 00:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I13QOM/XyZe4jexaUu6Tg14FjNQVNu2OzdTG+eKEvxs=;
 b=Urf/A79crlroamjdZ/4jO0Ea3JsVS/HR0RS6j4Scbe/uESPEuIqzn1CISgZZ4M2O5Q
 2IJ/bbCONVPXPx0UHdwldQBbY+glrYv9E+RAOFyiQlZhteyXjKfPhHoaC0lmBx818SVx
 zrOFUawhELjFTUzvBv6ySv1v7pSJqYo2WdgONHIEbMLzMRuo7ZshWOT2URSNCCVm0tFs
 dME9t6qUHmmDkcJ78hRUgtnH7QGqkW7K6X4NttTr2wqeRCOPQMcv/FfDYNUVmkpEpxui
 EHybpT0WbT4GlKWVIlTpGBZ+k3S90J77Jjt72aKwVx2gqSklHM8p5i9ZFJGkKUFnam/Z
 +fqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I13QOM/XyZe4jexaUu6Tg14FjNQVNu2OzdTG+eKEvxs=;
 b=ILuiJzAHGMUA1EBwkf2mpa6MdZvB24jJ6YHO/a+of53Pu1anW/W7FV94pQGfJRqWmD
 EBDvTceGfP8z4fJqqh84/2OfTgwVyyt7EnTlxmaehJOwEpY4zusEKS/grwsdhwddF+hm
 xqfoi62OFDICigFxeNKWaCiDRpjCOFLu3gtJE8NlFAgVDSm5SAIwrig5uGG6ulRJtNa9
 +mcsEiEXkE+PrUbamAUbcB6rpG/GYJPsYy02oWZhjEpgxCpVDbCdHj9B9n32mKIVopAR
 mBwMTUNXkcqqwsOvacpv9dyyDthnIKUuXhEGsxI1nG4pwv4psHMGj2HQ/QtF3dsOGiVx
 K94A==
X-Gm-Message-State: APjAAAUf3qb50Ri3XjFfJlkbK/hNI9gj+fhPczDeRcKrdhVUI2pw5Pg6
 3o9Z3Fa5gHj9IZY53S/6BcXk9mn8PysXlb2Bnsp7TQ==
X-Google-Smtp-Source: APXvYqwt6fIkH5aRFph0l1Lb7nTwjasXYcWkPzvXCdXqxUsHWhUIa0fRQNvSZ2zcwf47+j1kV/aNS9rzQoInjIAmU2g=
X-Received: by 2002:a6b:c7c7:: with SMTP id x190mr1124939iof.123.1575447135988; 
 Wed, 04 Dec 2019 00:12:15 -0800 (PST)
MIME-Version: 1.0
References: <20191204071958.18553-1-chaotian.jing@mediatek.com>
In-Reply-To: <20191204071958.18553-1-chaotian.jing@mediatek.com>
From: Hsin-Yi Wang <hsinyi@google.com>
Date: Wed, 4 Dec 2019 16:11:50 +0800
Message-ID: <CACb=7PWeW+aYx3Dah0CFj3cyG+Wr=gOe7pfo9a_jmfjvjJeFDg@mail.gmail.com>
Subject: Re: [PATCH] mmc: mediatek: fix CMD_TA to 2 for MT8173 HS200/HS400 mode
To: Chaotian Jing <chaotian.jing@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191204_001217_394577_1EAC9FCF 
X-CRM114-Status: UNSURE (   7.56  )
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, srv_heupstream@mediatek.com,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Dec 4, 2019 at 3:20 PM Chaotian Jing <chaotian.jing@mediatek.com> wrote:
>
> there is a chance that always get response CRC error after HS200 tuning,
> the reason is that need set CMD_TA to 2. this modification is only for
> MT8173.
>
> Signed-off-by: Chaotian Jing <chaotian.jing@mediatek.com>
Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B151E85381
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Apr 2026 16:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mhIYPi+ZTj650hQKyeIbVrsNYbY3op5BHueN/8Cl9Xs=; b=DQUzUS8Aj0hmO7cHOjtFChtN9K
	lce4jfuvVBItda0FQXBn/CtJsh1k6zzoKfuEyjgE+ZpO/EssgiHAk00k+XbuKTCXk+8OqTojZ7Tg5
	WQcbxhz2K+ZMg6eq5AmLn40k15JZrglj3jaxXJ9B9NbZI6wRp2phjOKOvyc0HiL0GkeRO/kdV8e3P
	NcJsyHYBFFXGE+T+BpSYPOZ0FXvN9MrycAyq5C8OJcuJPVE9IQylmMiMsvWnXdEc/MXtdAM31t7ZE
	2ly5g7px5DuN6D4iNs+VJ6KHfpcv0qrj8DLdv1utw0aUNVfmQ8e0dCRzQWECugW504KzriaW9vKVu
	0XUoEuzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8hVr-00000002Ksa-11Tv;
	Fri, 03 Apr 2026 16:36:51 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8hVo-00000002Kru-0j7J
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Apr 2026 16:36:49 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-68313a00e79so183828eaf.2
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Apr 2026 09:36:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775234207; cv=none;
        d=google.com; s=arc-20240605;
        b=YVYShK3PhwxFsL7eeHbI/wrL57NDrJSn/M2DjFvlGo23sZu7mYcH8UcUFRHaj9VqxH
         GYBKmdGVioxjhanbErPilGJ5l8Trps/8qCU2JFndcj3gvMVbq3tr5t8OmTM781kHI/mZ
         GXBwuiOvKoE9eF9W7yOpdn+r6OOy9G2PM5nUVCQRVLCqXZXHNDZQenukBsT8OOhoFDiC
         wByCpIsfwv4MUFLVuW23YwkgE1lD3xPFDjbfx5tH4XHrrSGfg2R2yG2qMSZ2xT1uL7Gl
         4MlzTiL2NrrHIj0xHvvcuz9Zxu9GuYiA10iMPrhpZRf02KxcYAG2vnBAIspXy51DUUaV
         LN/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mhIYPi+ZTj650hQKyeIbVrsNYbY3op5BHueN/8Cl9Xs=;
        fh=Qlt+DjS+cYC+X8FHgJ4d8AI+jKxOmvjSey8GYOmrmZg=;
        b=gF8zfff1S/Wabho8KCREYeGq8XbCCYFFSaDZH1LnCgBpwlNNC7YhftoCFYjgO5ayAo
         kVLsHdooS/uVH3wVb5CzAw3PXg2hOT/qw5GFSamagt27gZGBgC/gruWoons5r8ptKQwF
         POveS1VavV7XwapwQMJynsppGa/TyLgHWukmT3BiUKLXFdscE6Y3fATrc87KBgfBne27
         dMPIKzD4DvZqHtO2vmHfgh4YRpgHECkVRxM3QE10GZU/WpNUJDeETrLP6z0DF6z8LnZK
         BpnsUAf2Ut7dwDpiF84OIRGnI7o7Mwd+HT8SyJT5VjT8jCVmRDYR0eRzR3XmUzWJk3Jb
         B9QA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775234207; x=1775839007; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mhIYPi+ZTj650hQKyeIbVrsNYbY3op5BHueN/8Cl9Xs=;
        b=XLdl2qyYiMz5o8Te0YlDSM9HT1iWepWosnjyWAsBe7K8os1rVREPeb/fRZ8EUlWUZ6
         xogr2FjM/XoS9ug5FG56UgF5b7KUZsT0rVFy3k4fw+6ngOkOCuO1ap3tkBKieagWvQYK
         As2ki2Jkyu913cAjdupIE4sLCbDNlCWViKxsWrdgSzV8+zaRslkeZmWCbJcT0Tds9hJ4
         ydmAk0WHqnJhVr+A90em3NvQEXAQ5VxGrzmluK4s4Nv6EZYcL/lGzu02+idfVD3dI7ta
         stkq47nGPOaIsmXLbvJ0MHuUhDvA9K3MOPxKm57Uu462oSY62PvaK+lBfhUtYbnv8GQz
         2D6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775234207; x=1775839007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mhIYPi+ZTj650hQKyeIbVrsNYbY3op5BHueN/8Cl9Xs=;
        b=Uq7OgJMCYdpjRb7+HoES/i/+oNaM9KiqMeNRJgiZ20OL+oCFXLZWcafPV2tu1O0Pmj
         9OKYyPUup1fXUIyXTE+aeZ2F1m6pbxJbi9v1NwqFmltRmDmAHm5Kc2/FuOLmYougONt5
         l5bd32LA6GN0wds5ne//yG10nn5JLjQUPFUUrd4C0IN8QcswJ9aNB08Ls2vA2Ef/xwrj
         Av88FGq999qnZt+H+Dn26Rf1hrTV/JhQ9cRS76+dI4XNPVW1AvCrsq4z/02ThG8VnsVv
         xPrgt7rJcGKEVEY6YlK03HmrqLCoz+LxiCWvRLKo+WEzyOf6P+T+PznlKCPxxfBaqAUd
         2GxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYM8v7zg58ApBdj4So658bF0pP8P5LJi/V6nboKcdkvnlXvc+ciZN3f3YxlZgSSmkz80KkXHF/0iTyQjehbg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwEzPsaeKBc31Mb32whu7aYzMcq0fMfEuBZbpgjYnAp7UcWFk/u
	VUMthu/j/MFaDKc35TLtc8tZI8XMzViKNlk9Bx7rABo+2v+7supbCmD7lyt77URMbnqPAZuwucf
	kzEjT5EDhILHhHNgfzMEx63uHSqDrlLc=
X-Gm-Gg: ATEYQzxCRuC3v8/y/JBlWYbajaYQz8k29WayE3d7rGi6vlXv82Pl0EKO+tEXhnz4yEA
	113XNbS7Qeslcn0mZWr74/7bTARBxHOvdmMQuW9rvh2bisoMQKE6PCitNF6vqhzVzcxs9sAuwZ1
	yVJlATYjfRSzJpdxxQ2tLQLyVje9NQWnirIBgwfVwMZGfzxbbpI+O/brATBnJZTdEM1xzc7ekZ1
	9nCe13sc7s1w2FiLU4Kno3jK1zEI48ZzOhiaG95em6OSL481Zk4lSzMa6jhSl+vleOojEDRwaIx
	qhB3289W
X-Received: by 2002:a05:6820:f023:b0:67e:1259:aac4 with SMTP id
 006d021491bc7-6821d747f8bmr1924347eaf.26.1775234206887; Fri, 03 Apr 2026
 09:36:46 -0700 (PDT)
MIME-Version: 1.0
References: <CABb+yY3hYcJ82QGor3w5KKHUGz9Pc1k64Jdf-94E4Yvv0DTeyQ@mail.gmail.com>
 <20260403151950.2592581-1-joonwonkang@google.com>
In-Reply-To: <20260403151950.2592581-1-joonwonkang@google.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Fri, 3 Apr 2026 11:36:34 -0500
X-Gm-Features: AQROBzCNnfUiQJss0MRPovDqMc4MnIhdZ3NJ2hHQRVK29Ar7Ti2BAIx3xKRl0IM
Message-ID: <CABb+yY23aTXeXu6G-8sHjw32DCqmhsJLu2Mt-txenOgTBiyv+A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mailbox: Make mbox_send_message() return error
 code when tx fails
To: Joonwon Kang <joonwonkang@google.com>
Cc: angelogioacchino.delregno@collabora.com, jonathanh@nvidia.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, 
	matthias.bgg@gmail.com, stable@vger.kernel.org, thierry.reding@gmail.com, 
	akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_093648_221064_172AA664 
X-CRM114-Status: GOOD (  26.31  )
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

On Fri, Apr 3, 2026 at 10:19=E2=80=AFAM Joonwon Kang <joonwonkang@google.co=
m> wrote:
>
> > On Thu, Apr 2, 2026 at 12:07=E2=80=AFPM Joonwon Kang <joonwonkang@googl=
e.com> wrote:
> > >
> > > When the mailbox controller failed transmitting message, the error co=
de
> > > was only passed to the client's tx done handler and not to
> > > mbox_send_message(). For this reason, the function could return a fal=
se
> > > success. This commit resolves the issue by introducing the tx status =
and
> > > checking it before mbox_send_message() returns.
> > >
> > Can you please share the scenario when this becomes necessary? This
> > can potentially change the ground underneath some clients, so we have
> > to be sure this is really useful.
>
> I would say the problem here is generic enough to apply to all the cases =
where
> the send result needs to be checked. Since the return value of the send A=
PI is
> not the real send result, any users who believe that this blocking send A=
PI
> will return the real send result could fall for that. For example, users =
may
> think the send was successful even though it was not actually. I believe =
it is
> uncommon that users have to register a callback solely to get the send re=
sult
> even though they are using the blocking send API already. Also, I guess t=
here
> is no special reason why only the mailbox send API should work this way a=
mong
> other typical blocking send APIs. For these reasons, this patch makes the=
 send
> API return the real send result. This way, users will not need to registe=
r the
> redundant callback and I think the return value will align with their com=
mon
> expectation.
>
Clients submit a message into the Mailbox subsystem to be sent out to
the remote side which can happen immediately or later.
If submission fails, clients get immediately notified. If transmission
fails (which is now internal to the subsystem) it is reported to the
client by a callback.
If the API was called mbox_submit_message (which it actually is)
instead of mbox_send_message, there would be no confusion.
We can argue how good/bad the current implementation is, but the fact
is that it is here. And I am reluctant to cause churn without good
reason.
Again, as I said, any, _legal_, setup scenario will help me come over
my reluctance.

Thanks
Jassi


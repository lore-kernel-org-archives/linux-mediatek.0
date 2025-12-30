Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 919DFE92FE3
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Dec 2025 00:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/OOpbynk6cMUYk6IoIP11teU4BYuiO0Neyv7rdgKSCc=; b=ck5rUP8nDUerZzinJI3njtfwGS
	E9jngoV/JKVYs2o+2ESxPhdwZqfeOJ+EQGNrn4sO61Cyz+c7ffc+WihxdnbEVBaIlofe9z1eo4pO0
	q/lhx4PePXjqp1HrKusdDFO5rF4L/uYoxosTNvOOecs3RkJ7nrcVszl2F94xUm7lIVAi+8qomLa2m
	36UnGN0Cr8BDIfNSVDjlyG4SZuvBf5r3p1R++cFXxF4mMlxyzxS3t90UGaTH+jFwvOvr13Ov6+MDj
	rk6KK//mOoVCSlroLMB50rpyTGvIeCSRED5J0PbRl84nrjfNCtURYWR2LTW873UVGwDQLHM4BBsgE
	u9qCJm7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaNnj-00000004BhS-3cvp;
	Tue, 30 Dec 2025 00:41:27 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaNnf-00000004BgT-43kV
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Dec 2025 00:41:26 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b73a9592fb8so1842430766b.1
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Dec 2025 16:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1767055281; x=1767660081; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/OOpbynk6cMUYk6IoIP11teU4BYuiO0Neyv7rdgKSCc=;
        b=c9+42AyPfRW9MChLw/v0rNTab8XxsvHZ+QnkOx984riGM138gfJrooa23Q4YLmnTYY
         B0zpeElDmUIzFDdOElSpWvJ/wWcAmgZezv90wOWDCOgEQ37JM4i09SGhYHUhl95P9uL2
         zVu5gwsWWErAFKukl3c7cdeN6tUGejahkVOrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767055281; x=1767660081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/OOpbynk6cMUYk6IoIP11teU4BYuiO0Neyv7rdgKSCc=;
        b=Z+Q/+dIcWejhEyMhjY7yCDPaMK9rc70DJJscq5s/+XHzi4mrWCHwGb+NcEOry1FoUC
         8590MDURu2ukkU+M9S/BCzckc+hfowMn5CKUTHRwS3fJ7VZMoMW19P8pAkuflRVFeDMi
         5M2OVM9+8rteJvn9yr6dohvMtTZ8M3xfo6wt9IYKdTv4u9yz3DOqUHxc9ypj5rlxZ8Xr
         923+e7oQ5l9UJI9kypq0PjcqZdI4VwjJJymK+z90pK7uGHz0pMxWYwtqBFdrOMCBse2r
         /tY6y6r1OYI3ITt6QIunQSe6+ErfVZSMFHSfy9LDTyLVFONEhE3/g0ORYeT8PEvSbeX4
         UKHA==
X-Forwarded-Encrypted: i=1; AJvYcCVHeXa2uE24tjMl17EMykAjrkkOb4eqiHR4CfbG2e+JmPmWtWSldXpqKmLMPC3dvTd2wH73K9LqqbvhioCXbQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRX+DHtr286F1oEuxjZqWbL/LJyXhHUEAP0TxqMvPFlcgJ/A6j
	Tso++uh+7rUoTrLfTTjifyKf+6SdnP0K6WEqGxk7uWgImpxCHd4JnMf8oUTo71FWL5w9QnM2BpG
	IjOt1NW4=
X-Gm-Gg: AY/fxX4SlmAiaFOOUjLJatuLneeRqnQ9ha/KomLxv7t/r8yuXPlrisCS/qmjVI23+Bp
	R535a3ocMrniW6aCZxcz3ISIrXXhnmzvwHIv5dFeUxHWM4PrKf+Ec6VCd++kJ2b3/U9CRmgO7u2
	CecuzPVdc00bXRsWyL9GyZatQpPM7nzodmMakj+KfZthsbgm8wINNGpdL9Ftup/veZeoMkb8VLd
	Q9kCTcOlcQYUqF5p4JSWpTovEG6N/vC/t3jfUUoS5P1MvWytWEfmNOi+gTiCRM+uxxBU/G20E2J
	F9c9AUGYLwNjdrK5tNxMZr4Q4o5qj05RQ48ffP7Zb+XxC9bZqOGJQmyI8rgsTeBC4NvK18M9pWb
	uc45dFUFGval+nBTlRmkmiSILk8aG3+3EgJJnmBqt/v830e3PA7JXqw5zrt7dF4mpU/hn4XNZR6
	IsdckXgFNC2lmMf61wWl5i14+1HUFipUxwvkLUtdCYWjtUvtbyZlAzhPUC9hbJ81Lg9lWHnSE=
X-Google-Smtp-Source: AGHT+IGMtLU0oKobwzcAQqRuaIQe7re+q/1Z3fB2ubODLf+637Sw2JaaYvEfVCh/NnMOBodCaCwJlw==
X-Received: by 2002:a17:907:fdc1:b0:b7d:266a:772c with SMTP id a640c23a62f3a-b803574c34fmr3474514166b.21.1767055281304;
        Mon, 29 Dec 2025 16:41:21 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8350268f86sm1144603166b.16.2025.12.29.16.41.20
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 16:41:20 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b7cee045187so1709751666b.0
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Dec 2025 16:41:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU0kwnSSik9DeY3YZl71uWfLzuPKKRZEU0I+97hoPYexu1BB1rxC/WtNlrYK0gskyevJS9YrNOFasEN2IKfjQ==@lists.infradead.org
X-Received: by 2002:a17:907:7708:b0:b72:671:b2a5 with SMTP id
 a640c23a62f3a-b8020400974mr2870792466b.3.1767055279778; Mon, 29 Dec 2025
 16:41:19 -0800 (PST)
MIME-Version: 1.0
References: <d7f3b00d-beec-41f0-b157-7cfb871f9a46@linuxfoundation.org> <756e3f65-b2f2-4da3-985a-17754a7a872d@t-8ch.de>
In-Reply-To: <756e3f65-b2f2-4da3-985a-17754a7a872d@t-8ch.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 29 Dec 2025 16:41:03 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjO-7uR5HBi-MFnkxAxjhpgfbAQ+HCMKPiXFVwM+AJ7tA@mail.gmail.com>
X-Gm-Features: AQt7F2oRj4wh9ZDjWvoh2Rob4-m_u3jMhQym1nFoxdYfh4pzw2gAPmxOpJxWfUs
Message-ID: <CAHk-=wjO-7uR5HBi-MFnkxAxjhpgfbAQ+HCMKPiXFVwM+AJ7tA@mail.gmail.com>
Subject: Re: Linux 6.19-rc1 mediatek mt7921e broke badly
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Eric Biggers <ebiggers@kernel.org>, Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, 
	Mario Limonciello <superm1@kernel.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>, quan.zhou@mediatek.com, 
	Felix Fietkau <nbd@nbd.name>, lorenzo@kernel.org, ryder.lee@mediatek.com, 
	linux-wireless@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, 
	shuah <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_164124_153146_E73CA137 
X-CRM114-Status: GOOD (  18.17  )
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

On Sat, 27 Dec 2025 at 04:25, Thomas Wei=C3=9Fschuh <linux@weissschuh.net> =
wrote:
>
> Hi Shuah,
>
> On 2025-12-27 02:07:24-0700, Shuah Khan wrote:
> > mt7921e doesn't load on my primary laptopn on Linux 6.19-rc1 and proble=
m
> > still there on 6.19-rc2.
>
> This should be a duplicate of
> https://lore.kernel.org/all/CABXGCsMeAZyNJ-Axt_CUCXgyieWPV3rrcLpWsveMPT8R=
0YPGnQ@mail.gmail.com/

Hmm. I wonder if we could instead do this:

  --- a/lib/string.c
  +++ b/lib/string.c
  @@ -113,7 +113,7 @@ EXPORT_SYMBOL(strncpy);
   ssize_t sized_strscpy(char *dest, const char *src, size_t count)
   {
          const struct word_at_a_time constants =3D WORD_AT_A_TIME_CONSTANT=
S;
  -       size_t max =3D count;
  +       size_t max =3D count - 1;
          long res =3D 0;

          if (count =3D=3D 0 || WARN_ON_ONCE(count > INT_MAX))

(intentionally whitespace-damaged patch, because I want people to
think about it).

It basically says that if the size of the 'strscpy()' buffer is N,
then we do the "word-at-a-time" only up to 'N-1' bytes, because we
don't even need to read the last byte of the source, because we will
always NUL-terminate the destination...

That would basically make it ok to use a destination that is one byte
larger than the source (in order to fit NUL termination that doesn't
exist in the source).

The downside, of course, is that it means that we possibly miss out of
doing the last word of the copy a word-at-a-time. But possibly not a
big downside, and it would make strscpy() able to deal with this case
natively.

The *real* issue is that we don't have a "source is this big,
destination is that big" version of string copy.

Normally that is a non-issue - just pick the smaller size of the two.
Except for this particular case, where the destination is exactly one
byte larger, and wants to be NUL-terminated while the source might not
be.

I haven't really thought this through fully, which is why that patch
is very much whitespace-damaged. Somebody else should verify my
thinking.

                   Linus


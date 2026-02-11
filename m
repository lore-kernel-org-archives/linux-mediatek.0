Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218D0EB597E
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Feb 2026 09:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IlqKUyiN0U3VYCZSh5wBhgPjVtteYN5T3q7z1E8Zpjg=; b=SVpwYAPAohZulyqbB5IuTi92hX
	yKkcnCGfIuMt5F2+GyuXtF/af/nxaMJaqjJRy9Oqz95+eC/3UchXxtU0KKV0gVvajh7pR3CxF/NWF
	8qihbky73Yex/ZyL9fnQ+CG6GLd3u31oHJiQhJ0xUXXcJ5yUc5CWT9ohi4aeoo5DrrIv5hXjKc8f7
	XJxwAxVmmvnCWegLBCo6iwHfXWPiZIWLd0moKdogQVi1z4zfVkwoTjgQqM2UlELeutDNsa+VRYkDT
	ndiG1wQWiRIdN3rSreYWolkuRzh0DIYXeBeS2iSaDc1fKlj7/EExHHkVxdTl8tWM7o4IZaxqlZ5xR
	RI81mwHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq66R-00000000PaV-30d2;
	Wed, 11 Feb 2026 09:01:43 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq66O-00000000PZf-3mfp
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Feb 2026 09:01:42 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-59dd3e979ceso5726340e87.1
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Feb 2026 01:01:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770800498; cv=none;
        d=google.com; s=arc-20240605;
        b=JsXZx0BudGs/otZGSgaARu2+9vXhVKgqKjX6mLCKZXnvmlKcZuNDGKdg1gkGjcYIDW
         Cj1TFkAhSbFiQ2bMh5lkpvx4CwUa6aSOhwSGcta7TPUR4vb8N7HmX027Tj0PYG3g2vkg
         I7MQGR2+Iu+871eqdZ1CaSLP1g4FuQRTWwcl5PCbGDn8N6nHkquO0DhshPfeAZ7OXuMc
         l6V/tXWVXR9/9rCw0KYrL29fVcUaB/IWyxhIHq3DJPi/0rvJgAdmpWlhjVgkOwveWevr
         ajyBH8bZZ6mtog5nAAFNAM6yiO0oIO5yghRvIl0JwF9aTa6jWBlmrT3TC1OMed/Z6jkQ
         mTgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IlqKUyiN0U3VYCZSh5wBhgPjVtteYN5T3q7z1E8Zpjg=;
        fh=szoiGU39T51v2rSt5TP5vFFnH9ee9Vr7MCtf+2+akak=;
        b=k/cMpPvRdPyBAXtJrMD3oI2ZrSpI9GJKsyvQzK0zfLZ6iUf2hM77iIpLkR/4kBhEXj
         SYV76SOVB5AYBMnhXg1JEp5kFQpWGjnQHpFMOemGyJWGaTkn2S+gtdGoV3YRylRs2977
         zXcc5jHZEAWrmHFfXELPodNKGvjj0vS2ds25Stofr9nqaBSAW7NyPPpM1Mb93688dLcp
         tixuHAa9AbU/iZCvRZrr+RyI+WbTGGB7vJiQJ6HWVuWnwKXGLJlVsGxXzMMog2FJ54oB
         4pp5UB0KvWx37xXebQw4BLwLzQUcAdf6NxnQ0Lxc98iYTdwz4jQ4BWk5eD08fbanDeE0
         90jA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770800498; x=1771405298; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IlqKUyiN0U3VYCZSh5wBhgPjVtteYN5T3q7z1E8Zpjg=;
        b=eVPxNYxdlwq0kAZiFxHY/An6yNjtEVK6191uzvKimIho7+GtsrZWos19BdGsp+XVAm
         ze3CSVQvuoStokMMyKTK3psWOeIzuaHXrdXpBJMo0E3cELvkR3PSzvpFsnZT1xGeQY9w
         PKHqG1sht0s8h6tAyNdIbAC9V6aHgjwVm2zcY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770800498; x=1771405298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IlqKUyiN0U3VYCZSh5wBhgPjVtteYN5T3q7z1E8Zpjg=;
        b=HK4P9m9ZVlDzycgfHSF94fZL5zA6wJG7ZBEq5YSXJ9r9ur2SRS+gCcBlZ+1GNzG2NE
         +SnbrGfw40NsVh6AXYga0IuAPV3Uy+XHmAmlb4QJcDOVzuFKLonOy7unMGJdsWXeNMLc
         k8EUQU2MXboBwoHPXjlcS3FnaM6JFFNwH7COpl9inPF2hmoPOlqDdE/59jP9Qht/miqp
         bTZhKISwI5xKiY6u8w6WA/fGO6mmiyzd/7JHvkT9XZ42oqW6G4eJv5e6k6wgkYMW2SUZ
         4Xu0AxbIIcM9wuBmq89/jduAU3JaYudJWbDVlnkEJYZLveWwUn4Qs4QMtDpI79aInYRw
         wQ9A==
X-Forwarded-Encrypted: i=1; AJvYcCUdBgh1R1oWbY0T+3PNk/NNf+V56y13FWjMVaWBay1IiBpZAGoy03fVksuMUJ+lMaMCfqWoiLgPjYEGMK0e5g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm6l7p3iNB/geSc3+So/okGj8d/Z9qWv48zJF9T4JbeGg3KwRd
	xfapZVFTk/sto0038o+mB/6XaNqMm59FMjdkEW27/AJjM9jfjdRS+PWowV79NJNL7KIQJmdY4aQ
	EMZmjm/KM+SBnREVt5HJDfWOV48Wrs4DZPZ4iUrsM
X-Gm-Gg: AZuq6aJz4tYmfSCi3rnm2XB1caBLeOZfRUTBeI52mS1op069x9HfbMwuvdi6bDvXVcf
	9Rjt18go9exBGbOwi4xHt2HGCW67VO8+01wDWbgpIn0WhmDi3n9893AOsC+8PP4/Np21Rq6GNjM
	AMVuJ3p6J17Sflvf2riKmcLWUzpD72RcyFDpOEC9ar6DwFY3YWq/Ptan3lunzQjRAMD948rhzZC
	sSqyOUyrO3hiY24sDyyBwiP5KF6jjFzvOC6SBx/IruRRw/lejCO2JXsyQXtO2nMXDGuR++uwPE3
	7U9qYq0pqB84TldI7Mr3b4+btsdpDXjcTAB8
X-Received: by 2002:a05:6512:12ca:b0:59e:1954:1d3f with SMTP id
 2adb3069b0e04-59e5c3f0c07mr635102e87.44.1770800498017; Wed, 11 Feb 2026
 01:01:38 -0800 (PST)
MIME-Version: 1.0
References: <8fa8ec500b3d4de7b1966c6887f1dfbe5c46a54c.1770746444.git.ryder.lee@mediatek.com>
 <69521aebefef405bad5117d4d5d5fef4a5dfb7e8.1770746444.git.ryder.lee@mediatek.com>
 <20260211-miniature-chital-of-plenty-1a71df@quoll> <bd4da0a8522db2991ec0844233efe068323c2578.camel@mediatek.com>
 <b00c8c18-930b-4cb9-975d-b15118bfc854@kernel.org> <0dceffe2e1344830c12bc1f6516d13c7bb488b99.camel@mediatek.com>
 <23561f00-9f3f-4d4d-81ae-aab9958bd797@kernel.org>
In-Reply-To: <23561f00-9f3f-4d4d-81ae-aab9958bd797@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 11 Feb 2026 17:01:26 +0800
X-Gm-Features: AZwV_QglW35gBJXxqkqDaU4LG31ARe_Nwoft0XmJRDrq9pj3jspIahr0OV8U4wA
Message-ID: <CAGXv+5EY=8Xta4OdnS9Skjx3Ls3ZnW7oNS38cK1Ch=wL6JJJ0g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: net: wireless: mt76: clarify backoff
 limit format
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "nbd@nbd.name" <nbd@nbd.name>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, =?UTF-8?B?QWxsZW4gWWUgKOiRieiKt+WLsyk=?= <Allen.Ye@mediatek.com>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_010141_027155_1F685EF3 
X-CRM114-Status: GOOD (  14.45  )
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

On Wed, Feb 11, 2026 at 4:41=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 11/02/2026 09:33, Ryder Lee wrote:
> >>>> Why this cannot be a schema?
> >>>>
> >>>>
> >>> Well, actually, it's already a schema. This is just an expanded
> >>
> >> Where exactly?
> >>
> >
> > How 1T1ss is used across different generations is what my example above
> > was talking about.
>
> Where exactly it is already a schema? Please point me line encoding this.

I think what Krzysztof is asking is why can't you have different compatible
strings for each generation (connac, connac2, connac3), and then have
conditionals in this document to describe in proper DT schema, not text,
the length requirements of each property for each generation.


ChenYu

> >
> >> But if it is, then this patch is redundant. Don't repeat constraints
> >> in
> >> free form text.
> >>
> >
> > Alright then, let=E2=80=99s drop this change. Felix, please ignore this=
 one.
>
>
>
> Best regards,
> Krzysztof
>


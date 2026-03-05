Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609D8F3D332
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Mar 2026 17:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/v7sICsM5F4xpYz64Tnfvw3weq5zyAxTy0YM7/lebk=; b=1GC8O18h/6zYs5bCOB8noYpDLu
	E8pBrFuxFfI8MhgtrOMzVeWBF6sAuz9Aslu1oStAdhhaC0uyG9kIDjyec/g9LuSmVXFrmaYgMyjkC
	wkNRNtgremioxttJLoMKFdk1aVGpuvBSZ+0DXkWUFS0ZXQDtuzeNanIzN1ilnp1wl8nIN1otYR3Fj
	c5SXGrYxRQD3RQNbLKoN8ij+Js3bUv/AC4bIMvmyjhYwBghia6ZGmeEMbhdJld6+eRbwk+jclc7/P
	WdYNdedhixL15D1XnSMQVOXTd3qb2OYOcFaBSKuGR0mYGXMyATKZKMQghW/uPGKdi8oo1PJhasGSp
	epKa0gow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCMF-00000002HDf-0B8c;
	Thu, 05 Mar 2026 17:19:31 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCMC-00000002HCl-0m1O
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Mar 2026 17:19:29 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-506c02ec1b3so92534681cf.0
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Mar 2026 09:19:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772731167; cv=none;
        d=google.com; s=arc-20240605;
        b=YI2Gl43I6XMV4xI3x/PIivM6RmnXqqeYHkeLyGq/51f+B6QYXau886b9n+0Y0lrAa+
         Y0TuolYGnaDBEbxz9aSU/cN3oohdlcFaVre2GKOMpTLRjX9t6n3lkjylPsBJjdVsy/ZF
         C8YMIgEZF7XV7Ed7G/0pV9z5Or2/K6Cta2OUMjyWrgS45PZiZfyPe1RxjV0W1HDMlWVI
         WKvnscqFVqr3O3czRWjR7tVJZSHpZVwKmzmsFqvrI61Y+oZPiVmRfFF3Wp//52Zdr5s5
         Stx8XipYGW3FMf0WUXTPAVAd6KRKXoh7OrRiONebHn8iZfcvVXGh8UvDo9O0DYkgowZK
         fzdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6/v7sICsM5F4xpYz64Tnfvw3weq5zyAxTy0YM7/lebk=;
        fh=E9bmWr3ffBG78qOXfukdbMfUj2+Rb7ygQcPwoaFdRfw=;
        b=A1aGZ46nzAsj9QiVn4mQ198a4hqBcggidsvv0nLhVUty2B6EveuonYS8e0Vittu3Ck
         MNXOmEJKm7Yr/zJjaKdyb5ySd5I+qJ5l+IhgxzuFE7lqIc8+FWlgX54YwKogEj1cplbz
         /xWzvJSNo2CQiWk3tX/KSez+0JwfOfztUeuFSDIwZj8XeOnbtrakCz65L8tchGjQyG0V
         MI4gSjRaRE8VyyHwUgVPKb8bwnIMeiT6zMdznf3IhzEuTEaE+KC2wIxBGShElq6OgsWJ
         NpcB2gorLem2nuYZ31jCAK9CJFxpaj14zzkkbYuBt8wrG5GDjoJ3B6CXBwgYxzfzhfB3
         PmOw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772731167; x=1773335967; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/v7sICsM5F4xpYz64Tnfvw3weq5zyAxTy0YM7/lebk=;
        b=ZPC6unHudgvF+JrrunV/aemjN+XlcRf1Z1xECgADQbhbYLZbuXkDmEw19ihmDjVruK
         LuKNqMKzLCy5s15wY2V4wTqPYsOeUFFzoOQdTCWFpSlRdQqhquynYn+E5aTexjxczAyJ
         98RHnsvmp2I3qD6JMVC8UxeBB5c+Zxir456jwW45dFScmiGb2Ipu1D1WeKsZ2rhi7qC1
         HZRf5npdftVcpwsPFMWUjxn9Fi2gNtTCyNvuld7BoOw2FFo8a9OsJ6cqlPq8mda5waTX
         Ntzash0nbNlKRMfZU5lKVi2b/XAgTDt+v/qn72SeN8KlrOXjk8JLD+uW17dYUGRUw/7C
         Ljqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772731167; x=1773335967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6/v7sICsM5F4xpYz64Tnfvw3weq5zyAxTy0YM7/lebk=;
        b=nm2YpEQh1arIS99nMODqoglADk684cXKTaAkNLkR68yQ1qtVKvto5r72I5FmSX17s5
         gkLEXyqtkoFangDhUEDNertuL4l2OAk5PK5Y6iEfqEkXoRNvB6gNukBRwHAkUpb+5sPK
         MpDymvbhcRz17eWYOwMO6iVk1aeqqMsipsfnbmxvH8AZqbJYx36KUWZ9Hyg/sNo2LuHT
         5PSf+iCx/WsxixVJ9CQrp18DjW1khsEocyIS7BqvrsIG0C2ROMF6wqt2lA7wUIwQyRNY
         iVXGLTVtGprGQRfeeRK2PgLbNgYDNuuT2FeLWF3PqHnzgRmkuqLCpkDU7iYAhxx8u5W0
         SGqw==
X-Forwarded-Encrypted: i=1; AJvYcCWn10ZQ8EX5nuLXYZM7G+zusKnnfp0D+I1dRGM08hzCcY4DTDJuFdKU7gCy6bKSi2Fn6Vp5oozXZu+cctKvZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzypGXA30CCKgQgkWwmR+9HWuGo+6QCXg4cWvUxBeP/LqHpNB8l
	98C3GmU0w31enpUcCDRYBX2pWf6wYOLcbzM98VPRVTfqTnvLYRPIXPvksjrcziZqgs8GRXhQnIc
	LUrZzdq4N78KMy4bgkWMGxmEItEd9yXYwI0JXN/4=
X-Gm-Gg: ATEYQzxn00BZGg32hPKWWIfr7c8tEjGeRsqjNokqL2wbscQqRCGgjPnSJhO5u0OaFWQ
	rZuIZj0f/YKbMZB6DngT1cnYZL2USRsHRJZIHJWlWWWFDMi9Nx8zo/mGmmI3c8ne0P4rKYgsfOJ
	EZOFv0F3l4BkPaJUETh2sK/5y6DtOOPgUgVc/+a4+SqePqDZibE+je94gwfq507tVm2SjYuQlpc
	Zjon6dWGdT6+4oNgSD6czGlsRJT852vXQVqsw5+mJSC/nWoPhZRfDvKAmxpPbuUiGHelOn5zzwd
	kTsfesBp0K7VHW0vTD6jGOKQNA==
X-Received: by 2002:ac8:5f91:0:b0:4ee:26e9:98ac with SMTP id
 d75a77b69052e-508e689f8f4mr36540041cf.16.1772731166518; Thu, 05 Mar 2026
 09:19:26 -0800 (PST)
MIME-Version: 1.0
References: <20260304192417.818211-1-akkun11.open@gmail.com>
 <20260304192417.818211-2-akkun11.open@gmail.com> <e8c587e8-61af-4ef7-b7dd-7d8da7b9aeff@collabora.com>
In-Reply-To: <e8c587e8-61af-4ef7-b7dd-7d8da7b9aeff@collabora.com>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Fri, 6 Mar 2026 02:19:15 +0900
X-Gm-Features: AaiRm51aWSWGaLr6s7woc0EGoF8GjUlJU07ZiwNqeQX-qHV6fBA6LMgRCpFcnX0
Message-ID: <CAKr_iV5j4fWSUCV_1M3E+cejXp0P5H8F2ah19=kOd+s=XFDCBA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: mediatek: Add Lenovo YOGA Tablet 8/10
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, sean.wang@mediatek.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_091928_235931_E8661A50 
X-CRM114-Status: UNSURE (   9.43  )
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

On Thu, Mar 5, 2026 at 6:49=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
> Did you really test this with dtbs_check?
>
> test with `make dtbs_check` before sending a v2 :-)

I think I did it, but I may have missed warnings or errors.
(I was sleepy so I don't remember much, lack of sleep is very bad...)
I must check dtbs_check before sending v2.

> ...also, is the "lenovo,blade" really used for anything (bootloader)?
>
> You can either fix that or just remove the lenovo,blade compatible... but=
 please,

There is no user of it, I'll remove in v2.

Thank you for the guidance.
Best regards,
Akari


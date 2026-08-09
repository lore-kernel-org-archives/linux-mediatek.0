Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 348BBC5AD7B
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2026 17:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rU7Duwnzym7o6H9C40VXv2V+HHIGH6Z448XVA54zyEg=; b=Aj5vGh53H6HulN0PzIAaR+19VV
	oTXvKrMikdBjjDyz1Cl49P5yEE4kRZ5NMHl9Wrpk3C8jiXc81xt9PPMoDvastuKFwMji39RPPfosc
	p6L05E0nqkyqOiQl745X2NV+Er3fJWznfNllRFZls37ekzA2W6YicYXAxtso0XXIu67Ymc1PmJWtv
	Jn9j1kkHr9YeLEVKWJQiskTgGwgnwF2EV4vJIqFUN2sKe0ZtQkSZvUWY4FEZ0igj9FfgzLiNOrntV
	36g8dXycIiNwqhgFO3g7L7p/etoPQa8nZu1cu849HmsoXKAnKOMdcB0S/S8hWt/QndNXGEdE8idoD
	aAsYb0kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt78m-0000000AXCD-2070;
	Sun, 09 Aug 2026 17:16:52 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt78j-0000000AXBW-23kg
	for linux-mediatek@lists.infradead.org;
	Sun, 09 Aug 2026 17:16:50 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-8f29ec73064so5552166d6.1
        for <linux-mediatek@lists.infradead.org>; Sun, 09 Aug 2026 10:16:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786295808; cv=none;
        d=google.com; s=arc-20260327;
        b=H4vdvEoXRqROOZComke0xGysVslTRlNsVW5pAgxB/BiKai9cMjb6XVKEIiRe/1REdS
         hQvEm5ukZNwB8SXQ4gZLfB/PZLrGdccAa+czLTjn7GTqN0diX7yHaCbPuqwIoLZTem7Q
         D4hzRNaniiacIkL89Uvxz+pASykm1mgAZ3fXsfMlUIMvOdohM4Fnp9drr4MifmpMu10x
         mKYZxTnqW1N1DHUdF7lkm+1fZ6vz5Umc6afqHKqMcvORw456ugKy3NJR3z4Bv+N20vQ8
         ra8fFlXMRjCdMYl3Z9LQu7ROYkB5b6lg72apqeLxv4qBiEMRWu/gIowg0SE2yFgt3yM3
         KOuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rU7Duwnzym7o6H9C40VXv2V+HHIGH6Z448XVA54zyEg=;
        fh=fqGAgdkdt8iicQmaBdD8Ko2qD4ZyC9AfAyYdWt7vRQY=;
        b=d0VEmScPgwxHOXL0pV2WB3phBWlLaNInf9wjUBcBmhqfNxJep/NolGqcEf9Yv840lp
         bqfLJHY5cKHBZZYC+73nwNwh1U7UW0sHBjCst9M9ry7wBzyUK5B4A3y6YJ6WzWoxDPRl
         knGqM0iA1z2aEQSz43mRjfhJChoj0QtCgQhb8aLB0mVNIWG2kUuU068c5XDJO/ogCwqZ
         mlXRZQ8u7k5zUDOXpMA+xWBewsSvrWGTMWGfzYuzpQfBrc0qQNdjt0lRhIGqaUrTU1Xw
         lmqYZTSTav+S6Ks6WNRaooPO549cBw61rvMhhRXKfqSoR0dYQI+dz8aBl2MiWVMhMcjo
         DFNw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786295808; x=1786900608; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rU7Duwnzym7o6H9C40VXv2V+HHIGH6Z448XVA54zyEg=;
        b=Jc+0xSZ/nvbS/c/Ffny+BesxqnlclrfZ7gD3cJn8ajWz4Bpwld9pcOkFDpmOUO93Ri
         Zz6ObrWBY5h4JcbcwmcR55wIr5hedTwGaLINZgvDCpmjxZDoyisLIseBL5veUl9jp5k4
         SU8pQVTfm8aVVODLY71fKTzc5U/rYH5xhWIhej1IK9zuOG82rVH280UlsVx69j+fbNce
         PEEJAcBj8C3km+Zaf2kyAKTd2Amdi+Kg3sQ+goFEjLYdCGRuhXipYVCrwGW5FkFGHIRV
         dJjjlfFZNGNEx6KRxKctLsIdPdF4hmtoHfCTr7jv/gqP3gspFhHCFiucf+WToHfzUrDm
         r2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786295808; x=1786900608;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rU7Duwnzym7o6H9C40VXv2V+HHIGH6Z448XVA54zyEg=;
        b=mFbprz34J9X3vKbuGgU/Jjuyc/nnmDOXgm4mpOjLn/sT6YFhViwNZN5zrJ3tIFUxuu
         w0bOtJY4I3vbFHVm793FjQzJimK9SpSipNgGfNf29pJOF9h1nkthGm9G3T/WiLzdRkG5
         obYWb9CVt6QhyEhN3ZL7gvknmtVcgMnf6XoD7lCHgumt6cV0AU9qZ6b19FOr0iQ/C7k+
         pgDPjds7cs//gUsMHdLIz8ojxC3Q0lVuJWixx4Kslkb2ZIM3z1KOI00JndBrnIy9AJOs
         +vfbZY7CnCbLnAnMFmVqhKuDbBYeA9Vx9GXXwhUwoe3REU58g6Ucc0Jhy9BBb5q5Xw8H
         uQxg==
X-Gm-Message-State: AOJu0YyNYQSYFS5EnX0ttBZ2MyMCfTwI9buOtfRXRKDLcJH1Iz9W19fQ
	jVKJLndJta/+X+g3pzWquADqNXzmUBh9x6VIFH/ila2ALidwNJvNJNbSrNO3CZv/IwL4PaKOSn7
	IErdui3OTBMO79wmIaOIaa9wWiIkrHDw=
X-Gm-Gg: AR+sD10MPiEwGE+RiFC1PF8l0qCnwJz/JRwYubi5Gzn6v+6KsGhEaZGQWObytFcJzeK
	Gfrlc+Hv3hIQG0kUNSfS6bRYLqgSTiVt9hzW2OI3b607Is0TdbgnjrYX5PzbDyCbGaIkn0l2FqI
	nBFwMdUuM2Yp2pd9TxBfvrZ2K8Nd8rHPnAP0VSCq8WyZh2gliwnZouM3b54mW1XcLWGPUNanf0y
	CyDyzNBf9D+4jTe3os/36ahOYKuiWB6CmdeaA4g1HcWHs3Iteh9b76U/EV+H9tg60hmKzM5es21
	uRe7Os78FGJ8bMDKck8AtXWo32AzX1NbV247JfGnE26Zt7wQI1gltfzVyzjDwDk=
X-Received: by 2002:ad4:5945:0:b0:8ea:fb8c:2e0a with SMTP id
 6a1803df08f44-908813800camr422497886d6.28.1786295807862; Sun, 09 Aug 2026
 10:16:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260809160643.33991-1-l.scorcia@gmail.com> <20260809160643.33991-4-l.scorcia@gmail.com>
 <aniv5B4jz07mI70D@buffalo-ssd> <CAORyz2KJMY6OvFQEB2GU0P7CkxothuXOCXgCcRvtiUhhPaK1ig@mail.gmail.com>
In-Reply-To: <CAORyz2KJMY6OvFQEB2GU0P7CkxothuXOCXgCcRvtiUhhPaK1ig@mail.gmail.com>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Mon, 10 Aug 2026 02:16:36 +0900
X-Gm-Features: AUfX_mwSw9EQyRpwAxS44Dmd7O80H1Xy4wdfZq_kCKddFw7XIYHyFdFWMPL0V3c
Message-ID: <CAKr_iV5oi5VbnXZD-7b4XCaUuimavqYNBDO=2oM39JvYwzkwmg@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] arm: dts: mediatek: mt6589: Enable toprgu reset controller
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_101649_568762_F295EA93 
X-CRM114-Status: GOOD (  18.60  )
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

Hi Luca,

On Mon, Aug 10, 2026 at 2:08=E2=80=AFAM Luca Leonardo Scorcia
<l.scorcia@gmail.com> wrote:
>
> I apologize for the mistake - if a new revision will be necessary I'll
> correct it with the Acked-by tag.
> Thank you!
>
> Il giorno dom 9 ago 2026 alle ore 19:04 Akari Tsuyukusa
> <akkun11.open@gmail.com> ha scritto:
> >
> > On Sun, Aug 09, 2026 at 06:03:27PM +0200, Luca Leonardo Scorcia wrote:
> > > Enable the toprgu reset controller feature for the mt6589 SoC. This
> > > allows generating reset signals for the 12 subsystems managed by its
> > > top reset generation unit.
> > >
> > > Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> > > Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> > > ---
> > >  arch/arm/boot/dts/mediatek/mt6589.dtsi | 2 ++
> > >  1 file changed, 2 insertions(+)
> >
> > I provided "Acked-by", not "Signed-off-by"...
> > https://lore.kernel.org/linux-mediatek/amEBgRmQktZ44jc1@buffalo-ssd/
> >
> > PS: I am also fine with this patch carrying my Signed-off-by.
> > Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>

Sorry, I made a mistake in my previous email.
The Acked-by I mentioned was for patch 1 of the series, not this patch.
I did not provide an Acked-by for this patch.

The Signed-off-by was not what I originally provided, but I am fine
with keeping it for this patch.

Sorry for the confusion.

Best Regards,
Akari


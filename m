Return-Path: <SRS0=sDSL=4F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B6F0C7619C
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 03:21:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6116522522
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 03:21:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kj2eRiNZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="t5eF1GPF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6116522522
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IUnHJlT4hMe2xpxphEeqioN3PlI4punjN3z74JcQYSk=; b=kj2eRiNZPfysWu
	KnJtIOKORmaGgs343ycfYnBkSUQNiwsen8DsldudhSENTIXn+gB4lu/AajDmdJp9Gb3DWMypaz1D8
	CrcIPUitHylp6OQ4WIOohYRXAaboE6YPrtd39r2jXzcG/1vfxpS88U5GjjjTm/834Q0+94JoFAhD+
	GFpjSYbXTDdKnsCVg0iDnQFkzrM4V7RhOEOC0j6snVQGKQHYzoLiPfr6Ze4V7oAYfduZ4NIJ/+GTA
	DIZHI7jmTuUUu6FzghUZTZpuKrpUfrfEpf9HSXNWb3sXV6kOcEMv/cj66gFeIY1V0Ef6hE/Yu79XO
	e3xYPDjo/X6PvaDoTkbQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3WyV-0005V1-3Y; Mon, 17 Feb 2020 03:21:35 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3WyS-0005UJ-9L
 for linux-mediatek@lists.infradead.org; Mon, 17 Feb 2020 03:21:33 +0000
Received: by mail-io1-xd42.google.com with SMTP id z8so5319385ioh.0
 for <linux-mediatek@lists.infradead.org>; Sun, 16 Feb 2020 19:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+kmg82PrP5LICQsxhHiVbN5R5NBrtOLNvQPwne/NGOA=;
 b=t5eF1GPF6GoODdlqsDLhBm9YZ93XeswOThOt26rhz68lYQtokb/vXMws9molPaNGgn
 YCzOzoa4OJo6ampwllRBwhc5V2yPxbfiAVCz+I1MVhcXgH0sClaKrchJASLbszzXDUc5
 PcKhaD5sp2Sny4fXmTCuj6e69ZrN5k6XoHp1YwNl2Xe3sHsf1drXgW6CMzXCk6358oVS
 f5+s2M0Hr2BmZ3zq8SGg3NkgrcKyQNCwtu34tk6FDP+xLSk5ABatZ9hwybmW6g0VRCur
 0g3whXZ0pdOD5SUi4ogFS8o8RGJpUzUaOmyI1a4Pj/3IQUZLw9vKtn8equ5zxAKJwZA6
 EfAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+kmg82PrP5LICQsxhHiVbN5R5NBrtOLNvQPwne/NGOA=;
 b=BKad2yzMsJ4xWKNOICd5WGV+lJuphFoI18etnxAN7CivL6yo1UFXUmTr/sr5oJ0/uA
 IvLGeDB33OdHDSKxAUjFe5rYK8mW5cMwnVPnCKO6N6bup/vzZmdTUfs6tlatiTEccj6V
 pczU3xJfnPbgkBn5coD4552Ukzmy2lC4nW4MU057AF+9BqmGo/rbxv4vc9fFnfsu1QMV
 XuvigtcWjEKkYpla3KcOmzrHGS4e5KU/dExdNQ3of9XQWoiA0fZVKiyvDwz5U24mFhma
 EIWlRLn+rYpD/LcUclPwIMWKem/66H+z0XvC4L1tKrrSzxM2yL+zzYvTvUugcxQFNIX1
 ccEg==
X-Gm-Message-State: APjAAAWQCrBARNvlFayyINrloS93hS2Ru0JGY1nUlsroZ3L8n23oOQGQ
 YH7RYLAKIAzd0PXhRRcRPokTFs4LsvqlGNxy8OtPvA==
X-Google-Smtp-Source: APXvYqyaPVYhmq/h7UBs6n0tcjgftHnCsB9jpo4a+DwPuDtd3EIywxxxx8zFkzSw8qKGVwWf4dYIvkD+9m0g64cglr8=
X-Received: by 2002:a05:6638:538:: with SMTP id
 j24mr10587053jar.12.1581909688631; 
 Sun, 16 Feb 2020 19:21:28 -0800 (PST)
MIME-Version: 1.0
References: <20200213153226.I477092c2f104fd589133436c3ae4590e6fc6323b@changeid>
 <1581664042.20487.4.camel@mtksdaap41>
 <CA+Px+wW0BWz0-8L_UXJ-OYbwG6W9vmCWRr7kevpk0yokp+NKKg@mail.gmail.com>
 <1581669243.29925.13.camel@mtksdaap41>
 <CA+Px+wUacX+HbgLTSjAuq0feoeYNb5pp=1w8C4_zm=0jGVcHUw@mail.gmail.com>
In-Reply-To: <CA+Px+wUacX+HbgLTSjAuq0feoeYNb5pp=1w8C4_zm=0jGVcHUw@mail.gmail.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 17 Feb 2020 11:21:17 +0800
Message-ID: <CA+Px+wXQGh3rX54TE8Ks8tfFhHPQXUV2PhK2qzME_LFQ+USUQg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: fix race condition for HDMI jack status
 reporting
To: CK Hu <ck.hu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200216_192132_349509_985E125C 
X-CRM114-Status: UNSURE (   8.91  )
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
Cc: ALSA development <alsa-devel@alsa-project.org>, p.zabel@pengutronix.de,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Dylan Reid <dgreid@google.com>, linux-arm-kernel@lists.infradead.org,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Feb 15, 2020 at 7:59 AM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Fri, Feb 14, 2020 at 4:34 PM CK Hu <ck.hu@mediatek.com> wrote:
> > It looks like that even though sound driver is removed, hdmi driver
> > would still callback to sound core. This is so weird. After sound driver
> > is removed, hdmi driver would callback with codec_dev which is invalid.
> > I think this may cause some problem.
>
> Will do some tests and get back to you.

Please see https://patchwork.kernel.org/cover/11385055/ for the
proposed solution.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

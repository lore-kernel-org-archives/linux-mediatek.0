Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8610D3C920
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Dec 2025 15:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3oM7C5JKk0bBzWgIUK1EKF/80L5/WNgj6mhCv2v/NwU=; b=US2BUyvKk6PRsIEFxNyHR60V9J
	ua2Jff3c+gBE+dJDhYu0vH+eIVgRAoQAt4uRQYCHNvwA1QVO8DiBoSmNRipOKphg2aSyXwg368Qch
	vp4APYFr2lUBLThbHlVIlxQsms/+A179d1ozbLFiy5ESI4cHs2o+hl/bc7hBImpLx09h3WBE+rwQv
	fBa7g1jezH9W/XCDT1WD3BzGxn5lj05PRiMeUH6N7sTWjYCjsHldUxK8aTGvgyHvEsT2i/sRyOyUY
	OXknNqTpH+igC1qNJJrXeCEY6WND260+RZGskyuA0DkH1E+22LJe9zrW7O32YANGWMjqpTphX6PaW
	ewpsvIvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTM99-0000000FZPD-1KBi;
	Wed, 10 Dec 2025 15:30:31 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTM97-0000000FZOS-10SM
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Dec 2025 15:30:30 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-59445ee9738so5776372e87.3
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Dec 2025 07:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765380626; x=1765985426; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3oM7C5JKk0bBzWgIUK1EKF/80L5/WNgj6mhCv2v/NwU=;
        b=GZ4nrx37N3jwQrhIj19LtyinoqblsVOcFdjDuS5vm9i4mYvhGFJ7WTYKiPOL4LKT92
         xhuAKskxkFcnZmX8Y/UhX0t259sDoiwJiu9DPNcGRWsoHWBoubhfpj9gggA0ylsmuoQY
         3dYdL3TUXSPYabSJVdvuLYxSvhdy66/Nmiy6NIJv+0lcgHsKwbBYU55c59fJ6CEROSVx
         QIPGNp4FCJlECPZdotY/9VYpu4uGGg8bl1aIeZMYEvMVgj5R87rTs2V0i8v+PlPjEri2
         E9ga4h0p575EP307pKYRQ5o31hAM1wQKtyiFWQ6In9QzUDmqsoEjjVzV8s8SG2wQyKou
         ZJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765380626; x=1765985426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3oM7C5JKk0bBzWgIUK1EKF/80L5/WNgj6mhCv2v/NwU=;
        b=Qyfm49e1a967kF+DIGWdoctOIsvtGsUcLJp4kMwn+1WkQO27ZvHUkOuzJaVymSymSM
         MB6PC0sd922a96NtRqHfrEs6+5/W0Uw515ypGuoS5RDmcxahRyqwN9DuvRkLSZW1ERJg
         rYQQ+6D8nxuKvwAAv+rDHiVix8JzZQ+IjVrz0hddXmrLfit8CbwSFs8bcaMfOEdsJGHo
         bIdIwJ/GKuwbdsPqIwj8N3610Yq3k2G18FPKoJLKX2Lv6/oWaAOi3QJG0/KBME/Rvs1O
         07LE/E1nEt79Jml2fhvSxsWuSVFxPRzgjU1e3HZRCPBOpJuCs0MeukTnb/oflf0nfIG8
         Yc1w==
X-Forwarded-Encrypted: i=1; AJvYcCWbiScTdFeBINFtniPJimoat03SRLA4Vmx7JNGTn+i054p4gA3V4NRAM2e2iGk2lgtwGsMBxL4VVL3rK04Wxw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyD3J1tjS3Faihj4tVQesQsXsu7XUHDdQosENbqWKFkdwqQrck6
	PqSZXXVhKxK/t0i5HGw2/kDtAkPAo5/6CXONqt9Xc1pqXcdDRK/T21nCjoHpnN6sJLuNzOx5JIA
	sK1EzfSpM6O+/kKGCt/PwoxZHIHMggdi4jtrW8AeUxw==
X-Gm-Gg: AY/fxX7iQQ4P44PsR4slyS+cr7A/idbEtTb9srv/lStwj9sX3FGFJNRu+IRuGPmdQib
	rLlIYjv0omTma/dism7sxI9fOThJ2i/FpgcHqrLo5tr7I2PDbdYeVkV8VdOpH/PqMmrHpm158zV
	YM+I2sPeXVGAUcIURnERFI2W7wjxRMRgXmYSeBW3f7eyjck3IDSVcbooSeOeHSy1xvRNatVGtya
	287opzplpnEbtA6i27cSpAphFL2SxNnDDrG0Wu5qoRhB8qDom7UwMkGMDNBEf+OfyuPS3VaerPl
	4kDNQSqS4UGdmWR+MX40BxzIvCe2
X-Google-Smtp-Source: AGHT+IEYPLumSLiqv9vm35UuD54sgjwSHWM6ebmAu9tuA8+ywHCPfhWkSszStzlqK4kPNAby2b3RcjziCDgwx+M2Kvw=
X-Received: by 2002:a05:6512:15a8:b0:595:81c2:9920 with SMTP id
 2adb3069b0e04-598ee4dbebdmr1141791e87.27.1765380626523; Wed, 10 Dec 2025
 07:30:26 -0800 (PST)
MIME-Version: 1.0
References: <20251107141303.223254-1-marco.crivellari@suse.com> <7e24110636db36e8c0a877d90d2ed9570c4aecf5.camel@ndufresne.ca>
In-Reply-To: <7e24110636db36e8c0a877d90d2ed9570c4aecf5.camel@ndufresne.ca>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 10 Dec 2025 16:30:15 +0100
X-Gm-Features: AQt7F2pXItH5geVIbULqaw0IgXchV7ZnVe5Ou6Cc5C27xz9gAGtwoAoMzdHRMko
Message-ID: <CAAofZF44pUoyDPnnv9UUuMkYvqiSWP4gELg4rutgo=3tNpBZsw@mail.gmail.com>
Subject: Re: [PATCH] media: platform: mtk-mdp3: add WQ_PERCPU to
 alloc_workqueue users
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_073029_310220_41629BC5 
X-CRM114-Status: GOOD (  13.55  )
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

On Tue, Dec 9, 2025 at 9:57=E2=80=AFPM Nicolas Dufresne <nicolas@ndufresne.=
ca> wrote:
>
> Hi,
> I have to admit, there is likely no review here due to the lack of knowle=
dge, so
> in order to help educate myself (hopefully its not just me), can you expl=
ain why
> the new default of WQ_UNBOUND would not be a fit for this driver ? After =
all,
> the author didn't care and didn't make a choice, so I feel like its worth
> asking.

Hi Nicolas,

The fact is that "alloc_workqueue()" without WQ_UNBOUND it means per-cpu.
So what we are doing here is just make explicit that the workqueue is per-c=
pu.

Currently there are no behavioral changes in alloc_workqueue(); in a
future release
WQ_UNBOUND will be removed and unbound will be the default. But as for now,
it is still per-cpu.

We can of course change the current behavior and I can send the v2 with
WQ_UNBOUND instead. Looking at the code there are not per-cpu variable and
the workqueue does not have the WQ_BH flag, so we can convert it if it
is better.

Thanks!

--

Marco Crivellari

L3 Support Engineer


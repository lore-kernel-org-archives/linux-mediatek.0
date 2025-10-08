Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9EFCAC5BB
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Oct 2025 13:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/IqmJxYbXkGUJafgNNovCiyKceh2Ks0X8PZsaDhrLHg=; b=YSUBs28LLRglTwID99+nz9Ay9T
	WDamjQF1/RNQAEAJ0pvnhLc2mH2elMPLtkt0SZP5FqsSNTnwPVhAKyhAf80q9eq/kuobLoJUrEIY6
	K1TEew1Tw2ghyB1oJ04Kx7V9NpSLJESOhp0GHa2amMYee0yPzDCQvWAxhCBIi2k8/c3W0s/qWvLvo
	N1YoX2HGKDcJl6Bg0tLJhRdOHWF3CiNNGAkdEG6zmbbDZ5DQRBKlQvynV5scAfNv8EQD83SyaRZ3M
	gM/D4HzzInGS3I0BLwpazRgpnXqcFbKy5l6C9nbva7sL9VN65V/VL1Zehg2S3Hd245hia+H56IBwm
	6pxi5A/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6UCV-00000003w1a-2ism;
	Wed, 08 Oct 2025 13:27:27 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6UCT-00000003w18-11mr
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Oct 2025 13:27:26 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b403bb7843eso1054866b.3
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Oct 2025 06:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759930043; x=1760534843; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/IqmJxYbXkGUJafgNNovCiyKceh2Ks0X8PZsaDhrLHg=;
        b=N3zKloq4eqpydSwLjQp30Xf+vF7uxsm9qZ7O/xRAbrZT4fqyuCu68gIHzj/Jpq/CBh
         tKhmdy7nbZcltsSHPRLy2OOe6pgLiEXOVz5nZEor3QxJi/EyjAY5FquMK7IvEr2kxVGc
         8MExnRBikPiO/YlVCoMdD0ErAZll6A7yNtGMP87RQHD/iQyPaDRzaOeaY+SEL6uICWK7
         zKonAz+alBc2TaouzWXNuwu71hDsu+6ZEGrUDUOVNyf/4AErZ0fqiLbb9geBBn3s0yq1
         FcHw3pNtMJ9HK+wqrgnRMfwXlAclmdZAsvL4mrRioXWocUkYeKxATtScmwDGnH/8r+xS
         /tLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759930043; x=1760534843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/IqmJxYbXkGUJafgNNovCiyKceh2Ks0X8PZsaDhrLHg=;
        b=sYEJNYDzelIgxEEtiQnr3nzypL7isu4nPi/Mk+iKW6etUUbw668+NldSPZRdkhejnw
         mq0/lowVgfnVjjpbMstE6jii4SAaTQW4ANhws72+Wy/3ouw+UcCazu9W7W/4RzdjyVn5
         a72AUff4ynrKt67TWXUVLS+IVb8fXgF8c8lRQ5uma0QKq1dgFdeH1jVdIcfeQXA1AoDz
         uJMjDHuLvzk8E8YC8v4BbqMm0qMlNW1vtjpdELLCS/7tgiyxF3I05jHt7ufJLLn6KNcx
         j93eJzr6HzcXBYqPmWhKhEYmcWDsxkBml+DM/965+IjaX7063vOWsM3OE6pQIXfSVRmG
         iMQw==
X-Forwarded-Encrypted: i=1; AJvYcCW351jFsA6TS9KVR5lfcFRL5Li4IvHIN3CUgD898L+HNtb6a+jQx6WiOxEOuZNxBsWapIlhjsx9/p3IG1d/Aw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxodcYf4R0JWtT9qKuuObPldhyJluty4SK9Jkng6+Xrb29Izvlu
	HXafMdi/rOnR6hofzEOrqqJhjgQ9EqtdQ4iBWu79M5eWwjH9JB1iV3Fu7pj125GQ++V5wSzy+WB
	ihWQMzSQyW6uF5EJsQWcN2wNQiOyCRhxPVOsv
X-Gm-Gg: ASbGncuUawj8E+xogeqC6+IxmfebM0ytCbZkkV4zd2k/ExkKtwhmK67gJGK4mkSgD6E
	5IsQplmwYXbP7cYgkaEW1xhyeC4rfS7cGrlX/nuIRg5eWCtivZao8V2+r5P3BW9+pOOQNGGVVl0
	8QflqMOZTORDFldQOMZiy+nRc8jGoIaglVmBolCbhbQICtDzb8Ceqn3TeqweGcxlNpx+AcFCFAL
	agRs1V/vIc2F6J32J4uHmZdc/72
X-Google-Smtp-Source: AGHT+IGtJ3jgYS7oPpguD0YA6ZhtC3wC1OUit6lk2wQGBVxISV94tnsyrtpc9yPU/HqjXfGT1Y+pevkAgWHeTxVbv1c=
X-Received: by 2002:a17:906:c153:b0:b46:35c3:83fd with SMTP id
 a640c23a62f3a-b50aae96556mr314316366b.29.1759930043185; Wed, 08 Oct 2025
 06:27:23 -0700 (PDT)
MIME-Version: 1.0
References: <87bjn6fgr6.fsf@gentoo.org> <87a52n1xvv.fsf@gentoo.org>
 <dda63a6b723d31f41e6e275ac7f38d31c6715fc8.camel@mediatek.com> <d0a06fe1-abd0-49b2-8867-6c01d6551e54@gmail.com>
In-Reply-To: <d0a06fe1-abd0-49b2-8867-6c01d6551e54@gmail.com>
From: Matteo Croce <technoboy85@gmail.com>
Date: Wed, 8 Oct 2025 15:26:46 +0200
X-Gm-Features: AS18NWDmEhUMBJE36cywPVgrOf9iPqSdrOLBHTFGScvseC-Phs7Q7qbvrnVFBg0
Message-ID: <CAFnufp2pbBtNnVrEpxbkKzA5JhRFRiD-7Vd8ss9fLbYW39Jqgg@mail.gmail.com>
Subject: Re: Regression in linux-firmware-20250917 for mt7921e driver
To: =?UTF-8?B?QWxsYW4gV2FuZyAo546L5a625YGJKQ==?= <Allan.Wang@mediatek.com>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "sam@gentoo.org" <sam@gentoo.org>, 
	=?UTF-8?B?TWluZ3llbiBIc2llaCAo6Kyd5piO6Ku6KQ==?= <Mingyen.Hsieh@mediatek.com>
Cc: "xiangzhedev@gmail.com" <xiangzhedev@gmail.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_062725_309218_9DE118D8 
X-CRM114-Status: GOOD (  11.07  )
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

Il giorno mer 8 ott 2025 alle ore 15:12 Matteo Croce
<technoboy85@gmail.com> ha scritto:
>
>
> On 22/09/25 10:24, Allan Wang (=E7=8E=8B=E5=AE=B6=E5=81=89) wrote:
> > Hi Sam,
> >
> > Would you please try "insmod mt7921_common disable_clc=3D1"
> > to help us clarifying this issue ?
>
> I confirm that disable_clc=3D1 fixes the issue:
>
>

Looking at the code seems regulatory stuff to handle the power
depending on the country.
Am I right?

Regards,
--=20
Matteo Croce

perl -e 'for($t=3D0;;$t++){print chr($t*($t>>8|$t>>13)&255)}' |aplay


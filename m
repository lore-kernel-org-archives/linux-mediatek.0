Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EAE2C43217
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 09:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=stK0AWcx/AZ01b7n2KWQ9iHqc49fEITiVHxzybb+U1o=; b=BpAMugYgFEddZfxDcP1VnmOkXW
	7+odO4orQ4g2r5P6loaiybyVEfk8yHf3F6jD1sG7oT9E0W1BFUBG9W1rl2YV9VxFi88WqFg4Ic92N
	osjXY+JE2KcwBnM6+Ge3Kd+/QjQ37rIRutNZRdHxVMae9oz8tIVAlL709Lh2J02OCo2Bhr8riGs0e
	6uLglmYkD3aawUvwQ0qR0hC2G/lkTKw799hn9jpMqCPek3V+leZDRooiMPV29DIUOSfngwAe1A4b2
	o/XUKut4bUcHQ0ZVT1dxDSygoRgF1GxDIsNPENWSx+7NgAGIed3HiFERR/aqa2WiLP8MW62edx93C
	/izsZ9GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olo76-006iSx-7j; Fri, 21 Oct 2022 09:14:48 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olo6n-006iMb-HK; Fri, 21 Oct 2022 09:14:32 +0000
Received: by mail-qk1-x72c.google.com with SMTP id j21so1612492qkk.9;
        Fri, 21 Oct 2022 02:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=stK0AWcx/AZ01b7n2KWQ9iHqc49fEITiVHxzybb+U1o=;
        b=cskSjnwyJ6vHbgNG9yaijetiCA+RXGT7xI8Cp94+Rslp78do1CSrEKBFvkE7yzTaEb
         g9OQhPw15/9gQWBB+7QkpcnVSKo+ogPdChR0uxC19MJsRS9BlcLuWLOf2FFc6QbzA/DE
         Tf/tDKM0DuLzZgkKLqPu2fr1Y7kBpha/kjmbnU3ORoji7WNwkFVahWUSgpFApHfnIUSS
         Dircv1QvpkYHxk6BplB+GbekZVzQmtmucBwbPf46V72kMfFKa2lTwHyY+EcEViPVc0pO
         kEb0aec3tRZj4rZqKzklgGc+CSwohgpN5HsLEF0IH2ymj04Tl5HfqAv8pjCp4B69tHYG
         l5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=stK0AWcx/AZ01b7n2KWQ9iHqc49fEITiVHxzybb+U1o=;
        b=GkbLDCJG0HQKxI4NJGVFOSboUMuc9uEUJqGFw9BaYtjwVkO1fg/BnQhOYzGcvcNTkS
         4f+8AgKs0p18/Or5HbqDTb8OeDx5kNl/PVe/TpvZRRQfx5UIs1tYFOEQCReSskgd92+k
         RhwYyy0HTS9nIyQO997/9zWZlyoPma4DMLGyiGU1gKvo65TXSA2xEgu1HN5tPmbpp7Gw
         N1b3JYno3j3OCll9Kjb2VMfnDqurMVyEZs0MyaoC/GifO3wo2RJzJR5eYEdFTvBBPFXa
         hEOksvPi4QPVwHByAz2n+3aAnwKQ7IxJChxq8PU0w9NM1b0naglAuK9VlWrU7rsqUJGv
         VLUA==
X-Gm-Message-State: ACrzQf037icyvG2NwuA/JCl8xOqMO2StQ90966gBTAmPnp+9K22Al8Kp
	4WfZTjx3IgBvFmDQIehERpGpVu5c6kDixYbER24=
X-Google-Smtp-Source: AMsMyM7cGoFHzxKL8B63R5Hkzf07vJCOm2dyRiGss62iQSTcyCB58ibn0DTDEeGKOMo1Ul7D3LAJn8NQ4gg753pYHdM=
X-Received: by 2002:ae9:e848:0:b0:6ee:92d5:94e4 with SMTP id
 a69-20020ae9e848000000b006ee92d594e4mr12931849qkg.404.1666343668326; Fri, 21
 Oct 2022 02:14:28 -0700 (PDT)
MIME-Version: 1.0
References: <1666318661-11777-1-git-send-email-u0084500@gmail.com>
 <CAHp75VeMvWycVsNPHb1cvMbtVSCiX3m9wUsZk7HkPU+e=VTb3A@mail.gmail.com> <CADiBU3_m1gDgZxyo53UNvDP8P5LpFgpV+mBbw9+_epYuXimqWA@mail.gmail.com>
In-Reply-To: <CADiBU3_m1gDgZxyo53UNvDP8P5LpFgpV+mBbw9+_epYuXimqWA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 21 Oct 2022 12:13:52 +0300
Message-ID: <CAHp75VeWMSeZiq6vUo25hRdueMbeEEQuzPqR=-ROsOufK+27LQ@mail.gmail.com>
Subject: Re: [PATCH v2] mfd: mt6370: Add the out-of-bound check to prevent the
 null pointer
To: ChiYuan Huang <u0084500@gmail.com>
Cc: lee@kernel.org, matthias.bgg@gmail.com, chiaen_wu@richtek.com, 
	cy_huang@richtek.com, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_021429_650791_63145632 
X-CRM114-Status: GOOD (  12.24  )
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

On Fri, Oct 21, 2022 at 12:02 PM ChiYuan Huang <u0084500@gmail.com> wrote:
> Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2022=E5=B9=B410=E6=
=9C=8821=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=884:34=E5=AF=AB=E9=81=
=93=EF=BC=9A
> > On Fri, Oct 21, 2022 at 5:17 AM cy_huang <u0084500@gmail.com> wrote:

> > It looks like you randomly cut the trace.
> > It's not what I meant and documentation suggests.
> >
> I checked the submitting-patch.rst.
> To satisfy the requirement for 70-75 chars per line, I only keep the
> important log.
>
> May I ask what you mean for the 'trim'?
> Is it 'Still keep 70-75 per line and cut the characters that's over
> the limit to the next line"?

> > https://www.kernel.org/doc/html/latest/process/submitting-patches.html#=
backtraces-in-commit-messages

Have you had a chance to read this section of the document?

--=20
With Best Regards,
Andy Shevchenko


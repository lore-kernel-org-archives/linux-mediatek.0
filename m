Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16826F99C74
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Apr 2026 02:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sTpB3zFGMA4+49UPAPJnoMPYvm1cGwiY/ChissLecvk=; b=cCz2yPOvHYyaoOeaixKaRvsbEt
	JW4jCHYNICQLqBaiiehXEZ2e6ymNREOF65GBeyXctOjZGGPbOEKY0oprAoE3xL2o2zkPXb2KY+1vD
	xhON1g67Gj6nGimHSNl0RefyaWYAiDRMx+FVQa4D09cKBikYy0z18uQhWz8Iaax4+MRnLuMJdS5eI
	FWD39HuhXHWkddFvZ0GwfOGASU0+9zIIxgzZ1EQuFXbAnZJ8/LNslOf5BvM9TgDtPQd0kD70LtdzJ
	e2zURXLFWz2fi13NWgpeRBjKeG9KFhyhhUIy98BoeNKzwI94gUaT1rJA9APufF5XP5jCi4KAI0lsR
	/wxxNdJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDvlA-00000004gm9-2nFl;
	Sat, 18 Apr 2026 02:50:16 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDvl7-00000004glM-1ssu
	for linux-mediatek@lists.infradead.org;
	Sat, 18 Apr 2026 02:50:14 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-673ee2a98b1so745673eaf.0
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Apr 2026 19:50:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776480612; cv=none;
        d=google.com; s=arc-20240605;
        b=I8AWIq6v5mik48TpzcX+rZ36X3CELdL+RtNXIIRMiG/mfOXkjB18dkuBXgOjJmf0mF
         Cr6vF95BuRRQ5ms1tH76Eiez+ptKOw6QhPMIfpdBSJqapKCfDu65in5+hwQ9FlG96Y/G
         LBMBe1/gd0KtS+XHOjQJMqm1T+lf5jaqxMAM1mRKAR3UxSyo+0tC9z+zyRBQPov3Fkv2
         P/BcxFnVH4LxkCQpm/1ADtGUmCJX4I7U+6k94ZNDhuH16fQz625O0WnkDkIEOcY6lHDz
         QZMp2h1gWctLrWwzGx38wYhYPTNxY5mVg9E25p7bxO2tV9fSDb92mJ11EtWbmAqnzw8P
         u1Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sTpB3zFGMA4+49UPAPJnoMPYvm1cGwiY/ChissLecvk=;
        fh=KsZKlc7OCiGDagoWx7lB5W99uLATymE1w+oKWuV8dZw=;
        b=F6FOnI7jbCyY+yUGtF6WM83GgoMMq5qLeB6870xK9fsayRUxxOLDKMyQtf6b3t6kvV
         Hjq74kZEGXW0/Q7vgIItMWRvoCfHKnnAislyXyJv15QqRHzgo3h+qfVt1don2xNZtNVU
         55WYElCulrQZ9XBzpw06OeRQuq/IqIE6KpGEgw2fOYsYXZj893fixU+tE44kgdnv5pUw
         BrjeciB6zwb7yE2+AQZ8G6IAlmUvQz+z3W201m4C08avwnJswC/bZFw64JyjLnPIOuFv
         77qD2w8bqlWf2RSoQOB51VAT7/auif6m+ykXAGiOk5OWkG3/0AoPFqbl6qL6GyePYH2c
         Bi5A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776480612; x=1777085412; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sTpB3zFGMA4+49UPAPJnoMPYvm1cGwiY/ChissLecvk=;
        b=P7xouFs8W6yXnEEbU2r4HZ5hd1Sy5kolztxFpifyfqjcULdgi4Ey/nQJM/OXzYrOa+
         b8D9RF4Dz2S4BgKGgOHWj/QQcomj1DNi67ZB+wXpBcqC0q9tr7Ka+5GFtFp79MP6BFdd
         c/kCW+WyvABBEEycryp1ayJA3eUSlXcQjVI6Rk5OYPSr193ZJ1D4SxgSu98N/8PqMC0e
         15v0rcqc1RK6dDMy13vhIw/En/SefcvNlb0wOvGs+t7GqvQ3rkdnPJw10Bn0dzRte1g7
         EbE+E8OJCKrtBtDR/hphiVUfxEr+tENcEXIqNVoSqgD9jgv0HHMTsDPtvQREZC22ez0Q
         3ayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776480612; x=1777085412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sTpB3zFGMA4+49UPAPJnoMPYvm1cGwiY/ChissLecvk=;
        b=HidopWJmHEiIag2oe8aO53IuKo+KmMB+3dewm3hl/PLsr0LflaJnw782nTnlTTOYDt
         eRODwn282H6A9tc3Ol5v+kdPrBWk0Qky1I6M0eIRwjr149NOg0sg2wPAJiqLeJ0L1WzK
         XJBBef11bIerKqg3NxT1Mn8uTZ/r9CtjJL0fSKuHz1Ndf3O2U/VVbhCiXNheRgdqN84R
         O8Nli0qV4eWaKFNA8pna6iHQLcu7f/aBSRQ0j91wEWIBgLIxwi+Zuhik/1ED4hoifqk6
         a0kSOr0NH0Br/+4zgEUxsZx5atVR+4V86kfpmStSKGg4nLVGsHyNV7lFDJe0molxDbYa
         Nd8A==
X-Forwarded-Encrypted: i=1; AFNElJ+AfzggX1EGe7R9aXvGU66wOwviWD9kJ49Nq9hsniV5T4RfXkd/dXbmgrHERV5qdgxfGh8cKYCu2m0a7cgw2g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyDSqXL/PdSeKTIcCXa9CRMbDnCMHyZtHGW5xIf/EEA82FcJKEy
	WWDEDMO4tlPWPIj2VYqjm3g1Tj2fsGgifArEGVU8WvmDGPegkyd8KOeu60mdic063f2ZTtH04U/
	itKDREhDpVTiij7LijW7FMit0FIMJ1lw=
X-Gm-Gg: AeBDiesMrFrcistcT7prcxV5QY4Y3Z363b9WKaNzgeweRs31QoTePHRCmXWs/erHLp2
	XflATQzdnxqGwMGp6yjrbhbHC17+DOTzRXqYv6VSrq/4GSPrRLTiAG6l6LAMndAWPPuoIfocgpV
	MFhpVn9e3iblV0T3keDxn7tD6r1YXUB35XDut5hQH4LvwXRFFTO+v4jK0AxkpGTXysfL8swiuJX
	6PoLx53490PiU/lFQ6nhz+r+iCmAnfhMHesNtLuh5nczQHkzhj0MltxonHa9n9RnLdAO6Oi+2nk
	o91m8C5fa364EYWldKE=
X-Received: by 2002:a05:6820:604:b0:689:7cd7:259e with SMTP id
 006d021491bc7-69462f44c08mr3366697eaf.57.1776480611628; Fri, 17 Apr 2026
 19:50:11 -0700 (PDT)
MIME-Version: 1.0
References: <CABb+yY23aTXeXu6G-8sHjw32DCqmhsJLu2Mt-txenOgTBiyv+A@mail.gmail.com>
 <20260417084335.2092188-1-joonwonkang@google.com>
In-Reply-To: <20260417084335.2092188-1-joonwonkang@google.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Fri, 17 Apr 2026 21:50:00 -0500
X-Gm-Features: AQROBzBa_VS1wWtSKDMjmtBp02-qplt4Nx2TejF_JEV5fvEqT0eLpBXx6xGnZnk
Message-ID: <CABb+yY2yBZ+hgr-=Uh_sRk-TJZRfsk2AYtoS5rPtUN8kVsUScA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mailbox: Make mbox_send_message() return error
 code when tx fails
To: Joonwon Kang <joonwonkang@google.com>
Cc: akpm@linux-foundation.org, angelogioacchino.delregno@collabora.com, 
	jonathanh@nvidia.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-tegra@vger.kernel.org, matthias.bgg@gmail.com, stable@vger.kernel.org, 
	thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_195013_548541_8693036C 
X-CRM114-Status: GOOD (  33.03  )
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

On Fri, Apr 17, 2026 at 3:43=E2=80=AFAM Joonwon Kang <joonwonkang@google.co=
m> wrote:
>
> > On Fri, Apr 3, 2026 at 10:19=E2=80=AFAM Joonwon Kang <joonwonkang@googl=
e.com> wrote:
> > >
> > > > On Thu, Apr 2, 2026 at 12:07=E2=80=AFPM Joonwon Kang <joonwonkang@g=
oogle.com> wrote:
> > > > >
> > > > > When the mailbox controller failed transmitting message, the erro=
r code
> > > > > was only passed to the client's tx done handler and not to
> > > > > mbox_send_message(). For this reason, the function could return a=
 false
> > > > > success. This commit resolves the issue by introducing the tx sta=
tus and
> > > > > checking it before mbox_send_message() returns.
> > > > >
> > > > Can you please share the scenario when this becomes necessary? This
> > > > can potentially change the ground underneath some clients, so we ha=
ve
> > > > to be sure this is really useful.
> > >
> > > I would say the problem here is generic enough to apply to all the ca=
ses where
> > > the send result needs to be checked. Since the return value of the se=
nd API is
> > > not the real send result, any users who believe that this blocking se=
nd API
> > > will return the real send result could fall for that. For example, us=
ers may
> > > think the send was successful even though it was not actually. I beli=
eve it is
> > > uncommon that users have to register a callback solely to get the sen=
d result
> > > even though they are using the blocking send API already. Also, I gue=
ss there
> > > is no special reason why only the mailbox send API should work this w=
ay among
> > > other typical blocking send APIs. For these reasons, this patch makes=
 the send
> > > API return the real send result. This way, users will not need to reg=
ister the
> > > redundant callback and I think the return value will align with their=
 common
> > > expectation.
> > >
> > Clients submit a message into the Mailbox subsystem to be sent out to
> > the remote side which can happen immediately or later.
> > If submission fails, clients get immediately notified. If transmission
> > fails (which is now internal to the subsystem) it is reported to the
> > client by a callback.
> > If the API was called mbox_submit_message (which it actually is)
> > instead of mbox_send_message, there would be no confusion.
> > We can argue how good/bad the current implementation is, but the fact
> > is that it is here. And I am reluctant to cause churn without good
> > reason.
> > Again, as I said, any, _legal_, setup scenario will help me come over
> > my reluctance.
> >
> > Thanks
> > Jassi
>
> Hi Jassi, can we continue discussing this issue from where we left off la=
st
> time?
>
Long passionate essays are difficult to read, so I haven't yet. A
simple description of some setup that you think is not supported, will
keep the discussion focused.
If your platform is supported but you think the api is not clear,
updates to the documentation are welcome

Thanks,
Jassi


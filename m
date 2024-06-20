Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94206C27C79
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jun 2024 14:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I0CBy4FKqWho9UEUVxmMefKmw1lL8tFVQrf3tj2spcY=; b=FDABuPm7jPWNTaBLz3edxhK+Hi
	vQSHO6rv1UZLdfbNiNkMgw4+Yq9lkaTuLuZ0aKS1uPLD/lkJAsQqEELuY9f9gJJ6NFCF2/t7OEHyJ
	wWxL3+SojWsDf8XIrZ09WY/jl0XyvKv6VeQ5u4qUkaH04yjhQN0MBGuhhAi4reRsfG+oS3jTZKKYK
	X/KDPLcs4CMzot5CjPDN0a3x46T16JwtB7LSZXtj8Polb2YFCcXV0f2l4vQ7K3QOo/PREeUxLy4rt
	GLjxKgMRhjw9K2L0OevJuMCIzmCiFIw6qLVyFGe7CcGXlDfI6c+ttJqla0jlhwq7ScPiiXPMl/Vxn
	vl7uLmgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKIgt-00000005QBg-01C0;
	Thu, 20 Jun 2024 14:23:07 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKIgp-00000005QA3-2sBW;
	Thu, 20 Jun 2024 14:23:05 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a63359aaaa6so134946066b.2;
        Thu, 20 Jun 2024 07:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718893382; x=1719498182; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I0CBy4FKqWho9UEUVxmMefKmw1lL8tFVQrf3tj2spcY=;
        b=jm060ZejJwbPdXQiqhuJrDYb5CK1b5GdtOPt7C8hODZ/dS5lH0+lIitgX822jJ7WUT
         Uwtlz5pHYsl1ccUYesrTq6AeOFsVHVjlXSo32QT535vNMe/XOrmCJPtDoOSmjxFlmraN
         9/F9KfnoMGs2UnU5g/l0rBZvQ5ugEIvaxmaJIJjuvf2L/AO6e9iRCFcQSHakw2Zp1v1G
         V2v/5iEIMW2fMt3g9NgiiIU/OkZ2efg5Z5Qif7r6zs77TJaUyazpe+GwyJGemJhWs9Pl
         TlJthQWRzCVDegeIQ3T92sWfYjiPj+VPRzqQF0wLfwk8AzZ+dlCuTx4BciPOi0iNjfOd
         rCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718893382; x=1719498182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I0CBy4FKqWho9UEUVxmMefKmw1lL8tFVQrf3tj2spcY=;
        b=jO1BtDDlJa6CIOuA6vfaoiRlxmn+ef9a6pszIFUuodfFUMtrukQUr1oolYnDEfgCHy
         3N8omQ+IUmC6zP0RgJNkVMDfdHymLjRDq2EmQ2AUG8UKRzOkt45HJ9azeCeitBF+xzUu
         hyUPBhaJcRceTbMIepnSSr8X13ZLWZbYBP+jwRtcX1r8h369ZognhIO24gTJwYr3FMYs
         +i9UzrcGYPnlpwchxwARLN6yMpWeAA26i66pDsnTYG2zc6NMOBEyVJdrWdQ8vSOq15aa
         q7se2jFWgxsn+WjFcSaC9iI3m5cuvy3/LSWFsjVzOjfLMsh/JB2Xp1JeJ8I834RrdizE
         FCuA==
X-Forwarded-Encrypted: i=1; AJvYcCXEigm/LeSKvhJipj4eFkrkpCCgfNAB8oMF5PA2UmVJ9ygHRaT/SugHAxS1TIrtyQGMyAr5S3l9bfbzFURCiBnEpIHT0Um0n+Z82TUqYYi6S6BTNEkEDk/q1y0CECpZjUOvfZUUKrwtnXOBI3eOzEAqipHRlowLqok=
X-Gm-Message-State: AOJu0YxEz4ANQSRLrlh1axtlXnWkVy/D+XtryXD5VwUUa1IvZqpWv1RP
	eMUIerg2HQJqLHiDnPvHcpmMfvF5qUPkD65w5RxZhJvfO4NAeR2ifJiw7yIvxGF6xugr5NfmnHe
	w2nQ+dF8/BPNQtsasE2WoZDaBM5Y=
X-Google-Smtp-Source: AGHT+IH9AgOYuujmCOL147Fr+nuBv1kxRRk+RX4FEgjd3RcfDME3sX8YBjtbwz4yxAV/0QZpQzJ3dRGAAx/ZTP5aMSI=
X-Received: by 2002:a17:907:8906:b0:a6f:c24a:7224 with SMTP id
 a640c23a62f3a-a6fc24a7411mr115165366b.17.1718893381614; Thu, 20 Jun 2024
 07:23:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240614040133.24967-1-jason-jh.lin@mediatek.com>
 <20240614040133.24967-3-jason-jh.lin@mediatek.com> <CABb+yY2bwj2BcdJLGe1ZYwCrnXL3LtcePMb=wQPaBKorBSs2yA@mail.gmail.com>
 <fc92d51cc6e55301c081ea2d589e1ba6cdd295ee.camel@mediatek.com>
 <CABb+yY1L+YGjf6O9UgPYkS2gWAdo=7QoojSAUNWC_8o7XtZQSg@mail.gmail.com>
 <1f815ff8-2b7a-48de-8b47-0bc9b3cb67ab@collabora.com> <CABb+yY1Yy8o3ofAiC-uV+gDrO3QDTWz3_XTUMai_2uyrnj-VrQ@mail.gmail.com>
 <b7ebc021d391452eaf2149976ea2d53fba3d89fc.camel@mediatek.com>
In-Reply-To: <b7ebc021d391452eaf2149976ea2d53fba3d89fc.camel@mediatek.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Thu, 20 Jun 2024 09:39:28 -0500
Message-ID: <CABb+yY3+pnuXDK_jZMDYOAzahdSZ5iig51VqzM=FFHrFpK+9LA@mail.gmail.com>
Subject: Re: [PATCH 2/2] mailbox: mtk-cmdq: Move pm_runimte_get and put to
 mbox_chan_ops API
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
Cc: "angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	=?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>, 
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_072303_796109_69D60E46 
X-CRM114-Status: GOOD (  34.97  )
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

On Thu, Jun 20, 2024 at 1:33=E2=80=AFAM Jason-JH Lin (=E6=9E=97=E7=9D=BF=E7=
=A5=A5)
<Jason-JH.Lin@mediatek.com> wrote:
>
> On Wed, 2024-06-19 at 10:38 -0500, Jassi Brar wrote:
> >
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >  On Wed, Jun 19, 2024 at 3:18=E2=80=AFAM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> > > Il 18/06/24 17:59, Jassi Brar ha scritto:
> > .....
> >
> > > For example, when static content is displayed on screen, the CMDQ
> > mailbox never
> > > gets shut down, but no communication happens for a relatively long
> > time; the
> > > overhead of actually shutting down the mailbox and setting it back
> > up would be
> > > increasing latency in an unacceptable manner.
> > >
> > Hmm...  in your driver,  startup() is _empty_   and  shutdown() is
> > all
> > under a spin-lock with irqs disabled, so that too shouldn't be
> > expensive. Right?
> > Then what causes unacceptable latencies?
> >
>
> I found that the BUG report only occurred when opening the camera APP.
> Maybe something in imgsys_cmdq_sendtask() is too expensive or somewhere
> else in imgsys driver.
>
If you move anything from submit() into startup(), which is once per
lifetime of a channel, it will only make imgsys_cmdq_sendtask()
cheaper.
Btw, the imgsys code is not public, I don't know how it looks.


> I'm wondering why this BUG report is not occurred in display use case
> which is more frequent than imgsys use case.
> Does this mean sleep() is not always called in pm_runtime_get_sync()
> and if we can guarantee this sleep() won't be called, then using
> pm_runtime_get_sync() in atomic context is OK?
>
Instead of hacking around, maybe try using startup() and shutdown()
which is for such uses? Maybe request/release channel as part of RPM
in your client driver if you are worried about the noise?


> > > This is why I opted for autosuspend - it's only bringing down
> > certain clocks for
> > > the CMDQ HW, adding up a bit of power saving to the mix which, for
> > some use cases
> > > such as mobile devices with relatively small batteries, is
> > definitely important.
> > >
> > > I'll also briefly (and only briefly) mention that 120Hz displays
> > are already a
> > > common thing and in this case the gap between TX and ACK is ~8.33ms
> > instead, let
> > > alone that displays with a framerate of more than 120Hz also do
> > exist even though
> > > they're less common.
> > >
> > I don't know how even busier channels help your point.
> >
> > > All of the above describes a few of the reasons why autosuspend is
> > a good choice
> > > here, instead of a shutdown->startup flow.
> > > And again - I can place some bets that PM would also be applicable
> > to SoCs from
> > > other vendors as well, with most probably different benefits (but
> > still with some
> > > power related benefits!) compared to MediaTek.
>
> I agree with Angelo's point!
>
Ok, but you or Angelo still don't explain "unacceptable latencies"
when your startup() and shutdown() are empty. You just want api
changed, which we can but at least do you part and tell me where the
bottleneck (unexpected latency) comes from.

Thanks


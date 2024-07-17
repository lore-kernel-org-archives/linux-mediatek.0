Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC742C3DA42
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jul 2024 16:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nN1bLNl0BTZ9iy1K7Yp0WmZCTwJNvK8fshp2FGJokkQ=; b=Cknq/8zsVP3nPTcQ0lToSKseB6
	AtVUFS8OPiTx8u3G/m2gu/wsaDQStPcIDKIXQYe0yn3B2aju8F8GMdYjVUgoNxCI3/dfcZSrvlqJS
	HiHIX8i0QioIyJba/5f1dVh4BprN0CJg2pPRf4kQc3faLStSxIKuWkKFS8PbjrIhlYpJRnnqYjMKI
	Z6V/6yeGG4JimLHRfY+6GmP9ZMtqFDBMfYPbSTRT8n63tiuPpssgWZtD1rg61I80OyxoXkRWptfs/
	MTcYR01zLcJnc0KucK18eXqnPjQE1szZTQP//d6/27p5uoKW0b81aMTRw5MrBjkmYzt20zVVCWFuK
	zWGMLRnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU7M8-0000000EKQO-0PBp;
	Wed, 17 Jul 2024 16:18:16 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU7M5-0000000EKOA-05ed;
	Wed, 17 Jul 2024 16:18:14 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-52e9a920e73so7913406e87.2;
        Wed, 17 Jul 2024 09:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721233090; x=1721837890; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nN1bLNl0BTZ9iy1K7Yp0WmZCTwJNvK8fshp2FGJokkQ=;
        b=b20yKrEdwgX2MTwFn0GVbVSL4LtFflhY0NUituy0PSmk3oXEAU/koo0TpOU0xMEPSm
         WP4x0lq45I4Jt2SzPxaTbpZT/kxv4VKjzLgoGCAlSw6OvHLQW4l4kUACJbPEuH0tx7f3
         EN35aJwSbGPQmAmUjoTLXbm1VmzJoS17u6vRX7PLfF91Sh3t/eXYxlTbGHO+lCJW9hHA
         SPitf/ru5vayUJeNeQGI0/MGWhrgjA6mYTRkzzmtZW+2oNyGM9TPpDHKaKhj8+8Deqs5
         LNvk5rxEtoZQIj0WXHvbiKPlmw8BZRw96rPzelKKq+sd9Ap4dfeYgehrBiaEtdBeXyte
         sa5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721233090; x=1721837890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nN1bLNl0BTZ9iy1K7Yp0WmZCTwJNvK8fshp2FGJokkQ=;
        b=tLFMxWdfwOk/LAUiAUVrGWn/6FAgvnyVKjFoGfUq5VDF//TLN5rrB/wB9bAbswgsqP
         3hg1YbCoI+d5BzJ3BZH74QEYoGtWgn321pppzSbpNlivfnhl/ZvBtVvjTs15xeYjTLVU
         LKYT42hCokZle8iicF/a3uTTDN5YS6mtjhUSb3fT+0BX68zrfEUQ0Pqbb5g/oWBmrLBH
         LNoAt4oH3Iz4bKGInx9wfBpoM+tvVP/q46inJtjRHlC68oe1nAe1RVvVQLEUempRRwcS
         mADiMV0oUzKaz02p87XavDbdbfsG9u0Gqr/LQx7k/CY0+HNcwfk4X3/9B53cHPVIlDaI
         iVDw==
X-Forwarded-Encrypted: i=1; AJvYcCWTE0nDip73PnDf0536rt0Ay96vXzXFtbNXRqY94G6kZ4rrgrC4BpGMukCSXlOH9EkptHuRFiTsT0B47XrLsBfmtctjr2jvjzyVsOrmN455aeLkVZ1jIEyeooTdg0wonEJ0U72T0nDCATeG5qcrjIYU6LL10RfkI+M=
X-Gm-Message-State: AOJu0Yxtjxv/4F0bEbAh5fIJyqBmmXaVZfXhUdATZmnV+oFzBgnwstqW
	oT3LDYj7xjypomNPV2Ve2XBk4PV2YxBNNRRy6KiUNdxO3cjtVEywFm0/wiUoZoLiPlAriJEA/OS
	obAcIF+pKaotEvXyo8BVIs3YHqhsMJGhA
X-Google-Smtp-Source: AGHT+IHJKGB3isMbpiavmiRNgPprCHd6xCU2Zj9jAPGFncmg1lt1S1zutRUqS9ElJc7/eqF9zLYRwRvV9Y5PxGXjTlk=
X-Received: by 2002:a05:6512:3d0c:b0:52e:be1f:bf7f with SMTP id
 2adb3069b0e04-52ee53da928mr1592447e87.27.1721233089843; Wed, 17 Jul 2024
 09:18:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240614040133.24967-1-jason-jh.lin@mediatek.com>
 <20240614040133.24967-3-jason-jh.lin@mediatek.com> <CABb+yY2bwj2BcdJLGe1ZYwCrnXL3LtcePMb=wQPaBKorBSs2yA@mail.gmail.com>
 <fc92d51cc6e55301c081ea2d589e1ba6cdd295ee.camel@mediatek.com>
 <CABb+yY1L+YGjf6O9UgPYkS2gWAdo=7QoojSAUNWC_8o7XtZQSg@mail.gmail.com>
 <1f815ff8-2b7a-48de-8b47-0bc9b3cb67ab@collabora.com> <CABb+yY1Yy8o3ofAiC-uV+gDrO3QDTWz3_XTUMai_2uyrnj-VrQ@mail.gmail.com>
 <b7ebc021d391452eaf2149976ea2d53fba3d89fc.camel@mediatek.com>
 <CABb+yY3+pnuXDK_jZMDYOAzahdSZ5iig51VqzM=FFHrFpK+9LA@mail.gmail.com>
 <4e5d4362-4940-4ba0-95aa-627b82e21e41@collabora.com> <CABb+yY3eXvJRUq7MOqB8QZ9N4aiuogaUCTfP7MerKdNbAbLkvw@mail.gmail.com>
 <895af04e45d286c38d01f48b29ad41598b7dadb7.camel@mediatek.com>
 <CABb+yY1EZOsKUR7WUX0Ni0Ukbqz0+yRHswiu07tNXtY1A1gNUQ@mail.gmail.com>
 <d6f0e7072ec0e89e573e5720fb2b9c621eb9154c.camel@mediatek.com>
 <CABb+yY0+fFw7Bg578DFEdrigVFgf4-v3qo2JVruEa3ExtvRsMg@mail.gmail.com>
 <092d917b4cae2762317a8739c874855554ae913f.camel@mediatek.com>
 <CABb+yY2-KWYORo_-ZWafyM0VJnh8-2wefvCpeDsK204qB0TchQ@mail.gmail.com>
 <3f655bc4e1e60cd5e0dfc9baa018553fa8892826.camel@mediatek.com>
 <CABb+yY2zBY_3nEYajdhRNfwb+bPMpFOvbXrqY+jM9rB6qbjJNQ@mail.gmail.com>
 <e860d67f578f1963d785dcc0423936fe5de20547.camel@mediatek.com>
 <CABb+yY0mYrUyfpNLVKZt2aDdzZPf+VjawcwVSpMG8H_=pwKLbw@mail.gmail.com>
 <c8081a0bbfa2f60fc3d594bd0fadacf9354507b7.camel@mediatek.com> <74e15fceff5ef48ca18a6f3e8dac15ae9cff09b7.camel@mediatek.com>
In-Reply-To: <74e15fceff5ef48ca18a6f3e8dac15ae9cff09b7.camel@mediatek.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Wed, 17 Jul 2024 11:17:58 -0500
Message-ID: <CABb+yY04wHaq3pU8tVOK51PeUHAMnUtPC+zi5gFkmykK05C+Vw@mail.gmail.com>
Subject: Re: [PATCH 2/2] mailbox: mtk-cmdq: Move pm_runimte_get and put to
 mbox_chan_ops API
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	=?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>, 
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_091813_093509_4C7069CD 
X-CRM114-Status: GOOD (  20.65  )
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

On Mon, Jul 15, 2024 at 4:45=E2=80=AFAM Jason-JH Lin (=E6=9E=97=E7=9D=BF=E7=
=A5=A5)
<Jason-JH.Lin@mediatek.com> wrote:
>
> Hi Jassi,
>
> > > You mean _with_ the api patches. right? Because I had suggested
> > > "Over
> > > your patchset, apply the following diff ..."
> >
> > No matter __with__ or __without__ the api patches, autosuspend didn't
> > work...
> >
> > We have to find out the reason __without__ the api patches, then see
> > if
> > we still need the api patches to fix "calling sleep in atomic
> > context"
> > problem.
> >
>
> I found that the reason autosuspend didn't work was that I added the
> devece_add_link() locally between the drm device and the mbox device.
>
> After removing that change, the mailbox device of display can
> autosuspend as expected. So the current autosuspend function is fine.
>
> And the mailbox device of display has the same BUG report like imgsys.
>
>
> Here is the log after removing the local change of device link and
> without the PM api patches:
>
....
That is the log of your some w.i.p code... it does not trace
mbox_send_message() which is where users call the api.  You trace
cmdq_mbox_send_data() , i.e, the api calls the driver.

Even here, the minimum send_diff (time between two cmdq_mbox_send_data
calls) is 32ms. The minimum resume_diff is 540ms, which means you
suspend for at least 540ms.  Also you don't expect these times to
change even with the changed api, do you?

At these timescales, you could very well release-acquire the channel
resource because that cost is ~0ms for your driver. That will not only
be the right thing to do but also avoid opening another can of worms
by adding some ad-hoc api that works only on your platform.

Thanks
Jassi


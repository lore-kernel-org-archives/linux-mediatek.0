Return-Path: <SRS0=9FsO=BR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC91FC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 03:13:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83205221E2
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 03:13:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LpsqvhXA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="RDovZW0c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83205221E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TbhGW2luXOwfDHwB0SNKZIO4ukttdSKzwF+76FzKjrw=; b=LpsqvhXAcUPoDVmY/NFx3/z6t
	37WIAGVpMBMMUIPAWY9WwHwfsyVSQqT6ur2nU6/tbGrZ3yeXzDLeu1BX/PiVqEn3aicpxtoWp+yje
	DRyDQn/n7LfRJONTCcbAGhB56ZvVM6dsLhBD+F9YFYTV+sO5yGIwpjlIyUWe+2m8/mVDqXjkp+rJe
	8Ua8pSUglyyUKpqzPKC1vcJByJjJPxNuceCc+Xy7/Pm318duRa11bbupBvVslECqqD4HqlKVlxcoN
	PfknGBl8JqOei0FdkXE7EwmfG0i1zomAaVXpL3YdorVdRPhO8LBN5ux2Ekfgui17Vqts/UKHlaZC9
	5NQAZ7Huw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3sp9-0004h6-5m; Fri, 07 Aug 2020 03:13:39 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3sp5-0004fs-7P
 for linux-mediatek@lists.infradead.org; Fri, 07 Aug 2020 03:13:36 +0000
Received: by mail-pj1-x1041.google.com with SMTP id 2so211747pjx.5
 for <linux-mediatek@lists.infradead.org>; Thu, 06 Aug 2020 20:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Mntt/yV9g0WantW+MFUMl7qG7fGk/Oi5dRuY6kccsYw=;
 b=RDovZW0comW5k7a9qDBhi0AemfQotZc35NVP3B/JDirQCHkb3KxYzbiNVpmHOLFuwB
 16VvF1+r+a5Uh0LqZm/NYiMCFqw5Kg84vRSFVEvGutQZxz14IrygV9VS6q8VcYGZw/h1
 dHG0UzmQ0xHz10DDkThhfDS9paQ9LrKO/PoEGFXs24VQWqcyQVSzNeshbKpJnxZ1mG0d
 5Zf92IcmPVcRjaHg0tRv1sCEKsHUa8AclgHXo1FnE9oTRiP5y2Izlfzg3fZJrgzl3sqd
 07fpIFfQH3mur+x5UUTjPLI1b9JvJd346SZpuhDJVf+98Mu6vRZ5H5WCK+dJezuiL7kq
 YLBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mntt/yV9g0WantW+MFUMl7qG7fGk/Oi5dRuY6kccsYw=;
 b=YjpxI0LQgAAdnyR0QKDp+OvvEYOm4QsFNyNfUSjnK8b03d3Gg6aCOdri4mD90+ejCG
 ARJa3j6GNFYA661EG/6+K1rZ5d1xww4cQz57+vDfX8jFns1IH4LHAXTTFUvzDI/Tw6+3
 8sTwIU5I7JiClR6+U8lRWx/yV1u3SbsnG3PNcft2ow/DgiXcjmAdkGCPdhV2FbkRiS2H
 xy4H7Ixm2f4JbTd/5ETQie1pm+wlF3fwwt8JsBpcI4u+LYpQWXreqCuuLSO2+FcVnu40
 pdlUDdXVX2uVrSp4qdfUuZXSFR1HGE8bJuNRqL4Jvs1xZ8LH4B9AJU3WTaHM4O5KxxxS
 nAUA==
X-Gm-Message-State: AOAM533BiQrAkJkQaJu39GDO01LTpogaHOD7sEhZV78o3NfMofGDAy17
 jt4AdSJ1hGWOUM77FDxDGv5w+d3ejhWo1ooGvJiwHw==
X-Google-Smtp-Source: ABdhPJwHf/baXL/FshABJwVK72iC4bCenNX/IrhdV9ee/TdyaNNuV/RPDLg0FYY0/FnAyGhJKXhqedgsCLoHXEgA/TY=
X-Received: by 2002:a17:90a:1546:: with SMTP id
 y6mr2707909pja.93.1596770011948; 
 Thu, 06 Aug 2020 20:13:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200718000637.3632841-1-saravanak@google.com>
 <20200718000637.3632841-3-saravanak@google.com>
 <CALAqxLVZ+rFE+hM9OtQ46NqpTHeLu6oKLNWKstLv1U5zbwyq7g@mail.gmail.com>
 <CAGETcx_rkK3-bKhDP_N4n_WyXLXFPoaUV9rbY_Y+H1Joj=dCyw@mail.gmail.com>
 <f314b687-11a9-5a5e-e79e-c46dd2f16c6f@kali.org>
 <78ad0914-6173-f753-9eba-b7cbfbb51fd6@kali.org>
 <CALAqxLXPN9kThwF32YoWyApaWnfjthANXj3uk65Wc3ddaJQFFQ@mail.gmail.com>
 <20200807004001.GF20825@builder.lan>
 <CALAqxLWwY00PVUL7EM-tgbXeB5h8MsfPo7EFZTfDSzbb3P3eqQ@mail.gmail.com>
 <20200807013903.GG20825@builder.lan>
 <CALAqxLWmJisTA9836Rvb8f9m4hsTL7iZ=HQtz39anu2Bbgv44g@mail.gmail.com>
 <CAGETcx9Gsa9CWow8MBVPF4cgofdcK1+cFohAf_-Dqa3JT8H1bw@mail.gmail.com>
 <CALAqxLWR3mKrQDn5VkOV_zaaqxmwWzZwK0CCLRSfGJDU6WUXag@mail.gmail.com>
In-Reply-To: <CALAqxLWR3mKrQDn5VkOV_zaaqxmwWzZwK0CCLRSfGJDU6WUXag@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 6 Aug 2020 20:12:56 -0700
Message-ID: <CAGETcx-2mCg9K3th+HW_QjvKWmpb6yk=Cu3F3gOn3w+TD1RTzw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] irqchip/qcom-pdc: Switch to using
 IRQCHIP_PLATFORM_DRIVER helper macros
To: John Stultz <john.stultz@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_231335_333396_8BD12D7F 
X-CRM114-Status: GOOD (  21.16  )
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
Cc: CC Hwang <cc.hwang@mediatek.com>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <maz@kernel.org>, Hanks Chen <hanks.chen@mediatek.com>,
 Loda Chou <loda.chou@mediatek.com>, lkml <linux-kernel@vger.kernel.org>,
 Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Android Kernel Team <kernel-team@android.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Aug 6, 2020 at 8:09 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Thu, Aug 6, 2020 at 8:02 PM Saravana Kannan <saravanak@google.com> wrote:
> > On Thu, Aug 6, 2020 at 7:49 PM John Stultz <john.stultz@linaro.org> wrote:
> > > On Thu, Aug 6, 2020 at 6:42 PM Bjorn Andersson
> > > <bjorn.andersson@linaro.org> wrote:
> > > > With all due respect, that's your downstream kernel, the upstream kernel
> > > > should not rely on luck, out-of-tree patches or kernel parameters.
> > >
> > > I agree that would be preferred. But kernel parameters are often there
> > > for these sorts of cases where we can't always do the right thing.  As
> > > for out-of-tree patches, broken things don't get fixed until
> > > out-of-tree patches are developed and upstreamed, and I know Saravana
> > > is doing exactly that, and I hope his fw_devlink work helps fix it so
> > > the module loading is not just a matter of luck.
> >
> > Btw, the only downstream fw_devlink change is setting itto =on (vs
> > =permissive in upstream).
>
> I thought there was the clk_sync_state stuff as well?

That's not needed to solve the module load ordering issues and
deferred probe issues. That's only needed to keep clocks on till some
of the modules are loaded and it depends on fw_devlink, but not really
a part of fw_devlink IMHO. And yes, that's on my list of things to
upstream.

> > > Also I think Thierry's comments in the other thread today are also
> > > good ideas for ways to better handle the optional dt link handling
> > > (rather than using a timeout).
> >
> > Could you please give me a lore link to this thread? Just curious.
>
> Sure: https://lore.kernel.org/lkml/20200806135251.GB3351349@ulmo/

Thanks.

-Saravana

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

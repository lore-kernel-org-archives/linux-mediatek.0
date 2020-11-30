Return-Path: <SRS0=DVVK=FE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D0D6C63777
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 03:47:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEC35206F9
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 03:47:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UCPcDV3U";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="N14N3tz9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEC35206F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oGd+4YFdjKKa6Wj/RYfbDLGqbV0hV3/uo+1/O8sE3j8=; b=UCPcDV3Uqd+4XnOHrm4L0llyh
	rPczhtfnD+4UVdtTpOvydhLIX2NXDjQXjX64V/+eNCe5FhxRyeC/zmZ2Zs3PAzEIxWNvxa7NpZdoK
	l1DmeJdEKfiQrEeTyQdIo9lR2iONCVeVmdD/mFkcJK9COW/5DNvr/u2GzmXlUDsk6VT89Kx4FyoUE
	DOvp6DhiGMX/b6sMRfh7UMpnLSzy0AyPhMTmH5KPyi18pZ+nIV+XuPXbO7MbskUudLCFsXxwuymtL
	z8+iA4IKDmFAu7q0oF555dBwrrNB5CvgbuzlEjtGkUCiXz/LoWIfzzGp2D2BjNeHgaEVDeETJKyYk
	BiAHgXlEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kja9x-0003zF-Mc; Mon, 30 Nov 2020 03:47:29 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kja9v-0003yU-Vj
 for linux-mediatek@lists.infradead.org; Mon, 30 Nov 2020 03:47:28 +0000
Received: by mail-io1-xd44.google.com with SMTP id o8so10403669ioh.0
 for <linux-mediatek@lists.infradead.org>; Sun, 29 Nov 2020 19:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sr/AV0NV1nWLn+qvblWrhldoUPj+2qT844+17kc4W80=;
 b=N14N3tz9X4ZYWYkbKFYXhkbrTim66RP7ENfXqyOeu0zmvlLRGk7t/RyGCacMJ46Ey1
 dwm9n4nCgJXa8wINfftA53fsHX48Xn+6BZ6HB529xiQ9QRf38CEhqWu5GI1v3h4K650U
 iPI1mxhfEitvRDUOQnrPB9luX2TKfj7Jyp9Usrr7l+TFDQMrdL3Od8/XPK51dSb9fkMv
 sLiIDbaf/KmGPONGj9GMI6C2Zmyy0B6URfVRVW9/kjVL9p+3D49EA7sf/uuT38+MLozP
 h8X4VCJpUlwamn4NLo4dFp7ogSl8w+FsaTmQ3wKu8xztX9xIAf3bW/9tohT77EO14j5+
 0gKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sr/AV0NV1nWLn+qvblWrhldoUPj+2qT844+17kc4W80=;
 b=sNEbtTRgBXJ98aBVyat4+Y3UrtHSw37hCbhoSd46+rSohKk4AxRDD3CUcBOOKUhNf9
 fghOYTlFG9bSF5pfmmsO4Vb5q/F4bO0QPWYax/gDNEpi6Yk5obbXFj4enaXqggNAz6OF
 Uu6rmPfkBZ+5I0GpaPV/PKXwemBiGWGPa0omVJkPUGVeRuKyWQD9rhKPoOx67QbBie2U
 94+ESuRRmS6G6WW1xRLMVaHU/QwERgCizvXQ5UrT5UkVIbxX3x9SKFIlCxelCuDo1CgL
 6uX37m2vZk7ddn2IQw8cpIu054ii8QxNQ8IjUWH5+hq9apMKXO92qQPK4sJv54/76toW
 tGwA==
X-Gm-Message-State: AOAM530VUP0I96dnf/GGNknmiH0Ku/sE1z7ZQm6UP2ypozGqy2/S73yC
 A394DgdoGhn9i1c/zeLGJhtXepFXMQjbOfga8RBkvg==
X-Google-Smtp-Source: ABdhPJyKlKEGyv2O7fI+OGq/1ZBn85I4dJFpSnoeOKYF/Ltg2269U2GSgcKtfQ+/+s7laOHZWO4jTsfc8+nxflC9PH4=
X-Received: by 2002:a6b:d006:: with SMTP id x6mr14378761ioa.53.1606708043604; 
 Sun, 29 Nov 2020 19:47:23 -0800 (PST)
MIME-Version: 1.0
References: <20201127092941.1646260-1-tzungbi@google.com>
 <CANLsYkx5FqGUe46SDwV8yYZkES66j5daFEAs9_eafiJm8RNz_A@mail.gmail.com>
 <CA+Px+wVsL6YUa7jNvpsehpUyqcxpm+8_Axag26zCeufaKrdTcw@mail.gmail.com>
 <CANLsYkwT6HYLgZ4MzEkfOvq6Rou8_toE=AS=wfjGeNinnuzRhA@mail.gmail.com>
In-Reply-To: <CANLsYkwT6HYLgZ4MzEkfOvq6Rou8_toE=AS=wfjGeNinnuzRhA@mail.gmail.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 30 Nov 2020 11:47:12 +0800
Message-ID: <CA+Px+wUbJHv=mhetqvTmG+Bx9mvK_yhowF=Xj+2-9X2RYWsPYg@mail.gmail.com>
Subject: Re: [RESEND PATCH v2] remoteproc/mediatek: read IPI buffer offset
 from FW
To: Mathieu Poirier <mathieu.poirier@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201129_224728_139030_290CC7D0 
X-CRM114-Status: GOOD (  18.21  )
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
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 =?UTF-8?B?RXJpbiBMbyAo576F6ZuF6b2hKQ==?= <erin.lo@mediatek.com>,
 linux-remoteproc <linux-remoteproc@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Pi-Hsun Shih <pihsun@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Nov 28, 2020 at 2:25 AM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Fri, 27 Nov 2020 at 10:25, Tzung-Bi Shih <tzungbi@google.com> wrote:
> >
> > On Sat, Nov 28, 2020 at 12:11 AM Mathieu Poirier
> > <mathieu.poirier@linaro.org> wrote:
> > > On Fri, 27 Nov 2020 at 02:30, Tzung-Bi Shih <tzungbi@google.com> wrote:
> > > > The patch breaks MTK SCP when working with legacy SCP firmware.  We're
> > > > aware of it and will upgrade the devices' kernel and SCP firmware
> > > > carefully.  Other than that, AFAICT, no other devices in the wild are
> > > > using this driver.
> > > >
> > I agree the patch is aggressive which would break machines with old
> > SCP firmware.  But AFAICT, no other devices are using this driver; and
> > we'll take care of our devices to upgrade SCP firmware first and then
> > kernel drivers.  Thus, ideally, no real device breakage is expected.
> >
>
> How do you know about all the systems out there that use this SoC?
> Moreover why would the original author have implemented the driver the
> way they did if it didn't work for them?

I am trying not to repeat my statements.
- AFAIK, MT8183-based chromebooks are the only user of the driver.
We're happy to provide fixups if any other devices break due to the
aggressive patch.
- The original author Erin Lo <erin.lo@mediatek.com> adds the driver
for MT8183-based chromebooks.
- The IPI buffer address was hard-coded because we didn't foresee new
feature changes in the next generation MTK SCP.

If it still makes no sense, here is v3 which is backward compatible
with legacy firmwares.
(https://patchwork.kernel.org/project/linux-remoteproc/patch/20201130034025.3232229-1-tzungbi@google.com/)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

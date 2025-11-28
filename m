Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DDFD111A8
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Nov 2025 03:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cJq+1B1sI6yzhGchPzVcdD4BSJn3WDAPIGOauWfX+bk=; b=CZM6Rn4FCzv55S5PcHFOmksTxB
	06oxzpLAqZwZy5YbWYDIFBVDKd9v20pDEMqgbXsUiRC5A2Ly+eMBwJJASF8jchB3OcRhcMYqJTJkY
	L8HZHAVPp82UAMCaVk2xooFUI9HNuHHVfGFnehOvOYQS76HU5AP0i+rEbkiNBoegcT0yY+mWm4vjm
	XcL3JS3UIrDgcL81+w+mM1hvkpc7jcaW/sL9KXzTh5jGX46sxDH6g+20Ucy9WLMFxgPdzgeubMq+a
	EGW1Yzpw1sNECgm8GDBqnyTApdSJCnj+mzsQxRyfIpVyPtICXAXCS9I8OQmZKjcqm4OqIlndt5bOI
	UwI2VAKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOoiN-0000000HUGs-0SXF;
	Fri, 28 Nov 2025 03:00:07 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOoiK-0000000HUGU-0M2Z
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Nov 2025 03:00:05 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5957e017378so1576023e87.3
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Nov 2025 19:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764298801; x=1764903601; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cJq+1B1sI6yzhGchPzVcdD4BSJn3WDAPIGOauWfX+bk=;
        b=GDIn63DqdH6+NL2QqGg0V03kSZsPCMQe+ke5Yn7VGTe2b9QM0W9CXTLyvoPq5akdRL
         YedYvgq/lOQxpOP0TyiLAC3ayDyXLrUpWgaNC6f+Yp+48HMzFRhXqtFl50KsMp1s0BHA
         jTir1aVxUKtkV2QhXU5bYWhcqyXKYPuChO13lytI/YjbKXE+VXZE+2E+8CASp5hzsH+x
         tkNOFQBJA9LzkXuS4gcLSNxLjZ0gfha1h4hFWH/5vJZaXH3XVzfAhi4dcPPPTtCQFrJt
         uHlDwvRDUkQU1HV2rKvmHEH8bJZRpyVYCYa34hYzNP9FWsXBoF7gDCwVwcc3UD1oFb9/
         CsSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764298801; x=1764903601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cJq+1B1sI6yzhGchPzVcdD4BSJn3WDAPIGOauWfX+bk=;
        b=IMPU8i12Q007ws5dYY0PzdhzZGJfx4Ra5rk+h6QSolbsXDLHs9RfmW6cxqRNOMzq8w
         vRZ3b1BT0gkgTZXUQd3q+sbZlxhGKg8iWjxx40E0NwNXZmrpQT4sp8p3356Ads4L2WHn
         mo+B8vyE9evyu/q9veyTIMp66cKkENy5CnNDpg0o1Qu+z9KWS9S4y+XtYDeiG5GrkLAm
         xBaA98RN6qUzqPgv51rA5WDTdzuZPPDz/2m4KGAXp/YDRcNpH5qMvCNBPL247LQVnuge
         64W3oAv/WK3EOY4Ielq9jQyDGUwOPtzBUvRB6bcJsa+BooFvmDnZf5Pn6VqQuUCLW+2y
         wElg==
X-Gm-Message-State: AOJu0YwAOB3eq+C6yXM45dliG9oGPTAFI4wYCrGNW08p7uCYDMMvTczA
	pF3wAVoCr6yziKKuvx8Bzshaq1nai4vg5Dab8MW9i0SxzkSEkAe2+aVE6RfUCEhFxzOFnBv7IQf
	R1DG6btPAIItDhml9UANcYkD/7+20R5E=
X-Gm-Gg: ASbGncsblM8HuIgu40/urQCJQgmLZl/i/+bxPwfQaKYnTd514SXppKrXXIixcEkSr9X
	vOFcJYKUYduE21t8g9Hu7mwmSxoRsODpm8yBZRuRaBKXSl96JmwevRl+lkkYDllz9GVS2QYBUBQ
	p8egezwL0KKeXCTEmbuGRCj07+0x4af3H2rxq5PDMoUPin50gJTiEZ8crdGygUVqA+HRHxf+k62
	japPRJpU/ZwG2d37ztxBolh8ihpNnYGXVfKUMZu2kgzRsWXX14MbPqmQMdGPslqTBfI+js=
X-Google-Smtp-Source: AGHT+IGvOWy7yyiK7f98nc3EO/ukeFU1q3BB62MfykeDDvhHqxD5/kjVdAl0bSZqgV7901NqJCOH/MYwkjyE5oYiH3c=
X-Received: by 2002:a05:6512:b1d:b0:595:7a6c:7db4 with SMTP id
 2adb3069b0e04-596a3eb59afmr8509799e87.4.1764298801222; Thu, 27 Nov 2025
 19:00:01 -0800 (PST)
MIME-Version: 1.0
References: <CAAq5pW8q6V7x6qpYnE3xB99nVwE363keGiu+Jax0_zqPjogULw@mail.gmail.com>
 <CAAq5pW_saBZ+52zz2FYTt9SuWXj2KwX2Ld7AggVKAzca2m0Oow@mail.gmail.com> <CAAq5pW9o3itC0G16LnJO7KMAQ_XoqXUpB=cuJ_7e3-H11zKd5Q@mail.gmail.com>
In-Reply-To: <CAAq5pW9o3itC0G16LnJO7KMAQ_XoqXUpB=cuJ_7e3-H11zKd5Q@mail.gmail.com>
From: Evans Jahja <evansjahja13@gmail.com>
Date: Fri, 28 Nov 2025 11:59:49 +0900
X-Gm-Features: AWmQ_bljV87U_YaWy2CItZO_-S-4IuG82a7APaAjJ3ItWl_P2M7yJwtTlwlAyac
Message-ID: <CAAq5pW8-j6UzruT=SU05QgJ1AjLXeUwASLJ3O3SVKttaMbdTXQ@mail.gmail.com>
Subject: [REGRESSION] mt8183-kukui: dts: changes in dts caused display to no
 longer initialize - Was: Re: mt8183-kukui: drm/mediatek: dts: Invalid display
 hw pipeline when probing mediatek-drm
To: "angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	matthias.bgg@gmail.com, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_190004_145220_70259563 
X-CRM114-Status: GOOD (  23.20  )
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

#regzbot ^introduced: e72d63fa0563f8a6e98c10fed3a9ce74dc0536e6
#regzbot monitor: https://bugzilla.kernel.org/attachment.cgi?id=3D308962
Hi,

There has been a regression in the dts for my system
mt8183-kukui-krane, where changes in dts/mediatek/mt8183.dtsi broke my
machine.

The display works under v6.17.9 but is broken in v6.18-rc7. I was able
to replicate / fix the issue just by using the dts from the other
version.

> On Wed, Nov 26, 2025 at 3:01=E2=80=AFAM Evans Jahja <evansjahja13@gmail.c=
om> wrote:
> >
> > Hi,
> >
> > I have a Lenovo IdeaPad Duet Chromebook CT-X636F, detected as Mediatek
> > krane sku176 board. (mt8183-kukui-krane)
> >
> > The display failed to initialize on the mainline kernel (linux
> > 6.18-rc7). Using the same config, on stable (linux 6.17.9) the display
> > works fine.
> >
> > config: https://bugzilla.kernel.org/show_bug.cgi?id=3D220803
> >
> > With the system on mainline kernel, I was able to check the serial
> > console, the error on dmesg looks like this:
> >
> > [    6.513400] mediatek-drm mediatek-drm.18.auto: Building display
> > pipeline for MMSYS 0
> > [    6.514983] mediatek-drm mediatek-drm.18.auto: Display HW Pipeline
> > built with 9 components.
> > [    6.515009] mediatek-drm mediatek-drm.18.auto: Invalid display hw
> > pipeline. Last component: 38 (ret=3D-2)
> > [    6.524422] mediatek-drm mediatek-drm.18.auto: probe with driver
> > mediatek-drm failed with error -22
> >
> > Temporarily modifying mtk_drm_drv.c by commenting calls to
> > mtk_drm_of_ddp_path_build_one CRTC_EXT and CRTC_THIRD allows the
> > display to function even on mainline. I was also able to add some
> > logging and determine that building the HW pipeline for CRTC_MAIN
> > works, but because building CRTC_EXT fails, the entire display would
> > not initialize.
> >

I think this is the issue:
https://lkml.org/lkml/2025/9/12/1242

On Wed, Nov 26, 2025 at 2:06=E2=80=AFPM Evans Jahja <evansjahja13@gmail.com=
> wrote:
>
> Hi Angelo, I was able to isolate the problem further to the dts. After
> bisecting the arch/arm64/boot/dts/mediatek/ and building the dts, it
> seems like this is the first commit that introduced the issue on my
> device.
>
> commit e72d63fa0563f8a6e98c10fed3a9ce74dc0536e6 (HEAD)
> Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.c=
om>
> Date:   Thu Jul 24 10:39:08 2025 +0200
>
>     arm64: dts: mediatek: mt8183: Migrate to display controller OF graph
>
> I am linking my full bisect log here:
>
> https://bugzilla.kernel.org/attachment.cgi?id=3D308962&action=3Dedit

where we're unconditionally adding mmsys_ep_ext.

The issue seems to be caused by the recent addition of CRTC_EXT on the
base mt8183

Please kindly take a look. Apologies for any mistake, this is my first issu=
e.

Evans Jahja


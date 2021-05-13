Return-Path: <SRS0=rIjB=KI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F90C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 14:55:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6454961438
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 14:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6454961438
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=vanguardiasur.com.ar
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TJIC8E4sYxY32OMjSP/VtQn5B5wRWFya7q+x3A9of7c=; b=da51INg6SmF2D3sEPJylnzI6H
	yvTR9HWg06pE7OCxhcxlzdG30qXYT9Rna2XK7ZGKHGM1Di44CWCGbxKDmBznsw5oVBvDSMA5T+w7z
	LkdX2EDamW02FmpNzeKAgYvTSvwGmsZFG5QG4BAdm8MW36HTMZRjgJGLCjW0Yt00Iia79WNnnlEX9
	ICtx7owtYOoXslNpv/DslccZCsbHpMVcTB7X707gbHo5OBQmz5biANEEUNcEeAncLlYC7lhMLOpWY
	gsYFXVeNfD4lM/z3lmiGh7o8eu6aDMfxXlAX8QqX7+25u28BcY2AyckGi540QluzFq7w+GAd/kwPh
	ZM0RTVltA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhCkG-005oDM-QC; Thu, 13 May 2021 14:55:25 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhCkE-005oD9-UR
 for linux-mediatek@desiato.infradead.org; Thu, 13 May 2021 14:55:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=/8vd2SAwTdt88nX11VE63bL19uYaNF7maDv4yIT9Ok4=; b=p5iR9KQrbZY/2cUcKeyVGR+GAX
 utbym1QR6TwUdSdL0CBD03SytPKlgZLy5bvl4YX2GJYnq9ECk0sPJo2BRaqYKWCFIp3WApE5WiMFU
 5poH3k0W7tmjv0gs1DOyipgywLiMk71uUPaDNGnhEjhHE6jSKxBEjBtHExXHaEx+jQeGp/Chl4ipr
 6/WXK/d1ncvCdsJ2nWuru/H6SQbdlsnF5gVL4+0AzaCNYgdT+Htj7wrMqRiBKoJI/2lmQsRhshV9z
 YvbH+W2cTrYOrxtcNQk8hm7+oELkw4Y3Z60gxiGJ9zuDURWW2k97cgACT96AcXLym/gY+hw17ix00
 4Ag4Elkw==;
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhCkC-00BL0v-0M
 for linux-mediatek@lists.infradead.org; Thu, 13 May 2021 14:55:21 +0000
Received: by mail-ej1-x629.google.com with SMTP id l1so4267249ejb.6
 for <linux-mediatek@lists.infradead.org>; Thu, 13 May 2021 07:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/8vd2SAwTdt88nX11VE63bL19uYaNF7maDv4yIT9Ok4=;
 b=OdlYf21e3GAV7+fJtPuYd/MZ2x4Q9Ktm+p6MDIKe45eorVK0EItJBVTUhfRpEn1FKy
 wzScKBxoIgLTaEF0kfXWfKAsWcuCcWa3kZRhrmZnRtT3Y8Kyv3BIut7KInyGQK/Q7+82
 S+MS6SQbce1OEAMhTpVs41rMza/m9fge+6nrVnaUWhQe7KfXS7z/YvfOYIzMysYwE9CT
 CqdFxylTupNIeHkP1Nqfg4LyMqQGMfcdVkBmNLsTXbZlq6CrAH7kDom2FjfWzECS5b0S
 mZvicBNTg4i76IA8Udo6EWsXsKvSB93DSIKbcwksVrNZgJEzPIXioVdLDVMMsyH/nVJw
 M1Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/8vd2SAwTdt88nX11VE63bL19uYaNF7maDv4yIT9Ok4=;
 b=I5DIEOPB6eCN+qulRM0wua7r/b5EIYlhP9Pt3t/BorBlzmgVgX5wH6GyZPIjyftdon
 ecJd7CJaX+D9nVLDja4f67VNiuJNtdO4Wt/FOeCB69JbIRSPb5wNTvX5GQcqRYI6cJqA
 vs06OzXgPPsG3If9lCpX50jEGmC1q0fOK678BcznEcoK5vNXzaCn12WruZN9jfm+L8OA
 eFOgpm+CMOsH0c0aeel+bCjpv1bGUjcKmkxi0iKKjK8sKsW/x/6hpQO70c0C4hY+lM5y
 Od9IB1tkd5WqWyglMD8nik327PjghBte7gFBAULCR9kJYkY5sqwNvkDM00W+I+KKJ0zp
 z7Dg==
X-Gm-Message-State: AOAM5304i86wO2r/eTVjrWZhCTF61zJoULjNcndZ0JEbiDmXie1AMlbE
 czVR1wI7tUwOqKHUL7lYupbygx27DEJVThavFuqsPw==
X-Google-Smtp-Source: ABdhPJzyUVhAWAlVMgDV04Iqsca9WuX0WFa9WkM+n0Abvzy901iwOodylHjwZuY3UIH9Xp68bXI9dnwIoJZkQnfZBmk=
X-Received: by 2002:a17:906:13db:: with SMTP id
 g27mr468360ejc.88.1620917718561; 
 Thu, 13 May 2021 07:55:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210421052855.1279713-1-drinkcat@chromium.org>
 <c91746ce-88b6-5612-74a5-74600c7761e8@baylibre.com>
In-Reply-To: <c91746ce-88b6-5612-74a5-74600c7761e8@baylibre.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Thu, 13 May 2021 11:55:06 -0300
Message-ID: <CAAEAJfD3i+L4w1NuE5pUkMuH=R3CfBztDn-ZLcYR=onkcZ4Gxg@mail.gmail.com>
Subject: Re: [PATCH v13 0/4] drm/panfrost: Add support for mt8183 GPU
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>, 
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, 
 devicetree <devicetree@vger.kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, 
 fshao@chromium.org, David Airlie <airlied@linux.ie>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, hsinyi@chromium.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, hoegsberg@chromium.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210513_075520_056032_6C7A51B4 
X-CRM114-Status: GOOD (  33.61  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Mon, 26 Apr 2021 at 06:59, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi,
>
> On 21/04/2021 07:28, Nicolas Boichat wrote:
> > Hi!
> >
> > This is just a rebase of the v11, untested (but it seems like
> > Neil Armstrong recently tested it), with small changes in
> > binding and dts. v11 cover follows:
> >
> > Follow-up on the v5 [1], things have gotten significantly
> > better in the last year, thanks to the efforts on Bifrost
> > support by the Collabora team (and probably others I'm not
> > aware of).
> >
> > I've been testing this series on a MT8183/kukui device, with a
> > chromeos-5.10 kernel [2], and got basic Chromium OS UI up with
> > mesa 20.3.2 (lots of artifacts though).
> >
> > devfreq is currently not supported, as we'll need:
> >  - Clock core support for switching the GPU core clock (see 2/4).
> >  - Platform-specific handling of the 2-regulator (see 3/4).
> >
> > Since the latter is easy to detect, patch 3/4 just disables
> > devfreq if the more than one regulator is specified in the
> > compatible matching table.
> >
> > [1] https://patchwork.kernel.org/project/linux-mediatek/cover/20200306041345.259332-1-drinkcat@chromium.org/
> > [2] https://crrev.com/c/2608070
> >
> > Changes in v13:
> >  - devfreq: Fix conflict resolution mistake when rebasing, didn't
> >    even compile. Oops.
> >
> > Changes in v12:
> >  - binding: Fix min/maxItems logic (Rob Herring)
> >  - Add gpu node to mt8183-pumpkin.dts as well (Neil Armstrong).
> >
> > Changes in v11:
> >  - binding: power-domain-names not power-domainS-names
> >  - mt8183*.dts: remove incorrect supply-names
> >
> > Changes in v10:
> >  - Fix the binding to make sure sram-supply property can be provided.
> >
> > Changes in v9:
> >  - Explain why devfreq needs to be disabled for GPUs with >1
> >    regulators.
> >
> > Changes in v8:
> >  - Use DRM_DEV_INFO instead of ERROR
> >
> > Changes in v7:
> >  - Fix GPU ID in commit message
> >  - Fix GPU ID in commit message
> >
> > Changes in v6:
> >  - Rebased, actually tested with recent mesa driver.
> >  - Add gpu regulators to kukui dtsi as well.
> >  - Power domains are now attached to spm, not scpsys
> >  - Drop R-B.
> >  - devfreq: New change
> >  - Context conflicts, reflow the code.
> >  - Use ARRAY_SIZE for power domains too.
> >
> > Changes in v5:
> >  - Rename "2d" power domain to "core2"
> >  - Rename "2d" power domain to "core2" (keep R-B again).
> >  - Change power domain name from 2d to core2.
> >
> > Changes in v4:
> >  - Add power-domain-names description
> >    (kept Alyssa's reviewed-by as the change is minor)
> >  - Add power-domain-names to describe the 3 domains.
> >    (kept Alyssa's reviewed-by as the change is minor)
> >  - Add power domain names.
> >
> > Changes in v3:
> >  - Match mt8183-mali instead of bifrost, as we require special
> >    handling for the 2 regulators and 3 power domains.
> >
> > Changes in v2:
> >  - Use sram instead of mali_sram as SRAM supply name.
> >  - Rename mali@ to gpu@.
> >
> > Nicolas Boichat (4):
> >   dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
> >   arm64: dts: mt8183: Add node for the Mali GPU
> >   drm/panfrost: devfreq: Disable devfreq when num_supplies > 1
> >   drm/panfrost: Add mt8183-mali compatible string
> >
> >  .../bindings/gpu/arm,mali-bifrost.yaml        |  30 ++++-
> >  arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   5 +
> >  .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |   5 +
> >  .../boot/dts/mediatek/mt8183-pumpkin.dts      |   5 +
> >  arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 105 ++++++++++++++++++
> >  drivers/gpu/drm/panfrost/panfrost_devfreq.c   |   9 ++
> >  drivers/gpu/drm/panfrost/panfrost_drv.c       |  10 ++
> >  7 files changed, 168 insertions(+), 1 deletion(-)
> >
>
> Seems this version is ready to be applied if we get a review on the DT ?
>
> Mathias ? could you have a look ?
>

Given Rob has Acked the DT bindings, I think it's OK to apply patches
1, 3 and 4 via drm-misc, letting Mediatek people sort out the DT changes.

My two unsolicited cents :-)

Ezequiel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

Return-Path: <SRS0=Strr=JL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8B3CC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 14:53:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26727611B0
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 14:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26727611B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5wZu94Bt5DNx6HAGsmtWhgEqtBORB32OPq9yrcMBYtw=; b=reOwyVLcTU6iWKmF0VRVic0/9
	QYtMN0b1dSDS7SdGqtqxW24Ra03UQjAB9QCj/87mXio1i4zTKcEHiQsclS1XClM0dDSiYoSBBsf3K
	T06fy+R4RAVZYQqm/j4K5r9LfniCiQsvqy9W8V1JKdEb2M2TJkkmXJSMEV6gP8sTmcjflghw46BRq
	X2Lk7N6LAUTN1hGUw029WdD2iYmnifc+IKXalxSQ+Ohv23MJVereKl+S6O+RGB1qiDXGhFDJYEoDS
	GIPRklNT45LnczVOZnGmPcvre5wr5i7/Ip3Hxhd2fNf/6NGVGfkh66rf8slhPO1EU8ZTGLlMUmXmX
	vl0mSkhXw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWgto-00CxGu-VB; Wed, 14 Apr 2021 14:53:49 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWgtb-00CxF8-JE; Wed, 14 Apr 2021 14:53:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=3YMvYEtHewROZOpFAlE+YVnTRwtmI4sbne6ZZ7QNqKw=; b=RWDkKk4xCZHtGpOR9gNaknO1HR
 AUw8FfCU13ivo2O5kfI5kJG0ZnaV0sZwOcLN9o+QANXkokA3IkeVEyASoF88O0HmYQVuU/F/XD72T
 C36tXxVgtvE7VUzcVxruMouXsTE9xo1sl2+94O38aDiidqlH7dcLaCiY0qnK7WW8rNLF7n2NUd/oq
 CBT2vQ3UF2kuvxtKB705VC3+LoqqppD5oZo3W1DX6oO03oausDP1wcnsFVJjR8/3x0JVMoM+77vlF
 iDsKDJ9zJFWEW/jwuwgrtr6m9Av4tQu63D/dh+/Mo58eAthIxltIPnoQ0MaGiBuoDT7CbkABudu0A
 w4YF66Cw==;
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWgtZ-007qii-3X; Wed, 14 Apr 2021 14:53:34 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 x21-20020a17090a5315b029012c4a622e4aso10963148pjh.2; 
 Wed, 14 Apr 2021 07:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3YMvYEtHewROZOpFAlE+YVnTRwtmI4sbne6ZZ7QNqKw=;
 b=gk1viNQDK7ATXpkM7+FeLIsLNRfFMGyp0/r07qHCpZQpPF0CpIQj0R5blR/OdQwqB2
 qpYJWOLGJa9ewSlnMr7wdEuxSxp1AfJ0Hjlpj1S1XFdpI/G2togUKr+loeuKgbgn4xFE
 8Rr+gnWPuVitTPdq41lvXakBF6WbVHCpY+lhCb3AElHcbMRVoE1KfmagE6u06IuQdFB3
 A9gK+4mFF66bDX416YCsn4iJ2j1XzECIGaECKtv7xaOkHwEkcCpxqocCfZK+BTgXmAnt
 G2CFuNYv2k/qwJeLyXFeuPlTxHZtUEX3jj0lqdCDjc6u/eNvjcxcGqubjgwI9DFU8uDn
 7SDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3YMvYEtHewROZOpFAlE+YVnTRwtmI4sbne6ZZ7QNqKw=;
 b=PIwUgiTejecHZ8sJDuOn+B78ydlJ66b5jvfU/kkZrn6ruxYR+vR4W/XUeGNGu1qIPF
 A8Ebp4w6b6r2JHnJKFmiQ0o/eEyhAWsP1dLMnjGaFl6X11bXIdp92sltT0zOaZe3i55W
 kXiglkYC1/O+hn7Ox09enGLgi6IxMMZBymvvoRL/zygsVyLgJz5Rc97eG07wEtzXYcfi
 0tZwAgbxhPtOkkdk/8Alj8zM8LaK8U03K8LW7IeJE+M0M5EfYg9X7zS/T2NsUQdOy7Ww
 qTlCAI3P4miCqLR0CwICeV8dYntTKNi/+rZ6mbD73VAejgQn2q7qHLnfyaKfXqFFHNrY
 DfSw==
X-Gm-Message-State: AOAM532phIJoJkua4MNc7My4lg7SO6uq4jX5rFNmbrlkjZSelEwHjZUZ
 z81lr+lAvjeEE42To9nCRtMegTDkj7PlnfWRupE=
X-Google-Smtp-Source: ABdhPJxoTj72BoWiQQAL0hug/P6L4J7UqtuVV3Zj6//58oTaD2XEZzKaiijbRgpI7vJRshL+1CdfH5CNLg1PCWSM5ac=
X-Received: by 2002:a17:902:ed14:b029:eb:8e3:bfc9 with SMTP id
 b20-20020a170902ed14b02900eb08e3bfc9mr14876376pld.54.1618412008841; Wed, 14
 Apr 2021 07:53:28 -0700 (PDT)
MIME-Version: 1.0
References: <1618226325-31927-1-git-send-email-yongqiang.niu@mediatek.com>
 <CABb+yY1b9wD0hoBx=aYzpLcF-=EEG4QTrV68sZj8+rtf5J1aJQ@mail.gmail.com>
 <1d946d1c-1626-33ed-26ba-f840729d63e7@gmail.com>
In-Reply-To: <1d946d1c-1626-33ed-26ba-f840729d63e7@gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Wed, 14 Apr 2021 09:53:18 -0500
Message-ID: <CABb+yY2ar8LcYMUrOTP8gH+DhNdV3aL7nuod4Uc_fuQq2A8K+A@mail.gmail.com>
Subject: Re: [PATCH v2, 0/5] Revert "mailbox: mediatek: remove implementation
 related to atomic_exec"
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Fabien Parent <fparent@baylibre.com>, 
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Devicetree List <devicetree@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_075333_165580_13649D5F 
X-CRM114-Status: GOOD (  21.66  )
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

On Wed, Apr 14, 2021 at 3:51 AM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
>
>
> On 12/04/2021 17:29, Jassi Brar wrote:
> > On Mon, Apr 12, 2021 at 6:18 AM Yongqiang Niu
> > <yongqiang.niu@mediatek.com> wrote:
> >>
> >> This series base linux 5.12-rc2
> >> these patches will cause home ui flick when cursor moved,
> >> there is no fix solution yet, revert these patches first.
> >>
> >> change since v1:
> >> add mtk-gce.txt and dts modification
> >>
> >> Yongqiang Niu (5):
> >>   Revert "drm/mediatek: Make sure previous message done or be aborted
> >>     before send"
> >>   Revert "mailbox: mediatek: remove implementation related to
> >>     atomic_exec"
> >>   Revert "dt-bindings: mailbox: mtk-gce: fix incorrect mbox-cells value"
> >>   Revert "arm64: dts: mediatek: mt8183: fix gce incorrect mbox-cells
> >>     value"
> >>   arm64: dts: mediatek: mt8183: add gce information for mmsys
> >>
> >>  .../devicetree/bindings/mailbox/mtk-gce.txt        |  2 +-
> >>  arch/arm64/boot/dts/mediatek/mt8183.dtsi           |  5 +-
> >>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |  1 -
> >>  drivers/mailbox/mtk-cmdq-mailbox.c                 | 80 +++++++++++++++++++---
> >>  4 files changed, 76 insertions(+), 12 deletions(-)
> >>
> > Please break the patchsets (this and the other 3) into mailbox only
> > and platform specific ones.
> > Also, it would help if there are some acked/reviewed by some mtk folks
> > especially when reverting patches.
> >
>
> I'd prefer to have DT and mailbox patches together as otherwise the burden on me
> to find out which patches in the driver are needed, and to check if these got
> accepted, gets higher.
>
I meant the patches that need to go via mailbox tree (controller) and the rest.

thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

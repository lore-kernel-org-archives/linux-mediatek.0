Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BCFEC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 08:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+uuARNyOgTXTk0gskQkqLyWuxd7tQnOqhRIbKWcEdSM=; b=Fm3I2cM7hToh8o
	ME7URyUVVlS/SxU5QbLGZdULMB+UvoqEvMeIexq0lPbLjM6G/ZIqlgahPWpBTPzgZV6eBIobVXVD7
	l23GnmCdnPAyXKlLrs2C74gW059SRuuNW4H1m41ZMrwLHBlHQChoKa0RZrhrYAOqMjCHjombd/+eI
	61RextWXKFhzLdO2iPXcjpBu2jTiU+H970dORWV600aQ2yaUG8vFdN42RlUEVHfaz0MBp9zaBFsAS
	H8KghU4GGUd7eVK7U2eB7weIBs9rq94qbd7deBVDza4Bnmt7Cd8JrLOgZeyuzbINaHdkHcLLeuuAn
	EivJEifpVDDnthrVhr3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhSWL-00CWLV-1o; Thu, 21 Apr 2022 08:50:37 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhSVr-00CW6s-90
 for linux-mediatek@lists.infradead.org; Thu, 21 Apr 2022 08:50:09 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id t67so7534991ybi.2
 for <linux-mediatek@lists.infradead.org>; Thu, 21 Apr 2022 01:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C1t5mUF1ebuEHByKOPa7jvd5uPJ4IKlhTRldMrpukDU=;
 b=X7X1O9iZdMtSeshylJiakmEOV4UCGYmtQG5/k2PnUtQR35LhOowY9T0zT0TZ7chMfw
 PfGEjARNnp5i4aK9OW15d4E4lmkPv0Vfa2+oFSvEzlbOUzewFHAWSTPyjUYccbN26eKB
 YEtp4B+p7iKbdk4d2wq3m84k/DDtbU/vgWpSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C1t5mUF1ebuEHByKOPa7jvd5uPJ4IKlhTRldMrpukDU=;
 b=yqOGXtKTIMcXY4e6lJwPjcJB7LIXHsOWHnlFE5Z3iOLEElVWuh83qmVJjBw93O+DT2
 6cW0jT66Is2yfENLuyjfx+BQ38ye5GUYKtY0SkKqwNGW0b/A+4C8XC9OCfct6C3Nfz2f
 2bL62cX4hCp5QeFlvH4mFHsRNMjZUVohLI2T9/XlT23yeUCsTAyPX5IRjvEnxgeAlehp
 rFmR9DEdFnHUtxuGbz3n0MMArOR1JIQOOpbN8Q5M04cdHtYqaSjdiFN9xrNicpC1XgMa
 UCb7z9sCPMUVZusAIz6H3VDmbyGcRBCehwsPa5FFnAlGVeXiIIdLP6qhELEXv1Q7qi+Y
 q0vw==
X-Gm-Message-State: AOAM532EZ+2q1nD/LvEliyqppfqZ1cGT3BHP8TFELVZgJO4zh6Xiuh6D
 lpjvqMG9fLpPXO72OG7+1fVdzCGT8vmtvfR7JolS4g==
X-Google-Smtp-Source: ABdhPJyp/x2iHg2u/UbKD2umcDkFiw3TdbXVeOp6mmt8vzeFktbi6PtrjNtBzfFq1Myl4QMjaHUyxzECRA36CLqzFgs=
X-Received: by 2002:a25:2ac3:0:b0:645:36f4:2db3 with SMTP id
 q186-20020a252ac3000000b0064536f42db3mr12076194ybq.189.1650531004985; Thu, 21
 Apr 2022 01:50:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220414025023.11516-1-Nick.Fan@mediatek.com>
 <ee2f0819-8c9e-4160-c4ae-fb4ad0da3f3b@collabora.com>
 <b6509465-b7c7-0e66-071a-be85793cce58@arm.com>
In-Reply-To: <b6509465-b7c7-0e66-071a-be85793cce58@arm.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 21 Apr 2022 16:49:54 +0800
Message-ID: <CAGXv+5EhBB2LiQ_XL_ya7aceE7SBqZpjrbXe-gf81ed8qbeKBw@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: Add DT schema for Arm Mali Valhall GPU
To: Steven Price <steven.price@arm.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Nick Fan <nick.fan@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com, 
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com, 
 linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_015007_397339_AA314006 
X-CRM114-Status: GOOD (  33.28  )
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

On Thu, Apr 14, 2022 at 8:47 PM Steven Price <steven.price@arm.com> wrote:
>
> On 14/04/2022 12:51, AngeloGioacchino Del Regno wrote:
> > Il 14/04/22 04:50, Nick Fan ha scritto:
> >> Add devicetree schema for Arm Mali Valhall GPU
> >>
> >> Define a compatible string for the Mali Valhall GPU
> >> for MediaTek's SoC platform.
> >>
> >> Signed-off-by: Nick Fan <Nick.Fan@mediatek.com>
> >
> > Hello Nick,
> > Unfortunately, this binding is completely wrong.
>
> I think that's unfair, although there is room for improvement.
>
> > First of all, there's no arm,mali-valhall driver upstream - this will be
> > managed
> > by panfrost later, yes, but right now there's no support.
>
> We need a binding agreed upon before support can be added.

+1. I asked them to send an updated binding for their hardware so that
we could have a discussion about it and converge on something.

> > Then, you're also setting opp-microvolt in a way that will never (or, at
> > least,
> > not anytime soon) be supported by the upstream driver, as it manages
> > only one
> > supply for devfreq scaling.
>
> The mt8183 binding (already in tree) is very similar. The binding also
> should be describing the hardware not what the driver supports. There
> are indeed limitations in Panfrost for supporting multiple supplies, but
> that's something that needs improving in the driver not a reason to
> block a (presumably correct) description of the hardware. I can't
> comments on whether the specifics of the mt8192 are correct.

Having an agreed upon binding also means that we can bring our downstream
driver into alignment, instead of having to maintain a device tree fork.

And +1 to being able to handle just one supply is a limitation of the
driver. Panfrost in its current state would just not enable devfreq
if more than supply is given [1]. Looking deeper, the OPP core currently
doesn't support more than one regulator for a given device.

> > Besides, please don't push bindings that have no upstream driver,
> > especially if
> > these are for downstream drivers requiring proprietary components, while a
> > completely open source implementation is in the works.
>
> More constructively, Alyssa has already posted a patch (as part of the
> series adding driver support) which would extend the existing Bifrost
> bindings to (pre-CSF) Valhall:
>
> https://lore.kernel.org/dri-devel/20220211202728.6146-2-alyssa.rosenzweig@collabora.com/
>
> I'm not sure I see the point of having a separate binding document for
> Valhall considering the (pre-CSF) hardware is the same from the kernel
> perspective.

So I suppose the next step should be to move the required MediaTek
specific changes into the existing binding instead of having a new
one?

Separately I think we would need a new binding to spell out the
requirements of MediaTek's two supply OPP table? Or maybe this could
be in the description of the Mali binding?


Thanks
ChenYu

[1] https://patchwork.freedesktop.org/patch/429782/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9ABC531D0
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2026 04:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ayTdrhGTmTRlS5yubk7pA+8kF1TugqiIc+iTJFgG25U=; b=jOxoAyQgPLuBr6rNEhGmC/JfFX
	hAL0onntXbuKY4Gitrdrq1EQPLrenwoCyt7wA9FrCTyQDVka4sudBBFUFhS8wDmIbGIic2ribkqZR
	Y50rulZFegIo1hHPADS3l5gxK5Oo+T7dgmogtWWfay8RQdOQsVEJvcoyR3zufjhYpVN/6rW1xymEV
	7CiEraTarDNGmmxYRwaLIXzNHgO141ZsGNpkszdyGPid8wvnhf5Ns3XuKVGRRWjh4A0O7WJoAsflK
	pMqtT70YFH41tGZbDdaQpQ2evL8BXn7Kk21+aEdAiGMswbdqymOlrCnD5TgC3V3K1v3KbkKr1dG8p
	e1WmI82g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpIk6-00000009VXy-3uZh;
	Thu, 30 Jul 2026 04:51:38 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpIk2-00000009VWV-1nAS
	for linux-mediatek@lists.infradead.org;
	Thu, 30 Jul 2026 04:51:37 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-81e6f2ee60bso5734247b3.1
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Jul 2026 21:51:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785387093; cv=none;
        d=google.com; s=arc-20260327;
        b=ca1v6ZRz3OpUuv2jz2dh3OH2nhwA2NE8Rb+bnRAXU/eBRYlEEEBPnJhGoegsRrhmC9
         /dPM0wKXk2Ou1ndpkyILT98JTI1Q2FiXaN9yzcvZDe7Uj70agO85N2f+R6wMHJxsnv5R
         R5c0tU9RWZCqA3nDLDpC156qjEefdmmcTDrAoz5idUdP9BCrtU69vc0A32qTQ9Pii3cA
         2LLwSS6mWUirseF1w6A9dv00XKddRRbvj/31d05IwT+zIj+ExMvKcYPB7kZ1f+uwaEfv
         kpM+x/fEi7AWxKIoku3+kYdT/RPqd8DaEHxIpdp5TbZJiuqpbMxoLsiDk+fXcZWHKNyC
         UHBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ayTdrhGTmTRlS5yubk7pA+8kF1TugqiIc+iTJFgG25U=;
        fh=EtwuD7hI2NF4LTTIsbfRK8Xcm0XbhxIoj0C2CLQLT8I=;
        b=P0xfXtPzXI9pVsi8Fff1gEFJgvFNb3rXV6IWY9cyFgbbZ4p+dKSfS+sWrKGTHTsj7C
         m0n2ZWVkuLnfxRxjMvxX+LMS5pjnUFfJZf8W+l4LReoAmJqy4RlCj1p9PG9v/pfYg1fF
         xr0kQNdAbQiT//g8aupunRH27Sbp3gMkvC9RkwpOvkI4mX8AgxBUWaxJjEcCC53PNePB
         SSZMbPjOeClqGi/Rb+3dfVk6SvFJ1RHTTL0VSFPa+1GXJFKmU9j/nFZREAhVEiGNljbs
         94JWuha+ExvdmxUTJRtS7UdtRd3IxTQ8Wi7X43hK9Q97AXCQlTargSCGrftwjol1P1DF
         tcsw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785387093; x=1785991893; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ayTdrhGTmTRlS5yubk7pA+8kF1TugqiIc+iTJFgG25U=;
        b=KW44Ew9lnL9QiBesEKNNqfVNcG+nvCV0ve9cMIuAkg4LkqJ7Arrk68RJZwx2Ti0cEr
         r7b535jmigc7xdvDDnF2qq+srnJb8hnQB95UDktHeu1nLFEMh+GksdN0nn14zH4+xp6E
         ThHsMN0+pmKA4bQSR2z+ZMWIFUFUPvarVB8n4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785387093; x=1785991893;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ayTdrhGTmTRlS5yubk7pA+8kF1TugqiIc+iTJFgG25U=;
        b=pvM5AagK+rZOLXesMkYnX213KBGb8tLK1+1bUHQU3cM8CeXaFFf6mNO+Rbm/uDUeyx
         fF7h/37XP5EeMGfHt6EnQ0UElLQivlOoGyJmzVFrUFKvzIMVTFUyINUg6LrEn1IFwRX0
         F5VzB/Xug7SpHkrR0mYeh4aWiprqAElhCvnTkINP/zRabSdMRfLTc8s7yeSxqWt3l8H8
         V2jXDYppihA+8+7B6ZdXFkR7P8wdG/1xQ8XNYxQE8d0wJnIhK1lTgihjMLVvdCExtcVn
         Y5ApncHRmC0fF8Nt8F2pzHj/0fxFcwZ+2+HXfeDcBxiPcTNKxY4cx1FSaRiOmNUPmgwG
         Z7MQ==
X-Forwarded-Encrypted: i=1; AHgh+RqXUj/FLUQnew8SQfzXpiEZFTj3H8Dk7+TQ3EK1Q4Y/bsIz3zD7eCire/vKX0QPgeeolnvw6FsHxWLW9suRFA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy6805ilG+5lLeFsRq2ZVJ35FFPdbjZejVJf0LZebY+RgbULK4
	FPwXJCq4iHBbkNnkoIErZjfDur0sQlP7SIvIOFub4MMjFq4y1EH2YMur8SKmwBZxxJAQ2APPeUX
	3EWo6UEeYufEi8Duv1wFoQtfekugOJVpwMMIvEdRW
X-Gm-Gg: AR+sD12mMt2Bb3GYwdqROyVISd6B0B7vxhfUf8omK8MhwoEr3so3qtuwnqUCKjN2JFq
	m6SdVZ+HKpNkQfAVGJOQpKLjZBeSHgOAmdBhWmv7kiiJYEj7yXb5iJCBtlWsF+sZ7YI1XnzxbXO
	SVQowZPZNrSQu/x8ypmbhRjhLZV++RVB5kDiNcd23KWZRgpIPVHstQCprpkq6lmG8moIFMh6N8h
	1bfkhyemkwypCklmUFaq5ef01TFIuWlRFW2kB/frGdieE99Y0J0cMC6+6t49pO7gHyj7AkLmGJE
	f7l9WxznXy+QTWDHTqk3sGPCiLzIlGeEgxPP725sM4J4biaALDHu4PSVym3ke5+y8XiGOTOg33t
	/ikhWaGUc4g==
X-Received: by 2002:a05:690c:288:b0:81e:ba92:b253 with SMTP id
 00721157ae682-81fb964be1amr5292937b3.4.1785387092765; Wed, 29 Jul 2026
 21:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260728091804.382753-1-wenst@chromium.org> <amiqKRkFItYwD6oL@redhat.com>
 <CAGb2v64zUO-azpTuei6LCypad2noGFbg+EmaBC1iidoZ2stQzw@mail.gmail.com> <c1048eae-72c5-4e2e-ac49-25e2c4297018@collabora.com>
In-Reply-To: <c1048eae-72c5-4e2e-ac49-25e2c4297018@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 30 Jul 2026 12:51:21 +0800
X-Gm-Features: AUfX_mxnxexVKpsRakYQvwrmIlkydC8kB3j1QZQvD5J6WTjr-o8egQw_wYmWxF8
Message-ID: <CAGXv+5EgGYFVt4TJCysQgRqA1J5=Qz9c0oWY5YTxgc5PnNC_AQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] powervr: MT8173 GPU support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Brian Masney <bmasney@redhat.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>, 
	YoungJoon Lee <getfeus@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_215134_478006_30184567 
X-CRM114-Status: GOOD (  23.57  )
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

On Tue, Jul 28, 2026 at 10:33=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On 7/28/26 15:13, Chen-Yu Tsai wrote:
> > On Tue, Jul 28, 2026 at 9:10=E2=80=AFPM Brian Masney <bmasney@redhat.co=
m> wrote:
> >>
> >> Hi Chen-Yu,
> >>
> >> On Tue, Jul 28, 2026 at 05:17:58PM +0800, Chen-Yu Tsai wrote:
> >>> Hi everyone,
> >>>
> >>> This is v4 of my MT8173 PowerVR GPU support series.
> >>>
> >>> This time around Mesa was ready for basic testing, using both vulkanm=
ark
> >>> and glmark2-es2-drm (with Zink). Details below.
> >>>
> >>> Changes since v3 (all in the clk driver patch):
> >>> - Changed pm_runtime_put() to pm_runtime_put_sync()
> >>> - Added missing of_node_put() in remove function
> >>>
> >>> Changes since v2 (all in the clk driver patch):
> >>> - Made COMMON_CLK_MT8173_MFGTOP depend on PM
> >>>    - Needed since the driver implements PM domains using the generic =
PM
> >>>      domain library, which also depends on PM
> >>>    - Fixes build breakage (kernel test robot)
> >>> - Fixed "RST_DELAY_CNT" name (Brian)
> >>> - Dropped unused mfg_desc (Brian)
> >>> - Added check of clk_prepare_enable()'s return value in
> >>>    clk_mt8173_mfgtop_power_on() (Brian)
> >>> - Saved error value for return in IS_ERR(data->clk_26m) branch
> >>>    (Dan Carpenter / kernel test robot w/ smatch)
> >>>
> >>> Changes since v1:
> >>> - Adapted to changed DT bindings
> >>> - Dropped driver change
> >>> - Use same power domain for "a" and "b" GPU power domains
> >>>
> >>>
> >>> This series enables the PowerVR GPU found in the MT8173 SoC, found in
> >>> some Chromebooks.
> >>
> >> I'm making a pull for Stephen for the clk changes. Should patches 1,2,=
4
> >> go through the clk tree? Patches 3,5 go through the DRM tree?
> >
> > Only patches 1 and 2 should go through the clock tree.
> >
> > Patch 3, 4, 5 can all go through the soc tree if Angelo wants to pick u=
p
> > DT binding patches. Otherwise I can push patch 3 through drm-misc.
> >
>
> Not sure if I can really take the DRM bindings patch through soc.
>
> I will take the devicetree ones exactly right now, even though it's going=
 to
> give warnings.

Apologies for missing this, but the first DT patch depends on the clk DT
bindings patch for the clk ID macros. This is causing build errors in
linux-next right now.

Not sure how we can fix this right now.

Brian, would it be possible for you to split out that patch into a
separate immutable branch for Angelo to merge?

Otherwise Angelo might need to drop the DT patches until the next cycle.


Thanks
ChenYu


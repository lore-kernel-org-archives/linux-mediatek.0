Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7219CC79F80
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2026 08:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tBqFv7ZNVkf8/OWug/8l6emlj27SIx7U4VNemvpWjT4=; b=iQNy57IH/T4/2vNmOZvB6Zo+qR
	JwrHyFVf2eDQuoP6HFxwcW2XJUl1/EbiEOw6MVjA91WpiJs38ElFu2g226uRW50Z8bZSo9Fix+DGh
	r/t982qXaPjsLFxBafDbqXFmbH3dp3e7h9gEHwVLkEd58tNOqyKlkFJuVHPtDdoyvpFnkEgzPYpGW
	Pz/p4XLZZ44KePRxzmCne9Rn/F9IHv2ynxf4EtqsCOEa02Ib6FjfAY+aVvdAnzvhFOoqkIiTWR+dW
	+7NGLte5fyiCnWkZY+7y1mNaA93BlNYqcE4BpkCzMqgeMFDzI14uer+P3rNHJ4tq1kUFdLSnfuhXf
	uGyWEgtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2P3t-00000001Lcp-3OJD;
	Fri, 04 Sep 2026 08:14:13 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2P3q-00000001LbR-4AUY
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Sep 2026 08:14:12 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-66f7f62e915so658655d50.3
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Sep 2026 01:14:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788509649; cv=none;
        d=google.com; s=arc-20260327;
        b=ZjS1OrrX7oQpyXaEcNZCLDNg8WplrpEuyACyERRjh8A1G/Gh/p7dzzQxIPtX6fpIwb
         q9U7MaFFmsBaUP9qhyo14nB201Hw3pQhzv+p/1HIHzBc+YSERtgNrfGUHoVed+R8try9
         Be7Vfd6km9NKWKfFjYy6liWCCfAXdVs9bEleOlaVG3yXimbORAswujC4wWyE+3duOLGI
         EhXHCefU4li2Lzu0Jy9/Min2huJy1EE28JxC0Ti7zWC0EPXSZLpyoQ45j6a7vmZ1eQx0
         MY604jEMSQQefMSPGJ99yKJFIgi3dqNdSoNZvW0N71MdR9o/BwmaFCZVOBf/uX6HhhxM
         /WPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tBqFv7ZNVkf8/OWug/8l6emlj27SIx7U4VNemvpWjT4=;
        fh=GowAR+DP7qYmpkvP8RMQxNrw4yotLLV/vXx5i67G/tQ=;
        b=Gba6fOsycD6LV9Y3hsn58mJZVeerAqW5zOZOXf7acio6Q3ATM4t2WeFtKOabmz6FDj
         /CYCiiBan+nZAydQNSYlhL263q13nz0ZnTkjIwCPBaXXxdxmJsgJI73Qfjx5KI+z5lTf
         YgBE+enrI5eR/QY/ELbaAOYH0mvyEgI+Ycjh79T2GmX8NOLJB2CE//KEshZzH3u6WfGn
         O43IYKy014pkeSey+gitVgaGdPQPb+n/+yq98ibjxdrdgLrhMD/Tt4EaZ9n3YLwPPdsr
         mSI06/dNztFzVgK5+F7M8hgiX6rpcAcFa2U1mJ1MDXf3pfzYGHbR3rllVtlM8LOblQtq
         V6RQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788509649; x=1789114449; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tBqFv7ZNVkf8/OWug/8l6emlj27SIx7U4VNemvpWjT4=;
        b=APW5BzcJJi2VM/4/K8/IQ60M+u0p/PiW650nx5f0bVl/c/18YGhlWd0Wvp1a3jiDJE
         d8qDPefK9RGNHF3jKEsFefU/bhKEwycE8ZAHdfg9XaemLOzTU8M5imeSlQEtDkbpPi6Z
         GFij8THFkugk1PNlPw9R7z3g8jviqs3rg+5J0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788509649; x=1789114449;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tBqFv7ZNVkf8/OWug/8l6emlj27SIx7U4VNemvpWjT4=;
        b=KvMpc3c6FXl3ktXHp3mhDy5lozIredOEwuEkaUYTmS7Thhh4JMOo49Rs8P/ucleked
         V/PNgboO9+9wMZc+pUJrE6X0vaA8+xHIuE92w3+uydE0nGRdKTlUsjjkeq84gjXXSBgE
         8oYtAQgpGEQ201APjMYYGl826jwyd/64WLvlCZBbJ06s86zwjs7Q1s/TMNpP/MJUrb4X
         RAl+gURfFyX2zuX4Ij7GisYd0iIjGuu8jXf39wRsh7S5pbtuJF5obhPu0hYm5HiCIdmb
         GeKMvPv8NirjJE7VBngWX4bNk72DR3+g3AR62ABC833b9hl0ED2DYDUqFPjlCzJOlUt6
         jUng==
X-Forwarded-Encrypted: i=1; AKwUvBy0Bp3Fw897y2iG+l59GJ+rXV5LPawaRWZxGZabw1SZyxAL2SCWTLCa519YcOCN3uWRswvo4aqeSdHDxwxTSA==@lists.infradead.org
X-Gm-Message-State: AFuF++lDQIz7WbBbmdOJnQafb9of9iaEKNFnI0zrEIgVLbDHQSlv0dZb
	rvX8DFTILPoMFP+TFs1nHzEp2EODpj9/UtqhYIs2h33b5yO7aA7bBhMDykF1VWaT2IofcZlDM42
	ticEJuGl+wtwbNv6EgkP0Yq1UgjrC6g6lxsLMqAC9
X-Gm-Gg: AYBFou20opgS93y2ODaHYtbVsClAawDcEzfgdS+tISAx0Khb7rMkbHx8nDLQjM/RKCF
	r5NVr8SC1foijBK52gz+9RYbaPqs/g+TgrLCzIderBm3Dmx3rGne1CQQFgJbxhAhAYBOgcUj98f
	6YNU7+3J5Ooc1IgDt+FFMOLVnhbs1LWgnADe5fqCri8/9/MaDr2fo2GkboYcP9fruf0otB33PXR
	UVnUJB30EUMJfq0YzK2fTc3sWr6bagF+DsXO8poimuJ3OZprsGzWSeMCcsZ46cxi6RasXPCha3i
	EgpGT1rwWeip9orZNj4gK+4c60bPA/YC7YYdkxUM1iK0kfvwQ92r8iAh8+N0VSWnOSo4TMxTBfo
	fIKEpBsw6
X-Received: by 2002:a05:690e:168d:b0:667:770c:f88e with SMTP id
 956f58d0204a3-66fb5aeafe7mr1463610d50.45.1788509649151; Fri, 04 Sep 2026
 01:14:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260728091804.382753-1-wenst@chromium.org> <amiqKRkFItYwD6oL@redhat.com>
 <CAGb2v64zUO-azpTuei6LCypad2noGFbg+EmaBC1iidoZ2stQzw@mail.gmail.com>
 <c1048eae-72c5-4e2e-ac49-25e2c4297018@collabora.com> <CAGXv+5EgGYFVt4TJCysQgRqA1J5=Qz9c0oWY5YTxgc5PnNC_AQ@mail.gmail.com>
 <36f2775a-d332-4913-8e9e-ca0429c3f713@collabora.com>
In-Reply-To: <36f2775a-d332-4913-8e9e-ca0429c3f713@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 4 Sep 2026 16:13:58 +0800
X-Gm-Features: AcwNN1XC4LXAm1BwVIM4UDg-tlD1lttg9AE64QKW3tHBF46eVGyIPLVMv5NqRcM
Message-ID: <CAGXv+5FEx=H9r5MGequDpH3i62FAWbXdwkk66eBj8+ziT1fhMA@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] powervr: MT8173 GPU support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Brian Masney <bmasney@redhat.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Alessio Belle <alessio.belle@imgtec.com>, 
	Luigi Santivetti <luigi.santivetti@imgtec.com>, 
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
X-CRM114-CacheID: sfid-20260904_011411_109747_71B17A4C 
X-CRM114-Status: GOOD (  30.06  )
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

Hi,

On Thu, Jul 30, 2026 at 4:23=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On 7/30/26 06:51, Chen-Yu Tsai wrote:
> > On Tue, Jul 28, 2026 at 10:33=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> On 7/28/26 15:13, Chen-Yu Tsai wrote:
> >>> On Tue, Jul 28, 2026 at 9:10=E2=80=AFPM Brian Masney <bmasney@redhat.=
com> wrote:
> >>>>
> >>>> Hi Chen-Yu,
> >>>>
> >>>> On Tue, Jul 28, 2026 at 05:17:58PM +0800, Chen-Yu Tsai wrote:
> >>>>> Hi everyone,
> >>>>>
> >>>>> This is v4 of my MT8173 PowerVR GPU support series.
> >>>>>
> >>>>> This time around Mesa was ready for basic testing, using both vulka=
nmark
> >>>>> and glmark2-es2-drm (with Zink). Details below.
> >>>>>
> >>>>> Changes since v3 (all in the clk driver patch):
> >>>>> - Changed pm_runtime_put() to pm_runtime_put_sync()
> >>>>> - Added missing of_node_put() in remove function
> >>>>>
> >>>>> Changes since v2 (all in the clk driver patch):
> >>>>> - Made COMMON_CLK_MT8173_MFGTOP depend on PM
> >>>>>     - Needed since the driver implements PM domains using the gener=
ic PM
> >>>>>       domain library, which also depends on PM
> >>>>>     - Fixes build breakage (kernel test robot)
> >>>>> - Fixed "RST_DELAY_CNT" name (Brian)
> >>>>> - Dropped unused mfg_desc (Brian)
> >>>>> - Added check of clk_prepare_enable()'s return value in
> >>>>>     clk_mt8173_mfgtop_power_on() (Brian)
> >>>>> - Saved error value for return in IS_ERR(data->clk_26m) branch
> >>>>>     (Dan Carpenter / kernel test robot w/ smatch)
> >>>>>
> >>>>> Changes since v1:
> >>>>> - Adapted to changed DT bindings
> >>>>> - Dropped driver change
> >>>>> - Use same power domain for "a" and "b" GPU power domains
> >>>>>
> >>>>>
> >>>>> This series enables the PowerVR GPU found in the MT8173 SoC, found =
in
> >>>>> some Chromebooks.
> >>>>
> >>>> I'm making a pull for Stephen for the clk changes. Should patches 1,=
2,4
> >>>> go through the clk tree? Patches 3,5 go through the DRM tree?
> >>>
> >>> Only patches 1 and 2 should go through the clock tree.
> >>>
> >>> Patch 3, 4, 5 can all go through the soc tree if Angelo wants to pick=
 up
> >>> DT binding patches. Otherwise I can push patch 3 through drm-misc.
> >>>
> >>
> >> Not sure if I can really take the DRM bindings patch through soc.
> >>
> >> I will take the devicetree ones exactly right now, even though it's go=
ing to
> >> give warnings.
> >
> > Apologies for missing this, but the first DT patch depends on the clk D=
T
> > bindings patch for the clk ID macros. This is causing build errors in
> > linux-next right now.
> >
> > Not sure how we can fix this right now.
> >
> > Brian, would it be possible for you to split out that patch into a
> > separate immutable branch for Angelo to merge?
> >
> > Otherwise Angelo might need to drop the DT patches until the next cycle=
.
> >
> >
> Yeah, that's so bad.
> I'd be happy to be able to resolve this, but it's too late on my side.
>
> I should've checked the DT patches more carefully, my bad: I got a bit to=
o excited
> to finally see this PowerVR stuff working on MT8173 and going upstream.
>
> Sadly, I have to drop the devicetree patches :-(

This is a reminder to re-apply the device tree patches from this series.


ChenYu


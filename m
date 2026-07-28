Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 880F7C54F4C
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2026 14:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+zoBoxVP0tu54EmP44Kgg99nD/WSNJ3du1BUA30wzps=; b=elmOx+H1ZEH+49
	LTkqv4QSRXUUmdAsCoeyFcetpteOZTgCQNdH4kbca03AcXwvKnz5Vqa77sn0ZulQLsN6W3e5Kmzk2
	vuUno9R9C3AoCNBGNdZjkk2vSnz4fF1YXiZFA+LvJDSvgCEDQUarIrvRrIYw3Z3KlRVasJsxAt/pF
	R0GP25kXGTaO68UeGpLbCxSLquAOtHWT5GMtw0tnYl6gFpTN8paPdYHSLpXR3FCmvI7NqSXj6lBDU
	rdVm/g3gaC4oFMozTEgtJYlAzQc5CBRNl1LpaNBkv27fnpZb66sqeu6EXvpnzHyJdnjX4NiyWUp99
	MyffaE+UKQYOrJY0H0gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woj3S-00000005XVo-2plY;
	Tue, 28 Jul 2026 14:45:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woj3S-00000005XVY-0Hqo
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Jul 2026 14:45:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 87EA74512E
	for <linux-mediatek@lists.infradead.org>; Tue, 28 Jul 2026 14:45:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FE341F00ACA
	for <linux-mediatek@lists.infradead.org>; Tue, 28 Jul 2026 14:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785249913;
	bh=+zoBoxVP0tu54EmP44Kgg99nD/WSNJ3du1BUA30wzps=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=JvHqpuTk00lMlu3XNouaDMT787Xmh5ZH9xAHaW5qASWPVyM9MjIS7H0CGU0mQQuab
	 gzeYGF1Nxv3+XToSFj77YXsWsnuAm0Pyl54PJAOH3G0CpqoEYRMvEy+TTACdHOk8Qe
	 mMZnxHR/Py7bD7SdJcCMFk4e7CgPSHuGkZqfyuh+OyL5Hmw14p1prf5nctoiKnHXee
	 nmJJBy6ATQOgancwoqpT4Hhoxt55L+UvtmAgpFC5nQZ3iZX4KlmcNBelebHc00vsKY
	 KwjbsVfsklTSXyl/hmZqOuWsPGgGq+adSgvQL3icu3qn6QI1GuoX2GFJwLHTD8zBhZ
	 9C+k0pMDylctg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39f1ac13687so30895001fa.0
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Jul 2026 07:45:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp5qLCnJzXRyNHYzxx9TKY5r/NecWm0LnFZyzQBl5FfE8OJSc0qZe1pRLJafWwPZhvOM57BQFu9KNMH2Yh9hw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyzRZqoNAT8Pxb1Ds13lTMGioE5SnCmTuDhTFXkXaYt3Ciblpqx
	PCilP8yCKAoaEJhEiW7KOXDqoiOz1dFy/PEa7vgTsQPtxruJdndUI+LN5umaNfgv6LW6eHmd6OW
	rrG2zwbYevfu0SrFE5CY0+bSfKsN5Oyk=
X-Received: by 2002:a05:651c:1472:b0:39f:334:5417 with SMTP id
 38308e7fff4ca-39f51e78500mr5509941fa.31.1785249911724; Tue, 28 Jul 2026
 07:45:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260728091804.382753-1-wenst@chromium.org> <amiqKRkFItYwD6oL@redhat.com>
 <CAGb2v64zUO-azpTuei6LCypad2noGFbg+EmaBC1iidoZ2stQzw@mail.gmail.com> <c1048eae-72c5-4e2e-ac49-25e2c4297018@collabora.com>
In-Reply-To: <c1048eae-72c5-4e2e-ac49-25e2c4297018@collabora.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 28 Jul 2026 22:44:58 +0800
X-Gmail-Original-Message-ID: <CAGb2v67VRhy_xzkdwUAYhzM_sWzoXyfZ3rYSHYLYaxuve9H17w@mail.gmail.com>
X-Gm-Features: AUfX_mx6JNGZEk5lcOTAkXuDdaZ1OKJc8XncWYJ1mBU23rnRHL1R5sda5IuVL9U
Message-ID: <CAGb2v67VRhy_xzkdwUAYhzM_sWzoXyfZ3rYSHYLYaxuve9H17w@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] powervr: MT8173 GPU support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Brian Masney <bmasney@redhat.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
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
Reply-To: wens@kernel.org
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
>
> I trust that you'll make the binding get into linux-next before it's too =
late.

Rob beat me to it. :D


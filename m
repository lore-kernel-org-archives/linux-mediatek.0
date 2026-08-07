Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA52C5AC7A
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2026 17:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lRjAT478Uz3ZQXBeUJ/wQtNqpl6lKAtydNqvVxPKT04=; b=1wYG575Bh+fxUeh7H36czBKfvz
	j54323utkFvDrt+zVXXnpraWR4qW7N8RK2QO3mrd9fckcVeY2qHROtE+LBxOMhKwlrNhNof5HV6kg
	oYgohrdVGEmCzzqhVr7L6p6ryIkIdqMudqc2QLPoEl5uPBzw3u9AHnu0u6tQbeHd9nGMstykRCdXG
	ivHSyyE/MqXXwmpmz3aB88xUTzleZyMM5DrQKsAbD6NXFtl53/BsdPNbuqjL4GI+H/bqanMbLaDEq
	vlWCz12d0wi9kQdVjDFRMgb3bo/WDbOksDtHVgWukXxbnjdvDuFxFv1U+izE+dXZSmQatD5sURBvh
	syoAWzxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsOin-00000008Xzh-1FmA;
	Fri, 07 Aug 2026 17:51:05 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsOik-00000008Xyp-22r6
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Aug 2026 17:51:03 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-6aeaaef491cso1113473eaf.2
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Aug 2026 10:51:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786125061; cv=none;
        d=google.com; s=arc-20260327;
        b=s6kJtL44WxlSqiXhdaPloHmMu3WHVVA6WWP/HFTu30V2U7FMKtMMSTMW07D3rymPEU
         uRu5ZNmK7OnSiSWKPLrJrPLoz5MjpoZYcjkiJnBkzu1dileLmTZUxiAey05gc2NyJohL
         6Q4RYRqb9qKGkRc/eEPNJufN53W2A1cqNDuEJoYkicjo3qgxCrO96LyRjhUjFnfl+kK7
         bdklTHmO4MVj6a/vSIJILIkEEFhwUiCaVjNcaDb3imGpWfFhvqQbcZFLmVwLo4ogWZYP
         IF4Pu70/u5c3keS4aqYzus04dHum5fBp8yC18h3jaSd5z+M3rlr+cVtdAU5BHxRRevOL
         PqTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lRjAT478Uz3ZQXBeUJ/wQtNqpl6lKAtydNqvVxPKT04=;
        fh=m71SdVeVynHQY0gTWaHkOuLUfg7I6vD9fBqiheD3TXA=;
        b=MsC7XDVFDXpOXVdbFz+O9aI2Zt2LIFNaGF5yfgu6GKkmz1frzwUKpUYVUpzjrkar43
         eABOJSMrvrWO4lz01Oeximep2XR/TBw66F+/kkH6r2/k59Y5iOS/l9UaRaJf2p+4D+Nw
         p/jldsS3Qr7xNmAY9vWUIwrBYFrGTurdVbwSc43uxSwigsBMa53jYPPr1gAnTShSanSu
         +DX1HD/6hzZMi+SibWrZ34gKj+RsLx1/RTKx4Rphpyr/iyn5phyFxhB/U6LGD0+GhxO8
         cDNEniUIzpa6PyGMHJkXPu0RFAmaAt/Ebds9pUxclXzoPV9TsRsF/5WVddzyOfqKt7J0
         LjGg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786125061; x=1786729861; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lRjAT478Uz3ZQXBeUJ/wQtNqpl6lKAtydNqvVxPKT04=;
        b=Ln1aeJwL090UPvq/Uv77jF/V4V0G9WgB+K6OaPsJcNvaXfHMT9FrlxQOp+j+oI28ro
         39eOlPA3FjYZhCBZcwlOwNlVjeh11NYz4itMGyU4J6XyG3Waji+OMyN3RKvHtyX4xcsF
         PctrGX/AuWkwKMNdC3Rsp/YCA9g+Aoedk4BHg7YykCnClTSJ3ZNgcV/220zmnjWyfG+L
         shbtHqBiRgsJ4iyG++wT4KMlLjtbriX09c95sb2l7v1O8gf6Vc7Kxkxa5+nnqpWiY6JK
         qj7JKTFzUX6yR6oMSTkl7bIYFTEC21cwH4brsZCOATGnLnIBXRm6DfrPl6r12+HY5PH+
         6r8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786125061; x=1786729861;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lRjAT478Uz3ZQXBeUJ/wQtNqpl6lKAtydNqvVxPKT04=;
        b=I4MeqHKATOXuQDYYkXjrMEslgFBeBhnNIzC7NE6kLfv7TXMJnQw3OixgECwxA1khQT
         qnyi7gCrIKdOBivjTX1tXJqXxvGYikfFlzV++ifUp6Y5l7Uh23280LvNKh3g3//TvJze
         nMxiBZV3Xnnc0B3woRQinppC42rX7An4VMr5ddgoaiF1pnDSaf4e9AlMljVnnzIlCKGC
         ZIaF7yTljgcOBGNjobSj9fSNW9e4QEtc1zawdLWN4nXAqlWiuhcgLkWsbpsYueNZtgVn
         2omoEJijq7NQNR/Lg9xtlkJEjsqrOWwW08vo4AIWlxYxDLIMdnG5s1EgWstSopQhlUXG
         xypg==
X-Forwarded-Encrypted: i=1; AHgh+RoKmX3VAZ3/pV3ctL84rm6XDPJ2J4wxoOZXdxe1WX4tTwS/vEznh/Lxu3jcL7J0Ge/3gY0K8nbFV8i+cSmBDg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx59kUvZGPpGXgNyD1qZ0GyPfJnZ/eZ6LLzZbCvMCTJ7FLNUlyL
	RU/jFggQ++C2VNMPq+Voqng+HdkCsWg6JD9PnfAwIwxG+SnIFM+N6q9vU/C/vb+m7iCGaYqyXRZ
	52RayeQM2wvaGyBdPqZLRUTc6/5j26QA=
X-Gm-Gg: AR+sD11WbPPw74ibAJwXYUaa9lyse2/v1z14matfzkB/0bWCpx7d/QBFOuMjGlphrV/
	dRsxR9Uf/yLKpFJ65rSy8GJKTX69AI6KmSPnr1K+WUYCFTZK3jUy7ALRPcRwDb+2xmTQswVKyfO
	MxXK5U96f9PVs4eI2YF0wJoehIcBGIt99yt107U+Yb7FoSyt9YkahrQb0Lwk6fynEoXYaACOefN
	q5reW58nsHXxFIyEVVmTg2xXOSq68vMvH06XTnwdOMkdrSrTMbK1T/gFt+TNX3QQAiRspXUxU8s
	MkRTslFBCT8/Zya5ojKtOdCOc8qy3mCvHExV1k+VvfHqVPOmssUyhwW/HoPZG68kEEme4ksg5qq
	ZsA==
X-Received: by 2002:a05:6820:811:b0:6b0:40d9:8ac6 with SMTP id
 006d021491bc7-6b041f594b5mr991109eaf.9.1786125060721; Fri, 07 Aug 2026
 10:51:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260728091804.382753-1-wenst@chromium.org> <amiqKRkFItYwD6oL@redhat.com>
 <CAGb2v64zUO-azpTuei6LCypad2noGFbg+EmaBC1iidoZ2stQzw@mail.gmail.com>
 <c1048eae-72c5-4e2e-ac49-25e2c4297018@collabora.com> <CAGXv+5EgGYFVt4TJCysQgRqA1J5=Qz9c0oWY5YTxgc5PnNC_AQ@mail.gmail.com>
 <36f2775a-d332-4913-8e9e-ca0429c3f713@collabora.com> <amswFn2qWkvypMH8@redhat.com>
 <CAGb2v65yEtUH5LQ=kGL1io-urha12iOute=D2bbG872YXbK4fQ@mail.gmail.com>
In-Reply-To: <CAGb2v65yEtUH5LQ=kGL1io-urha12iOute=D2bbG872YXbK4fQ@mail.gmail.com>
From: YoungJoon Lee <getfeus@gmail.com>
Date: Sat, 8 Aug 2026 02:50:47 +0900
X-Gm-Features: AUfX_mw5H1veunrAd0DWILURr17Bo7nhldWDJMLG41xotTB7eMODtkVZIaJFjgA
Message-ID: <CA+m4KrDpcdJZBXT5wN+NHV+BtLLT-suhamCmzg+gUhamvbPR8Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] powervr: MT8173 GPU support
To: wens@kernel.org
Cc: Brian Masney <bmasney@redhat.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_105102_541898_EAFC2938 
X-CRM114-Status: GOOD (  47.86  )
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

Hi Chen-Yu,

A follow-up on the GX6250 issue.

I ran the diagnostic test I mentioned in my previous reply, and I now
have a reproducible system hang along with HWRT/free-list lifetime
traces.

I built a diagnostic kernel with temporary tracing around the PowerVR
HWRT and free-list lifetime paths, and ran:

PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 glmark2-es2-drm

The test was run from multi-user.target with no display manager running.

This time glmark2 progressed past the point where it had previously
failed, but later the entire system became unresponsive during the
desktop/blur part of the benchmark.

At that point:

- SSH stopped responding
- local keyboard and VT switching stopped responding
- the system required a hard power cycle

The HWRT teardown trace immediately before the hang was interesting.

Normal HWRT destruction repeatedly looked like this:

dataset-release
-> HWRTDATA cleanup data=3D1, err=3D0
-> HWRTDATA cleanup data=3D0, err=3D0
-> free-list release slot=3D0
-> free-list release slot=3D1

For the last HWRT visible before the machine stopped responding, the
trace ended at:

pvr-hwrt: dataset-release hwrt=3Dffff0000c0c62800 ...
pvr-hwrt: cleanup hwrt=3Dffff0000c0c62800 data=3D1 err=3D0 ...
pvr-hwrt: cleanup hwrt=3Dffff0000c0c62800 data=3D0 err=3D0 ...

There was no further PowerVR trace before the system hung.

Therefore, I do not think I can conclude that the free-list reference
counting itself is the root cause.

What I can say from this instrumentation is that both HWRTDATA cleanup
calls returned successfully, and the trace stopped before
hwrt_fini_kernel_structure() reached its first free-list release
message.

The tracing is intentionally verbose and may affect timing, so I do
not want to over-interpret the exact failure point.

I have the diagnostic patch, the full kernel log, the HWRT/free-list
lifetime trace, and the glmark2 output available.

Would it be useful for me to send these to the Imagination/DRM mailing
lists now, or is there a particular person or list you would prefer me
to report this to?

If there are specific additional tracepoints you would like around
hwrt_data_fini_fw_structure() or hwrt_fini_common_fw_structure(), I
can build another diagnostic kernel and reproduce the issue again.

Thanks again for taking a look.

Best regards,
YoungJoon Lee

2026=E5=B9=B47=E6=9C=8830=E6=97=A5(=E6=9C=A8) 21:38 Chen-Yu Tsai <wens@kern=
el.org>:
>
> On Thu, Jul 30, 2026 at 7:06=E2=80=AFPM Brian Masney <bmasney@redhat.com>=
 wrote:
> >
> > Hi Angelo and Chen-Yu,
> >
> > On Thu, Jul 30, 2026 at 10:23:14AM +0200, AngeloGioacchino Del Regno wr=
ote:
> > > On 7/30/26 06:51, Chen-Yu Tsai wrote:
> > > > On Tue, Jul 28, 2026 at 10:33=E2=80=AFPM AngeloGioacchino Del Regno
> > > > <angelogioacchino.delregno@collabora.com> wrote:
> > > > >
> > > > > On 7/28/26 15:13, Chen-Yu Tsai wrote:
> > > > > > On Tue, Jul 28, 2026 at 9:10=E2=80=AFPM Brian Masney <bmasney@r=
edhat.com> wrote:
> > > > > > > On Tue, Jul 28, 2026 at 05:17:58PM +0800, Chen-Yu Tsai wrote:
> > > > > > > > Hi everyone,
> > > > > > > >
> > > > > > > > This is v4 of my MT8173 PowerVR GPU support series.
> > > > > > > >
> > > > > > > > This time around Mesa was ready for basic testing, using bo=
th vulkanmark
> > > > > > > > and glmark2-es2-drm (with Zink). Details below.
> > > > > > > >
> > > > > > > > Changes since v3 (all in the clk driver patch):
> > > > > > > > - Changed pm_runtime_put() to pm_runtime_put_sync()
> > > > > > > > - Added missing of_node_put() in remove function
> > > > > > > >
> > > > > > > > Changes since v2 (all in the clk driver patch):
> > > > > > > > - Made COMMON_CLK_MT8173_MFGTOP depend on PM
> > > > > > > >     - Needed since the driver implements PM domains using t=
he generic PM
> > > > > > > >       domain library, which also depends on PM
> > > > > > > >     - Fixes build breakage (kernel test robot)
> > > > > > > > - Fixed "RST_DELAY_CNT" name (Brian)
> > > > > > > > - Dropped unused mfg_desc (Brian)
> > > > > > > > - Added check of clk_prepare_enable()'s return value in
> > > > > > > >     clk_mt8173_mfgtop_power_on() (Brian)
> > > > > > > > - Saved error value for return in IS_ERR(data->clk_26m) bra=
nch
> > > > > > > >     (Dan Carpenter / kernel test robot w/ smatch)
> > > > > > > >
> > > > > > > > Changes since v1:
> > > > > > > > - Adapted to changed DT bindings
> > > > > > > > - Dropped driver change
> > > > > > > > - Use same power domain for "a" and "b" GPU power domains
> > > > > > > >
> > > > > > > >
> > > > > > > > This series enables the PowerVR GPU found in the MT8173 SoC=
, found in
> > > > > > > > some Chromebooks.
> > > > > > >
> > > > > > > I'm making a pull for Stephen for the clk changes. Should pat=
ches 1,2,4
> > > > > > > go through the clk tree? Patches 3,5 go through the DRM tree?
> > > > > >
> > > > > > Only patches 1 and 2 should go through the clock tree.
> > > > > >
> > > > > > Patch 3, 4, 5 can all go through the soc tree if Angelo wants t=
o pick up
> > > > > > DT binding patches. Otherwise I can push patch 3 through drm-mi=
sc.
> > > > > >
> > > > >
> > > > > Not sure if I can really take the DRM bindings patch through soc.
> > > > >
> > > > > I will take the devicetree ones exactly right now, even though it=
's going to
> > > > > give warnings.
> > > >
> > > > Apologies for missing this, but the first DT patch depends on the c=
lk DT
> > > > bindings patch for the clk ID macros. This is causing build errors =
in
> > > > linux-next right now.
> > > >
> > > > Not sure how we can fix this right now.
> > > >
> > > > Brian, would it be possible for you to split out that patch into a
> > > > separate immutable branch for Angelo to merge?
> >
> > Yes, I can split things out and make an immutable branch this morning.
> > But it sounds too late for that.
> >
> > > >
> > > > Otherwise Angelo might need to drop the DT patches until the next c=
ycle.
> > >
> > > Yeah, that's so bad.
> > > I'd be happy to be able to resolve this, but it's too late on my side=
.
> > >
> > > I should've checked the DT patches more carefully, my bad: I got a bi=
t too excited
> > > to finally see this PowerVR stuff working on MT8173 and going upstrea=
m.
> > >
> > > Sadly, I have to drop the devicetree patches :-(
> >
> > Chen-Yu: Could Angelo add an Acked-by to the three patches, and then I =
send
> > Stephen an additional pull with just those patches? Do you think he'd
> > pull that?
>
> (replying from my @kernel.org address again because I don't feel like
>  pulling out my work laptop.)
>
> I think the question is whether the soc & dt maintainers would be bothere=
d
> by it or not.
>
> No need to sweat over it though. It's not like the GPU driver is producti=
on
> ready anyway. We can just merge the DT patches in the next cycle. :)
>
>
> ChenYu


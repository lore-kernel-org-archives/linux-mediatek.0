Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707D9C61DC2
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2026 12:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=itZQzQFfGRpNcad2SrjvcfFOteffgXN484YQS8QwNx4=; b=c1YKgr14mrVkckJZrxtC2XzbZo
	cDp3x1edgtxwdiOE+U24qzsiJkHKQR1DbpgpucXEAaRY3u77Lxf7QQUfNQi8PhjZYkRCuF3mhTyfX
	BlEPiis4ZQ1Rj7XuH5LXvyCqmMChBXvRy96/fOaXRNTAYjkHe+fGMHdfIMvDhpf0Bh9doGXoSHeF2
	J0A02lW3E7OjkuocHngKnGgGA6xM3NbNzOp//wQ/lEWi9rHhjc5bFq8hZvZfEOeHAgQzYEJEnTNfe
	lU14pE0j6MQ8n/UAy9VwaVib/ldcahxyJgxMGjQTDHnZ+WUsTLJsB0PlZS0OGTWZeyNPXQDPZRYMg
	8/oLjJ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzYoD-00000003vIN-2tqA;
	Thu, 27 Aug 2026 12:02:20 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzYoB-00000003vHS-0Aoj
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Aug 2026 12:02:16 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-7f4b94d72acso1987677a34.1
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Aug 2026 05:02:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787832133; cv=none;
        d=google.com; s=arc-20260327;
        b=nualQEKXKQ7Rs/W/id/lTvwAbkVtjtnvqcgI+OQw7klFNvjOMKj09YZzwlZTTNUtgI
         RHVjjZu/7OQi1TqhqLieuGpKKmfeKFG8a4Hx0LGHc0NGZA76CdM3CIlRxfraJtjvk0VU
         od4vRqlp+ThBxHggv3QmLsQCPQ071CQPcKyEZveMJXtwisq+PltvxJu63P25eLfbFlr+
         9C51TBiGk7vTc1MiKoWbzIxD0VQU+4Rg/2WIYhRcI9zHdNxv02GSdUXZ0EsilpWkpv78
         RwbSu3Hk1/xMQEn9FTHjrvqqyewxi31Kh1iJigGRX8f9Yv23qJ6Anczb8TPZVG6lz1ey
         5aeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=itZQzQFfGRpNcad2SrjvcfFOteffgXN484YQS8QwNx4=;
        fh=Fw1KftXOL7/2f6C6AsJlHQrRkuJoXIZ1NfNVFM3BhI4=;
        b=DMrYIbjapDZVe5dNWlrd8iJlqjQ29aAwtmwwT6I6dDWafxwNhf3vLALMHwgq2iyQxv
         SUZGkHeGRzIjcs6QGt8bc86DUdPxPnedtl/YE6U0yCYfSQnzzBZRDVJZLM86ub18mdcb
         oI8KmaM0/vmbCw/u36ClIAIdFmfJ9lTDpXRsH2gqMPpyydv8bzK2lyC3njb2RPyBoWLj
         wMcn74YLc9xdpJh1vzVVpWEoUOoPYgkGKS9ZViAWtVlXicY8qY+R4X3SkIr1da23Vg8+
         3uTa4MgXq6YJw7aYbbAi3qFq80toHWvHsdzdgIFSq/fZaidhnJeril/4CvRY3kpqJX2F
         H3qg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787832133; x=1788436933; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=itZQzQFfGRpNcad2SrjvcfFOteffgXN484YQS8QwNx4=;
        b=bMQuynN+BfG2/9ESWGs/73QL8VRCU65rFvfraqVP/I9R5u1TTaq4mDwOfUu18B8LE7
         bzKp91STZ8z5t/23+1OJNbg4fcJFFt7dL7F37k9EPeXgJsKh49MsJum8q1eaAcicCpB7
         4QM9o60kO6SgpnVo6eMWJe9zjdV/GJWCCd7bU6dfrdRoNFw/6h1VFlF8nDF4VA9VVkEW
         FCjya2P9Ek7XpL6rFAsuC4Ta8FqU6stesb1rzkcK0zPFnQTvCwyKCZcb/ESOVDwAEPSQ
         K7t22dHKKPmjaGGxFd/NsCP8okjkz7RhLWS3i7wXd590FhhJuJD+NynH3GMlwPMRjr9l
         Wusg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787832133; x=1788436933;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=itZQzQFfGRpNcad2SrjvcfFOteffgXN484YQS8QwNx4=;
        b=K8zy7SDuj/Ixf5zjxRf0AbakVZXASLXvclX4+WOoRI9aMjKI9cbh+VAEFekjYvfxC/
         n/JAMuy4DUq4KGE/D9wtKqjJjHxh9Hbogc3QzMwTabVDkANiNKPZDupNmkx5BNkmW620
         8KwlHKXdPhymapQjh9IIsghvC7ONKm8n1MypXf3/iSrhC23/JbL+K5zq7OprYt31UmXg
         kArgMZ/28ilNEnocb7ewpop98vlsKl2NoSzqm9lcTtKHNDQmh+AHYBGks6kV+sgNOSYe
         poSOO+UUVvvxjO+uUHBWrpvEQ/0pE1vzKBDQW6gJDWTXvWhIbkVXNrjwiJrGBzT2iHCc
         NUug==
X-Forwarded-Encrypted: i=1; AHgh+RpXBKK7Bt1nTJMnAHlZ1nkLLgzWPPD/gbKMeU/QUD6w+7sZQrHQbIHp9E0THa8LFoku7OU32fGfYR6stE3IBQ==@lists.infradead.org
X-Gm-Message-State: AFuF++l6qfqpWgodiXENofVB+ppYFA5QW1eOXBwU4wkh27UaCP891MUJ
	2UXPXGj9JC+620KrQhPYJFmg58twflE2f9Lr9AEO5qtLetDb0VdqFdonw7GvAKxspjasnv4UveQ
	GEjTnahLovDgSR+vrzhKaS3tP/AAS0A4JYak+BvV6uQ==
X-Gm-Gg: AR+sD115EhrTc8dDvXgegtR4b3KO7Q+CQDQ8S7W7ltCjZPDkoF6ti5qQY/BtDwv8eoA
	qMiJbYRcphCtwPqP9hesPu13mH4bb2n1BwzlDEcHgPN5WX0bVLDJ7SdF6rU9ufrdAakH8W8p7dO
	WMLJkeRYrNDGRmT8KmKn1Xl/6bOFXec1m2IasRqU7sXQKk7qLeNcMuMQ0ZW80rHNB1Mcbd82wzr
	CLAbnUyNsvS+Yb68uVsJRyIrAqkQcUyVABTU9SMMuliYRX25VmBNGT5/G0qSDE0nPwRkLotF6TG
	9GEIodMmTZ7mUe2wnHmfSra0uSqpiGIlFxgIPlBCTBTbzJXQ6oOBkt2FRR1P9p31ZVg+0JtxFf5
	8Ug==
X-Received: by 2002:a05:6830:82c3:b0:7f4:edd8:b7eb with SMTP id
 46e09a7af769-7f4edd8b9demr493222a34.6.1787832132894; Thu, 27 Aug 2026
 05:02:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260728091804.382753-1-wenst@chromium.org> <amiqKRkFItYwD6oL@redhat.com>
 <CAGb2v64zUO-azpTuei6LCypad2noGFbg+EmaBC1iidoZ2stQzw@mail.gmail.com>
 <c1048eae-72c5-4e2e-ac49-25e2c4297018@collabora.com> <CAGXv+5EgGYFVt4TJCysQgRqA1J5=Qz9c0oWY5YTxgc5PnNC_AQ@mail.gmail.com>
 <36f2775a-d332-4913-8e9e-ca0429c3f713@collabora.com> <amswFn2qWkvypMH8@redhat.com>
 <CAGb2v65yEtUH5LQ=kGL1io-urha12iOute=D2bbG872YXbK4fQ@mail.gmail.com> <CA+m4KrDpcdJZBXT5wN+NHV+BtLLT-suhamCmzg+gUhamvbPR8Q@mail.gmail.com>
In-Reply-To: <CA+m4KrDpcdJZBXT5wN+NHV+BtLLT-suhamCmzg+gUhamvbPR8Q@mail.gmail.com>
From: YoungJoon Lee <getfeus@gmail.com>
Date: Thu, 27 Aug 2026 21:02:00 +0900
X-Gm-Features: AcwNN1XpDElWizfeTEqW1-geIkvA_6UTkfh-v46rtV4U1JNftLGLCb82tOxCwhE
Message-ID: <CA+m4KrAOdFJRRzx8N1kK2LvLcfjG4Gx_pFmP7SsZjKUvU-0dTA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260827_050215_093215_4C52AFC9 
X-CRM114-Status: GOOD (  59.09  )
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

Hi Chen-Yu and everyone,

A follow-up on my previous GX6250 hang report.

I retested the MT8173 GPU support on an Elm Chromebook using
linux-next tag next-20260826. The test kernel included the following
MT8173 DT commits:

9ab51bbb2813 ("arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power domain clo=
ck")
33d6e5134c70 ("arm64: dts: mediatek: mt8173: Add GPU device nodes")

It also contained an unrelated local xHCI fix, which should not affect
the GPU test.

The resulting kernel release was:

7.2.0-next-20260826-stb-cbm-next-20260826-gx6250-xhci-fix1+

The kernel successfully probed the GX6250 and loaded:

powervr/rogue_4.40.2.51_v1.fw

The relevant kernel messages were:

powervr 13000000.gpu: [drm] Running on unknown hardware; expect issues.
powervr 13000000.gpu: [drm] loaded firmware powervr/rogue_4.40.2.51_v1.fw
powervr 13000000.gpu: [drm] FW version v1.1 (build 6976702 OS)
[drm] Initialized powervr 1.0.0 for 13000000.gpu on minor 1

I used powervr.exp_hw_support=3D1 on the kernel command line.

I also tested Mesa 26.1.6 with
PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1. vulkaninfo completed
successfully and identified:

deviceName         =3D PowerVR Rogue GX6250
vendorID           =3D 0x1010
deviceID           =3D 0x6250
driverName         =3D Imagination open-source Mesa driver
driverInfo         =3D Mesa 26.1.6-arch1.1

GPU interrupt activity increased during the Vulkan query. No new
PowerVR fault, timeout, hang, warning, or Oops was recorded by the
kernel during that test.

Most importantly, I completed the glmark2 workload which had previously
triggered either the pvr_queue_signal_done_fences() NULL done_fence
Oops or a complete system hang. This time the test completed, the
system remained responsive, and no PowerVR kernel error was recorded.

This is an encouraging result, but I cannot attribute the disappearance
of the Oops or hang solely to the MT8173 DT series. The new kernel is
based on a later linux-next snapshot and includes intervening DRM
scheduler changes and reverts. I am therefore reporting this as a
non-reproduction on the newer stack, rather than claiming that the DT
patches fixed the driver issue.

The clock, power-domain, and GPU device-tree support from the v4 series
worked successfully on this MT8173 Elm device, so for the series:

Tested-by: Youngjoon Lee getfeus@gmail.com

The expected experimental GX6250 limitations remain. The kernel still
classifies the GPU as unknown hardware, and Mesa reports the existing
BRN 51764, BRN 58839, and BRN 62269 implementation warnings.

I can continue testing newer linux-next and Mesa revisions on this
machine. If it would be useful, I can also try to narrow down which
change between my previous kernel and next-20260826 made the Oops and
hang disappear.

Best regards,
Youngjoon Lee

2026=E5=B9=B48=E6=9C=888=E6=97=A5(=E5=9C=9F) 2:50 YoungJoon Lee <getfeus@gm=
ail.com>:
>
> Hi Chen-Yu,
>
> A follow-up on the GX6250 issue.
>
> I ran the diagnostic test I mentioned in my previous reply, and I now
> have a reproducible system hang along with HWRT/free-list lifetime
> traces.
>
> I built a diagnostic kernel with temporary tracing around the PowerVR
> HWRT and free-list lifetime paths, and ran:
>
> PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 glmark2-es2-drm
>
> The test was run from multi-user.target with no display manager running.
>
> This time glmark2 progressed past the point where it had previously
> failed, but later the entire system became unresponsive during the
> desktop/blur part of the benchmark.
>
> At that point:
>
> - SSH stopped responding
> - local keyboard and VT switching stopped responding
> - the system required a hard power cycle
>
> The HWRT teardown trace immediately before the hang was interesting.
>
> Normal HWRT destruction repeatedly looked like this:
>
> dataset-release
> -> HWRTDATA cleanup data=3D1, err=3D0
> -> HWRTDATA cleanup data=3D0, err=3D0
> -> free-list release slot=3D0
> -> free-list release slot=3D1
>
> For the last HWRT visible before the machine stopped responding, the
> trace ended at:
>
> pvr-hwrt: dataset-release hwrt=3Dffff0000c0c62800 ...
> pvr-hwrt: cleanup hwrt=3Dffff0000c0c62800 data=3D1 err=3D0 ...
> pvr-hwrt: cleanup hwrt=3Dffff0000c0c62800 data=3D0 err=3D0 ...
>
> There was no further PowerVR trace before the system hung.
>
> Therefore, I do not think I can conclude that the free-list reference
> counting itself is the root cause.
>
> What I can say from this instrumentation is that both HWRTDATA cleanup
> calls returned successfully, and the trace stopped before
> hwrt_fini_kernel_structure() reached its first free-list release
> message.
>
> The tracing is intentionally verbose and may affect timing, so I do
> not want to over-interpret the exact failure point.
>
> I have the diagnostic patch, the full kernel log, the HWRT/free-list
> lifetime trace, and the glmark2 output available.
>
> Would it be useful for me to send these to the Imagination/DRM mailing
> lists now, or is there a particular person or list you would prefer me
> to report this to?
>
> If there are specific additional tracepoints you would like around
> hwrt_data_fini_fw_structure() or hwrt_fini_common_fw_structure(), I
> can build another diagnostic kernel and reproduce the issue again.
>
> Thanks again for taking a look.
>
> Best regards,
> YoungJoon Lee
>
> 2026=E5=B9=B47=E6=9C=8830=E6=97=A5(=E6=9C=A8) 21:38 Chen-Yu Tsai <wens@ke=
rnel.org>:
> >
> > On Thu, Jul 30, 2026 at 7:06=E2=80=AFPM Brian Masney <bmasney@redhat.co=
m> wrote:
> > >
> > > Hi Angelo and Chen-Yu,
> > >
> > > On Thu, Jul 30, 2026 at 10:23:14AM +0200, AngeloGioacchino Del Regno =
wrote:
> > > > On 7/30/26 06:51, Chen-Yu Tsai wrote:
> > > > > On Tue, Jul 28, 2026 at 10:33=E2=80=AFPM AngeloGioacchino Del Reg=
no
> > > > > <angelogioacchino.delregno@collabora.com> wrote:
> > > > > >
> > > > > > On 7/28/26 15:13, Chen-Yu Tsai wrote:
> > > > > > > On Tue, Jul 28, 2026 at 9:10=E2=80=AFPM Brian Masney <bmasney=
@redhat.com> wrote:
> > > > > > > > On Tue, Jul 28, 2026 at 05:17:58PM +0800, Chen-Yu Tsai wrot=
e:
> > > > > > > > > Hi everyone,
> > > > > > > > >
> > > > > > > > > This is v4 of my MT8173 PowerVR GPU support series.
> > > > > > > > >
> > > > > > > > > This time around Mesa was ready for basic testing, using =
both vulkanmark
> > > > > > > > > and glmark2-es2-drm (with Zink). Details below.
> > > > > > > > >
> > > > > > > > > Changes since v3 (all in the clk driver patch):
> > > > > > > > > - Changed pm_runtime_put() to pm_runtime_put_sync()
> > > > > > > > > - Added missing of_node_put() in remove function
> > > > > > > > >
> > > > > > > > > Changes since v2 (all in the clk driver patch):
> > > > > > > > > - Made COMMON_CLK_MT8173_MFGTOP depend on PM
> > > > > > > > >     - Needed since the driver implements PM domains using=
 the generic PM
> > > > > > > > >       domain library, which also depends on PM
> > > > > > > > >     - Fixes build breakage (kernel test robot)
> > > > > > > > > - Fixed "RST_DELAY_CNT" name (Brian)
> > > > > > > > > - Dropped unused mfg_desc (Brian)
> > > > > > > > > - Added check of clk_prepare_enable()'s return value in
> > > > > > > > >     clk_mt8173_mfgtop_power_on() (Brian)
> > > > > > > > > - Saved error value for return in IS_ERR(data->clk_26m) b=
ranch
> > > > > > > > >     (Dan Carpenter / kernel test robot w/ smatch)
> > > > > > > > >
> > > > > > > > > Changes since v1:
> > > > > > > > > - Adapted to changed DT bindings
> > > > > > > > > - Dropped driver change
> > > > > > > > > - Use same power domain for "a" and "b" GPU power domains
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > This series enables the PowerVR GPU found in the MT8173 S=
oC, found in
> > > > > > > > > some Chromebooks.
> > > > > > > >
> > > > > > > > I'm making a pull for Stephen for the clk changes. Should p=
atches 1,2,4
> > > > > > > > go through the clk tree? Patches 3,5 go through the DRM tre=
e?
> > > > > > >
> > > > > > > Only patches 1 and 2 should go through the clock tree.
> > > > > > >
> > > > > > > Patch 3, 4, 5 can all go through the soc tree if Angelo wants=
 to pick up
> > > > > > > DT binding patches. Otherwise I can push patch 3 through drm-=
misc.
> > > > > > >
> > > > > >
> > > > > > Not sure if I can really take the DRM bindings patch through so=
c.
> > > > > >
> > > > > > I will take the devicetree ones exactly right now, even though =
it's going to
> > > > > > give warnings.
> > > > >
> > > > > Apologies for missing this, but the first DT patch depends on the=
 clk DT
> > > > > bindings patch for the clk ID macros. This is causing build error=
s in
> > > > > linux-next right now.
> > > > >
> > > > > Not sure how we can fix this right now.
> > > > >
> > > > > Brian, would it be possible for you to split out that patch into =
a
> > > > > separate immutable branch for Angelo to merge?
> > >
> > > Yes, I can split things out and make an immutable branch this morning=
.
> > > But it sounds too late for that.
> > >
> > > > >
> > > > > Otherwise Angelo might need to drop the DT patches until the next=
 cycle.
> > > >
> > > > Yeah, that's so bad.
> > > > I'd be happy to be able to resolve this, but it's too late on my si=
de.
> > > >
> > > > I should've checked the DT patches more carefully, my bad: I got a =
bit too excited
> > > > to finally see this PowerVR stuff working on MT8173 and going upstr=
eam.
> > > >
> > > > Sadly, I have to drop the devicetree patches :-(
> > >
> > > Chen-Yu: Could Angelo add an Acked-by to the three patches, and then =
I send
> > > Stephen an additional pull with just those patches? Do you think he'd
> > > pull that?
> >
> > (replying from my @kernel.org address again because I don't feel like
> >  pulling out my work laptop.)
> >
> > I think the question is whether the soc & dt maintainers would be bothe=
red
> > by it or not.
> >
> > No need to sweat over it though. It's not like the GPU driver is produc=
tion
> > ready anyway. We can just merge the DT patches in the next cycle. :)
> >
> >
> > ChenYu


Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B212CD494F
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 12:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cRNYzNiImJujTu3gVe0e/F1xgNn+hpxzq5LY7wQeMXA=; b=eTvnuFjly35NbgdqYxqwDX0sJw
	AI8KDMTSDMFhvWXiY5GClkMICBm/s9iP8orTJEtP+P510cepsbBQPcECalrHq12b3/BGnjh2mWDVY
	izLeGfVE+QeBaM8mMoque5g+/F5pzrPKih3SzgtU9aZKYZy+JE3ilZj7H8WmrMpEXzIugNNHQHwv6
	6uG43FOpeYfkUD9wtV2rRG/yvoWxw0KXwAB/gI/aCWrVHTtEwiUQro5ZaT078Q/640yDmlyM0FNKI
	LND+3lmuBJaYoFewAVr4osK9gL9iD8x+XVTrrFhGy4PE3s1VX5m3L77hU2DT1uJGO7snj8cIjhZCE
	T+fTdLwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjIRA-005y17-2d;
	Thu, 21 Sep 2023 12:05:40 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjIR7-005y06-0V;
	Thu, 21 Sep 2023 12:05:39 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-5739972accdso1090890eaf.1;
        Thu, 21 Sep 2023 05:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695297934; x=1695902734; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cRNYzNiImJujTu3gVe0e/F1xgNn+hpxzq5LY7wQeMXA=;
        b=ShGheL5gNLold1dMyHUIG46feo/Au5eJ4zV1NyXb1TASjBfA9WhCd7h/vt835dDofq
         vODgRliYvq0F1C2q5PAZO22/C7Qu7522jG6xTYZnrDVsIMbBloKIqwbA/Fx57VDvwe/X
         sAT7MNyNEDONQaJDwn3lYG1CeRlM2R/bIkA19c3Y3DitYerkw8F0JfsDQkhujZmVv2r+
         WB05+8i7jjHxT9uWMPWNSw35Jst7KQ/cNnVapu09tKlgVKIodglS/FEBBfifOB1f78B7
         T55aUgKzUs5uDqHvKXVKrVc3cGER5VKUBXLZVPBlF/3qVKiLvVP7uYYROvccUKDjKDMQ
         FOqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695297934; x=1695902734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cRNYzNiImJujTu3gVe0e/F1xgNn+hpxzq5LY7wQeMXA=;
        b=oiA952qTPUvCrDLI0eVwQK/hDXDjJOBOYatLWOKGsd3m94YNOUpptwn7iw9zDkK+If
         JAqhGGQsMjZMDh7LqqB4U2Ln7iJH0neF8wDemhFre8z/5eexj1X6/XIL8K845J0/ArM9
         QU8Bqt/z/4FO0Q6q3nwMIeKPtogriB7SLJSCwoB5ehcPeWYDy8KZfYT7c3nTaEgEQfzF
         /81WmEFgAREjIXdxrV718QHB5wYDyNuUWSNq0xD2sTtKOZ8U9gIUF2v2ifVYk+nCnZ5s
         CcyqcLZ+4lO9Zms6OVZG7cbo/K5+PLw5R7MzsMFP2BbAFF98Z0r34ZtCgmUdhK3wqTIT
         nvuA==
X-Gm-Message-State: AOJu0YxY9J+ZFQExL7yff1sJB50ZCnk0RAcvSrfxw0v0U0e9lBbyFqeX
	PvfmIyEy2WJAHGdpX45aSs8xYLxl9S94/EOYTLQ=
X-Google-Smtp-Source: AGHT+IHDnNytitrj7g9Wmajhoe6mCmu7lVKXRZ191256VG1PXDsUDEvnSpWs3jvPhcDX3RKb1qYinf71cmk84zYAogw=
X-Received: by 2002:a05:6870:e2cb:b0:1b0:3f7f:673a with SMTP id
 w11-20020a056870e2cb00b001b03f7f673amr3513899oad.25.1695297933746; Thu, 21
 Sep 2023 05:05:33 -0700 (PDT)
MIME-Version: 1.0
References: <170e8577-42c9-b72f-60c7-80141f379ec4@arm.com> <20230921021350.28283-1-mark-pk.tsai@mediatek.com>
In-Reply-To: <20230921021350.28283-1-mark-pk.tsai@mediatek.com>
From: Xuewen Yan <xuewen.yan94@gmail.com>
Date: Thu, 21 Sep 2023 20:05:22 +0800
Message-ID: <CAB8ipk8cn893vTg_TZwBq4G7CtLdjCPtJ5Bt0OKbO9VxXg6rfQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: vfp: Add vudot opcode to VFP undef hook
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: robin.murphy@arm.com, amit.kachhap@arm.com, 
	angelogioacchino.delregno@collabora.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux@armlinux.org.uk, matthias.bgg@gmail.com, yj.chiang@mediatek.com, 
	=?UTF-8?B?546L56eRIChLZSBXYW5nKQ==?= <Ke.Wang@unisoc.com>, 
	"aijun.sun@unisoc.com" <aijun.sun@unisoc.com>, Xuewen Yan <xuewen.yan@unisoc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_050537_197135_372566B4 
X-CRM114-Status: GOOD (  38.44  )
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

Hi Mark-PK, Robin

We also meets the scene, and has the following stack:

Thread-2 (5361): undefined instruction: pc=3Dd05ae08c
CPU: 5 PID: 5361 Comm: Thread-2 Tainted: G        W  O
5.4.210-android12-9-04458-g56c7c43d3298-ab000045 #98
Hardware name: Generic DT based system
PC is at 0x7d1aa068
LR is at 0x7c22ae50
pc : [<7d1aa068>]    lr : [<7c22ae50>]    psr: 800b0010
sp : 7c78ee20  ip : 7c22ae40  fp : 7c78eea0
r10: 7c22ae60  r9 : 7c22ae70  r8 : 00000008
r7 : 7c0fee80  r6 : 7c0fee70  r5 : 7c0fee60  r4 : 00000010
r3 : 7c0fee50  r2 : 00000000  r1 : 00000010  r0 : a698aee0
Flags: Nzcv  IRQs on  FIQs on  Mode USER_32  ISA ARM  Segment user
Control: 10c5383d  Table: 8649c06a  DAC: 00000055
Code: edddcb1e fe22edd4 f4600a0d fc67cd98 (fe20edf4) <<<

So, we also need add the 0xfe000000:

Could you please help add the following patch into the patch-v2?

Thanks!

---
diff --git a/arch/arm/vfp/vfpmodule.c b/arch/arm/vfp/vfpmodule.c
index 7e8773a2d99d..1078c0f169d2 100644
--- a/arch/arm/vfp/vfpmodule.c
+++ b/arch/arm/vfp/vfpmodule.c
@@ -788,6 +788,18 @@ static struct undef_hook neon_support_hook[] =3D {{
        .cpsr_mask      =3D PSR_T_BIT,
        .cpsr_val       =3D 0,
        .fn             =3D vfp_support_entry,
+}, {
+       .instr_mask     =3D 0xfc000000,
+       .instr_val      =3D 0xfc000000,
+       .cpsr_mask      =3D PSR_T_BIT,
+       .cpsr_val       =3D 0,
+       .fn             =3D vfp_support_entry,
+}, {
+       .instr_mask     =3D 0xfe000000,
+       .instr_val      =3D 0xfe000000,
+       .cpsr_mask      =3D PSR_T_BIT,
+       .cpsr_val       =3D 0,
+       .fn             =3D vfp_support_entry,
 }, {
        .instr_mask     =3D 0xef000000,
        .instr_val      =3D 0xef000000,
@@ -800,6 +812,18 @@ static struct undef_hook neon_support_hook[] =3D {{
        .cpsr_mask      =3D PSR_T_BIT,
        .cpsr_val       =3D PSR_T_BIT,
        .fn             =3D vfp_support_entry,
+}, {
+       .instr_mask     =3D 0xfc000000,
+       .instr_val      =3D 0xfc000000,
+       .cpsr_mask      =3D PSR_T_BIT,
+       .cpsr_val       =3D PSR_T_BIT,
+       .fn             =3D vfp_support_entry,
+}, {
+       .instr_mask     =3D 0xfe000000,
+       .instr_val      =3D 0xfe000000,
+       .cpsr_mask      =3D PSR_T_BIT,
+       .cpsr_val       =3D PSR_T_BIT,
+       .fn             =3D vfp_support_entry,
 }};

 static struct undef_hook vfp_support_hook =3D {

On Thu, Sep 21, 2023 at 12:40=E2=80=AFPM Mark-PK Tsai <mark-pk.tsai@mediate=
k.com> wrote:
>
> > On 2023-09-20 09:39, Mark-PK Tsai wrote:
> > > Add vudot opcode to the VFP undef hook to fix the
> > > potentially undefined instruction error when the
> > > user space executes vudot instruction.
> >
> > Did the kernel expose a hwcap to say that the dot product extension is
> > supported? I'm pretty sure it didn't, so why would userspace expect thi=
s
> > to work? ;)
>
> The hwcap for dotprod has been exported since commit:
>
> 62ea0d873af3 ARM: 9269/1: vfp: Add hwcap for FEAT_DotProd
>
> >
> > IIRC Amit was looking at defining the hwcaps to align with arm64 compat=
,
> > but I believe that series faltered since most of them weren't actually
> > needed (and I think at that point it was still missing the VFP support
> > code parts). It would be nice if someone could pick up and combine both
>
> Were the mentioned series related to this commit?
>
> 62ea0d873af3 ARM: 9269/1: vfp: Add hwcap for FEAT_DotProd
>
> > efforts and get this done properly; fill in *all* the hwcaps and
> > relevant handling for extensions which Cortex-A55 supports (since
> > there's definitely more than just VUDOT), and then hopefully we're done
> > for good.
>
> Agree.
>
> >
> > > Before this commit, kernel didn't handle the undef exception
> > > caused by vudot and didn't enable VFP in lazy VFP context
> > > switch code like other NEON instructions.
> > > This led to the occurrence of the undefined instruction
> > > error as following:
> > >
> > > [  250.741238 ] 0904 (26902): undefined instruction: pc=3D004014ec
> > > ...
> > > [  250.741287 ] PC is at 0x4014ec
> > > [  250.741298 ] LR is at 0xb677874f
> > > [  250.741303 ] pc : [<004014ec>]    lr : [<b677874f>]    psr: 800700=
10
> > > [  250.741309 ] sp : beffedb0  ip : b67d7864  fp : beffee58
> > > [  250.741314 ] r10: 00000000  r9 : 00000000  r8 : 00000000
> > > [  250.741319 ] r7 : 00000001  r6 : 00000001  r5 : beffee90  r4 : 004=
01470
> > > [  250.741324 ] r3 : beffee20  r2 : beffee30  r1 : beffee40  r0 : 004=
003a8
> > > [  250.741331 ] Flags: Nzcv  IRQs on  FIQs on  Mode USER_32  ISA ARM =
Segment user
> > > [  250.741339 ] Control: 10c5383d  Table: 32d0406a  DAC: 00000055
> > > [  250.741348 ] Code: f4434aef f4610aef f4622aef f4634aef (fc620df4)
> > >
> > > Below is the assembly of the user program:
> > >
> > > 0x4014dc <+108>: vst1.64 {d20, d21}, [r3:128]
> > > 0x4014e0 <+112>: vld1.64 {d16, d17}, [r1:128]
> > > 0x4014e4 <+116>: vld1.64 {d18, d19}, [r2:128]
> > > 0x4014e8 <+120>: vld1.64 {d20, d21}, [r3:128] --> switch out
> > > 0x4014ec <+124>: vudot.u8 q8, q9, q10         <-- switch in, and FPEX=
C.EN =3D 0
> > >                                                    SIGILL(illegal ins=
truction)
> > >
> > > Link: https://services.arm.com/support/s/case/5004L00000XsOjP
> >
> > Linking to your private support case is not useful to upstream. Even I
> > can't open that link.
>
> I thought that maybe someone in arm need this.
> But it seems a bit noisy so I will remove the link from v2.
>
> >
> > > Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > > ---
> > >   arch/arm/vfp/vfpmodule.c | 12 ++++++++++++
> > >   1 file changed, 12 insertions(+)
> > >
> > > diff --git a/arch/arm/vfp/vfpmodule.c b/arch/arm/vfp/vfpmodule.c
> > > index 7e8773a2d99d..7eab8d1019d2 100644
> > > --- a/arch/arm/vfp/vfpmodule.c
> > > +++ b/arch/arm/vfp/vfpmodule.c
> > > @@ -788,6 +788,12 @@ static struct undef_hook neon_support_hook[] =3D=
 {{
> > >     .cpsr_mask      =3D PSR_T_BIT,
> > >     .cpsr_val       =3D 0,
> > >     .fn             =3D vfp_support_entry,
> > > +}, {
> > > +   .instr_mask     =3D 0xffb00000,
> > > +   .instr_val      =3D 0xfc200000,
> > > +   .cpsr_mask      =3D PSR_T_BIT,
> > > +   .cpsr_val       =3D 0,
> > > +   .fn             =3D vfp_support_entry,
> > >   }, {
> > >     .instr_mask     =3D 0xef000000,
> > >     .instr_val      =3D 0xef000000,
> > > @@ -800,6 +806,12 @@ static struct undef_hook neon_support_hook[] =3D=
 {{
> > >     .cpsr_mask      =3D PSR_T_BIT,
> > >     .cpsr_val       =3D PSR_T_BIT,
> > >     .fn             =3D vfp_support_entry,
> > > +}, {
> > > +   .instr_mask     =3D 0xffb00000,
> > > +   .instr_val      =3D 0xfc200000,
> > > +   .cpsr_mask      =3D PSR_T_BIT,
> > > +   .cpsr_val       =3D PSR_T_BIT,
> > > +   .fn             =3D vfp_support_entry,
> >
> > Why have two entries conditional on each possible value of one bit for
> > otherwise identical encodings? Surely it suffices to set both cpsr_mask
> > and cpsr_val to 0?
>
> You're right.
> I will set both cpsr_mask and cpsr_val to 0 and use single entry,
> as you suggested, in the v2 patch.
>
> Thanks.
>
> >
> > Thanks,
> > Robin.
> >
> > >   }};
> > >
> > >   static struct undef_hook vfp_support_hook =3D {


Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467D3C64EC4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 01:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EqhDZzrss8FZauHLdy3yGltu/TNnywGdNfFHVyXVdaY=; b=gOT9bfcJaDhBHnvVlKd8Iq75FT
	YPob7HLG66IW8JDV+SnGYLfOuDS8R3aP/Vub1aRgjE+CisCx9m5s1Z7PGOmnJ41oR5CY0bHS5xHHm
	ShDSMT5f9IJqsA9+kpLIvGXB8FpMBbf4dV6oflgfTksn+E9wmwDmVVAUBFvBs39njC9nX4CYNG/Qj
	YzlfJi7lZDi78lS/d9T1J7Wt3GDou6nA+9lEHsHBXAVyrbCb0S4OVOoW8qBGHXn91nO4LYf3jj9i1
	KZwONJiO19TMrwK2GHMVZfqGgOp9QVldQEcAOWKL6laCEYT1bP5ZJIlRAntzoBijmmyW/NDjATk/F
	YAGhQfWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa4mT-007Mzi-JK; Thu, 09 Mar 2023 01:09:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa4mP-007My4-Fi; Thu, 09 Mar 2023 01:09:16 +0000
X-UUID: fca75542be1611eda08d4d6090ec5a5c-20230308
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=EqhDZzrss8FZauHLdy3yGltu/TNnywGdNfFHVyXVdaY=;
	b=WWlMqsMQDySOOkiuXjrz/c4Pq8h5yvH1cGPEbDN9VXHrsYzMwHiHHLx/YzaTxykn9NZ2tyd96KkmEXMv9jCMcy+E4K7weGcMvOt0PujqheD9npXBrqTZr1F9AUu3QvJ/MPXDiZKsNIFgOZMNtUg0JBYxCrgiz/oQ3QN0wwua4Xk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:339b8971-1326-4702-bfbb-a63c16b0d03b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:25b5999,CLOUDID:d78a34f5-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 1,FCT|NGT
X-UUID: fca75542be1611eda08d4d6090ec5a5c-20230308
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <haibo.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2101898278; Wed, 08 Mar 2023 18:09:05 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 9 Mar 2023 08:58:32 +0800
Received: from mszsdtlt102.gcn.mediatek.inc (10.16.4.142) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 9 Mar 2023 08:58:31 +0800
From: Haibo Li <haibo.li@mediatek.com>
To: <elver@google.com>
CC: <angelogioacchino.delregno@collabora.com>, <dvyukov@google.com>,
	<haibo.li@mediatek.com>, <kasan-dev@googlegroups.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <mark.rutland@arm.com>,
	<matthias.bgg@gmail.com>, <will@kernel.org>, <xiaoming.yu@mediatek.com>
Subject: Re: [PATCH] kcsan:fix alignment_fault when read unaligned instrumented memory
Date: Thu, 9 Mar 2023 08:58:31 +0800
Message-ID: <20230309005831.52154-1-haibo.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ZAhkQUmvf1U3H4nR@elver.google.com>
References: <ZAhkQUmvf1U3H4nR@elver.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_170913_888356_4B4323E1 
X-CRM114-Status: GOOD (  29.88  )
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

> On Wed, Mar 08, 2023 at 05:41PM +0800, Haibo Li wrote:=0D
> [...]=0D
> > > > x2 : 0005ff802a0d8d71 x1 : 0000000000000000 x0 : 0000000000000000=0D
> Call=0D
> > > > trace:=0D
> > > >  kcsan_setup_watchpoint+0x26c/0x6bc=0D
> > > >  __tsan_read2+0x1f0/0x234=0D
> > > >  inflate_fast+0x498/0x750=0D
> > >=0D
> > > ^^ is it possible that an access in "inflate_fast" is unaligned?=0D
> > Here is the instruction for inflate_fast+0x498:=0D
> > ffffffc008948980 <inflate_fast>:=0D
> > ...=0D
> > 	ffffffc008948e10: e0 03 1c aa   mov     x0, x28=0D
> > 	ffffffc008948e14: 06 3a e9 97   bl      0xffffffc00839762c=0D
> <__tsan_unaligned_read2>=0D
> > 	ffffffc008948e18: e0 03 17 aa   mov     x0, x23=0D
> > 	>ffffffc008948e1c: 9a 27 40 78   ldrh    w26, [x28], #2=0D
> >=0D
> > And the instruction for kcsan_setup_watchpoint+0x26c:=0D
> > 	ffffffc00839ab90 <kcsan_setup_watchpoint>:=0D
> > 	...=0D
> > 	>ffffffc00839adfc: a8 fe df 48   ldarh   w8, [x21]=0D
> >=0D
> > The instruction is different.READ_ONCE uses ldarh,which requires the ac=
cess=0D
> address is aligned.=0D
> > As ARM v8 arm said:=0D
> > "=0D
> > Load-Acquire, Load-AcquirePC and Store-Release, other than Load-Acquire=
=0D
> Exclusive Pair and=0D
> > Store-Release-Exclusive Pair, access only a single data element. This a=
ccess is=0D
> single-copy atomic. The address of the data object must be aligned to the=
 size=0D
> of the data element being accessed, otherwise the access generates an=0D
> > Alignment fault."=0D
> >=0D
> > while ldrh accepts unaligned address.=0D
> > That's why it is ok while disable KCSAN.=0D
> =0D
> I understand now what's going on, thanks for the analysis.=0D
> =0D
> Can you test the below patch, I think it is the correct solution for=0D
> this - compared to your approach of opting out unaligned accesses, with=0D
> the below there is no loss of functionality.=0D
> =0D
> Thanks,=0D
> -- Marco=0D
> =0D
The below patch works well on linux-5.15+arm64.=0D
> ------ >8 ------=0D
> =0D
> =0D
> From 889e9d5ce61592a18c90a9c57495337d5827bbc2 Mon Sep 17 00:00:00=0D
> 2001=0D
> From: Marco Elver <elver@google.com>=0D
> Date: Wed, 8 Mar 2023 11:21:06 +0100=0D
> Subject: [PATCH] kcsan: Avoid READ_ONCE() in read_instrumented_memory()=0D
> =0D
> Haibo Li reported:=0D
> =0D
>  | Unable to handle kernel paging request at virtual address=0D
>  |   ffffff802a0d8d7171=0D
>  | Mem abort info:o:=0D
>  |   ESR =3D 0x9600002121=0D
>  |   EC =3D 0x25: DABT (current EL), IL =3D 32 bitsts=0D
>  |   SET =3D 0, FnV =3D 0 0=0D
>  |   EA =3D 0, S1PTW =3D 0 0=0D
>  |   FSC =3D 0x21: alignment fault=0D
>  | Data abort info:o:=0D
>  |   ISV =3D 0, ISS =3D 0x0000002121=0D
>  |   CM =3D 0, WnR =3D 0 0=0D
>  | swapper pgtable: 4k pages, 39-bit VAs, pgdp=3D000000002835200000=0D
>  | [ffffff802a0d8d71] pgd=3D180000005fbf9003, p4d=3D180000005fbf9003,=0D
>  | pud=3D180000005fbf9003, pmd=3D180000005fbe8003, pte=3D006800002a0d8707=
=0D
>  | Internal error: Oops: 96000021 [#1] PREEMPT SMP=0D
>  | Modules linked in:=0D
>  | CPU: 2 PID: 45 Comm: kworker/u8:2 Not tainted=0D
>  |   5.15.78-android13-8-g63561175bbda-dirty #1=0D
>  | ...=0D
>  | pc : kcsan_setup_watchpoint+0x26c/0x6bc=0D
>  | lr : kcsan_setup_watchpoint+0x88/0x6bc=0D
>  | sp : ffffffc00ab4b7f0=0D
>  | x29: ffffffc00ab4b800 x28: ffffff80294fe588 x27: 0000000000000001=0D
>  | x26: 0000000000000019 x25: 0000000000000001 x24: ffffff80294fdb80=0D
>  | x23: 0000000000000000 x22: ffffffc00a70fb68 x21: ffffff802a0d8d71=0D
>  | x20: 0000000000000002 x19: 0000000000000000 x18: ffffffc00a9bd060=0D
>  | x17: 0000000000000001 x16: 0000000000000000 x15: ffffffc00a59f000=0D
>  | x14: 0000000000000001 x13: 0000000000000000 x12: ffffffc00a70faa0=0D
>  | x11: 00000000aaaaaaab x10: 0000000000000054 x9 : ffffffc00839adf8=0D
>  | x8 : ffffffc009b4cf00 x7 : 0000000000000000 x6 : 0000000000000007=0D
>  | x5 : 0000000000000000 x4 : 0000000000000000 x3 : ffffffc00a70fb70=0D
>  | x2 : 0005ff802a0d8d71 x1 : 0000000000000000 x0 : 0000000000000000=0D
>  | Call trace:=0D
>  |  kcsan_setup_watchpoint+0x26c/0x6bc=0D
>  |  __tsan_read2+0x1f0/0x234=0D
>  |  inflate_fast+0x498/0x750=0D
>  |  zlib_inflate+0x1304/0x2384=0D
>  |  __gunzip+0x3a0/0x45c=0D
>  |  gunzip+0x20/0x30=0D
>  |  unpack_to_rootfs+0x2a8/0x3fc=0D
>  |  do_populate_rootfs+0xe8/0x11c=0D
>  |  async_run_entry_fn+0x58/0x1bc=0D
>  |  process_one_work+0x3ec/0x738=0D
>  |  worker_thread+0x4c4/0x838=0D
>  |  kthread+0x20c/0x258=0D
>  |  ret_from_fork+0x10/0x20=0D
>  | Code: b8bfc2a8 2a0803f7 14000007 d503249f (78bfc2a8) )=0D
>  | ---[ end trace 613a943cb0a572b6 ]-----=0D
> =0D
> The reason for this is that on certain arm64 configuration since=0D
> e35123d83ee3 ("arm64: lto: Strengthen READ_ONCE() to acquire when=0D
> CONFIG_LTO=3Dy"), READ_ONCE() may be promoted to a full atomic acquire=0D
> instruction which cannot be used on unaligned addresses.=0D
> =0D
> Fix it by avoiding READ_ONCE() in read_instrumented_memory(), and simply=
=0D
> forcing the compiler to do the required access by casting to the=0D
> appropriate volatile type. In terms of generated code this currently=0D
> only affects architectures that do not use the default READ_ONCE()=0D
> implementation.=0D
> =0D
> The only downside is that we are not guaranteed atomicity of the access=0D
> itself, although on most architectures a plain load up to machine word=0D
> size should still be atomic (a fact the default READ_ONCE() still relies=
=0D
> on itself).=0D
> =0D
=0D
> Reported-by: Haibo Li <haibo.li@mediatek.com>=0D
> Cc: <stable@vger.kernel.org>=0D
> Signed-off-by: Marco Elver <elver@google.com>=0D
> ---=0D
>  kernel/kcsan/core.c | 17 +++++++++++++----=0D
>  1 file changed, 13 insertions(+), 4 deletions(-)=0D
> =0D
> diff --git a/kernel/kcsan/core.c b/kernel/kcsan/core.c=0D
> index 54d077e1a2dc..5a60cc52adc0 100644=0D
> --- a/kernel/kcsan/core.c=0D
> +++ b/kernel/kcsan/core.c=0D
> @@ -337,11 +337,20 @@ static void delay_access(int type)=0D
>   */=0D
>  static __always_inline u64 read_instrumented_memory(const volatile void=
=0D
> *ptr, size_t size)=0D
>  {=0D
> +	/*=0D
> +	 * In the below we don't necessarily need the read of the location to=0D
> +	 * be atomic, and we don't use READ_ONCE(), since all we need for race=
=0D
> +	 * detection is to observe 2 different values.=0D
> +	 *=0D
> +	 * Furthermore, on certain architectures (such as arm64), READ_ONCE()=0D
> +	 * may turn into more complex instructions than a plain load that canno=
t=0D
> +	 * do unaligned accesses.=0D
> +	 */=0D
>  	switch (size) {=0D
> -	case 1:  return READ_ONCE(*(const u8 *)ptr);=0D
> -	case 2:  return READ_ONCE(*(const u16 *)ptr);=0D
> -	case 4:  return READ_ONCE(*(const u32 *)ptr);=0D
> -	case 8:  return READ_ONCE(*(const u64 *)ptr);=0D
> +	case 1:  return *(const volatile u8 *)ptr;=0D
> +	case 2:  return *(const volatile u16 *)ptr;=0D
> +	case 4:  return *(const volatile u32 *)ptr;=0D
> +	case 8:  return *(const volatile u64 *)ptr;=0D
>  	default: return 0; /* Ignore; we do not diff the values. */=0D
>  	}=0D
>  }=0D
> --=0D
> 2.40.0.rc0.216.gc4246ad0f0-goog=0D
=0D


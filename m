Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70589C74A5B
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 09:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nmlM9XqsRD3DG3f7oUF+FtletrXY02DAgZGYgAcM4K0=; b=lRpZ8TKIf951y64T08ROkHl9OX
	h2nHh1fxr1QsMz5+3gyaCIgp7e3MvkLS7R1HvxZe8t1l8F4avbwFcJVl/0jKCoIyCz64WVrD4BnZD
	Dzz3cGeVre1wm+ogsaEmHP2999HFooIy55EXTK6hnXfF1i8oMo7mXwvIsPg9yECskL9WsZfmNfPLA
	TfEdrnWfLwHsvGC5ojkQX3nxEz5tXzKoFjNakCm5n+1eiytKC7lolyMOUEyJbnQokj9XKZ/AEmqv8
	GqtIPcWezP535BsT1o0i9keZC8WrletuZzPd2tl8hawKfXVtNMAEtIlW1RWq+DpDIP/ubL7POn9XB
	6/AePpbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZqIY-004ENc-6S; Wed, 08 Mar 2023 09:41:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZqIU-004EM0-Kk; Wed, 08 Mar 2023 09:41:24 +0000
X-UUID: 5e3ecc2cbd9511edbbe3f76fe852e059-20230308
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=nmlM9XqsRD3DG3f7oUF+FtletrXY02DAgZGYgAcM4K0=;
	b=EFtHRuylCllzLUNfG7pzWaMIadpbVkUQHslIR9U+7mlC7JITmHKTMZZmLNzyDlqRU8eWcSkU6ZJu2Sv18ifuyXK3pCDHl6RGxGJsyVRacc+tumeE3D4cfea5dY1QUNJL6sp61qykIXSA4u98zml8q+IXvb6uiGdoE3I1PVy936U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:c42f6582-f2a0-4458-a55a-14fd1421e140,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:25b5999,CLOUDID:5fd198b2-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 1,FCT|NGT
X-UUID: 5e3ecc2cbd9511edbbe3f76fe852e059-20230308
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <haibo.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1159203719; Wed, 08 Mar 2023 02:41:14 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Wed, 8 Mar 2023 17:41:02 +0800
Received: from mszsdtlt102.gcn.mediatek.inc (10.16.4.142) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Wed, 8 Mar 2023 17:41:01 +0800
From: Haibo Li <haibo.li@mediatek.com>
To: <elver@google.com>
CC: <angelogioacchino.delregno@collabora.com>, <dvyukov@google.com>,
	<haibo.li@mediatek.com>, <kasan-dev@googlegroups.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <mark.rutland@arm.com>,
	<matthias.bgg@gmail.com>, <xiaoming.yu@mediatek.com>
Subject: Re: [PATCH] kcsan:fix alignment_fault when read unaligned instrumented memory
Date: Wed, 8 Mar 2023 17:41:01 +0800
Message-ID: <20230308094101.66448-1-haibo.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CANpmjNMj3JX6d=HS=CNzxZPZcJZWfz0G5wKmJjfGb_N525NNLw@mail.gmail.com>
References: <CANpmjNMj3JX6d=HS=CNzxZPZcJZWfz0G5wKmJjfGb_N525NNLw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_014122_712498_C3346420 
X-CRM114-Status: GOOD (  27.76  )
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

> On Wed, 8 Mar 2023 at 03:21, 'Haibo Li' via kasan-dev=0D
> <kasan-dev@googlegroups.com> wrote:=0D
> >=0D
> > After enable kcsan on arm64+linux-5.15,it reports alignment_fault when=
=0D
> > access unaligned address.=0D
> =0D
> Is this KCSAN's fault or the fault of the code being instrumented?=0D
> I.e. if you disable KCSAN, is there still an alignment fault reported?=0D
If disable KCSAN,the alignment fault will not occur.=0D
=0D
> =0D
> Because as-is, I don't understand how the instrumentation alone will caus=
e an=0D
> alignment fault, because for every normal memory access there is a=0D
> corresponding instrumented access - therefore, that'd suggest that the re=
al=0D
> access was also unaligned. Note that the compiler inserts instrumentation=
=0D
> _before_ the actual access, so if there's a problem, that problem will ma=
nifest=0D
> inside KCSAN.=0D
> =0D
> Can you provide more information about what's going on (type of access, s=
ize=0D
> of access, etc.)?=0D
> =0D
Here is the source code of inflate_fast+0x498(lib/zlib_inflate/inffast.c +2=
58):=0D
                    if (dist > 2) {=0D
                        unsigned short *sfrom;=0D
=0D
                        sfrom =3D (unsigned short *)(from);=0D
                        loops =3D len >> 1;=0D
                        do {=0D
                            if (IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_=
ACCESS))=0D
                                >*sout++ =3D *sfrom++;=0D
it reads 2 bytes from sfrom and sfrom is unaligned.=0D
=0D
> > Here is the oops log:=0D
> > "=0D
> > Trying to unpack rootfs image as initramfs.....=0D
> > Unable to handle kernel paging request at virtual address=0D
> >   ffffff802a0d8d7171=0D
> > Mem abort info:o:=0D
> >   ESR =3D 0x9600002121=0D
> >   EC =3D 0x25: DABT (current EL), IL =3D 32 bitsts=0D
> >   SET =3D 0, FnV =3D 0 0=0D
> >   EA =3D 0, S1PTW =3D 0 0=0D
> >   FSC =3D 0x21: alignment fault=0D
> > Data abort info:o:=0D
> >   ISV =3D 0, ISS =3D 0x0000002121=0D
> >   CM =3D 0, WnR =3D 0 0=0D
> > swapper pgtable: 4k pages, 39-bit VAs, pgdp=3D000000002835200000=0D
> > [ffffff802a0d8d71] pgd=3D180000005fbf9003, p4d=3D180000005fbf9003,=0D
> > pud=3D180000005fbf9003, pmd=3D180000005fbe8003, pte=3D006800002a0d8707=
=0D
> > Internal error: Oops: 96000021 [#1] PREEMPT SMP Modules linked in:=0D
> > CPU: 2 PID: 45 Comm: kworker/u8:2 Not tainted=0D
> >   5.15.78-android13-8-g63561175bbda-dirty #1 ...=0D
> > pc : kcsan_setup_watchpoint+0x26c/0x6bc=0D
> > lr : kcsan_setup_watchpoint+0x88/0x6bc sp : ffffffc00ab4b7f0=0D
> > x29: ffffffc00ab4b800 x28: ffffff80294fe588 x27: 0000000000000001=0D
> > x26: 0000000000000019 x25: 0000000000000001 x24: ffffff80294fdb80=0D
> > x23: 0000000000000000 x22: ffffffc00a70fb68 x21: ffffff802a0d8d71=0D
> > x20: 0000000000000002 x19: 0000000000000000 x18: ffffffc00a9bd060=0D
> > x17: 0000000000000001 x16: 0000000000000000 x15: ffffffc00a59f000=0D
> > x14: 0000000000000001 x13: 0000000000000000 x12: ffffffc00a70faa0=0D
> > x11: 00000000aaaaaaab x10: 0000000000000054 x9 : ffffffc00839adf8=0D
> > x8 : ffffffc009b4cf00 x7 : 0000000000000000 x6 : 0000000000000007=0D
> > x5 : 0000000000000000 x4 : 0000000000000000 x3 : ffffffc00a70fb70=0D
> > x2 : 0005ff802a0d8d71 x1 : 0000000000000000 x0 : 0000000000000000 Call=
=0D
> > trace:=0D
> >  kcsan_setup_watchpoint+0x26c/0x6bc=0D
> >  __tsan_read2+0x1f0/0x234=0D
> >  inflate_fast+0x498/0x750=0D
> =0D
> ^^ is it possible that an access in "inflate_fast" is unaligned?=0D
Here is the instruction for inflate_fast+0x498:=0D
ffffffc008948980 <inflate_fast>:=0D
...=0D
	ffffffc008948e10: e0 03 1c aa   mov     x0, x28=0D
	ffffffc008948e14: 06 3a e9 97   bl      0xffffffc00839762c <__tsan_unalign=
ed_read2>=0D
	ffffffc008948e18: e0 03 17 aa   mov     x0, x23=0D
	>ffffffc008948e1c: 9a 27 40 78   ldrh    w26, [x28], #2=0D
=0D
And the instruction for kcsan_setup_watchpoint+0x26c:=0D
	ffffffc00839ab90 <kcsan_setup_watchpoint>:=0D
	...=0D
	>ffffffc00839adfc: a8 fe df 48   ldarh   w8, [x21]=0D
=0D
The instruction is different.READ_ONCE uses ldarh,which requires the access=
 address is aligned.=0D
As ARM v8 arm said:=0D
"=0D
Load-Acquire, Load-AcquirePC and Store-Release, other than Load-Acquire Exc=
lusive Pair and=0D
Store-Release-Exclusive Pair, access only a single data element. This acces=
s is single-copy atomic. The address of the data object must be aligned to =
the size of the data element being accessed, otherwise the access generates=
 an=0D
Alignment fault."=0D
=0D
while ldrh accepts unaligned address.=0D
That's why it is ok while disable KCSAN.=0D
=0D
> =0D
> >  zlib_inflate+0x1304/0x2384=0D
> >  __gunzip+0x3a0/0x45c=0D
> >  gunzip+0x20/0x30=0D
> >  unpack_to_rootfs+0x2a8/0x3fc=0D
> >  do_populate_rootfs+0xe8/0x11c=0D
> >  async_run_entry_fn+0x58/0x1bc=0D
> >  process_one_work+0x3ec/0x738=0D
> >  worker_thread+0x4c4/0x838=0D
> >  kthread+0x20c/0x258=0D
> >  ret_from_fork+0x10/0x20=0D
> > Code: b8bfc2a8 2a0803f7 14000007 d503249f (78bfc2a8) ) ---[ end trace=0D
> > 613a943cb0a572b6 ]----- "=0D
> >=0D
> > After checking linux 6.3-rc1 on QEMU arm64,it still has the=0D
> > possibility to read unaligned address in read_instrumented_memory(qemu=
=0D
> > can not emulate alignment fault)=0D
> >=0D
> > To fix alignment fault and read the value of instrumented memory more=0D
> > effective,bypass the unaligned access in read_instrumented_memory.=0D
> >=0D
> > Signed-off-by: Haibo Li <haibo.li@mediatek.com>=0D
> > ---=0D
> >  kernel/kcsan/core.c | 5 +++++=0D
> >  1 file changed, 5 insertions(+)=0D
> >=0D
> > diff --git a/kernel/kcsan/core.c b/kernel/kcsan/core.c index=0D
> > 54d077e1a2dc..88e75d7d85d2 100644=0D
> > --- a/kernel/kcsan/core.c=0D
> > +++ b/kernel/kcsan/core.c=0D
> > @@ -337,6 +337,11 @@ static void delay_access(int type)=0D
> >   */=0D
> >  static __always_inline u64 read_instrumented_memory(const volatile=0D
> > void *ptr, size_t size)  {=0D
> > +       bool aligned_read =3D (size =3D=3D 1) || IS_ALIGNED((unsigned=0D
> > + long)ptr, size);=0D
> =0D
> (size=3D=3D1) check is redundant because IS_ALIGNED(.., 1) should always =
return=0D
> true.=0D
Thanks.I will drop it.=0D
> =0D
> And this will also penalize other architectures which can do unaligned ac=
cesses.=0D
> So this check probably wants to be guarded by "IS_ENABLED(CONFIG_ARM64)"=
=0D
> or something.=0D
=0D
Agree.Is it acceptable to use IS_ENABLED(CONFIG_ARM64) here?=0D
> =0D
> > +       if (!aligned_read)=0D
> > +               return 0;=0D
> > +=0D
> >         switch (size) {=0D
> >         case 1:  return READ_ONCE(*(const u8 *)ptr);=0D
> >         case 2:  return READ_ONCE(*(const u16 *)ptr);=0D


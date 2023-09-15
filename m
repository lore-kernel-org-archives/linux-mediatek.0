Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731EEEE644B
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Sep 2023 09:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1OuoRlRhal85zHHNkvOTaN3Ke5AHVAChxHwJa2fHozc=; b=PJPr4jFKP1gpjVFi6BceRvtkht
	4oVmRpGawMsTRK0Qj5Jm/goUTHLXeUoT3UvFKD7oCfuV+q7beNPSOl+itlWvu/y9dR2Teq2c7AqNe
	70+DcaIzKOe7Pj6ItvpS0vNw8LHaaPpQzs1j8ic9W5eazJ+E2huEp0cMOVVa3hwMakpjUoOxwDPQT
	wo7osXkW30UGI1Uy47Fx262iYpk8UnW0bAV2fOSvEcpoHprYCug+4G/LZv8pmuYmdng2v0kF0DeKE
	+6EgrwNGubnosVLZFXzQWMohqoy7A/dxQhYbHc0Oy1qHr5kGnE8l+Acbkczno1bFXeyfHiQlSmzhf
	8DBQN1FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh5Jk-00AIxp-1J;
	Fri, 15 Sep 2023 09:40:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh5Jh-00AIvz-1e;
	Fri, 15 Sep 2023 09:40:50 +0000
X-UUID: efa5b43a53ab11ee9b7791016c24628a-20230915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=1OuoRlRhal85zHHNkvOTaN3Ke5AHVAChxHwJa2fHozc=;
	b=MM3euV1tUKPXUIldHSEbYRgltH5vlWwr9PKwDcZsZ93Y58hIBDgqc8rENDFbkwXO+ceBSA77MybzU3AMAim1adN077HVNbgjNPIh8lQ605HiFQH5brtv68RiPv6ae75O4HIXXjIXvDfVSNnfzoBqMfzOhdzOiTL4mDx0JETFaNE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:8094830c-3d9b-49b5-b2d3-c6b0dcfc3a0b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:697511c3-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:817|102,TC:nil,Content:0|-5,EDM:-3,I
	P:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 1,FCT|NGT
X-CID-BAS: 1,FCT|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: efa5b43a53ab11ee9b7791016c24628a-20230915
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <haibo.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1576458382; Fri, 15 Sep 2023 02:40:42 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 15 Sep 2023 17:40:04 +0800
Received: from mszsdtlt101.gcn.mediatek.inc (10.16.4.141) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 15 Sep 2023 17:40:04 +0800
From: Haibo Li <haibo.li@mediatek.com>
To: <haibo.li@mediatek.com>
CC: <akpm@linux-foundation.org>, <andreyknvl@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <dvyukov@google.com>,
	<glider@google.com>, <jannh@google.com>, <kasan-dev@googlegroups.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-mm@kvack.org>,
	<mark.rutland@arm.com>, <matthias.bgg@gmail.com>, <ryabinin.a.a@gmail.com>,
	<vincenzo.frascino@arm.com>, <xiaoming.yu@mediatek.com>
Subject: Re: [PATCH] kasan:fix access invalid shadow address when input is illegal
Date: Fri, 15 Sep 2023 17:40:04 +0800
Message-ID: <20230915094004.113104-1-haibo.li@mediatek.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230915024559.32806-1-haibo.li@mediatek.com>
References: <20230915024559.32806-1-haibo.li@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_024049_555560_C1044C85 
X-CRM114-Status: GOOD (  28.96  )
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

> > On Thu, Sep 14, 2023 at 10:41=C3=A2=E2=82=AC=C2=AFPM Jann Horn <jannh@g=
oogle.com> wrote:=0D
> > >=0D
> > > > Accessing unmapped memory with KASAN always led to a crash when=0D
> > > > checking shadow memory. This was reported/discussed before. To impr=
ove=0D
> > > > crash reporting for this case, Jann added kasan_non_canonical_hook =
and=0D
> > > > Mark integrated it into arm64. But AFAIU, for some reason, it stopp=
ed=0D
> > > > working.=0D
> > > >=0D
> > > > Instead of this patch, we need to figure out why=0D
> > > > kasan_non_canonical_hook stopped working and fix it.=0D
> > > >=0D
> > > > This approach taken by this patch won't work for shadow checks adde=
d=0D
> > > > by compiler instrumentation. It only covers explicitly checked=0D
> > > > accesses, such as via memcpy, etc.=0D
> > >=0D
> > > FWIW, AFAICS kasan_non_canonical_hook() currently only does anything=
=0D
> > > under CONFIG_KASAN_INLINE;=0D
> > =0D
> > Ah, right. I was thinking about the inline mode, but the patch refers=0D
> > to the issue with the outline mode.=0D
> > =0D
> > However, I just checked kasan_non_canonical_hook for SW_TAGS with the=0D
> > inline mode: it does not work when accessing 0x42ffffb80aaaaaaa, the=0D
> > addr < KASAN_SHADOW_OFFSET check fails. It appears there's something=0D
> > unusual about how instrumentation calculates the shadow address. I=0D
> > didn't investigate further yet.=0D
Sorry to miss this message.=0D
I checked inline mode just now.kasan_non_canonical_hook can print =0D
something like below:=0D
Unable to handle kernel paging request at virtual address ffffffb80aaaaaaa=
=0D
KASAN: maybe wild-memory-access in range [0xffffff80aaaaaaa0-0xffffff80aaaa=
aaaf]=0D
...=0D
[ffffffb80aaaaaaa] pgd=3D000000005d3d6003, p4d=3D000000005d3d6003, pud=3D00=
0000005d3d6003,=0D
pmd=3D0000000000000000=0D
...=0D
pc : __hwasan_check_x20_67043363+0x4/0x34=0D
lr : do_ib_ob+0x108/0x114=0D
...=0D
Call trace:=0D
 __hwasan_check_x20_67043363+0x4/0x34=0D
 die_selftest+0x68/0x80=0D
 param_attr_store+0xec/0x164=0D
 module_attr_store+0x34/0x4c=0D
 sysfs_kf_write+0x78/0x8c=0D
 kernfs_fop_write_iter+0x154/0x214=0D
 vfs_write+0x36c/0x4c4=0D
 ksys_write+0x98/0x110=0D
 __arm64_sys_write+0x3c/0x48=0D
 invoke_syscall+0x58/0x154=0D
 el0_svc_common+0xe8/0x120=0D
 do_el0_svc_compat+0x2c/0x38=0D
 el0_svc_compat+0x34/0x84=0D
 el0t_32_sync_handler+0x78/0xb4=0D
 el0t_32_sync+0x194/0x198=0D
=0D
When addr < KASAN_SHADOW_OFFSET meets,the original addr_has_metadata should=
 return false=0D
and trigger kasan_report in kasan_check_range.=0D
> > =0D
> > > I think the idea when I added that was that=0D
> > > it assumes that when KASAN checks an access in out-of-line=0D
> > > instrumentation or a slowpath, it will do the required checks to avoi=
d=0D
> > > this kind of fault?=0D
> > =0D
> > Ah, no, KASAN doesn't do it.=0D
> > =0D
> > However, I suppose we could add what the original patch proposes for=0D
> > the outline mode. For the inline mode, it seems to be pointless, as=0D
> > most access checks happen though the compiler inserted code anyway.=0D
> > =0D
> > I also wonder how much slowdown this patch will introduce.=0D
> > =0D
> > Haibo, could you check how much slower the kernel becomes with your=0D
> > patch? If possible, with all GENERIC/SW_TAGS and INLINE/OUTLINE=0D
> > combinations.=0D
> > =0D
> > If the slowdown is large, we can just make kasan_non_canonical_hook=0D
> > work for both modes (and fix it for SW_TAGS).=0D
> =0D
> Thanks.=0D
> The patch checks each shadow address,so it introduces extra overhead.=0D
> Now kasan_non_canonical_hook only works for CONFIG_KASAN_INLINE.=0D
> And CONFIG_KASAN_OUTLINE is set in my case.=0D
> Is it possible to make kasan_non_canonical_hook works for both =0D
> INLINE and OUTLINE by simply remove the "#ifdef CONFIG_KASAN_INLINE"?=0D
> Since kasan_non_canonical_hook is only used after kernel fault,it =0D
> is better if there is no limit.=0D


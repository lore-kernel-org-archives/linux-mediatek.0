Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A6BDCD68E3
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Oct 2023 02:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wu/Ez0DKYV6FvYGCa4Fc/RxN6Eo8oqS6inmrf5HcxU4=; b=EPowOs7K5btbvDlZrdgSaQnVig
	iShliqOV8EXIc5hDubJzfhjr77iBYZwp0hlUfwcD/MdydtqCuniVqeX5Yrm9geBBk06opJjXgvZtm
	yJ0MBSayQQ2yFvOT/lhtXtlVdcYOsxHrUbuP3mbVqW3xJ9mWI6TY+gO4tS/HeMJn7OG1bIEkUA7YO
	mWvso5KDRnH7gpWvCtwSAZXzjMJu1usRG8ix/urUSPNdoGj6A/GmsOhAibfcBA1SV7HrlsdWeiap+
	Mdeqv7cYQ5MiOyGis74FvYfPM2v68ogt1RleZ383IUt9X9mEYEE30NCZIUPbidZIWyC2aX+AEfElT
	5lNJIZ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qq2EY-00C4RK-2l;
	Tue, 10 Oct 2023 02:12:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qq2EV-00C4Pv-2K;
	Tue, 10 Oct 2023 02:12:29 +0000
X-UUID: 71bbb52c671211ee86758d4a7c00f3a0-20231009
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=wu/Ez0DKYV6FvYGCa4Fc/RxN6Eo8oqS6inmrf5HcxU4=;
	b=ZTqiasz2cbny1AKtvctTnQ943n7Vjymnpn81mBS2ZTBeDiValMXmAbuQfZx3XLC14z2Zf2k8oaTpYX+bd6JZPWz0GwsCGmbORopCF9v5m1RCHcQw0HE2DuOc76DUN4AnVHlUcS2KToAwP14HzndulxemHLINYoEGqZP1H+7beFc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:3deb680f-8e48-4a32-a700-11253396f5f8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:b0f5bfbf-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:817|102,TC:nil,Content:0|-5,EDM:-3,I
	P:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 1,FCT|NGT
X-CID-BAS: 1,FCT|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 71bbb52c671211ee86758d4a7c00f3a0-20231009
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <haibo.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 336724300; Mon, 09 Oct 2023 19:12:21 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 10 Oct 2023 09:52:17 +0800
Received: from mszsdtlt102.gcn.mediatek.inc (10.16.4.142) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 10 Oct 2023 09:52:17 +0800
From: Haibo Li <haibo.li@mediatek.com>
To: <akpm@linux-foundation.org>
CC: <andreyknvl@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<dvyukov@google.com>, <glider@google.com>, <haibo.li@mediatek.com>,
	<kasan-dev@googlegroups.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-mm@kvack.org>, <matthias.bgg@gmail.com>, <ryabinin.a.a@gmail.com>,
	<vincenzo.frascino@arm.com>, <xiaoming.yu@mediatek.com>, <jannh@google.com>
Subject: Re: [PATCH v2] kasan:print the original fault addr when access invalid shadow
Date: Tue, 10 Oct 2023 09:52:16 +0800
Message-ID: <20231010015216.67121-1-haibo.li@mediatek.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20231009170031.a294c11575d5d4941b8596a9@linux-foundation.org>
References: <20231009170031.a294c11575d5d4941b8596a9@linux-foundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_191227_784750_F9A9C144 
X-CRM114-Status: GOOD (  17.14  )
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

> On Mon, 9 Oct 2023 15:37:48 +0800 Haibo Li <haibo.li@mediatek.com> wrote:=
=0D
> =0D
> > when the checked address is illegal,the corresponding shadow address=0D
> > from kasan_mem_to_shadow may have no mapping in mmu table.=0D
> > Access such shadow address causes kernel oops.=0D
> > Here is a sample about oops on arm64(VA 39bit) =0D
> > with KASAN_SW_TAGS and KASAN_OUTLINE on:=0D
> > =0D
> > [ffffffb80aaaaaaa] pgd=3D000000005d3ce003, p4d=3D000000005d3ce003,=0D
> >     pud=3D000000005d3ce003, pmd=3D0000000000000000=0D
> > Internal error: Oops: 0000000096000006 [#1] PREEMPT SMP=0D
> > Modules linked in:=0D
> > CPU: 3 PID: 100 Comm: sh Not tainted 6.6.0-rc1-dirty #43=0D
> > Hardware name: linux,dummy-virt (DT)=0D
> > pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)=0D
> > pc : __hwasan_load8_noabort+0x5c/0x90=0D
> > lr : do_ib_ob+0xf4/0x110=0D
> > ffffffb80aaaaaaa is the shadow address for efffff80aaaaaaaa.=0D
> > The problem is reading invalid shadow in kasan_check_range.=0D
> > =0D
> > The generic kasan also has similar oops.=0D
> > =0D
> > It only reports the shadow address which causes oops but not=0D
> > the original address.=0D
> > =0D
> > Commit 2f004eea0fc8("x86/kasan: Print original address on #GP")=0D
> > introduce to kasan_non_canonical_hook but limit it to KASAN_INLINE.=0D
> > =0D
> > This patch extends it to KASAN_OUTLINE mode.=0D
> =0D
> Is 2f004eea0fc8 a suitable Fixes: target for this?  If not, what is?=0D
> =0D
Yes, 2f004eea0fc8 is a suitable fix.=0D
All we need is a better crash report for this case.=0D
After commit 2f004eea0fc8 and commit =0D
07b742a4d912 ("arm64: mm: log potential KASAN shadow alias"),=0D
it is easy to understand the original address when=0D
 out-of-bounds KASAN shadow accesses occur.=0D
Currently, this feature is only available for the KASAN_INLINE case.=0D
As Jann said, it is also suitable for the KASAN_OUTLINE case.=0D
=0D
> Also, I'm assuming that we want to backport this fix into earlier=0D
> kernel versions?=0D
My opinion:=0D
 As it is to improve crash report,there is no requirement to backport.=0D


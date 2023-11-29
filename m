Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E32DAC4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 03:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MFrmkl3FpVdv2jTHH29SfVBZoqzJBE5Ed5AoaMdUtQc=; b=4R71+JtCadh/cGt912m3l7KUzZ
	pnBFi9nTHBXsv/nmFXgfI1yC7n7Vqtd0cAGUZDrW7L/yrqWoFfFdPJWkIZuxO3h7U5Z4+yvf88X4g
	DZBYTsstv2qHP2J8KuD/xr8hfVMhlN6bRSXx1IbWuAE1W+KOsqjEjy+wRk5APajbVRtQyAGmfb2Qv
	/Ud/yzPKNcKKLvvOxIbyf9/yCg7/wCsV0s+UQNWoFMjGodMVkMdbTo282QuZe7Zcm1plZgvmXsZxK
	Bkl2mbzmynlqWvlEGjkDW1VlOSAf5O6jAGL8v900FOa/ge+OSjYkq0gKTV9A40usOWdWE0CnVsNmA
	NcsAIDrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8BTX-006wtx-2S;
	Wed, 29 Nov 2023 03:42:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8BTV-006wtZ-04;
	Wed, 29 Nov 2023 03:42:58 +0000
X-UUID: 5f6928d68e6911ee9b7791016c24628a-20231128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=MFrmkl3FpVdv2jTHH29SfVBZoqzJBE5Ed5AoaMdUtQc=;
	b=hri4SC49SLNS2OovdCBAAq3/u6RqdCRIeb0lqxkXX5/mMfBHWf1P5e1mkcnBC0k71js22z1gng7N6tTtjbG9294Vzh1HUuQEm5FxbYSAu7ophEC8eIboHRdfhqlK7jERn2omXw46ojJyPJUdC61qB4kt8I+7B+9AzmMjMOYNprc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.34,REQID:db2c269f-aae4-48d2-8811-c6a9b4682c2c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:abefa75,CLOUDID:f12012fd-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:817|102,TC:nil,Content:0|-5,EDM:-3,I
	P:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 1,FCT|NGT
X-CID-BAS: 1,FCT|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 5f6928d68e6911ee9b7791016c24628a-20231128
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <haibo.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 744865758; Tue, 28 Nov 2023 20:42:51 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 29 Nov 2023 11:42:48 +0800
Received: from mszsdtlt102.gcn.mediatek.inc (10.16.4.142) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 29 Nov 2023 11:42:48 +0800
From: Haibo Li <haibo.li@mediatek.com>
To: <andreyknvl@gmail.com>
CC: <akpm@linux-foundation.org>, <angelogioacchino.delregno@collabora.com>,
	<dvyukov@google.com>, <glider@google.com>, <haibo.li@mediatek.com>,
	<kasan-dev@googlegroups.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-mm@kvack.org>, <lkp@intel.com>, <matthias.bgg@gmail.com>,
	<ryabinin.a.a@gmail.com>, <vincenzo.frascino@arm.com>,
	<xiaoming.yu@mediatek.com>
Subject: Re: [PATCH] fix comparison of unsigned expression < 0
Date: Wed, 29 Nov 2023 11:42:47 +0800
Message-ID: <20231129034247.226365-1-haibo.li@mediatek.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <CA+fCnZcLwXn6crGF1E1cY3TknMaUN=H8-_hp0-cC+s8-wj95PQ@mail.gmail.com>
References: <CA+fCnZcLwXn6crGF1E1cY3TknMaUN=H8-_hp0-cC+s8-wj95PQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--15.269300-8.000000
X-TMASE-MatchedRID: L8tZF6zWW2q0m/IROg5s5fHkpkyUphL9HTzSJQBZgdFqI8duabhZa/79
	6l+IAtl+w8XU8bLzT9L5qR7J2CotBvww9Stut6YHmNvbnzNu6oLTDXgcUlCNowFbHA9TqNLQmtk
	ZkOzLak8jjoep8ZitK6EZtwWhhaEgAYINegaglbBc/msUC5wFQX4rryovYbmmQ4pQeOTu+8UY20
	f1wrB11n4I3WRiw3QYqULTfmF5uZHqi7LDVhVKr51U1lojafr//5QRvrl2CZCo+b+yOP0oGFC9o
	pMYDUg2585VzGMOFzA9wJeM2pSaRbxAi7jPoeEQftwZ3X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--15.269300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 9998098F6E1CA8C593C63DD30B494B533A460EDFA2BA4999AF9EE84F9D7D46BD2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_194257_089452_09B02566 
X-CRM114-Status: GOOD (  20.00  )
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

> On Wed, Nov 29, 2023 at 2:22 AM Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > On Tue, 28 Nov 2023 15:55:32 +0800 Haibo Li <haibo.li@mediatek.com> wrote:
> >
> > > Kernel test robot reported:
> > >
> > > '''
> > > mm/kasan/report.c:637 kasan_non_canonical_hook() warn:
> > > unsigned 'addr' is never less than zero.
> > > '''
> > > The KASAN_SHADOW_OFFSET is 0 on loongarch64.
> > >
> > > To fix it,check the KASAN_SHADOW_OFFSET before do comparison.
> > >
> > > --- a/mm/kasan/report.c
> > > +++ b/mm/kasan/report.c
> > > @@ -634,10 +634,10 @@ void kasan_non_canonical_hook(unsigned long addr)
> > >  {
> > >       unsigned long orig_addr;
> > >       const char *bug_type;
> > > -
> > > +#if KASAN_SHADOW_OFFSET > 0
> > >       if (addr < KASAN_SHADOW_OFFSET)
> > >               return;
> > > -
> > > +#endif
> >
> > We'd rather not add ugly ifdefs for a simple test like this.  If we
> > replace "<" with "<=", does it fix?  I suspect that's wrong.
>
> Changing the comparison into "<=" would be wrong.
>
> But I actually don't think we need to fix anything here.
>
> This issue looks quite close to a similar comparison with 0 issue
> Linus shared his opinion on here:
>
> https://lore.kernel.org/all/Pine.LNX.4.58.0411230958260.20993@ppc970.osdl.org/
>
> I don't know if the common consensus with the regard to issues like
> that changed since then. But if not, perhaps we can treat this kernel
> test robot report as a false positive.
>
> Thanks!

Thanks for the information.Let's keep it as unchanged.



Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15362C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 02:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eV8675EZrjjaN8az2QNZjl5LVNz6pbadRoow/kKZEus=; b=OkJz8jZpdB7DqCY1jJOP6DszgL
	UhZPnIqOQTTjcIb/DlGURxIERJnUAjC5GKJr/wc/YJNYtmETTNiKDxnugoR/OE3Z3g6upmJyR1/N0
	mZ8OmB41DZsS2gJ2HubsvS9bYSRYtX7vM1dWGL++NcCRKtXJtwKDa9+84uiH28MELiScQURxnS2qS
	nezPDxcir/8lIkpHxdYVA57N8BKHtaWVK7Byy+1yVIvS9TeSq1AwS4jeD2KjcIJJBVcdxI44iF3VN
	tBBkZzsR+dQUcadKDWSHptYwdmZT7f3NN+xPl18AX9B0UrN4xqLVCy70Oewah+SrAeJCog7swDcVG
	20QGXJnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o768C-002Mxi-Ut; Fri, 01 Jul 2022 02:11:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7681-002Muq-9q; Fri, 01 Jul 2022 02:11:32 +0000
X-UUID: 593a4a7b361440ed922bc0ffc350c75d-20220630
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:09fe5091-b442-497e-8684-ed4a28a306a6,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:87442a2,CLOUDID:df054ed6-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:-5,EDM:-3,IP:nil,URL:1,File:ni
	l,QS:nil,BEC:nil,COL:0
X-UUID: 593a4a7b361440ed922bc0ffc350c75d-20220630
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <haibo.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1132874403; Thu, 30 Jun 2022 19:11:18 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 1 Jul 2022 10:10:43 +0800
Received: from mszsdtcf10.gcn.mediatek.inc (10.16.4.60) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Fri, 1 Jul 2022 10:10:42 +0800
From: Haibo Li <haibo.li@mediatek.com>
To: <samitolvanen@google.com>
CC: <andrealmeid@igalia.com>, <atomlin@redhat.com>,
	<christophe.leroy@csgroup.eu>, <dmitry.torokhov@gmail.com>,
	<haibo.li@mediatek.com>, <jgross@suse.com>, <keescook@chromium.org>,
	<lecopzer.chen@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<llvm@lists.linux.dev>, <matthias.bgg@gmail.com>, <mcgrof@kernel.org>,
	<mhiramat@kernel.org>, <nathan@kernel.org>, <ndesaulniers@google.com>,
	<peterz@infradead.org>, <xiaoming.yu@mediatek.com>, <yangtiezhu@loongson.cn>
Subject: Re: [PATCH 1/2] ANDROID: cfi: enable sanitize for cfi.c
Date: Fri, 1 Jul 2022 10:10:42 +0800
Message-ID: <20220701021042.48037-1-haibo.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CABCJKucgdTqDFyTumSCBHiyRVWgvJEhR2Fn=MxyMpTjWtvCV=Q@mail.gmail.com>
References: <CABCJKucgdTqDFyTumSCBHiyRVWgvJEhR2Fn=MxyMpTjWtvCV=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_191129_393626_AEB7EB17 
X-CRM114-Status: GOOD (  13.99  )
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

> On Thu, Jun 30, 2022 at 2:47 AM Haibo Li <haibo.li@mediatek.com> wrote:=0D
> >=0D
> > currenly,cfi.c is excluded from cfi sanitize because of cfi handler.=0D
> > The side effect is that we can not transfer function pointer to other=0D
> > files which enable cfi sanitize.=0D
> >=0D
> > Enable cfi sanitize for cfi.c and bypass cfi check for=0D
> > __cfi_slowpath_diag=0D
> >=0D
> > Signed-off-by: Haibo Li <haibo.li@mediatek.com>=0D
> > Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>=0D
> > ---=0D
> >  kernel/Makefile | 3 ---=0D
> >  kernel/cfi.c    | 8 +++++++-=0D
> >  2 files changed, 7 insertions(+), 4 deletions(-)=0D
> >=0D
> > diff --git a/kernel/Makefile b/kernel/Makefile index=0D
> > a7e1f49ab2b3..a997bef1a200 100644=0D
> > --- a/kernel/Makefile=0D
> > +++ b/kernel/Makefile=0D
> > @@ -40,9 +40,6 @@ KCSAN_SANITIZE_kcov.o :=3D n=0D
> UBSAN_SANITIZE_kcov.o :=3D=0D
> > n  CFLAGS_kcov.o :=3D $(call cc-option, -fno-conserve-stack)=0D
> > -fno-stack-protector=0D
> >=0D
> > -# Don't instrument error handlers=0D
> > -CFLAGS_REMOVE_cfi.o :=3D $(CC_FLAGS_CFI)=0D
> > -=0D
> >  obj-y +=3D sched/=0D
> >  obj-y +=3D locking/=0D
> >  obj-y +=3D power/=0D
> > diff --git a/kernel/cfi.c b/kernel/cfi.c index=0D
> > 08102d19ec15..456771c8e454 100644=0D
> > --- a/kernel/cfi.c=0D
> > +++ b/kernel/cfi.c=0D
> > @@ -311,7 +311,7 @@ static inline cfi_check_fn find_check_fn(unsigned=0D
> long ptr)=0D
> >         return fn;=0D
> >  }=0D
> >=0D
> > -void __cfi_slowpath_diag(uint64_t id, void *ptr, void *diag)=0D
> > +static inline void __nocfi _run_cfi_check(u64 id, void *ptr, void=0D
> > +*diag)=0D
> >  {=0D
> >         cfi_check_fn fn =3D find_check_fn((unsigned long)ptr);=0D
> >=0D
> > @@ -320,6 +320,12 @@ void __cfi_slowpath_diag(uint64_t id, void *ptr,=0D
> void *diag)=0D
> >         else /* Don't allow unchecked modules */=0D
> >                 handle_cfi_failure(ptr);  }=0D
> > +=0D
> > +void __cfi_slowpath_diag(u64 id, void *ptr, void *diag) {=0D
> > +       /*run cfi check without cfi sanitize to avoid calling cfi handl=
er=0D
> recursively*/=0D
> > +       _run_cfi_check(id, ptr, diag); }=0D
> >  EXPORT_SYMBOL(__cfi_slowpath_diag);=0D
> =0D
> You can just add __nocfi to __cfi_slowpath_diag, right? There's no need f=
or the=0D
> separate function.=0D
=0D
    You are right.Now there is no requirement for constant crc of __cfi_slo=
wpath_diag.=0D
I will change it later.=0D
	=0D


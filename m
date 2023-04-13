Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B11C77B6C
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 07:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TlS2syzLgaN+56EfstTdZIGRaa5/Hy8gJUg8hh7K3Fo=; b=myXIPr83hvPit8iebwTtC5KYKM
	E8k6Uhb8gkw6EaZ7VQeFcc6caZFaGV9N62r890tgUDRb2Yo7HjW54FWWsabiqqNXZzJwJr7lgO6TP
	0kvBDYPDUTXvCEaVxo9pPbkI1S1jewq2ZtJ6/OwC/EeifFQD9Ikds0QuWCj+/rdwYUaMlHtSUl104
	BrKzYJAA4xM38/r9+wts62entidDaRi8ei5v9J+FlY0BCcYF17aarAYfTeW5F0+G+kx/vUkGsjW1T
	+ZfjWBRAnQTZYZy6lf6SDBHBUlSu9+i/L3Oq4cEKHp4Vvj1L/q11nSBMeysrH8C0DBQ11gXlwOxW9
	brDi+CUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmrFg-005GG1-0H;
	Thu, 13 Apr 2023 07:20:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmrFb-005GF6-2n;
	Thu, 13 Apr 2023 07:20:13 +0000
X-UUID: 9b6c7a66d9cb11ed8687db9d93187ff1-20230413
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=TlS2syzLgaN+56EfstTdZIGRaa5/Hy8gJUg8hh7K3Fo=;
	b=J/CPNeNMZEaWg6RKHRPw9Tgg485PWAvUVKt769KX7pXBxsD2taDlO6IZANqMAoIe5C5Fj3v/8T/0IGxpPtc5YKXfNqbZPzznLjNw2qMexgUqx2+WDNhNETqC8Toe10CvJW9Z0pWz0zC7Ui703c7fGdMW+Kd0/ytBGwIg7WeeqvE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:37e0c691-56f1-4485-ac69-b508bf003b83,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:7de1eb83-cd9c-45f5-8134-710979e3df0e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 1,FCT|NGT
X-CID-BAS: 1,FCT|NGT,0,_
X-UUID: 9b6c7a66d9cb11ed8687db9d93187ff1-20230413
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <haibo.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1382452350; Thu, 13 Apr 2023 00:20:02 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 13 Apr 2023 15:19:26 +0800
Received: from mszsdtlt102.gcn.mediatek.inc (10.16.4.142) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 13 Apr 2023 15:19:25 +0800
From: Haibo Li <haibo.li@mediatek.com>
To: <amergnat@baylibre.com>
CC: <alexander.sverdlin@nokia.com>, <angelogioacchino.delregno@collabora.com>,
	<haibo.li@mediatek.com>, <linus.walleij@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux@armlinux.org.uk>,
	<matthias.bgg@gmail.com>, <rmk+kernel@armlinux.org.uk>,
	<xiaoming.yu@mediatek.com>
Subject: Re: [PATCH] ARM:unwind:fix unwind abort for uleb128 case
Date: Thu, 13 Apr 2023 15:19:25 +0800
Message-ID: <20230413071925.42858-1-haibo.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <7d567846-a000-1bd2-6e43-7ca170366d76@baylibre.com>
References: <7d567846-a000-1bd2-6e43-7ca170366d76@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_002011_913100_50502A3A 
X-CRM114-Status: GOOD (  21.00  )
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

> On 07/04/2023 05:33, Haibo Li wrote:=0D
> > When unwind instruction is 0xb2,the subsequent instructions are=0D
> > uleb128 bytes.=0D
> > For now,it uses only the first uleb128 byte in code.=0D
> >=0D
> > For vsp increments of 0x204~0x400,use one uleb128 byte like below:=0D
> > 0xc06a00e4 <unwind_test_work>: 0x80b27fac=0D
> >    Compact model index: 0=0D
> >    0xb2 0x7f vsp =3D vsp + 1024=0D
> >    0xac      pop {r4, r5, r6, r7, r8, r14}=0D
> >=0D
> > For vsp increments larger than 0x400,use two uleb128 bytes like below:=
=0D
> > 0xc06a00e4 <unwind_test_work>: @0xc0cc9e0c=0D
> >    Compact model index: 1=0D
> >    0xb2 0x81 0x01 vsp =3D vsp + 1032=0D
> >    0xac      pop {r4, r5, r6, r7, r8, r14}=0D
> > The unwind works well since the decoded uleb128 byte is also 0x81.=0D
> >=0D
> > For vsp increments larger than 0x600,use two uleb128 bytes like below:=
=0D
> > 0xc06a00e4 <unwind_test_work>: @0xc0cc9e0c=0D
> >    Compact model index: 1=0D
> >    0xb2 0x81 0x02 vsp =3D vsp + 1544=0D
> >    0xac      pop {r4, r5, r6, r7, r8, r14}=0D
> > In this case,the decoded uleb128 result is 0x101(vsp=3D0x204+(0x101<<2)=
).=0D
> > While the uleb128 used in code is 0x81(vsp=3D0x204+(0x81<<2)).=0D
> > The unwind aborts at this frame since it gets incorrect vsp.=0D
> >=0D
> > To fix this,add uleb128 decode to cover all the above case.=0D
> >=0D
> > Signed-off-by: Haibo Li <haibo.li@mediatek.com>=0D
> > ---=0D
> >   arch/arm/kernel/unwind.c | 19 +++++++++++++++++--=0D
> >   1 file changed, 17 insertions(+), 2 deletions(-)=0D
> >=0D
> > diff --git a/arch/arm/kernel/unwind.c b/arch/arm/kernel/unwind.c index=
=0D
> > 53be7ea6181b..e5796a5acba1 100644=0D
> > --- a/arch/arm/kernel/unwind.c=0D
> > +++ b/arch/arm/kernel/unwind.c=0D
> > @@ -20,7 +20,6 @@=0D
> >   #warning    Change compiler or disable ARM_UNWIND option.=0D
> >   #endif=0D
> >   #endif /* __CHECKER__ */=0D
> > -=0D
> =0D
> Why delete this line ?=0D
It may be changed by mistake.I will restore it.=0D
> =0D
> >   #include <linux/kernel.h>=0D
> >   #include <linux/init.h>=0D
> >   #include <linux/export.h>=0D
> > @@ -308,6 +307,22 @@ static int=0D
> unwind_exec_pop_subset_r0_to_r3(struct unwind_ctrl_block *ctrl,=0D
> >       return URC_OK;=0D
> >   }=0D
> >=0D
> > +static unsigned long unwind_decode_uleb128(struct unwind_ctrl_block=0D
> > +*ctrl) {=0D
> > +     unsigned long result =3D 0;=0D
> > +     unsigned long insn;=0D
> > +     unsigned long bytes =3D 0;=0D
> =0D
> Alphabetical order please.=0D
get it.=0D
> =0D
> > +=0D
> > +     do {=0D
> > +             insn =3D unwind_get_byte(ctrl);=0D
> > +             result |=3D (insn & 0x7f) << (bytes * 7);=0D
> > +             bytes++;=0D
> > +             if (bytes =3D=3D sizeof(result))=0D
> > +                     break;=0D
> > +     } while (!!(insn & 0x80));=0D
> > +=0D
> > +     return result;=0D
> > +}=0D
> =0D
> Please add a blank line for readability.=0D
OK.=0D
> =0D
> >   /*=0D
> >    * Execute the current unwind instruction.=0D
> >    */=0D
> > @@ -361,7 +376,7 @@ static int unwind_exec_insn(struct=0D
> unwind_ctrl_block *ctrl)=0D
> >               if (ret)=0D
> >                       goto error;=0D
> >       } else if (insn =3D=3D 0xb2) {=0D
> > -             unsigned long uleb128 =3D unwind_get_byte(ctrl);=0D
> > +             unsigned long uleb128 =3D unwind_decode_uleb128(ctrl);=0D
> >=0D
> >               ctrl->vrs[SP] +=3D 0x204 + (uleb128 << 2);=0D
> >       } else {=0D
> =0D
> Great job! I'm aligned with Linus Walleij's feedback about the need of fe=
w=0D
> comments to explain the decode loop, even if your code is clear, light an=
d=0D
> robust.=0D
Thanks for reviewing the patch.I will add the comment in later patch.=0D
> =0D


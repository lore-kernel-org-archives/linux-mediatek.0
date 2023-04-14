Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C35C77B70
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Apr 2023 06:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H9vNvewfpPR814IH1BCiBiPgoYyABnkdJEK5tx2llaM=; b=ItNLnocx4UlNyC6s0W5wyV8cBg
	ZzEzaGKipxicnftI5KYB1xE+8QCz4w/bRgQ6U4ytx7hN89OJlBIWyY378XXponCelxqLkVBP0KFkD
	vetqkKJVaOqB0gXVvF6rxZO8WUydJT6wa/NF4nQo3E0jF2oMnbVt2PWgO0lzBzxIuXH3R3/Ogpqkj
	H31rPuKWERAnNxSMrP+8OjRcGR6mO7R0wUbI2V9sCSzbaMVAcgaSYa79JF7CZn0Mnio9p0fqwUWOF
	g+1BukBnsphIXoymwV2gbuDadJa416Jqlf5DnL5ltsQhHpf5EBYpHGjhyPtt2pAgVOc/edMlpbnjy
	W41Wi7cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnCks-008Ruw-1h;
	Fri, 14 Apr 2023 06:17:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnCko-008Ru9-20;
	Fri, 14 Apr 2023 06:17:53 +0000
X-UUID: 0fbe807eda8c11ed8687db9d93187ff1-20230413
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=H9vNvewfpPR814IH1BCiBiPgoYyABnkdJEK5tx2llaM=;
	b=Kme3YT+NH82Igci+OiepJoYbzUtp1ua/9kFxkSGCWS/DI5o4btG3t/td626U0703znIxGWW4IKX11zCB5Q7tFq4NaAG66MVeujF1U47tN0TwQb04NHND+qp85CkwusRoigfqtNv770gyX3hw9kspPS46LrMWp0i6NhgaawKj7mg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:a8131c6b-ad23-4f3d-b33b-5cafe0a8b057,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:58e84ea1-8fcb-430b-954a-ba3f00fa94a5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 1,FCT|NGT
X-CID-BAS: 1,FCT|NGT,0,_
X-UUID: 0fbe807eda8c11ed8687db9d93187ff1-20230413
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <haibo.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 606753395; Thu, 13 Apr 2023 23:17:41 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 14 Apr 2023 13:57:04 +0800
Received: from mszsdtlt102.gcn.mediatek.inc (10.16.4.142) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 14 Apr 2023 13:57:04 +0800
From: Haibo Li <haibo.li@mediatek.com>
To: <angelogioacchino.delregno@collabora.com>
CC: <a.anurag@samsung.com>, <alexander.sverdlin@nokia.com>,
	<amergnat@baylibre.com>, <ardb@kernel.org>, <catalin.marinas@arm.com>,
	<haibo.li@mediatek.com>, <linus.walleij@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux@armlinux.org.uk>,
	<matthias.bgg@gmail.com>, <rmk+kernel@armlinux.org.uk>,
	<xiaoming.yu@mediatek.com>
Subject: Re: [PATCH v2] ARM:unwind:fix unwind abort for uleb128 case
Date: Fri, 14 Apr 2023 13:57:04 +0800
Message-ID: <20230414055704.123841-1-haibo.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <22bb4f8f-8f4b-6efb-74ab-b33eabc1fbb9@collabora.com>
References: <22bb4f8f-8f4b-6efb-74ab-b33eabc1fbb9@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_231751_494149_0E22F8C9 
X-CRM114-Status: GOOD (  21.73  )
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

> Il 13/04/23 09:34, Haibo Li ha scritto:=0D
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
> > v2:=0D
> > - As Linus Walleij and Alexandre Mergnat suggested,add comments for=0D
> > unwind_decode_uleb128=0D
> > - As Alexandre Mergnat suggested,change variables declaration in=0D
> > Alphabetical order=0D
> > ---=0D
> >   arch/arm/kernel/unwind.c | 25 ++++++++++++++++++++++++-=0D
> >   1 file changed, 24 insertions(+), 1 deletion(-)=0D
> >=0D
> > diff --git a/arch/arm/kernel/unwind.c b/arch/arm/kernel/unwind.c index=
=0D
> > 53be7ea6181b..f37e55fcf81d 100644=0D
> > --- a/arch/arm/kernel/unwind.c=0D
> > +++ b/arch/arm/kernel/unwind.c=0D
> > @@ -308,6 +308,29 @@ static int=0D
> unwind_exec_pop_subset_r0_to_r3(struct unwind_ctrl_block *ctrl,=0D
> >       return URC_OK;=0D
> >   }=0D
> >=0D
> > +static unsigned long unwind_decode_uleb128(struct unwind_ctrl_block=0D
> > +*ctrl) {=0D
> > +     unsigned long bytes =3D 0;=0D
> > +     unsigned long insn;=0D
> > +     unsigned long result =3D 0;=0D
> > +=0D
> > +     /* unwind_get_byte() will advance ctrl one instruction at a time,=
=0D
> > +      * we loop until we get an instruction byte where bit 7 is not se=
t.=0D
> > +      * Note:It decodes max 4 bytes to output 28bits data.=0D
> > +      * 28bits data(0xfffffff) covers vsp increments of 1073742336.=0D
> > +      * It is sufficent for unwinding stack.=0D
> > +      */=0D
> =0D
> /*=0D
>   * unwind_get_byte() will advance `ctrl` one instruction at a time, so=0D
>   * loop until we get an instruction byte where bit 7 is not set.=0D
>   *=0D
>   * Note: This decodes a maximum of 4 bytes to output 28 bits data where=
=0D
>   * max is 0xfffffff: that will cover a vsp increment of 1073742336, henc=
e=0D
>   * it is sufficient for unwinding the stack.=0D
>   */=0D
Looks much better.Thanks.=0D
> =0D
> > +     do {=0D
> > +             insn =3D unwind_get_byte(ctrl);=0D
> > +             result |=3D (insn & 0x7f) << (bytes * 7);=0D
> > +             bytes++;=0D
> =0D
> also, I would do ...=0D
> =0D
>         } while (!!(insn & 0x80) && bytes !=3D sizeof(result));=0D
> =0D
> ...compressing the code and not creating any human readability concern.=0D
> =0D
> after which, you can get my=0D
> =0D
> Reviewed-by: AngeloGioacchino Del Regno=0D
> <angelogioacchino.delregno@collabora.com>=0D
get it.I will make a new patch.=0D


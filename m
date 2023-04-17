Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751B8C77B72
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Apr 2023 09:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NKCkdEg5aJ3JRFS1sh5Igra4N928b73FCh4yQqzNjv4=; b=ExOufe8ayovekk49wEICy0TT+H
	ijLfZ3fEyztu+55yIgV6qt76odtr79D7jvFrsGpGDEgaAh1O3LQjK8YfPQkE42wIv9BrVmU22XowQ
	aec21jCuwPdtRLd+NZGslCFOa4Ex01DEr1mH05TLnpoXbEc9e5PLKlIDARS6gDy9iOPydqb+dS6un
	eOgv9wyQSZTTy/UdwqC4X34aUQANNVzy0Y794flkIRr4VVtPtcLO1PqDLzNRQwt5FJkZO2fCUgFB6
	kcYqJWltoQ3kgxKWex1gYwamABZZ46I2ii3UA3Y/Awsyggk5WzIpP62kTBiVw9ZFZsQ5lj9cphTFx
	Pbq6CpgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poLRl-00FceN-2L;
	Mon, 17 Apr 2023 09:46:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poLRg-00Fccl-0A;
	Mon, 17 Apr 2023 09:46:51 +0000
X-UUID: c16bd996dd0411edb7d8d11f642b8e78-20230417
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=NKCkdEg5aJ3JRFS1sh5Igra4N928b73FCh4yQqzNjv4=;
	b=jtfTwGqREXCUrVwa22WUWAw6bMPxl8f++eVgFFmbJ64h/w8eqoupY/MrIBUSezYDoVAJQgZawPVDh4iXW8Me2fI0zyxBda9yJfulWbLvQliwGFi3nGTX4Wu1iBJWyANYSSAA+kQl7mLaa/SXCdjPEiRU9TIgVnnQKhS8IM4qQTg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:4b7ca3a5-34b0-4cf2-8b9a-ce0cbb33572f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:b99996a1-8fcb-430b-954a-ba3f00fa94a5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 1,FCT|NGT
X-CID-BAS: 1,FCT|NGT,0,_
X-UUID: c16bd996dd0411edb7d8d11f642b8e78-20230417
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <haibo.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1255314862; Mon, 17 Apr 2023 02:46:41 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Mon, 17 Apr 2023 17:46:38 +0800
Received: from mszsdtlt102.gcn.mediatek.inc (10.16.4.142) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 17 Apr 2023 17:46:38 +0800
From: Haibo Li <haibo.li@mediatek.com>
To: <linus.walleij@linaro.org>
CC: <a.anurag@samsung.com>, <alexander.sverdlin@nokia.com>,
	<amergnat@baylibre.com>, <angelogioacchino.delregno@collabora.com>,
	<ardb@kernel.org>, <catalin.marinas@arm.com>, <haibo.li@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux@armlinux.org.uk>,
	<matthias.bgg@gmail.com>, <rmk+kernel@armlinux.org.uk>,
	<xiaoming.yu@mediatek.com>
Subject: Re: [PATCH v3] ARM:unwind:fix unwind abort for uleb128 case
Date: Mon, 17 Apr 2023 17:46:38 +0800
Message-ID: <20230417094638.153213-1-haibo.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CACRpkdZf0vQL9bJtGaKfn0wBPTQTZWsg0G7UTB1dmXhfi_2KmA@mail.gmail.com>
References: <CACRpkdZf0vQL9bJtGaKfn0wBPTQTZWsg0G7UTB1dmXhfi_2KmA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_024648_107179_98264C01 
X-CRM114-Status: GOOD (  12.76  )
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

> On Fri, Apr 14, 2023 at 8:10 AM Haibo Li <haibo.li@mediatek.com> wrote:=0D
> =0D
> > When unwind instruction is 0xb2,the subsequent instructions are=0D
> > uleb128 bytes.=0D
> > For now,it uses only the first uleb128 byte in code.=0D
> >=0D
> > For vsp increments of 0x204~0x400,use one uleb128 byte like below:=0D
> > 0xc06a00e4 <unwind_test_work>: 0x80b27fac=0D
> >   Compact model index: 0=0D
> >   0xb2 0x7f vsp =3D vsp + 1024=0D
> >   0xac      pop {r4, r5, r6, r7, r8, r14}=0D
> >=0D
> > For vsp increments larger than 0x400,use two uleb128 bytes like below:=
=0D
> > 0xc06a00e4 <unwind_test_work>: @0xc0cc9e0c=0D
> >   Compact model index: 1=0D
> >   0xb2 0x81 0x01 vsp =3D vsp + 1032=0D
> >   0xac      pop {r4, r5, r6, r7, r8, r14}=0D
> > The unwind works well since the decoded uleb128 byte is also 0x81.=0D
> >=0D
> > For vsp increments larger than 0x600,use two uleb128 bytes like below:=
=0D
> > 0xc06a00e4 <unwind_test_work>: @0xc0cc9e0c=0D
> >   Compact model index: 1=0D
> >   0xb2 0x81 0x02 vsp =3D vsp + 1544=0D
> >   0xac      pop {r4, r5, r6, r7, r8, r14}=0D
> > In this case,the decoded uleb128 result is 0x101(vsp=3D0x204+(0x101<<2)=
).=0D
> > While the uleb128 used in code is 0x81(vsp=3D0x204+(0x81<<2)).=0D
> > The unwind aborts at this frame since it gets incorrect vsp.=0D
> >=0D
> > To fix this,add uleb128 decode to cover all the above case.=0D
> >=0D
> > Signed-off-by: Haibo Li <haibo.li@mediatek.com>=0D
> =0D
> Way to go, remember to collect all the Reviewed-by tags before you put th=
e=0D
> patch into Russell's patch tracker.=0D
> =0D
> Yours,=0D
> Linus Walleij=0D
Thanks for reminding.I put the patch into Russell's patch tracker just now,=
=0D
together with the three Reviewed-by tags from you,=0D
Alexandre Mergnat and AngeloGioacchino Del Regno.=0D
Thank you all.=0D
=0D


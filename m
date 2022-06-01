Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96C0CCA468
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 14:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ImIyOq5ZvIvJ/zjKA6viEGbH0hiKDi6ZTtPI5EcQ9g=; b=EeOZ4yCMu5LM7J
	BtSnVg/x9Et5o3g/TuuA4Cka08HTx2Ohmi1k26z4rZyeJ6D2dm9qj7OlNMJzVAxVmpiuqMwSzd8dW
	7KHJaqql8bUOkMcwJp/WiVV4vGsx2mJWx1RRdyGZPiBjudGfJKkoTrEs/FZPoSdXvCq0sDjuKTyNh
	telTRbCWUhAM9boZP3xtH40bgqcaL9ghg0jDXsgQzir7c4motWAb4YRjhKnLgWcwADUMIwFhTZtXH
	7/3YJYIKQbDM5qzrqlHSjyL1w/F8nP/PJRSRDc1h4KhsGuM8RgyVm3aUCtbwlWb5vR+j+vfXNlhQp
	ngf/S1kAS1YBbjNkM3kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwP6y-00GZdQ-Ar; Wed, 01 Jun 2022 14:14:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwOrx-00GRni-6l; Wed, 01 Jun 2022 13:58:44 +0000
X-UUID: 729ed01ba3704ab38d3d2335c507d2c5-20220601
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:47a86ecc-9185-4b70-80b2-3e64172056ea,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:cebb780d-3a0d-4bbe-9d72-0e5d26d57423,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: 729ed01ba3704ab38d3d2335c507d2c5-20220601
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
	(envelope-from <qun-wei.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 668013730; Wed, 01 Jun 2022 06:58:31 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jun 2022 06:58:30 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 1 Jun 2022 21:58:28 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 1 Jun 2022 21:58:28 +0800
Message-ID: <96fdee041ed8ec7d0414fa989c50bf9082005f9b.camel@mediatek.com>
Subject: Re: [PATCH] scripts: dtc: fix a false alarm for
 node_name_chars_strict
From: qun-wei.lin <qun-wei.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>
CC: Frank Rowand <frowand.list@gmail.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	<casper.li@mediatek.com>, <chinwen.chang@mediatek.com>,
	<kuan-ying.lee@mediatek.com>
Date: Wed, 1 Jun 2022 21:58:28 +0800
In-Reply-To: <CAL_JsqJnir+qA1Cgm5ATzsAH-pMqQSychLG=JQyUQg02dYb8TQ@mail.gmail.com>
References: <20220531053358.19003-1-qun-wei.lin@mediatek.com>
	 <CAL_JsqJnir+qA1Cgm5ATzsAH-pMqQSychLG=JQyUQg02dYb8TQ@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_065841_321051_9F3055F1 
X-CRM114-Status: GOOD (  23.75  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2022-05-31 at 08:06 -0500, Rob Herring wrote:
> On Tue, May 31, 2022 at 12:34 AM Qun-Wei Lin <
> qun-wei.lin@mediatek.com> wrote:
> > 
> > The function check_node_name_chars_strict issues a false alarm when
> > compiling an overlay dts.
> > 
> > /fragment@0/__overlay__: Character '_' not recommended in node name
> > 
> > This workaround will fix it by skip checking for node named
> > __overlay__.
> > 
> > Signed-off-by: Qun-Wei Lin <qun-wei.lin@mediatek.com>
> > ---
> >  scripts/dtc/checks.c | 5 +++++
> 
> We don't take patches for dtc. You must send them to upstream dtc and
> then it will be sync'ed to the kernel tree.

Ok, I'll send this patch to the correct upstream.

> 
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/scripts/dtc/checks.c b/scripts/dtc/checks.c
> > index 781ba1129a8e..6ef4f2cd67b9 100644
> > --- a/scripts/dtc/checks.c
> > +++ b/scripts/dtc/checks.c
> > @@ -325,6 +325,11 @@ static void
> > check_node_name_chars_strict(struct check *c, struct dt_info *dti,
> >  {
> >         int n = strspn(node->name, c->data);
> > 
> > +       if (streq(node->name, "__overlay__")) {
> > +               /* HACK: Overlay fragments are a special case */
> 
> Not a hack IMO.
> 
> However, this should be checking for any node name starting with
> '__'.

Did you mean it needs to skip the check for all nodes whose names start
with "_", such as __overlay__, __fixup__, __local_fixup__, and
__symbols__?

> 
> Also, doesn't 'fragment@0' cause a warning about missing 'reg'?

No, it doesn't.
Actually, the check_unit_address_vs_reg function suppress the common
warnings about the fragment names [1].

[1] 
https://github.com/dgibson/dtc/commit/afbddcd418fbf70467419b91f73cce972482449c


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

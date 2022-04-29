Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC89C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 09:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wE4lTIdgRIIJXnZ0MU9D+yduVrjIC1aujw57LnaG568=; b=LKDs7S4wf3u8J0
	Wa0kTpIkio+Jb2/FrZoWD/4/AzySKjMMVs9qsdcxHzun8ITcpvJ58ANJ0R6TotQdVH55mXkzV/e83
	gcmbXa0BH2vKrSLnTtiokO7m9EbNJAF+1pCVJHDnz1byF1t0Lt9leuyePXt8tPveorahUGiYvQR1B
	0vgC6rlkVKsNIG6SlU6QCFNNBYuwitorJjo6h6VjK+KdMkviWGP13CsrvdvsWWw1extXR6zD2fpqY
	uMdvHaOoY+4bj86uMbp44mX1xRWihjCQ87/Wu+a7UFaBfcEjlS6+BXPlUDVpD7khxVxsRCp7QFg1S
	j6O/afKBQxI0GYrn1QjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkMqY-00AMEO-0M; Fri, 29 Apr 2022 09:23:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkMqT-00AMDw-Ro; Fri, 29 Apr 2022 09:23:27 +0000
X-UUID: c0c6076b5eee488783068a683684a55d-20220429
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ty197XgIzvjg1s4/54JcQBZBHfQwCvbbrdgKAqRskgI=; 
 b=LJMA3hMWcg9vVTSHAlBXh9lzohoPt+HW3+g0IbIVHD/OF5uhTg/KVUBFdPJlw3EQsYgKnDiMi6mdvyWDsZnFWgl2Gf6iXb+6jUQru0GP7J1vpdZhdkFqyp3d5jUl+/bqO9kSvv1+TVhE+ulXVQaUXPCkodnxXtk94W235hpUGpM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:9bbdfd3f-1cc6-4170-9c22-68e259ffb189, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:2
X-CID-META: VersionHash:faefae9, CLOUDID:b4b0f4c6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:4,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: c0c6076b5eee488783068a683684a55d-20220429
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1138476784; Fri, 29 Apr 2022 02:23:20 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Apr 2022 02:15:24 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 29 Apr 2022 17:15:23 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 29 Apr 2022 17:15:22 +0800
Message-ID: <b90426905a486ab720b9d67f00ed869285acd768.camel@mediatek.com>
Subject: Re: [v4 00/18] ASoC: mediatek: Add support for MT8186 SoC
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <aaronyu@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, Trevor Wu
 <trevor.wu@mediatek.com>, Tzung-Bi Shih <tzungbi@google.com>, Julian Braha
 <julianbraha@gmail.com>, ALSA Development Mailing List
 <alsa-devel@alsa-project.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS" <devicetree@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 29 Apr 2022 17:15:22 +0800
In-Reply-To: <CAMuHMdWYJofetMwkAH4d8UzKZH77hxwRhXrMhaECOs1suQV2PA@mail.gmail.com>
References: <20220428093355.16172-1-jiaxin.yu@mediatek.com>
 <CAMuHMdWYJofetMwkAH4d8UzKZH77hxwRhXrMhaECOs1suQV2PA@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_022325_946359_CB1B5038 
X-CRM114-Status: GOOD (  18.50  )
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

On Fri, 2022-04-29 at 10:47 +0200, Geert Uytterhoeven wrote:
> Hi Jiaxin,
> 
> Gmail tends to mark your patches as spam.
> Can you please make sure to use "PATCH" in the subject line, e.g.
> "[PATCH v4 00/18] ASoC: mediatek: Add support for MT8186 SoC"?
> 
> Thanks!
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- 
> geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a
> hacker. But
> when I'm talking to journalists I just say "programmer" or something
> like that.
>                                 -- Linus Torvalds

Hi Geert,

Sorry for this mistake, I usually use "git format-patch --subject-
prefix "v4" --cover-letter -x" to generate a series of patches.
So it automatically removes "PATCH". I will correct the cmd to "git
format-patch --subject-prefix "PATCH v4" --cover-letter -x".

Thanks,
Jiaxin.Yu
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

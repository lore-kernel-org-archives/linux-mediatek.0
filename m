Return-Path: <SRS0=ht0X=4O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 667FFC4BA0A
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 04:30:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36EB7222C2
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 04:30:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CRygUuxJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Lo2+1eyl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36EB7222C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CLQep9nd198oMhOUghCCWQpb32tDfmQigjfoiP+Bvio=; b=CRygUuxJPizDmv
	qA810h+Bk4O9jex2goYYcQ1JTflGYrVQJURGRaEe5hLncHHzPi1Q9IGRHZM454q/nBwFqSOeCGezU
	u1OLrbd6jjuXac82mGAZ+khZzfwrYB1BWfaVLyE8QDqDciliDdVlsKbZx81m0cXborrimdq28iFS5
	MfQ2pviPAEjBDbGMNxcVPytWwPFEnTJW0YDmRynFo9vXpGW1OtjPppCDeOeod0WCD5zGotPf9BzTo
	02RxOSUb/JmRao/chE1NQRSp/ir1NrExd69hyBRuuDiZFlKna0xHvzSIBtFML1KtyH43AU3kqEVX6
	6an0NCO2Y79nVRs94X8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6oKv-0006HO-1K; Wed, 26 Feb 2020 04:30:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6oKl-0005To-2W; Wed, 26 Feb 2020 04:30:08 +0000
X-UUID: 0a1696a4ec4d44bf85937197e1a9da4a-20200225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=u2ArnXEG5GlsbquUkMe3Hv7WnxknMQJct50ufoK4Bzk=; 
 b=Lo2+1eylDq2+pgmwCV6acv0L/hF84cc5Bj1QcuG1QEhzNM/f4lFX6OECkjEQlSdfr9Kx3iR9V/bwxAjEJ1ciMsIMlsqY9DyQyI9Mu9VPvIdFmiVvZRmFS7/2ESoSNN5JP4DUWBDXZRfE/jTeeguXDnNiAGLYjNEujMBD5Xbnx/4=;
X-UUID: 0a1696a4ec4d44bf85937197e1a9da4a-20200225
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <gtk_ruiwang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 275391949; Tue, 25 Feb 2020 20:30:02 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 25 Feb 2020 20:19:57 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Wed, 26 Feb 2020 12:18:38 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 26 Feb 2020 12:18:31 +0800
Message-ID: <1582690790.6276.19.camel@mhfsdcap03>
Subject: Re: [PATCH] mediatek: move MT8173 VPU FW to subfolder
From: gtk_ruiwang <gtk_ruiwang@mediatek.com>
To: Alexandre Courbot <acourbot@chromium.org>
Date: Wed, 26 Feb 2020 12:19:50 +0800
In-Reply-To: <CAPBb6MWN6bXfYvpBJ6XyPCuvJSpdxNOf4Z9RbY0jbnB5=JX_sQ@mail.gmail.com>
References: <20200226033646.20949-1-gtk_ruiwang@mediatek.com>
 <20200226033646.20949-2-gtk_ruiwang@mediatek.com>
 <CAPBb6MWN6bXfYvpBJ6XyPCuvJSpdxNOf4Z9RbY0jbnB5=JX_sQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D348BF505CE6650B3B5516AF264460E956BF2F030360665364A932DB0EF629EA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_203007_147438_277C61C4 
X-CRM114-Status: GOOD (  12.84  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Maoguang Meng <maoguang.meng@mediatek.com>, srv_heupstream@mediatek.com,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-firmware@kernel.org, Tomasz Figa <tfiga@chromium.org>,
 "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, PoChun.Lin@mediatek.com,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Dear Alex,

Do you mean to create two symbolic link?

lrwxrwxrwx  1 gtk_ruiwang gtk_ruiwang      25 Feb 26 11:52 vpu_d.bin ->
mediatek/mt8173/vpu_d.bin
lrwxrwxrwx  1 gtk_ruiwang gtk_ruiwang      25 Feb 26 11:52 vpu_p.bin ->
mediatek/mt8173/vpu_p.bin

we create them at the linux-firmware root folder.

Thanks
Best Regards

On Wed, 2020-02-26 at 12:41 +0900, Alexandre Courbot wrote:
> On Wed, Feb 26, 2020 at 12:38 PM <gtk_ruiwang@mediatek.com> wrote:
> >
> > From: gtk_ruiwang <gtk_ruiwang@mediatek.com>
> >
> > Currently vpu_d.bin and vpu_p.bin are at the root of
> > linux-firmware git tree, it's not appropriate so we move
> > them to subfolder mediatek/mt8173
> >
> > Release Version: 1.1.4
> >
> > Signed-off-by: Rui Wang <gtk_ruiwang@mediatek.com>
> > ---
> >  vpu_d.bin => mediatek/mt8173/vpu_d.bin | Bin
> >  vpu_p.bin => mediatek/mt8173/vpu_p.bin | Bin
> >  2 files changed, 0 insertions(+), 0 deletions(-)
> >  rename vpu_d.bin => mediatek/mt8173/vpu_d.bin (100%)
> >  rename vpu_p.bin => mediatek/mt8173/vpu_p.bin (100%)
> 
> This is nice as it removes some stuff from the root, but for
> compatibility with older kernels that don't know about the new path
> shouldn't we at least temporarily create a symbolic link between the
> old location and the new one?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

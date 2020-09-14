Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFDB4C43461
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 14:01:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9291820E65
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 14:01:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e/98VTNW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TU+t16F+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9291820E65
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6dv6yLZBcAX//De6Djn9BuQMc39bTrgwJiGi1RzX5tg=; b=e/98VTNWmSj9lVCTxQ7TPcZwW
	McWAD9fqPTRbSIiJp9fDryeBqmWLQJkoxLz0aO9pLCKfcdbuC4+PY2kZPJ0uI/7cUOGj86OF4eZ8u
	5DCZxF3zVrUd3QNE1v/tLfGrNvnSUZyh1wNMf5ywjphu27uy26Iq1NTfOoixo/g3+UY33mNuDNJbk
	0YVTJwOwjLyaEXb7LUEkkxCxOxS8mZxQnx6iJct2TjssNJfiWg/BYh/lJExWzm30K5szmZYBUkcHS
	pWY0PZHJWzX9DcacwWodnDGpGcyKXzzenfvKmTaetG08tPmUbkgrFC8VL4LdWCbeSnDlx3mEBdrGe
	ozizby0RA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHp2p-0003TV-F7; Mon, 14 Sep 2020 14:01:23 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHp2k-0003RE-P5
 for linux-mediatek@lists.infradead.org; Mon, 14 Sep 2020 14:01:22 +0000
Received: by mail-ej1-x643.google.com with SMTP id u21so143608eja.2
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Sep 2020 07:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=FsmZe5O0P/p3M0FxJ0XsG6dr4tN+XjGndrSeePOYVLQ=;
 b=TU+t16F+AZpDvpM6tmEpVlIOQPLAhoPE1cquCeN5k8AOwilOAwh3hRbANn1iX9S8tM
 Zr96G9ieyipocyYfh4C10UpY7mn2twBpkUzfb3GJBn0hkUioI4ehJW/UsMzMpNlBie4U
 +QK+3EOt+8mrpiLz+Dq+Di/QQnudOfmmTypvB06YKcRo8d60/5t/I1oPHkmHShQAXlXk
 z77Ql1eP1gt6V8/1VMigv8oxGZ9gnsoDRzPxevOxyJ3whaW332oGogVqJQKG6RyKw1Ae
 K0cCOtYC4oBurdA6d/AJlZ6F5+V8SkrcyP1wUH+knQFDyg3L6Vd8u1V9um0hlROtbCsi
 gYoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=FsmZe5O0P/p3M0FxJ0XsG6dr4tN+XjGndrSeePOYVLQ=;
 b=pCd0QGtxpvZfZWyi8FeU8Y+iPT5OSrViBknPFQGJDk+Rkvjpca3dNbVsXut4g6F6T/
 J0/aLfpECngAJUW3dwkCm0YdkxKJhTnVj+MaZaz2Cku2V7zaFgHGOfYtrrDxrrRIXErD
 EfkSjc2KdebowFaAa49OWdeth1TfF8FKHjKX/xRtFccDin3TzXcaYs9xGZ8VltdRMUIH
 iGqKSqSxpx9KpshjHwyPphlM5NjG8lu1PojE159s9GtrUk1CwDU69u1Q3PpddR+2h+XJ
 9DsByOxVuJTH9x+3lhub3Mem56bROD1Z9Hb/AosjnudY/d4zDb60KPMwEMiDqaIJLkzS
 xoag==
X-Gm-Message-State: AOAM5333XY/kEiMuOrk1P0Jh/RIrqUW4VZB4hXwwGfXJ1aA9iNNQ2hqf
 WRdhiHsmdxqK0Li8/elN7D0=
X-Google-Smtp-Source: ABdhPJy2UBdvzRal8bOeleN4BdmvWhzHCaeHXvF9L0vChKKrvPzgf77fC/MD+0rqVWQT2arqF3Ol0A==
X-Received: by 2002:a17:906:6b0b:: with SMTP id
 q11mr15310063ejr.412.1600092077249; 
 Mon, 14 Sep 2020 07:01:17 -0700 (PDT)
Received: from felia ([2001:16b8:2ddc:3000:7936:d9d0:986e:cca5])
 by smtp.gmail.com with ESMTPSA id t4sm7770493ejj.6.2020.09.14.07.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 07:01:16 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 14 Sep 2020 16:01:15 +0200 (CEST)
X-X-Sender: lukas@felia
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: make linux-mediatek list remarks consistent
In-Reply-To: <9c5aaa15-bdd8-ae4f-0642-092566ab08ba@gmail.com>
Message-ID: <alpine.DEB.2.21.2009141552570.17999@felia>
References: <20200914053110.23286-1-lukas.bulwahn@gmail.com>
 <f6bc41d3-5ce4-b9ea-e2bb-e0cee4de3179@gmail.com>
 <alpine.DEB.2.21.2009141208200.17999@felia>
 <9c5aaa15-bdd8-ae4f-0642-092566ab08ba@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_100118_833320_03ADBA9D 
X-CRM114-Status: GOOD (  31.16  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, linux-kernel@vger.kernel.org,
 Joe Perches <joe@perches.com>, linux-mediatek@lists.infradead.org,
 Bjorn Helgaas <bhelgaas@google.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Pia Eichinger <pia.eichinger@st.oth-regensburg.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On Mon, 14 Sep 2020, Matthias Brugger wrote:

> 
> 
> On 14/09/2020 12:20, Lukas Bulwahn wrote:
> > 
> > 
> > On Mon, 14 Sep 2020, Matthias Brugger wrote:
> > 
> > > 
> > > 
> > > On 14/09/2020 07:31, Lukas Bulwahn wrote:
> > > > Commit 637cfacae96f ("PCI: mediatek: Add MediaTek PCIe host controller
> > > > support") does not mention that linux-mediatek@lists.infradead.org is
> > > > moderated for non-subscribers, but the other eight entries for
> > > > linux-mediatek@lists.infradead.org do.
> > > > 
> > > > Adjust this entry to be consistent with all others.
> > > > 
> > > > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > > 
> > > Maybe rephrase the commit message to something like:
> > > "Mark linux-mediatek@lists.infraded.org as moderated for the MediaTek PCIe
> > > host controller entry, as the list actually is moderated."
> > > 
> > > Anyway:
> > > Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> > > 
> > > > ---
> > > > applies cleanly on v5.9-rc5 and next-20200911
> > > > 
> > > > Ryder, please ack.
> > > > 
> > > > Bjorn, Matthias, please pick this minor non-urgent clean-up patch.
> > > > 
> > > > This patch submission will also show me if linux-mediatek is moderated
> > > > or
> > > > not. I have not subscribed to linux-mediatek and if it shows up quickly
> > > > in
> > > > the archive, the list is probably not moderated; and if it takes longer,
> > > > it
> > > > is moderated, and hence, validating the patch.
> > > 
> > > I can affirm the list is moderated :)
> > > 
> > 
> > Hmm, do we mean the same "moderation" here?
> > 
> > I believe a mailing list with the remark "moderated for non-subscribers"
> > means that a mail from an address that has not subscribed to the mailing
> > list is put on hold and needs to be manually permitted to be seen on the
> > mailing list.
> > 
> > Matthias, is that also your understanding of "moderated for
> > non-subscribers" for your Reviewed-by tag?
> 
> Yes.
>

Okay, then I guess my patch is actually VALID and can be applied.

> > 
> > I am not subscribed to linux-mediatek. When I sent an email to the list,
> > it showed up really seconds later in the lore.kernel.org of the
> > linux-mediatek public-inbox repository. So, either it was delivered
> > quickly as it is not moderated or my check with lore.kernel.org is wrong,
> > e.g., mails show up in the lore.kernel.org archive, even they were not
> > yet permitted on the actual list.
> > 
> 
> I'm the moderator and I get requests to moderate emails. I suppose I added you
> to the accepted list because of earlier emails you send.
>

Okay, I see. I did send some clean-up patch in the past, but I completely 
forgot that, but my mailbox did not forget. So, now it is clear to me why 
that mail showed up so quickly.

Thanks for the explanation.

Bjorn, with that confirmation and Reviewed-by from Matthias, could you 
please pick this patch?

Lukas

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

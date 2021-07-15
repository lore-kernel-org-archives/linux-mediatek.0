Return-Path: <SRS0=ob7z=MH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4171C07E96
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 05:24:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B76C360FE7
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 05:24:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B76C360FE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U5f6v7M7T+Xf6QWrNjENlloDydi2vUc7+h0i6mXp4VA=; b=BEmHijqut7/o/1
	bl4GjNkl33r27rEkAwSMUc3xQP2BJ/4FIcMnJ0B641Ymt+qSxD4AoPsWzHO6Pn4puyLRgcKOtJK36
	cOU43TT/YN0WHCgh0HScC5iwTeXhJxvbxDF4s7/YJ/+vjDCBsytR8Mmf8Nh9qsmESt9MuqKfATpLU
	5FAUIPeBI+6ffMD7U70zUMlQYjFFD4dtfQk8usQpA5P7Yw5Re9ECxa3AXO9D3aUg8mmN8n5T3tqYV
	wdqjU0ZlJQ6gfwdFC17VHmzyq2j6peBPDxLhONmhcz1eE/YZnn+TBCMvebX1M/YJ+si4VwrBddKrQ
	nA4YkOdNpA9iXasl2YiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3tr0-00HAqY-6a; Thu, 15 Jul 2021 05:24:10 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3tqp-00HAom-0z
 for linux-mediatek@lists.infradead.org; Thu, 15 Jul 2021 05:24:00 +0000
Received: by mail-lf1-x12e.google.com with SMTP id i5so7696128lfe.2
 for <linux-mediatek@lists.infradead.org>; Wed, 14 Jul 2021 22:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7gHi8C85J19Z/buybEtbR7DxC+/60ag6de4D5gu0A4s=;
 b=TfwneCGKNPpYSyMgTbwLjXIVq/VuCm7QkyuoeUAOKk34NKwSLSvfuumyE2Tn5vcnhf
 Tq1R1u4BlNAy4HcyQLVmse3G5iI9aKNHs5YBXdVGpV4jZggqG9W4piFHQgJwvptXZXSM
 A2bCx760it7lS+DmEQzq5Z1TBJaNGZgDHKdqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7gHi8C85J19Z/buybEtbR7DxC+/60ag6de4D5gu0A4s=;
 b=OWEBllGvclD4hY3MRXIK0x33I/J3e9AYIdZo2acuVRYipMkkJcaEtSH3vbBeIRmyYT
 pwueUZKeGXTkWmL0NSGKzqnNG8fZb7BawGrtr3VWgkFHNYuxdwb/sIoahOFkJJBMYm0Y
 jwFEVmzmluLxu6KtKi2osMR3AWKckejKyCHhuL4wTgq7LXsGF3ovZDAAEicrExVloqjT
 UJRDRl3YYfRLqYgLPab6SOQzfSZ65kGrIFr5/8TompkhPeo7ws8qVjXDpY2xWXUyD277
 y02tncgyvyMnVw00cs20fH3Qr/DfInVCs7JhqDqNuNV4cSf2HvmEcxN8BDuEvto6YvCA
 tabQ==
X-Gm-Message-State: AOAM532Pg+bVPCfMaF+RcSbL6YhilMPJjGhREvGlGo96u1o7L1sdbQIw
 zSX3uTrOJakzBWImEZwcKcX8R2KAPJGd9SiQTXGCiA==
X-Google-Smtp-Source: ABdhPJxyzZdXZbHnyDFU0e2E2xXXk9NuHsijUMcorMgs2GSg8C6hPxXb3FRaE5BAUxs943DBYUCs6RGDAffpPPVO4Cc=
X-Received: by 2002:ac2:53a3:: with SMTP id j3mr1809482lfh.479.1626326635394; 
 Wed, 14 Jul 2021 22:23:55 -0700 (PDT)
MIME-Version: 1.0
References: <1626316157-24935-1-git-send-email-kewei.xu@mediatek.com>
 <1626316157-24935-4-git-send-email-kewei.xu@mediatek.com>
In-Reply-To: <1626316157-24935-4-git-send-email-kewei.xu@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 15 Jul 2021 13:23:44 +0800
Message-ID: <CAGXv+5EOkBvxyigPF8vgnYXfF5Qz472aonPzB-Yw0n=XQU+03g@mail.gmail.com>
Subject: Re: [PATCH 3/8] i2c: mediatek: fixing the incorrect register offset
To: Kewei Xu <kewei.xu@mediatek.com>
Cc: wsa@the-dreams.de, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
 linux-mediatek@lists.infradead.org, 
 srv_heupstream <srv_heupstream@mediatek.com>, leilk.liu@mediatek.com,
 qii.wang@mediatek.com, 
 qiangming.xia@mediatek.com, ot_daolong.zhu@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_222359_099612_293D91C0 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
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

Hi,

On Thu, Jul 15, 2021 at 10:31 AM Kewei Xu <kewei.xu@mediatek.com> wrote:
>
> The reason for the modification here is that the previous
> offset information is incorrect, OFFSET_DEBUGSTAT = 0xE4 is
> the correct value.
>
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>

This needs a fixes tag:

Fixes: 25708278f810 ("i2c: mediatek: Add i2c support for MediaTek MT8183")

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

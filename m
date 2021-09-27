Return-Path: <SRS0=95qJ=OR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA15C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Sep 2021 17:32:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 797EE60F46
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Sep 2021 17:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 797EE60F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aBckoRNTba4QabcBPuIEB9FEqfsZw9xs4k07uQj8BSM=; b=uaEvnOPo2YbA4J
	ysL7mlaIEx8fbF6XLYoSF6w6iaP1FWZRyfFN08ujZOpgLX59BQiTj2v702QFRIYvRJ1nXMHyBMjOJ
	Nc3LTsE8fXjL76CYfDdoMjtdG8B9HGk01R7ZDUvVs7EKswmjH7l007c0zBWBz4oe5fjIiNFgYLMPi
	+PWySX3nznLagRBAsGjSqut4v+ZMQADSJOfbfdYM2R7Gl4XCC7zkgfD8AZ7aX1mmuOzHngxQkzww2
	IxNYcLsmcYtBi/3rS9VJUPj3YFXUhN9GewkvaB80NVUyeEYLpTM+XHer3enuIFRMy+nFMgA9DnOXr
	IUxkIH1fBkdzG/FkWrFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUuTu-003cMw-SX; Mon, 27 Sep 2021 17:31:58 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUuTr-003cL4-S9
 for linux-mediatek@lists.infradead.org; Mon, 27 Sep 2021 17:31:57 +0000
Received: by mail-qt1-x830.google.com with SMTP id l13so17407001qtv.3
 for <linux-mediatek@lists.infradead.org>; Mon, 27 Sep 2021 10:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q25abHd9wgNegk3LUcOidVwBOafJNu1U9ST62KJXKh8=;
 b=Ny6AIsS9MNvI6ERmgppnjGwYp+CeoJRk0IArqfNnE6eticiIdzNtufGZQts0fxRfaa
 2La6isn8ClLdLGvpKcRN7Ws+5DbB2alushQpd5Mgdc9x0R4XjR8obr6bX67RKTuetBaA
 VnxeAY+0ch/n5c2/oqU2Ri+Wkk5YXe/CnUMzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q25abHd9wgNegk3LUcOidVwBOafJNu1U9ST62KJXKh8=;
 b=fGNV4xOSRqU/xNV7+hrrFCNxzRnBjOw+a1Gu3qn98ksoOcdG/UvLFjlMJmOxZBfV2I
 seg1grdOkUL/cot9e5FpZUEr9XVAjsWsgMXcYe30+FTp88Mump6b0uuKBBbDCnqvs//x
 v7plhE3UHEzGWWNWV9bFGK72b8VBQfTYs3HhCtKkwSVqMVUT6DwzaadTzTQ94G4Nzibi
 tzOpSs1fe6mqb30x7+H4ZqAfWz77Pkp/3rlK5gzR6g6qudbfwVvVYjP8OoVVyr+xKRKE
 L7Cp1fgGRJuK5Us7gth47gBQT8YE7DFh9o6kbJTg/cCxq1w49CCnQ5z6QVBAKxfwFTJZ
 c5ag==
X-Gm-Message-State: AOAM5315ONI8YD0xrruzHtf/G2lPeYzSZ4m9brUV1KWtUlX9BHE+nmLF
 Am2Y6kqCwPdbMij+W59NdZrYY4Rc+V9q07G4KdBV7g==
X-Google-Smtp-Source: ABdhPJx1KC2Sf4WzHgUQwWyPdWRuSlZoOLnjiZdGnYaexNZXkvQiCqTpJJd5W5gO70e5CRvJBsLepizgX3kZwngK+r4=
X-Received: by 2002:ac8:4089:: with SMTP id p9mr1016844qtl.363.1632763914260; 
 Mon, 27 Sep 2021 10:31:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210901083215.25984-1-yunfei.dong@mediatek.com>
 <CAC-pXoNT8AFA2j1DiD9M_uGb92fVcukTGDKVURaGjwpPstcwqQ@mail.gmail.com>
In-Reply-To: <CAC-pXoNT8AFA2j1DiD9M_uGb92fVcukTGDKVURaGjwpPstcwqQ@mail.gmail.com>
From: Steve Cho <stevecho@chromium.org>
Date: Mon, 27 Sep 2021 10:31:43 -0700
Message-ID: <CAC-pXoPrOO8W2Le_-WdgX3_=D-Qde8ut_TAzC++EyGCkdoOoPQ@mail.gmail.com>
Subject: Re: [PATCH v6, 00/15] Using component framework to support multi
 hardware decode
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Tzung-Bi Shih <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Tomasz Figa <tfiga@google.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Irui Wang <irui.wang@mediatek.com>, linux-media <linux-media@vger.kernel.org>, 
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 srv_heupstream <srv_heupstream@mediatek.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_103155_921660_22B19A4D 
X-CRM114-Status: UNSURE (   9.75  )
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

> > [1]https://patchwork.linuxtv.org/project/linux-media/list/?series=5826
> This link seems to be no longer available.

It is probably because the default state is "Action Required", and
this series was accepted recently afterwards.

I can see the series with the below link.
https://patchwork.linuxtv.org/project/linux-media/list/?series=5826&state=*

Sorry for the confusion.

Steve

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

Return-Path: <SRS0=95qJ=OR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 609B8C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Sep 2021 16:56:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2686D60F58
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Sep 2021 16:56:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2686D60F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qTNHXRuMi2sBzlHGD32kGQS152uYTmTn9Gn/pFHIxiE=; b=HSOqHVk5xQkPCK
	Q+TStjY2Hgv8HDKNuzz81oKf/ZwB/Mo1HXy7aS4ayL3+kGb59Kn8uYopJNeQ84s42q1iZ3o834S0k
	dNsNpYOf+yUAYxOdzsPjUS+AT2jb5OzRxj0mDGTY4+fujsWs0Jk6sKk5tXg74q7uBoOmAsDuyZMdv
	rKSgNSbMm91b0EcnM0JicqfX1GmEucTEqYUqseTL2UlAS3MW5nJuZRIq3arqTHoR+2Bd1fMkb8mXJ
	Ka4n7VRbexFc6/K3Nv90XU0FO7+KLalajco3T0Ee+JxB3MlN5oJyhvCU+bIcIugIT1iTsDxe5mlLb
	DTEEsHc0alvgA6f1E79w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUtvj-003S6Q-28; Mon, 27 Sep 2021 16:56:39 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUtvT-003S1A-7t
 for linux-mediatek@lists.infradead.org; Mon, 27 Sep 2021 16:56:25 +0000
Received: by mail-qt1-x82d.google.com with SMTP id e16so17157905qte.13
 for <linux-mediatek@lists.infradead.org>; Mon, 27 Sep 2021 09:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LxG4HPV4FXiyd9Nx3Il3K8msxXap3JQb5VLOGuZR7VY=;
 b=lg1n7FUxcNqWTq5zo6ikpYbbg1qh5zQzLTJ8zwUneGdbsMi0M8mPV5zE8+Xcnd4HAQ
 gP4NyCqJ20CSOR+CPqKX/7qhd/sNzEYzCKw4BD4XJoCDHPDw+ma36rX2v5+8bAAdsQXE
 1U8inMUrBNXMZLxmcTjggGzHf9MKW1SPst+Sw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LxG4HPV4FXiyd9Nx3Il3K8msxXap3JQb5VLOGuZR7VY=;
 b=OQ1hsW8RKjyMCP4K0os0bX0V+OoHgvdnAZRjL/hNb332NzWaRB3J95fPmp5vjAt42Q
 9CugHNhayVxKrL/toAU56Ny+V566ZFEPAJfjOt0yCN/NWLolx4mAayOyNIZXTngKVxll
 P13tXPAKP5pWK9Bln6O/+IWlKUGwYKrz6JRGvwysnBBpygnczy04ge0ay0zq5BMOMuqb
 WsryaPdp7/tHmAVHzE1AEzf9MVJo/2j43t+er1rGJ4ESXH+XrudvMKCy2I8DlpBHGcwr
 pAL2DaTcWTACbFpEFJHvnF4dFggbHc2GuuLoJ987HykdWZ/NruyHFFMH3hC+R0HFL+iX
 nBQg==
X-Gm-Message-State: AOAM533G1WOaf4JAD0bTdXNmMNV1pmddYEpbkUJlexhQ8W0XIoX3oF2J
 4pyDV89vwyfDtrYI9RV+ZW1F2BZ1s3H6i7ZR5wYozA==
X-Google-Smtp-Source: ABdhPJxks+ildD0Q8dRhHE4wWhlya4id4tdrl9iWX9N3kBCiqQIO9AuMcdOLdKpmnSNIRpILzZVNT9+rwNTdRNHeUGM=
X-Received: by 2002:ac8:1c6:: with SMTP id b6mr855002qtg.221.1632761781171;
 Mon, 27 Sep 2021 09:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210901083215.25984-1-yunfei.dong@mediatek.com>
In-Reply-To: <20210901083215.25984-1-yunfei.dong@mediatek.com>
From: Steve Cho <stevecho@chromium.org>
Date: Mon, 27 Sep 2021 09:56:10 -0700
Message-ID: <CAC-pXoNT8AFA2j1DiD9M_uGb92fVcukTGDKVURaGjwpPstcwqQ@mail.gmail.com>
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
 Irui Wang <irui.wang@mediatek.com>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com, 
 linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_095623_301672_DADE45B7 
X-CRM114-Status: GOOD (  12.07  )
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

Hi Yunfei,

> This patch dependents on : "media: mtk-vcodec: support for MT8183 decoder"[1] and
> "Mediatek MT8192 clock support"[2].
>
> 1: Multi hardware decode is based on stateless decoder, MT8183 is the first time
> to add stateless decoder. Otherwise it will cause conflict. This patch will be
> accepted in 5.15[1].
Just a few basic questions. What kind of "conflict" are you expecting here?
Are you referring to kernel "5.15" here?
Probably not. If yes, then that sounds strange to me considering our
current kernel uprev plans and current kernel used for MT8183.

> 2: The definition of decoder clocks are in mt8192-clk.h, this patch already in clk tree[2].
>
> [1]https://patchwork.linuxtv.org/project/linux-media/list/?series=5826
This link seems to be no longer available.

> [2]https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/commit/?h=clk-next&id=f35f1a23e0e12e3173e9e9dedbc150d139027189

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

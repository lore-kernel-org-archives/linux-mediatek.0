Return-Path: <SRS0=WJkm=OQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FFB9C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Sep 2021 14:52:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0742C60F48
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Sep 2021 14:52:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0742C60F48
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=vanguardiasur.com.ar
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kyQQid6CeTA+hod2FikQrHHtEPZIcvy92vt6KgdYee0=; b=LWipv3tbs1bCzf
	Uy8Lpps1aw3N5KFJEjezNtozD5qgj81z+/VD0om3k6IC8fP4QfRvhl9g+5oRn/CKIk0hi7BihpYFx
	3KyrFthWr7j82ANwXWYq5k/nZe2C5eZ7FMJX67ZHSnbO0Goz/EQeSqzVKpraDAJWJynddpStIAkSV
	/8y0BFspIawLHKmjuHOOGVW4/Jb3TE1N8BuyxjUJUuYbg9jOHd4WSIeJBItCNKVXzpenRzFxaaC+I
	AYErGKsTXlVP3xW5RdU9Nmfrnx7yw8kisFQMnLSZOMBGVNTvKu7uxfir/OwqKt8g2PXZiG05CzrVs
	atSRqukT2oOjJrJ6dvrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUVVS-000imx-SC; Sun, 26 Sep 2021 14:51:54 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUVVQ-000ilm-7C
 for linux-mediatek@lists.infradead.org; Sun, 26 Sep 2021 14:51:54 +0000
Received: by mail-ed1-x52d.google.com with SMTP id v10so53209517edj.10
 for <linux-mediatek@lists.infradead.org>; Sun, 26 Sep 2021 07:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sLce4anF/Ldxr9zJgqQp47ftX0X/kbCvqATSWd0SLuI=;
 b=S+hw9FjUgdENuVuqSrXHDlFjl4Zr9rPqWNEez8sEdpicMAbHwC2QIRkpRloWZzwpuA
 vcuMX59mB52afIhYL1N6sSE1uki387Gw42gR6DqohyNOmFG9GUak+ALFy6SY2nxvuJCV
 A2csKPZIvtE9OjBsqYJgK5KYHU3GQ5PWrOErJC+AkLR9AMU45iRWE2QcCuMPv9v8DKoy
 qoe95ToLD0LZgt1tjsejG8rlWCzpSokJCGwoxOPRyCCUn7/eZLQrd2YksqMy8/yvhgA/
 Uri7Z7xPRnCKqsMT7fOrkvP9dYwRU1KQ/eI0xQFhBswN1xq+Tq3yra/1IUJWxnPH9inB
 lZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sLce4anF/Ldxr9zJgqQp47ftX0X/kbCvqATSWd0SLuI=;
 b=riFbIgemGxGm4rqTI3PsUbMMFflTXUm+WjKiOUmuarSGmNdaGz9uwEdgx85FroMKDf
 98jPiPHvOPfYpkUp1B67mlD9nykhDjVGcaQPVw8Oc8xNJGZNd/Jug6TAT/KbqOgoDLb/
 utWQOPt3B3o9c7kOb7D3RlowkIQSsoy1VssqkfcgWgsrby1LVaUsEP/gM7Pk+MkU+gSW
 rYNJ0BTd7DY9amvCRWfyEya2YWj5zfyCK967JoPRRG5iYMkEBCh3O6LI0Eb3WOrQmJYD
 HS5USdE6KLXjedS9/kqIti3m0fBEa75JS34ZhxrXWZG7ZoMyyz65Ez7paCA5wB0mZntT
 R7dA==
X-Gm-Message-State: AOAM531rPGPtJO4fbPhlmKtSoFFiHjoGHrw+nxJrPOQt+IYy8qhO9Yqb
 Gl6n4Wd95EWtRC1xFaZ81Xv+9P7nJwIPS4YFXUCKMA==
X-Google-Smtp-Source: ABdhPJwEI9Otw5j+Kubnt1ZjqadmE4duy9lhN+7xJz+VYfyRhHhxfTsqb0Bln6cUv2IXEVGS0gPu4vV4A28m+/m9Cgc=
X-Received: by 2002:a17:906:e20e:: with SMTP id
 gf14mr22462818ejb.244.1632667909119; 
 Sun, 26 Sep 2021 07:51:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210901083215.25984-1-yunfei.dong@mediatek.com>
 <CAAEAJfDOt_GyDPojcj5P6Wou9HC2GC8YzRt2wYyqdrCOjfeOog@mail.gmail.com>
 <3b9463e88d88ce85205da08f8263252da7726ade.camel@mediatek.com>
 <aba7fb4ffe6e45ac90869b5017468386bce64d28.camel@mediatek.com>
 <b7ed8b71578a98704e9b8ca29cac63c67cc14b3f.camel@mediatek.com>
In-Reply-To: <b7ed8b71578a98704e9b8ca29cac63c67cc14b3f.camel@mediatek.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sun, 26 Sep 2021 11:51:37 -0300
Message-ID: <CAAEAJfCHEBFc8B7C0bu7UxtJdffvDarqgA-rset1wPjLOiV01A@mail.gmail.com>
Subject: Re: [PATCH v6, 00/15] Using component framework to support multi
 hardware decode
To: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
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
X-CRM114-CacheID: sfid-20210926_075152_555783_C19D2273 
X-CRM114-Status: GOOD (  11.45  )
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

On Sun, 26 Sept 2021 at 05:27, yunfei.dong@mediatek.com
<yunfei.dong@mediatek.com> wrote:
>
> Hi Ezequiel,
>
> Could you please help to give some feedback when you are free for iommu
> limitation?
>

How about you work on the architecture I originally suggested?

As the saying goes, talk is cheap, show us the code.
So let's see the code and let's discuss the limitations
with the code.

> According to google's suggestion, it's better not to use v4l2 async
> also.

Hum? I haven't seen such objection on the mailing list.

Thanks,
Ezequiel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

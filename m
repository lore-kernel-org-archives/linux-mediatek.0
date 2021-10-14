Return-Path: <SRS0=9yZI=PC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53796C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 12:39:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18336610CB
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 12:39:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 18336610CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=vanguardiasur.com.ar
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CaYSXG7RmoVPS0153fysR3noCp136tLwt3i+DeeyK58=; b=NXRDet3nZK32J2
	cFldbGYTDO/MfLwoViM4VqrOetRvdnHDlhm5/qn4ofyZli24mOfmTq/0vU3rNf4mifT4SODAs5TRn
	ol59W0OSPnuv21jZ8ImGVWAxV2N/EO1oxcZ0sYIUMKWkVWNoeuyXMnW8mVfUkw4tIG5k5UVPeRJcm
	U2W7a6SmcuzDzoU4F6y8RJShCU3MZFv/NQ8sh2QqQ92lNzAhN+b+IrF5EOnWcNmlwkqfJECIwNunF
	itgpcZ8z/n20JzBFeGijrCkroBp9VP1b/VAUhUbsb2IZM7xyT8yaMkb+B2Kn2ICmsRYUYf+soTuAL
	vJ2wYbkOauZivH46daxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mb00i-0035r0-JW; Thu, 14 Oct 2021 12:39:00 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mb00f-0035pd-M0
 for linux-mediatek@lists.infradead.org; Thu, 14 Oct 2021 12:38:59 +0000
Received: by mail-ed1-x52b.google.com with SMTP id y12so24228630eda.4
 for <linux-mediatek@lists.infradead.org>; Thu, 14 Oct 2021 05:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8OYfFNdhKlh5vCRuRw3rL+lpyG6Iz3zsndXlWQuOqNI=;
 b=rO8Cimbu3ArvFcSKskAMaEz7aYPRXYb1TiaXDvaU2b70yNbLMOWMpDmGJFMN1Rnz7G
 M297CLhdxw2O0YteyYq9YLtuf9NyzJWhkonUS9AlKuTCLX+CrlBF3jbIZ1vLEbv5JyfN
 cq9XMY7pO8xXwClCitODDk8MvmypSpa56G3dGbCHCnwUA1DHpXSTI+VBZQ5QRFvuARgD
 rnQqcQgS7V45c7G2eEvq3qx6CxbpHc1h2Zfqt8gRETh7npquNH5NFa9Iv1o2PkOi7Rq2
 EAzYMngcgh029FfDuYQ8j5b/8ea7PNtfWGsSImewcj1GyCS1CqkK4rdJsai0iuCsWFE0
 01UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8OYfFNdhKlh5vCRuRw3rL+lpyG6Iz3zsndXlWQuOqNI=;
 b=S3KBMK35MmI5YsXY89FjfBVdBi/AkBjEc86dXNOW0jVGmMJDe2KpTOAUQlHMTIHl55
 1Rpw05cLZ7TyaaI8lvi9koQTdOR4pc8wOYUMDBw7y2DoIBJQrbnylS9aSABEr2HwQGeR
 6m07I8Efih/bkVQONWC7xQTJKaa+RcEFWgRkK/iaMU+VGM4Dcd/RO4gSv9oaWxurbokK
 znCRpjceDeGalZVtVl0wfO+2VyWFuPqvMU+VYzr64NGj4XkKlZNKa24v4ErtEpUsdS1u
 SEdkZreGldEuPqgYoBLY5dc9HHnEqFnQTC2bS/9CS045bCAILQewf+8aryNL53P9lS1Z
 QmuQ==
X-Gm-Message-State: AOAM530Qb3pVGuIWmGh0rgNhfO/HEp9frQGap57Kg4jMCQvg4iVy9172
 L/rtA7a47+WAY2oOb45N45FH9Y39hpwkNLR2W4PMFw==
X-Google-Smtp-Source: ABdhPJw5RwGlWi8DUKaA9l8+IoPQsOFoPKhiFW27/0Uo29ALZMFUdlPeJGnIjKW+HthuHqOmJG3IW10gLCzTjzFq+d0=
X-Received: by 2002:a05:6402:40d2:: with SMTP id
 z18mr8324506edb.362.1634215135566; 
 Thu, 14 Oct 2021 05:38:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210901083215.25984-1-yunfei.dong@mediatek.com>
 <CAAEAJfDOt_GyDPojcj5P6Wou9HC2GC8YzRt2wYyqdrCOjfeOog@mail.gmail.com>
 <3b9463e88d88ce85205da08f8263252da7726ade.camel@mediatek.com>
 <aba7fb4ffe6e45ac90869b5017468386bce64d28.camel@mediatek.com>
 <b7ed8b71578a98704e9b8ca29cac63c67cc14b3f.camel@mediatek.com>
 <CAAEAJfCHEBFc8B7C0bu7UxtJdffvDarqgA-rset1wPjLOiV01A@mail.gmail.com>
 <b3fa00e8b66658e120279e37261cbdb5db7edf52.camel@mediatek.com>
In-Reply-To: <b3fa00e8b66658e120279e37261cbdb5db7edf52.camel@mediatek.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Thu, 14 Oct 2021 09:38:43 -0300
Message-ID: <CAAEAJfD0=0zNOS8ydu-BwpdoCsADAjdpm1LXBzZ2T8D=JQmYtg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20211014_053857_740696_E4874376 
X-CRM114-Status: GOOD (  16.55  )
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

On Tue, 12 Oct 2021 at 22:17, yunfei.dong@mediatek.com
<yunfei.dong@mediatek.com> wrote:
>
> Hi Ezequiel,
>
> Thanks for your feedback,
>
> The driver can work well now according to your advice with
> of_platform_populate interface.
>
> In order to separate parent node with children node, parent node is
> master device, children node is component device.
>
> The master and component are registered platform device.
>
>
> Could you please help to review the patch again when you are free:
>
> https://patchwork.linuxtv.org/project/linux-media/cover/20211011070247.792-1-yunfei.dong@mediatek.com/
>

I'm glad you managed to simplify the driver. I tried applying the patches
but they don't apply on media master. Please push a branch to gitlab or github
or somewhere public.

Keep in mind that when you need people to review your code,
it's generally good practice to try to make it easy on them.
The harder you make it, the less inclined people will be to
spend time on your work.

Thanks,
Ezequiel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

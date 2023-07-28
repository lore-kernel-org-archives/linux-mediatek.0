Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D58C001DE
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jul 2023 05:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cE7yzj/ShJctTo/cH8TMuQ/2VH0iD1G1+5KA9qirh/Y=; b=ze2jt1CkLxeM8v0AqctUDNUzzT
	rVBy5Q/I5LyT2c4X71LCXkxNmWo6to/R8PbRd0cA0uPWC/cAEJPDC2mUJ66SFRDe77FzzaX/6+OaI
	Ex1Lv3Pf5VzWidJkQ9tc89aGzQoZfsuJT0psi68TcBXYZaMiJ3PO6QQY5h9hoIWV+oNUruIwUtZXx
	j8aE6rqxb2ECcGel4E9M5byg3p50QMy9WsOztjj35Vr/CflWNjvH2zRicWLEeIAlTkxBXOpMjaX5W
	Q3qV9VseeMe6g5ZFOVagMTk0dcmRPpgvOJcIZdPM/6c32zZAJOJ9WewWxQujv5VSbyoF2xXCoweOP
	PB7akiKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPG0A-001jIw-2U;
	Fri, 28 Jul 2023 05:26:58 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPG06-001jGx-1S
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Jul 2023 05:26:57 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-63d10da0f26so11352686d6.3
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Jul 2023 22:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20221208.gappssmtp.com; s=20221208; t=1690522010; x=1691126810;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cE7yzj/ShJctTo/cH8TMuQ/2VH0iD1G1+5KA9qirh/Y=;
        b=trpErXEJEPDZtUwJrLhT56jOvw/TASEnxJqiim24u87Ey219zXjICSpgcrZjP+hIvC
         YOisNcRp1EFcZBuqaw0v47KkdLVd0rFI+qxA+sXUlebSorcP7hGjMv3NkVKwxd1A+1fM
         +cPBg+wk6aUxXSizYt9OOW8K2HwaRZylnOeA2baYNkYAkyTSt3uSNK4bqSBTUKRlrYKH
         veSyepWn/C4JI0VyBkgwNf9ieJKzWg0hb3tCI/tmQqhFz8s1wdV5XOJi6PQyomubgQDL
         AUwaUxnOfbqg6WW2SXOJHHuKT2fULl3OjCF9EdNHMtPrrV+gZMyo2wDTP0lf87ec5+Bk
         zCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690522010; x=1691126810;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cE7yzj/ShJctTo/cH8TMuQ/2VH0iD1G1+5KA9qirh/Y=;
        b=eIcbr881jcy2wm6HhzyJzNCuSMpdpu7khBqUdGHCrHAZlX92C4egtR0Y0SlJ4N9Xis
         Xr34xLKDzD8GHzOEp2nccPFx2fZnXxmLPclNyf6cGgPubob7n18QNi1LwcuCe5RDBa+y
         EXOme+uGeWGOXononSboXKybyDXRIhU4bmLMpWW6gW2sLCqjhpU4IEm+0ZaDR2XaZ2IA
         jO4adVy1Y9Uus3HLMwcwtlsGHMI9JIJjIW3oHQRxNYQokEw+NYB9MMAlnCNrjX5/+jNQ
         rAWIFwbEU/BzRP3KmTO5njKSLQwFEYulu2vPzHZynhy1GWDbWdLslb1ZarjVfCfDiVrW
         WhYw==
X-Gm-Message-State: ABy/qLYo/xRVC4A0A2qI5tLrSZmGn8qEJgD+U68Ez+PDVelGkho1NyoA
	om/bERdnUm0g7xUnumfn6F7GMjv6vkVQA7sNpsXlxA==
X-Google-Smtp-Source: APBJJlGaHKu68l916QbJnESfurRQ8GLdxdUM6h1VlhU7qK1FfkFxQTpsfGqhPqGZxqp+5PbL922CfRISxETZ4hSkBS0=
X-Received: by 2002:ad4:45a9:0:b0:63c:fc39:3c0d with SMTP id
 y9-20020ad445a9000000b0063cfc393c0dmr1353378qvu.62.1690522009771; Thu, 27 Jul
 2023 22:26:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230720152737.102382-1-helen.koike@collabora.com>
 <CAF6AEGtXL5vjp3Uup6Mk19MiY8E26-tpyXVmxXYhMd3fiadykQ@mail.gmail.com> <CAF6AEGsxLg4og1EkCdno6P8x31KK=rJfmerJa8uMeNR-n7RVRg@mail.gmail.com>
In-Reply-To: <CAF6AEGsxLg4og1EkCdno6P8x31KK=rJfmerJa8uMeNR-n7RVRg@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 28 Jul 2023 06:26:39 +0100
Message-ID: <CAPj87rPNyJ=mX1Um6yaN_jTV2gH5MhMxr3mnSb7=nB7NEOf2Ag@mail.gmail.com>
Subject: Re: [PATCH v10] drm: Add initial ci/ subdirectory
To: Rob Clark <robdclark@gmail.com>
Cc: Helen Koike <helen.koike@collabora.com>, emma@anholt.net, linux-doc@vger.kernel.org, 
	david.heidelberg@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, jbrunet@baylibre.com, robdclark@google.com, 
	corbet@lwn.net, khilman@baylibre.com, sergi.blanch.torne@collabora.com, 
	gustavo.padovan@collabora.com, linux-rockchip@lists.infradead.org, 
	daniels@collabora.com, martin.blumenstingl@googlemail.com, mripard@kernel.org, 
	anholt@google.com, linux-mediatek@lists.infradead.org, 
	robclark@freedesktop.org, matthias.bgg@gmail.com, 
	linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, 
	neil.armstrong@linaro.org, guilherme.gallo@collabora.com, 
	linux-kernel@vger.kernel.org, tzimmermann@suse.de, 
	Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_222654_494264_F55A3655 
X-CRM114-Status: GOOD (  15.28  )
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

On Thu, 27 Jul 2023 at 22:47, Rob Clark <robdclark@gmail.com> wrote:
> > I did run into a bit of a chicken vs. egg problem with testing the "in
> > tree" version (compared to earlier versions which kept most of the yml
> > and scripts in a separate tree), is that it actually requires this
> > commit to exist in the branch you want to run CI on.  My earlier
> > workaround of pulling the drm/ci commit in via
> > ${branchname}-external-fixes no longer works.
>
> After unwinding some more gitlab repo settings that were for the
> previous out-of-tree yml setup, I have this working.
>
> Tested-by: Rob Clark <robdclark@gmail.com>
> Acked-by: Rob Clark <robdclark@gmail.com>

And it's also:
Acked-by: Daniel Stone <daniels@collabora.com>

It's been back and forth a few times by now and reviewed pretty
heavily by all the people who are across the CI details. I think the
next step is to answer all the workflow questions by actually getting
it into trees and using it in anger. There was some discussion about
whether this should come in from drm-misc, or the core DRM tree, or a
completely separate pull, but I'm not sure what the conclusion was ...
maintainers, thoughts?

Cheers,
Daniel


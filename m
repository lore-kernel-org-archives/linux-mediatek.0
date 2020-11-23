Return-Path: <SRS0=13eL=E5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11CFFC2D0E4
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 23:56:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EB9C20724
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 23:56:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HOzvM9Vy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kZ+79z/u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EB9C20724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1a/zYjFfAaJVCPy3buVWhv1CaGBPv+4bei3Q9rRWCrw=; b=HOzvM9VyUajgUjcIarMWVRHom
	zwALcltqNHF6OC1gkVR8yP7gRwzbVyHWw5qyxk0veNcfKB86SdSsfjwls4zBUs8x0qnlpmq10nH8/
	MhsavgLSF+xjCgHb8EIQZyp5ut1SkHcSTNXAqv5m/bSX5r1JKO7BGy77y/OYFsTl0OGI8ZGtn5hID
	Yp603vRvhhV/nQMZBizEdZdrc/KrphjXm+Vw6EFT3/YXzqY9tFJHbL0SOC5yVknmtN2jEHkytCE7v
	13k7AywgwNi+DlLccBUoOX+44kpy+0iee5rIUnUl3kcyWbuAT7DaMAAyqI9WMEsrhWY9meoNE6GRE
	njXVNIUPg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khLgy-0000Jf-Rw; Mon, 23 Nov 2020 23:56:20 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khLgv-0000Iw-Vx
 for linux-mediatek@lists.infradead.org; Mon, 23 Nov 2020 23:56:18 +0000
Received: by mail-lj1-x244.google.com with SMTP id f24so7118143ljk.13
 for <linux-mediatek@lists.infradead.org>; Mon, 23 Nov 2020 15:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YnhR1hhTDdb79Txd40YmmmMbIC/AjLNuqdONwWnI2dg=;
 b=kZ+79z/uBo/qRjmY7Jjq0rAD+9AspnfTp6Dw62PbqgrQK57nOMVbJoQvY4j8kmwJeB
 s3vxfoE4mGEJGt+x+84wAJGICr4wuyd3cRiP0ZB4zw80Dr88IMov5y9wp/i6Ksl+3N6O
 HNPOKbOWzXIWbfPCWIQoqsldoNScc49jdbcEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YnhR1hhTDdb79Txd40YmmmMbIC/AjLNuqdONwWnI2dg=;
 b=nK+oU9T7bbTpv2YJqzIp4xzvkBJlxJuEKqAt6jC/Bj7NS4vBhGU+Oqy/rpeZM6Yds7
 CeuJhybcIEaaY3H18t/iEJWALofK4+jKKLemb1EgTBTfEuJ37ivRM3pn3rEceqGNrZGp
 lFev0HzSWrekHNi7zFjDl83jNQof6HPwCLSLWYgxDqTO4dQJ9A4XJLxOWdSmsue3IPpC
 9OsU+FQl1gzZQBgyWL4wci6cdATskLsMZ7NR8G4KuJfpKwZ0zG+4vIZMngcTMDDY76SN
 WOMhhOTJJX8/8mxQIaQ9zrNXPsLJtyKFMNB3kKNAJocHckxQd7zpEkdL4Nanmh+MgOng
 y6aw==
X-Gm-Message-State: AOAM53215w/MeRvjHxNhvTy1E/wIKd8hIAl3WeKZxRdNh6F4e1VjlgOE
 4bjwvXHZQ3iuWILDCH+GK3dLDORKMOn5tg==
X-Google-Smtp-Source: ABdhPJwoCe9cyO/ds+5Wqf1UmL1dzOCtX0nrrGdfGWp5VgtzUKmXXA2deI2L/vEOv+RxiQI4nfa9lw==
X-Received: by 2002:a2e:2e10:: with SMTP id u16mr732705lju.405.1606175773483; 
 Mon, 23 Nov 2020 15:56:13 -0800 (PST)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42])
 by smtp.gmail.com with ESMTPSA id m6sm123085ljp.70.2020.11.23.15.56.12
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2020 15:56:12 -0800 (PST)
Received: by mail-lf1-f42.google.com with SMTP id u19so26319526lfr.7
 for <linux-mediatek@lists.infradead.org>; Mon, 23 Nov 2020 15:56:12 -0800 (PST)
X-Received: by 2002:a05:6512:5d7:: with SMTP id
 o23mr598966lfo.272.1606175772082; 
 Mon, 23 Nov 2020 15:56:12 -0800 (PST)
MIME-Version: 1.0
References: <20201013124428.783025-1-acourbot@chromium.org>
In-Reply-To: <20201013124428.783025-1-acourbot@chromium.org>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Tue, 24 Nov 2020 08:56:00 +0900
X-Gmail-Original-Message-ID: <CAPBb6MVM81dQyLJANUH7j8b5uhpk8ERdm9gpsGkF4k1Y-ZkYDQ@mail.gmail.com>
Message-ID: <CAPBb6MVM81dQyLJANUH7j8b5uhpk8ERdm9gpsGkF4k1Y-ZkYDQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] media: mtk-vcodec: fix builds when remoteproc is
 disabled
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_185618_133987_94F2EEAE 
X-CRM114-Status: GOOD (  18.45  )
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
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Gentle ping about this - we are already well into the 5.10 cycle so we
don't have much time left if we want to merge this build breakage
fix...


On Tue, Oct 13, 2020 at 9:44 PM Alexandre Courbot <acourbot@chromium.org> wrote:
>
> No functional changes since v3, but it does the job at fixing the build
> breakage. :) Please kindly take a look.
>
> Changes since v3:
> * Removed obsolete Acked-bys
> * Fixed indentation in Kconfig file
>
> Changes since v2:
> * Use the FOO || !FOO magic suggested by Hans to ensure a built-in
>   module does not try to link against symbols in a module,
> * Added a patch to split the VPU and SCP ops into their own source files
>   and make the optional build cleaner,
> * Control the build of firmware implementations using two new transparent
>   Kconfig symbols.
>
> Changes since v1:
> * Added Acked-by from Randy.
> * Fixed typo in Kconfig description.
>
> Alexandre Courbot (2):
>   media: mtk-vcodec: move firmware implementations into their own files
>   media: mtk-vcodec: fix build breakage when one of VPU or SCP is
>     enabled
>
>  drivers/media/platform/Kconfig                |  28 ++-
>  drivers/media/platform/mtk-vcodec/Makefile    |  10 +-
>  .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |   2 +-
>  .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |   2 +-
>  .../media/platform/mtk-vcodec/mtk_vcodec_fw.c | 174 +-----------------
>  .../media/platform/mtk-vcodec/mtk_vcodec_fw.h |   7 +-
>  .../platform/mtk-vcodec/mtk_vcodec_fw_priv.h  |  52 ++++++
>  .../platform/mtk-vcodec/mtk_vcodec_fw_scp.c   |  73 ++++++++
>  .../platform/mtk-vcodec/mtk_vcodec_fw_vpu.c   | 109 +++++++++++
>  9 files changed, 277 insertions(+), 180 deletions(-)
>  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_priv.h
>  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.c
>  create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c
>
> --
> 2.29.0.rc1.297.gfa9743e501-goog
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

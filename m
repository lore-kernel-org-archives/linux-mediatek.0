Return-Path: <SRS0=VpQz=L2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CCC1C11F68
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 04:11:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC6AA6141A
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 04:11:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC6AA6141A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qCfAZEQP8uiZDvhiG/3ueQmtrdGQq+3emkF+QH2QeXI=; b=RPsQ5nHeqz3qQq
	g29EtxYSf1sCk6t6soy97fkVitquzX2iYne4K5ZKIprPNu+QuZIjoSJPxz4G0kyijh5JmGI0p8QV3
	WmyKaoK4iyGzZBMwp3fwMNlbhPemoJplP9hVasNu6rBWuOOjVnixbII5CyhMdNkb7/Xwvo+i/UsLq
	ucBPWITEUsHExWA9JFwjVyvnTbp/ma9faRMyLzWEzexQCplQW2yNnUi646sHBHqjpXTVNIwxoKwAt
	CB3T1v1V794fuLw9GnfCcf4t+GLKO8Di7kZOMKWVlJQwpTHBJG8Al2vl8364kH5en0Oh7AlP8t3Wm
	EumHGCxFUZssT4JrjkMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzAW6-0021aG-86; Fri, 02 Jul 2021 04:11:02 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzAW2-0021VZ-UN
 for linux-mediatek@lists.infradead.org; Fri, 02 Jul 2021 04:11:00 +0000
Received: by mail-io1-xd34.google.com with SMTP id i189so10142542ioa.8
 for <linux-mediatek@lists.infradead.org>; Thu, 01 Jul 2021 21:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zeSfxgHTcElRZoSpX3vn4Ly7z/IXRbCeFw0dHTkG7AY=;
 b=IuM+K/DrC/N1D8CS0EkEa3H706wC+2MyxRTwtdlaOVRQXrD1O8w7Ak9NSNpM/JQGdW
 4Bpslu4+wwkq6u06q8ny1O51SVtLSqRnnZ7YBekiG0zikWd3ZGF0l6ACkcPgyZIVQWP1
 EXvgsk07oRH7T6lLI6wvDLR2FcIzd8wOz9o+6BCh9CgD/g2hH6jhEsx2ctv1NKMqKQ/0
 MkfamFBQBIcbgWJY+gVydu+F/z1KyT1ezsV8HY2ZDA9c8C9ZWPGinZdPbMqcMql9GkRd
 G2Q48cdZlVKAmqHBiQqGteQSZo3jAv33rzxqDiBlaq3hy4A54huCAin9LmrbfGhYRiIR
 BYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zeSfxgHTcElRZoSpX3vn4Ly7z/IXRbCeFw0dHTkG7AY=;
 b=DDABGHy1U+9Om/CHuNmnKMOW46LZaJziw6mgVXP0OOc2Su1pyRMH6JnAbhlvpUvKkw
 3zbHb2boTYT1ukzAdCXJSyFjPyfdnuuTwZ5+5q9RDjMy7w/LeCfuu5K2250T+P5nn5xE
 tXlagXzj3hKjZjWPl4v0Un6JnCH21gJt7LfohTeNBBKys2GtI/M2EroDxxYEssyIBZnt
 1ZlfO1lExCbAwX/1S9s9R2T3q4Iqvy5JYkRxKWeghFAq0R2n0DtAIo3r3wRtHiU86gcY
 o4LDrZrgm1T8WUQt8Qg4brpRqKy4b0uE8Z2aXmvwoZ7kXh8U+cItx0tjsYdy+WKCll/Q
 Zv1w==
X-Gm-Message-State: AOAM532DF4xKt1v1O7d3ZLFoYSIJKBjVC7EwTwKljvITEy22AfXL0cpy
 oEIzSs3/CrnWm1W01OTxxC2hcrauEguMd2FeRLDRTg==
X-Google-Smtp-Source: ABdhPJyBQxBUgBEzL+AgJh2pPTIZG1lq9jnjj4ShF+UvDdDfl3o1JmKmztNrF6SH8uOwDhhHcI3j4ElRt8sBOwAeUb0=
X-Received: by 2002:a5d:840c:: with SMTP id i12mr2078731ion.185.1625199053517; 
 Thu, 01 Jul 2021 21:10:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210630085247.27554-1-irui.wang@mediatek.com>
In-Reply-To: <20210630085247.27554-1-irui.wang@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 2 Jul 2021 12:10:42 +0800
Message-ID: <CA+Px+wUZJQXtF2_eti5baY_z_24Rm-_+389KAeT5+sNretTD5A@mail.gmail.com>
Subject: Re: [PATCH 0/3] Support h264 encoder on MT8195
To: Irui Wang <irui.wang@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tzung-Bi Shih <tzungbi@chromium.org>, 
 Alexandre Courbot <acourbot@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>, 
 Yunfei Dong <Yunfei.Dong@mediatek.com>, Fritz Koenig <frkoenig@chromium.org>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_211059_028333_E6D65B66 
X-CRM114-Status: GOOD (  10.16  )
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

On Wed, Jun 30, 2021 at 4:52 PM Irui Wang <irui.wang@mediatek.com> wrote:
>
> Add MT8195 H264 venc driver
>
> Irui Wang (3):
>   media: mtk-vcodec: Clean redundant encoder format definition
>   dt-bindings: media: mtk-vcodec: Add binding for MT8195 VENC
>   media: mtk-vcodec: Add MT8195 H264 venc driver
A typo in the commit message of DT binding patch.  With that:
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

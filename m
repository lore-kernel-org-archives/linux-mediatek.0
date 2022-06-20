Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AA0C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jun 2022 04:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mukyLCtBBbCJ6QLdWGYeYZEZ9YqINwpy/ZdfkORqBZE=; b=dq/UlDdzNzwbBpc/K1VYfZLRnl
	TyVy2VWpR9mSK7OfyjVFWF78ugtBXAYA9RtVGvlAX+JACGrrc5XYuD5pIvc1S1yeBQe6/6mWYD0F8
	nQgZm80UtLJrUxNpXQfPjxDiHcF3opyBhA9d8SW9d/j7ltzH5z7qiT9afC0SDbAdlqT2Rup2kht0M
	AkuM9MLfAUoSDQ0XONKyRTVW3ovZeuwco7BpfZO0ZtaE5ogP8ylXQdRwxIf8GP96PRwObgcuHM99s
	8F2V4kPSx2NUTSGmEsK+7OzcZTz+LddQ0DDuR5Bn8x0WXwLkPxpL8WwRCgMvnoKEW2mKJ1Etje2jH
	1uTzMqvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o39Qj-00GCSA-HJ; Mon, 20 Jun 2022 04:54:29 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o39Qh-00GCQy-02
	for linux-mediatek@lists.infradead.org; Mon, 20 Jun 2022 04:54:28 +0000
Received: by mail-ed1-x535.google.com with SMTP id eq6so6087071edb.6
        for <linux-mediatek@lists.infradead.org>; Sun, 19 Jun 2022 21:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mukyLCtBBbCJ6QLdWGYeYZEZ9YqINwpy/ZdfkORqBZE=;
        b=UKNKFhdL+7ivgne6rJC21mSSfiaLKZHX9yoOuIh9UmqiDzzaewQHD7yYJipRMbN5SI
         sqMO9Scex5fT2OG4s3idcHiBshzVzr83BQRiz9MclD5AgLHLh9ef6R0EaL7PWErhcE/g
         wKYAz5furNCnzUMXK/fAv/VmQ0Psdwl6aMHDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mukyLCtBBbCJ6QLdWGYeYZEZ9YqINwpy/ZdfkORqBZE=;
        b=YjY7Srw7fXKag5Sl+rKB2iOyDkKTS6QJJZ/9NzE52+Sleb5NgWsvvunFBPOKNR81IS
         mhsXpSs08nIlJQmN9RV/Qc7RzLsdHqml2Gs7m16hgMhQ+ov/ihSv7kUIOh6YR3Gy4e+Q
         mi/9jFqHl8u3w2j2Izkd6gk4qJNU/+eodsl8gFbFSxXrRDrtVyQ6K75sY8yIkldAXRet
         jDsVygFBBiwQoBXizRSvq5seWnX66tu5oBSMSGkxwyeZi69YFxURnSOYqI/mH6xdz/9W
         XbfS4OZmqOV1cLR8h370rEyJvp1ZG7HUs1kdeHaHIHeJT37NHJbJ0x9uIzwU7Y9M1rMR
         kPGg==
X-Gm-Message-State: AJIora+pe2W4XsUQ+tyo4wothIkNOsSuGeB4MeTVeI80q0VynTCcwt40
	aWojMzqrJjtlFNyMjDJZalydhntawHQPmqKnVNWZOA==
X-Google-Smtp-Source: AGRyM1uRThNT8XmE57SQVNixL8TMkzT1S2u9lzIBzMfvygATaLlCkuFrLWUz2Cy72NYhPuNYT7dU009axLMuI9/ox2A=
X-Received: by 2002:a05:6402:3785:b0:435:5d0e:2a2e with SMTP id
 et5-20020a056402378500b004355d0e2a2emr19724945edb.307.1655700863894; Sun, 19
 Jun 2022 21:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220618072929.28783-1-yunfei.dong@mediatek.com>
In-Reply-To: <20220618072929.28783-1-yunfei.dong@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 20 Jun 2022 12:54:12 +0800
Message-ID: <CAGXv+5EFkZ6-bvu68dV4hr795+N3tAwbXYg5WCJp+Zd+pf1Aqw@mail.gmail.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Initialize decoder parameters
 after getting dec_capability
To: Yunfei Dong <yunfei.dong@mediatek.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Tomasz Figa <tfiga@google.com>, George Sun <george.sun@mediatek.com>, 
	Xiaoyong Lu <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, 
	dri-devel <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>, 
	Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220619_215427_106265_C31492DE 
X-CRM114-Status: UNSURE (   9.06  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Jun 18, 2022 at 3:29 PM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
>
> Need to get dec_capability from scp first, then initialize decoder
> supported format and other parameters according to dec_capability value.
>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

Tested on MT8183 on mainline 20220617-next with the vcodec-dec DT node
copied from the ChromeOS v5.10 kernel.

This fixes an issue where the first attempt to enumerate formats on the
device right after boot returns an empty list.


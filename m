Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EDD5C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Nov 2022 07:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RSCEsE/k2zop7T/QkKVjsEEgTxwFxYe+bGHoI98bBtY=; b=oZF2+Pc22595XczVHk9SS9uGyW
	RfJFnwfN+hvOj/OlgfECSyE0IW5HNSorMMo7UxOu0hf+0vm1c6yzpZ8hNd/09va2310RWUvsGNE3z
	JlFr7PzNsyK96pdogb3yQterXQD5j/x+ecPP5YyG1qhjRBAfm43lrwzM2yxmAOy94ljaN2+V0pwLM
	GYArbnPtCE0qFb1S3tnq2r3eRKUvr023d66ga3CX5E5O6onO+C+u/yOx5nsOJ33co6/cjrJRVxiSK
	oGeqUmA+5yKfYJHNmqTS2Crs1jnqujCZnB9ocrWxD8gC8bq7/HuS2u90EdiDihyKz+k2OwLc+4+fC
	wYHauwXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otOej-00DwP9-PU; Fri, 11 Nov 2022 07:40:53 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otOeh-00DwOm-3R
	for linux-mediatek@lists.infradead.org; Fri, 11 Nov 2022 07:40:52 +0000
Received: by mail-ua1-x936.google.com with SMTP id 97so1128128uam.0
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Nov 2022 23:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RSCEsE/k2zop7T/QkKVjsEEgTxwFxYe+bGHoI98bBtY=;
        b=F2dJGfr/6QuqyV8T3+ORTE5PscCUIRksA9H7zYvuBPSuViw6/kOe//nCkXR6hrojc/
         3voOCwRsLN3dNFb6PHCVnGacjtn3lkiwsiBVSYPCgz9YqkRe3tZLXP92HJ//ch9GzAGk
         QvBNMd/ze3lm8DEqW/oEuR5k2WODJ4f+t6Gq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RSCEsE/k2zop7T/QkKVjsEEgTxwFxYe+bGHoI98bBtY=;
        b=6FwXebtLc9W/euW1/6wraoG9C11ufbNhfLaC1oMjMe/MaYJdNb9syZRrzv9zKnrDgF
         +n5zhWvbMLnfkSQ6Ixi+SnsIY2uRbc1I7vR00lInlQ4O0Kqz1UUSR/EW75rvxVruvy+F
         NiAa60YOlFZexoj4CtMkuhGDP/jxqyAKo2yTjUdeIyzfU+E++ZY09oqywXCD+hB7QG0A
         gR9DKQLSf63wAGXT168fgcWMjDB7+FJ8qg0Hihiw+ooGjMBC9vPogM1XubrP/UtbdIH0
         suLx6PELDE21GlbL/7igeax102WtIFa72m8nN8rChTcX51HXr8ZAdTphtne7/tmDPHzL
         cpHQ==
X-Gm-Message-State: ANoB5pmmGTTGFTMJR8BVF00RztETnPCR1vRcsM5h78VqhnnrJrFanirH
	hIviKshMBtv+oAWvKTSN189YXdHYt5yNegxda0ZI4Q==
X-Google-Smtp-Source: AA0mqf60bQlM6y1waTIKCFYX4aHza3GEl7ztw9lALAFIoTrEbx+lXYrSHIrK4i/aPKj7zLkoBjp6Ul9kYl5ocidQGV4=
X-Received: by 2002:a9f:2f01:0:b0:3ad:bbe7:e134 with SMTP id
 x1-20020a9f2f01000000b003adbbe7e134mr187214uaj.43.1668152448952; Thu, 10 Nov
 2022 23:40:48 -0800 (PST)
MIME-Version: 1.0
References: <20221110184852.1848917-1-gildekel@chromium.org>
In-Reply-To: <20221110184852.1848917-1-gildekel@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 11 Nov 2022 15:40:37 +0800
Message-ID: <CAGXv+5HmNT9hEncMoQJ2dj+7YWnmq-N-z4Y7xNQHzT0mst=kug@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: make eDP panel as the first connected connector
To: Gil Dekel <gildekel@chromium.org>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	angelogioacchino.delregno@collabora.com, jason-jh.lin@mediatek.com, 
	justin.yeh@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
	airlied@linux.ie, matthias.bgg@gmail.com, daniel@ffwll.ch, 
	daniel@fooishbar.org, seanpaul@chromium.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_234051_207527_92B917C2 
X-CRM114-Status: GOOD (  11.23  )
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

On Fri, Nov 11, 2022 at 2:49 AM Gil Dekel <gildekel@chromium.org> wrote:
>
> [Why]
> Some userspaces assume that the first connected connector is the "main"
> display, which supposed to display, for example, the login screen.
> For laptops, this should be the internal connector.
>
> [How]
> This patch calls drm_helper_move_panel_connectors_to_head() right before
> crtc creation to ensure internal connectors are at the top of the
> connector list.
>
> Tested by ensuring the internal panels are at the top of the connector
> list via modetest -c.
>
> This patch does to mediatek what the following patch
> https://www.spinics.net/lists/stable/msg590605.html
> did for qualcomm.
>
> Signed-off-by: Gil Dekel <gildekel@chromium.org>
> Tested-by: Gil Dekel <gildekel@chromium.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>


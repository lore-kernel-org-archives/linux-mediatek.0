Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528AEC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 06:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+LHD1Eh7R5NFEh/i7at+5wk7Eyhd6qFs5js/UI+dUc=; b=pyA9+/GOFodwlVTIDLvH1W1r4q
	T1/DWonKvuBfJsg58pmSocX4lrBQbIecmn4kp8gFGpJI04FY32XoyvR4kTJG/kkLRfG4rSD5PcD0s
	U8XSsBwJ6wDtCD7aupTzbU6L/dClcxemI/ED4AzmkWKtToLrdV81yQoTHpwN595UyObIMeMkofMxK
	h+oDqJAwuiTJ6IwK6tryJDKwNbSdJ3lacsgDMN7ayDr8QxqHq2kqhd6jq99YJE7tvcPSPqz89Znc3
	xXcWj7kBzQZZ9g+uKllFBFjqe5Gqe007OLlOh0cUtEKFoLd4eLDeax2hPPRTB20Zp6jj3wkqx/kSG
	sX+9TgYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFrrs-005fRl-Qd; Mon, 25 Jul 2022 06:47:04 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFrrg-005fFX-N9
	for linux-mediatek@lists.infradead.org; Mon, 25 Jul 2022 06:46:54 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 6so18442374ybc.8
        for <linux-mediatek@lists.infradead.org>; Sun, 24 Jul 2022 23:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a+LHD1Eh7R5NFEh/i7at+5wk7Eyhd6qFs5js/UI+dUc=;
        b=Ibr9q1wIeBGws91HK3qdE1+wGQ7t0MkwzuOm1Xb3FnQkzuTRYcgaObgz8ynZLO2q52
         PA+10trsRKvarVn64dlNZzx6SdntY3tG6R7uP/a3yZTiEgS5/BXsZAPxKqmDTwjgXyyv
         GeBSJ75Ea/cEKXAv60Z9TTrJB0U/3a9uxk09g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a+LHD1Eh7R5NFEh/i7at+5wk7Eyhd6qFs5js/UI+dUc=;
        b=ekZIhMdsypOhhHzavP2/SiRtE6AD4WArSJNZL2s4tLrIM9EJw6XALdBpDQuDbncRxw
         xFIpo6D4yL0sXrRJNKvBRKQccWggm06LkQ8Hy2Dxk8vvJ/trAWq26q3fTL/e2G2JF766
         HWG/yAa2NhSkTxHZuR8vChyFC1V4BsIIPKar5rhqLiBaI836F85IFA09IUw/8sJ4GZJy
         hMw8vn27SpZ4AoOQ0kfZCehjHfbAjPKk2z/HAo410gXYlxO4EJpOclQJJwLA31fSg5OR
         rWSlgnHIUTzZ5yiL+CsLFxqM5W66cSJ6loXmyTigx7YSR0HucLkqC4gKkm9SHCrIV2Og
         MeHA==
X-Gm-Message-State: AJIora9STp+5g4j1MCiC8YIAYt+PX4W9DjbD2CQytUC5YzVKtsy1VT4z
	ik9upNKEO7C8avW4H3OV4SNG6WmOcCXAnO9h3OVcSA==
X-Google-Smtp-Source: AGRyM1vJ0Mmq3F2lfrUDVjqxtvHQmzaTShK7/xuF4iFq5a9n1GXpZWltqxF+0o4P2HADFPt1FvB99qvJNv/yVZEJkrQ=
X-Received: by 2002:a25:640c:0:b0:670:91a0:57e3 with SMTP id
 y12-20020a25640c000000b0067091a057e3mr8294122ybb.204.1658731610056; Sun, 24
 Jul 2022 23:46:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220721172727.14624-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220721172727.14624-1-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 25 Jul 2022 14:46:39 +0800
Message-ID: <CAGXv+5GyOjMxsmP24e-oUMJxhpV_UO_=c6RjCPf60MKn+SNiYA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: dsi: Add atomic {destroy, duplicate}_state,
 reset callbacks
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, jitao.shi@mediatek.com, airlied@linux.ie, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	rex-bc.chen@mediatek.com, linux-mediatek@lists.infradead.org, 
	matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, 
	xinlei.lee@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220724_234652_775999_DFF136EB 
X-CRM114-Status: UNSURE (   7.15  )
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

On Fri, Jul 22, 2022 at 1:27 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add callbacks for atomic_destroy_state, atomic_duplicate_state and
> atomic_reset to restore functionality of the DSI driver: this solves
> vblank timeouts when another bridge is present in the chain.
>
> Tested bridge chain: DSI <=> ANX7625 => aux-bus panel
>
> Fixes: 7f6335c6a258 ("drm/mediatek: Modify dsi funcs to atomic operations")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

on top of next-20220722 with additional DTSI changes for display related
device nodes [1] and modification to mt8192-asurada.dtsi to enable internal
display.

[1] https://lore.kernel.org/linux-mediatek/20220712114046.15574-1-allen-kh.cheng@mediatek.com/


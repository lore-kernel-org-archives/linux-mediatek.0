Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 985C8C6379F
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 07:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HdJzFq7jufeOqCgSl9+xQrgy1RmhMxPxNMg0cBhlhbs=; b=OfrPnFPee2d9LNNmfBKz3zb7S6
	d1Yr9MjLOOun3WcbLOEHhZEWGXK2qMRk9xNwSIMtQcPI1GkZaIqUHk+NDlTPQifkY3c3mKgqkldNL
	JNso0owL4v8Z96mBSk14qFDNNuF/aHvLY48eddHGk3lmAxOf881nekS+XYm2U+uPu3fnsx6NFHAwh
	qm1I81LfScODeJahdgICHDNL8r66mTuQs1/S93SBg4rsk1QXddYwV+nvuyEPAduZFwg64t10IYlzG
	ClloeeGZz5Tbmcdt0vUQFBMoH788MvpBSyLId4FC0yEeJV5cvJ3sbqfZxPscOG9Pco8/mMoeu/mmk
	rIQo74oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUMpt-006qwu-JK; Tue, 21 Feb 2023 07:13:13 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUMph-006qrc-V9
	for linux-mediatek@lists.infradead.org; Tue, 21 Feb 2023 07:13:03 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id x14so3255098vso.9
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Feb 2023 23:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1676963578;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HdJzFq7jufeOqCgSl9+xQrgy1RmhMxPxNMg0cBhlhbs=;
        b=QTtP++qdraIvmGcDg/G0yedBnkO5aUr696nf4kJjEqynqHqqP1t1I/p6IiZYtEH0iP
         VEp0HA85edRMoW1PVhjW9VC9yXpFVoON2oi71egsP3qCJFyVBnQXc0U2LfolYtbmKL+D
         kqRBypDclfnAfqZYidJkUoJrXGOFeBpLaxeC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676963578;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HdJzFq7jufeOqCgSl9+xQrgy1RmhMxPxNMg0cBhlhbs=;
        b=PAnz30z1IfFGGs26Xg0tyJ0UcwVoF73PeffxkV+Rqrw6U/hqo+cw1t7kCN/ROMDsBJ
         CGYhzC4vcVoUt1tKn54glJ5HfDGsfW/yzx/C0SH1mxJBdBNm4fW60RocCaTWCg/JKioo
         Q6IrmQrGu1SQqIoLkAaqHv9msbEqH93SJeqkKOPX3WOZTZV0xwSygy5iilSxP5eMAFAn
         NvrRu5nHtP2K3z0bHUx38jG70rT04TpE0idzP5GzhjOwrd+gYbRk9kCB6Qj7TejPEnXs
         +EUvT+iAcCD3qeYupZkdkLAxFDik1ItXSKcYQBtaDqw9p1dHjBG0uU78/KDrXp4QUjiz
         YSjA==
X-Gm-Message-State: AO0yUKVGXRTq65RGiMClsoyb2QGPyAdEtyiWjxT6OWjBCynSXxlkyNZc
	TXgfX8F91j1Onu4Bo/El+omoe6Wx+B3Lzz2Lcb8snU1bsCcSpF05
X-Google-Smtp-Source: AK7set9LDiQDEkH3XQ+jZqO1icouR/ex+tykAQ7KVNOAzfsDipi4GTynjIqgeAiSU3oARM6Z7LKriycFiF6nuUE0L+4=
X-Received: by 2002:a67:f6c1:0:b0:411:a14d:6bac with SMTP id
 v1-20020a67f6c1000000b00411a14d6bacmr907948vso.44.1676963578806; Mon, 20 Feb
 2023 23:12:58 -0800 (PST)
MIME-Version: 1.0
References: <20230216130021.64875-1-angelogioacchino.delregno@collabora.com> <20230216130021.64875-8-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230216130021.64875-8-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 21 Feb 2023 15:12:47 +0800
Message-ID: <CAGXv+5ELyqF+p1Z-m52CkV92nQ26Y_-uvBx_BetiFU4X4oyt_A@mail.gmail.com>
Subject: Re: [PATCH v1 7/9] soc: mediatek: mtk-mutex: Use module_platform_driver()
 macro
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, jason-jh.lin@mediatek.com, chunkuang.hu@kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_231302_041571_B409E72E 
X-CRM114-Status: UNSURE (   5.76  )
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

On Thu, Feb 16, 2023 at 9:02 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Replace open-coded init/exit calls with the module_platform_driver()
> macro being equivalent.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>


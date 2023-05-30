Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D074AC7EE31
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 23:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XTDjzev2g/dFwqXAbBNLlrXlZTn+kHPstDE3zCS5cQY=; b=Y7Njy+IubQGLWUKelZvBHgdzFG
	ibKOr8qhqbmCDUZU+pPfCM24wVUT49IIpGk0+vUZ6eEKJ7LCQq9fJdAnEMdsKDQAXZkixUmO3oB9W
	XIrMsOU4hmCtes7Jj8qP4yba0n5vTRm0ta3fQUUwrVZKKyrflWXSE+G1dHiMXLuMbZeiZZnYBDjlu
	/BVm2Cs4Epd8bG1gS/Q61NYsHPA6ECtyndK8ZT891H72+U9U5yxKzxte2nll31FyCejZe6bcX6V01
	h9BAPv9mRvWgSaqI4HKiEPxi9nCipMwBl2OR3yeiWg4UWaUdZbwVRTPIGAv5DaX1cQkKOgfWQMAdj
	NWh7Tv8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q48QC-00FQGH-2k;
	Tue, 30 May 2023 23:06:32 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q48Px-00FQ88-1r
	for linux-mediatek@lists.infradead.org;
	Tue, 30 May 2023 23:06:19 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1b0314f057cso23782895ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 30 May 2023 16:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685487975; x=1688079975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XTDjzev2g/dFwqXAbBNLlrXlZTn+kHPstDE3zCS5cQY=;
        b=GUpfbl+sC9QIc+kIV56cwMaviZrBRnvqS3CIUdUd6vOC1zkRyJf4Ad8fOhD5VXs0Lf
         8eUIAPNzc6PnrKqn7mCyaAW81LriRxS7r48I6U0BXV0AaQIjsEdckuShmd32VTbQXR4J
         Hh96JXPWeuMwLpRkDOYsuLjQiUxaXAteiTWYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685487975; x=1688079975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XTDjzev2g/dFwqXAbBNLlrXlZTn+kHPstDE3zCS5cQY=;
        b=HpVMFOR+0QMNc72CChn/CDdwDt/Sv35svo7EvJ3FaROOCyCH99qfL9yJFTm/rfTgrh
         UojhxIm01Xgurz0in/4MBz3VYHHzhnQ4a561NehlneDsrXCBueeh4glvYQLekYjL/3se
         ENtihmXRyWQkGa1hJZUpFpZswNGPH9mn+V/kePEbzT/8ozBGvb7ncTazTT7kLlX4Z/V3
         33Ix9k6PHct69XCKeGn77SQGDcbUMpOfXoTG2xexZGZ9R2bJx3OPJNYxpQP1crV9XAGA
         OKDsJKr4LnQJxOg95v3d9EOxNJ4cWbFoO/feet2kliDH1C/d8sV9qlqJOxPccM82MK85
         y8pg==
X-Gm-Message-State: AC+VfDzu3hnpaKs2hY0GqPw/1jM84m0k3/UX+DpjWcFaM5Q9aJm6Chd/
	7dxJ1qNbycDQin6qCtMu34h0MQ==
X-Google-Smtp-Source: ACHHUZ7lVzzQbfe9FHzoVRjHe+lwb9YnUIYN/bR8MPHORNI3UhJpQCoHt959/WC7Eg62hE/pMm6l7Q==
X-Received: by 2002:a17:903:2449:b0:1b0:42c0:93b2 with SMTP id l9-20020a170903244900b001b042c093b2mr4463117pls.45.1685487975185;
        Tue, 30 May 2023 16:06:15 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id x7-20020a170902ec8700b001ab1cdb41d6sm10800248plg.235.2023.05.30.16.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 16:06:12 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: azeemshaikh38@gmail.com,
	p.zabel@pengutronix.de,
	chunkuang.hu@kernel.org
Cc: Kees Cook <keescook@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	matthias.bgg@gmail.com,
	linux-hardening@vger.kernel.org,
	daniel@ffwll.ch,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	angelogioacchino.delregno@collabora.com,
	airlied@gmail.com
Subject: Re: [PATCH] drm/mediatek: Replace all non-returning strlcpy with strscpy
Date: Tue, 30 May 2023 16:06:03 -0700
Message-Id: <168548796307.1350188.12826442108899002892.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230522155306.2336889-1-azeemshaikh38@gmail.com>
References: <20230522155306.2336889-1-azeemshaikh38@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_160617_665792_3A96EDED 
X-CRM114-Status: UNSURE (   9.59  )
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

On Mon, 22 May 2023 15:53:06 +0000, Azeem Shaikh wrote:
> strlcpy() reads the entire source buffer first.
> This read may exceed the destination size limit.
> This is both inefficient and can lead to linear read
> overflows if a source string is not NUL-terminated [1].
> In an effort to remove strlcpy() completely [2], replace
> strlcpy() here with strscpy().
> No return values were used, so direct replacement is safe.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] drm/mediatek: Replace all non-returning strlcpy with strscpy
      https://git.kernel.org/kees/c/99ae1670e488

-- 
Kees Cook



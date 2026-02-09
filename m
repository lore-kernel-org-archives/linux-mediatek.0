Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A408CE81BDF
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Feb 2026 16:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cmy/Ly/aXsHQgzu/qcl33zGOHZYsPRhFpNl3iB5uL/U=; b=htNTcaZESLlAURkiCXUOpUvcrq
	04OexFg3SksCPuTZV2OThtog+REn9F/sO07pk6VohteOpTqQR86gC9P/H+cU9JyT/XrL9oLtPyVL1
	ZzngTZuJWw2C1PiqUUCu3hZf/F4KQBVocuRPx0QSdDxwDlpQnYM8XFc7+DvIhtT8oxoEGFJBMx2C4
	JTRFXWA5PdlSsvtYz3QJy+T/xX68BfpE3jq7RaodgQAxXSisv09ZszR+uulEgoRv8RkElofitnKv7
	0c3UZm+z8t5USc30Kn19QVywezjoa44ueQKOQabwvCJUlX7Mdm0pUkGIVlBWPsCuN3D3/ds+l1Xga
	8OmzYmpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpUOr-0000000FiJT-0eea;
	Mon, 09 Feb 2026 16:46:13 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpUOp-0000000FiI1-162q
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Feb 2026 16:46:12 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-65808d08423so6861656a12.1
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Feb 2026 08:46:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770655569; cv=none;
        d=google.com; s=arc-20240605;
        b=Xyki8EEOkMSOMc1/WdF6hfaPaxIk7tpp1DwIeI+PdUUyeUTf/i8HJLFeg/w7dPGIPQ
         4JmXIwkFSwXMvIOsh81/n6IgaGHUQVZ6pO4Bcvqn3FGfpr48nRKz5vCC5h6UyFrCBMOF
         wRPs7pdNEA9A9EgjJz1JEmk0uBu2WOITs6xumE3yd76eTAZHkZz0vxW/LhIn/JfWZQu4
         y9jzoJc6u7wiSllZ3L5p/rxYGSBT4Nbcbcow+rK+Pn0la5lmOadBgHFL+z8B2/KxskTO
         PyWxqagXrK0Fb2aXZse0VFzvdr7WdG8rFYOIfBnJEhdKYDhSDOL8nJ0X10+9TsdcoEh5
         WRyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Cmy/Ly/aXsHQgzu/qcl33zGOHZYsPRhFpNl3iB5uL/U=;
        fh=rrf4DaCAv7WEhBvnIjKl+sqfzKj39tzOkgKs5xxdBoQ=;
        b=gTO31NIVOOiz8EKX4edWWtp6DLr+fx3k5xwRg7zq3joQ5aMfwJJJFy776HFYwE75Gz
         17jk6o4WRIoefoQ3ab/TdIjxGr+JSzRGxmCcNihVzQOLcoUjGTnNi+PzAXbQRWLhtHLn
         tWAsTR27tkjunBp3ikiHR1HbeDeTTl1kC2mfxXVmphLRtv8oboByW7wc+oAlAeGGKB9q
         i/nOAlPU+x11C6GAfmXnXweZ7RXBV/Rs0qzstnYnsbSPujjG8XpvyzbTaneqGcMtkQOE
         zq+HFE2K5Zy9xtosOtmclnEFzOBPeW5TCAC10Z2ATCHOTa/JbHugQu5RYmtDtKaM8tMD
         Hslg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770655569; x=1771260369; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Cmy/Ly/aXsHQgzu/qcl33zGOHZYsPRhFpNl3iB5uL/U=;
        b=H1CMJQpnVcXh32WGK4GUFbumBktkd5BKMY5uHpNURWL/7TL9BqB5NXXzLxzI6OcjYc
         dSAleR4ATU9QzNveP37sFfYd7Mxl87ae5h/IdZglZLhSiCQ2hpgYJT1F5KlLanCkDl2W
         j7vTaKRPihy8Q+mcmtYkAxFxsGqCRuL2vOTjrt1/Y7r3YqyjU8JtgK4P8DzKHJTJjoBa
         jDF+O4Wzespn38qfmCLCFg7bs5F7M/TW9SFWvgt8uTZZTA2xH0yHgk89SxSDfF/wCpSw
         GqP8Oh+ut8o6edRpnMB9DsEGzUJPdwhFpaPH0KpoOXbZs1VO5BFjp7454GYaTeMC7ocO
         WWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770655569; x=1771260369;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cmy/Ly/aXsHQgzu/qcl33zGOHZYsPRhFpNl3iB5uL/U=;
        b=I2vNpETTBGbXLT+UwFMQT6+XAReya74+O9I1BkRfGJkuHDR+7xMUllRS1tsDsKWweB
         KEfFAugCwUgIE6AZd23A3pb1+FBP0pLqsbgnLZfjCi1BT2s8/Y8yaalzCfDZQVov0UcA
         Z2qRSPHox1NRrx8eAeUp9wPZ6M1iLADo8pbTkMeY2TaVoeOudv2hpFQvODx831bFofeL
         XyrlEM61GbEQknoA3cQbdDE7G8rV6FP0k4ypRO+JDrdWLHyV2T8Aea4jXFq9wPeOLlqq
         HzTv3uAaOhye4dV03JBgjQNlMmiq/4AqHxBHk5l75EsmKPeGXIIL0IfuUfNZEipd5Nd1
         tafQ==
X-Gm-Message-State: AOJu0YyvgThYVFhbbw+qBjweuoSrWYy3f1I15gVoCzsjo6gNWzmW7NRU
	tmjViOXRF2ZyGdn0ZbdQBBvnNzpZbFW9YU9jwpNOcLbU8JmMrZtr9e73o7AuBeQJlFWTUL6AuYg
	+YrgW3D8ZSox9ckKdpA3ECt8ynvRGaDg=
X-Gm-Gg: AZuq6aJmgsElZzc4VGHwBGm0qoJ3SYGwSyHdZFwF1e6PmEfXXkdhUsD3CuUkui684lu
	/hcvsjXw8tdkOINzQqD6E2rcZW827id6YMtDuWXgbROS3g+n+Z5xvBVx8Bbty9AdlhhWhWj3Ds2
	G0oabj+J3/hNZsVRrvVpjjgW4eHbGvT8NCg1+o6ZCopglw/fYsV5w74xWfkMOiL+mTvNYPJx8y0
	47CI8t4BxufLd/FqtmCfm3bRUCXM67+Bnb5cKDPzanUJWUt0qri9AJdOoPCXg5cFbwutw==
X-Received: by 2002:a17:907:d94:b0:b88:73ea:a1d5 with SMTP id
 a640c23a62f3a-b8edf3ea285mr667122166b.51.1770655568900; Mon, 09 Feb 2026
 08:46:08 -0800 (PST)
MIME-Version: 1.0
References: <20260206122623.670023-1-l.scorcia@gmail.com> <e50c03af-309b-4a9e-99b9-048203e8acf8@collabora.com>
In-Reply-To: <e50c03af-309b-4a9e-99b9-048203e8acf8@collabora.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Mon, 9 Feb 2026 17:45:57 +0100
X-Gm-Features: AZwV_QiytXaAnMhcHoIRtNRAi7rG9xSgIkBTP_sI10eI0oNbM5rDJB87ycIrieI
Message-ID: <CAORyz2+KLdn5YPOQ3LSj5tP3SdLTBEceFyah6tp62gjOAU230g@mail.gmail.com>
Subject: Re: [PATCH] soc: mediatek: mtk-mmsys: Restore MT8167 routing masks
 lost during merge
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_084611_296099_B6BAF6B6 
X-CRM114-Status: UNSURE (   4.34  )
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

Thank you! I'll post a V2 including the revised commit message.


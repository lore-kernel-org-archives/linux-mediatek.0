Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E99BC369D3
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Apr 2025 09:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ECOXHvPy1m6u83HyWp0b6PRWuYparDalOzZlX1hnZOQ=; b=c4+6jN5ZAW+sG2K5bGxjCUF7h1
	U8p1RVxu3IuePCBa1OFfdOxEJqWWjyzXr8KqlAnseA+ZSpDeVT+i6dXw8vVWrpqrDxNeNsbpRO/vy
	LTMxsnuKQtJ0NHvM4L3cxLATMzAauaEj5xAZLZ0bGLLkrswXTkC2IrcNoHDcHpXPrMT2eZD5lmH1i
	NtYlj1hMB2W1VsScScvATC4B1u0k5QbcOb8LGRQL9+rZUjuz8c3+E1gE1RTufe2bVSaA+DpOSv3Ly
	sQlLJJ/KUJqbLiRCNiCQqgM1PdPIXqqXg8b8q4OO4r+AqJ92evTU0IYuMrJ3MBX56CLobTlW1zcIl
	vqCTMb1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7WhJ-0000000A3HF-3vYG;
	Wed, 23 Apr 2025 09:47:17 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Vgt-00000009nlS-2Qio
	for linux-mediatek@lists.infradead.org;
	Wed, 23 Apr 2025 08:42:49 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso7984871e87.3
        for <linux-mediatek@lists.infradead.org>; Wed, 23 Apr 2025 01:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745397766; x=1746002566; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ECOXHvPy1m6u83HyWp0b6PRWuYparDalOzZlX1hnZOQ=;
        b=GIV30Uuj7VGVMkKGvn8NxDc0+rtf2yw6UxrgiS6c66AUVOY+ylfjo1vttCzhoSth5R
         F8P6RYa9K8AZBu8P+6/gOOA7cJbdl18ms/6gY7X0EyE9Td8rw+t8iqXAwgRUqEJ0xEdN
         LQiX6sb10CDB3Zzi8XId8u8z4GYhYf7kLLPMXdTJ/9rvcrCn5GBWQiAXHvX46CoA3fSB
         5vXMD30uhEAamjqusAq9ZlS57zOo+qXmcHAifw8Y/rEwUX5xEUfvniMz9w4mAJc/TvfO
         AliBhg0nfi84ERPQctCpiso6s4rKwit1PRDpqP0dO+jji/Me2c+jcY5hbIyraY79r8zS
         xWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745397766; x=1746002566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ECOXHvPy1m6u83HyWp0b6PRWuYparDalOzZlX1hnZOQ=;
        b=nqTE0Xj4qoH0hDRjc8M3ApMd57wpvfvrMAuF3lVnOrga5z2UqS72UAZOXNQAZjiq2q
         wdPi5hWc8luwSrZGevSOZs8JvUnNvFAJ9H0hgx4tjJv7VPorUXntzbJYYsqS59Ax4k0J
         V8NJ50fyiwKiDiGwk3jFrgxBqHT7Bc+T911wd411o0+y7I78dAk/Ss4qr59Qr8VZtvrL
         XX5JJk6JYnAaHxnLh4MFLgFDm5BXE0fmSE4S283k4pg062v8aBWLBCcL090TbWS47W+M
         LKW41GmohCxD9EjJ+P1un6al20IFDlA6QanL1QMF6k94d4YaP1YZVj2oTMrrL6qSUDPx
         C82A==
X-Forwarded-Encrypted: i=1; AJvYcCWFzsT1L9XwiTCJb83arRxD8tGfNJp2sZ8k+46J+0wPxarT80hQrcFzcCswTvatYtckgWlt0pZCvcAPk8/E0w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwfTctibpEIaDJRif8NBFP6AFK0M1q1fg5Ko0GVMlEdXrwFPhGv
	KvFp4lji2V4N08uORZgbOoFAH5UcUa/MvI7tWWkyWUFV6HZTvq6pbJaReOwvd4x/7K0fSGH963L
	sTAYYunViwFgGqb4n+u8OIBIyhYmsdXv4IcweaA==
X-Gm-Gg: ASbGncs6T3a7DpuBcJvHXaNVDAAl0l+SEuKrVvUOiNtc8PoiPphT5c+QyqKv8G8L9Iy
	GSbkfgqWNu/ddbBDHEOIhtNZtfcy6eQ7eMkRqwdwtD6MHy85pforymgzi04lQDAOtELh4zfz1lP
	X5zXf0bn2nCcXxlXrQBnSUog==
X-Google-Smtp-Source: AGHT+IF/9nczjT+/oWrcGPQu6RRK0VMd+RPdPyXG/CCLKRQHhZRImrCsqO3mNIzSHj966SqZ9meSOpaq1WCgkHTJSBc=
X-Received: by 2002:a05:6512:3987:b0:545:a1a:5576 with SMTP id
 2adb3069b0e04-54d6e62bf8amr5062499e87.22.1745397765600; Wed, 23 Apr 2025
 01:42:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250411084159.3307-1-ot_chhao.chang@mediatek.com>
In-Reply-To: <20250411084159.3307-1-ot_chhao.chang@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Apr 2025 10:42:34 +0200
X-Gm-Features: ATxdqUECxAVIQqbFYM6Ibi6XkYyTlVovD9mEdGmf4ii6T1onYXMYyalIoDjWE5Y
Message-ID: <CACRpkdb-+xhugxuAif_X0KyxOCgRr5LihzF0pUkviUzwZQTYCw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: pinctrl: mediatek: add mt8196 eint pin
To: Hao Chang <ot_chhao.chang@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>, 
	Qingliang Li <qingliang.li@mediatek.com>, Hanks Chen <hanks.chen@mediatek.com>, 
	Chunhui Li <chunhui.li@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_014247_635242_84E6DAD9 
X-CRM114-Status: UNSURE (   5.59  )
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

On Fri, Apr 11, 2025 at 10:42=E2=80=AFAM Hao Chang <ot_chhao.chang@mediatek=
.com> wrote:

> Add eint pin support for MediaTek mt8196 SoC.

Patch fixed up and applied.

I recorded Cathys affirmative reply as Acked-by.

Yours,
Linus Walleij


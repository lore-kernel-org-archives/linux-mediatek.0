Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8303E6B26E
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Dec 2025 03:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pd2hd9AEX+WskWeDqJXxKCyLLtKBcx0KAJIPRnzr5Xo=; b=RbeI9FXrvnSmtJwWz8MC+U9PUt
	pqODAzZir6H7B7eVJpWdD+HZN/wD0FVqAq1hgA2BZt6xxWWUBn2iufEjgtuG4Z8ggLKk4vEg3JdBv
	IYRdgjUZIDlIt5UtW8R9OZ3S+L4mukUm2cYid1fSImssY0XX8xon3jmXddTn2KdyunBpl6zuENjY2
	siT1tDnOxSV2tpOvHRew0JJvz3VO/t9K0dUk/9huMDR2Bv6zXnpg96x1t8KprTM4FpLQwcR7xdYgP
	my9HLF8+8S8r/p8CHzAs6n9JOyJK6dmxc4xztDN8LhUwqbz72J9OAmHwKIE9VXUp+WCJXcMnQtJZu
	L7ZM3QjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXsvv-0000000ESwI-1gcg;
	Tue, 23 Dec 2025 03:19:35 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXsvr-0000000ESvX-38zj
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Dec 2025 03:19:33 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-598f59996aaso5872944e87.1
        for <linux-mediatek@lists.infradead.org>; Mon, 22 Dec 2025 19:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1766459968; x=1767064768; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pd2hd9AEX+WskWeDqJXxKCyLLtKBcx0KAJIPRnzr5Xo=;
        b=A9IC+vEhyOfYMqdG6UMXFm/tzReo+zRwY6b9JFYSmBwyQogqJMNYVXC0Sr9Pj1EJ+6
         lZVqpIQtkLFNCkpEt/h+pB0H9XTnvATpz6z3n0Zmv3R7KLwEqCyfjhcPYMzfh60jp4+e
         uHn9NuGPxh0aBNmzlM/rsm8U/flWb+Pfrgxh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766459968; x=1767064768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pd2hd9AEX+WskWeDqJXxKCyLLtKBcx0KAJIPRnzr5Xo=;
        b=Uvykpo/Uq2Ll81xmuCsCeJNnBH1a/l42E2OdqjB71W8khj2Aap4yPRIsGnmqCNzYet
         GGzIw1CYzBKPdlYXiRlmlIqY9LNatx3QPXawuFBQWFlfdel1oMfc+1tUbvfs6UkKK4Mz
         q6WE6C7/QgFTEdYWtuMUxPQz7KpNhbVVhW9FEGqM41sKPPS0a/8MJCLMil/aWCQAufRw
         UNoVQEgOqKh5CZq43kxwHJeaxwY3aWl8cgx6kLdv1WoN71GiSiKuAfxZeJ41xy0+XXdK
         M3AEjlW/oq1PVjLfIjXnDT3iZaPRPiGiK1TF11hds05be12CL3bb06ZbSuj0NjTEfXKf
         BKew==
X-Forwarded-Encrypted: i=1; AJvYcCXDvpAiFka7s4FxjrA1Dkhrx9DlqyyPeYjJo2CYLcQA55THGH25USzkF9CW/XxzHPq2+p71ciLJGXDArW0zNw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw02Qd+2ir0RexDAlgI8i/dqHG15pudOBE0Uqhx0xouPrKC0GKE
	VzDJX4kl5cyR3gxfWtEtxu0161/eev4h9NmfqqZTCT9HdifxN6lPxCGr1Mh7tSxap9+yW41W77Y
	tJiQrWQCdvIjA1Vd15t8/n6pzxpNyQY6Ee1/BUvOX
X-Gm-Gg: AY/fxX4NFQSN36Y/zy+gm7O7s3n4rLact73I0g1il7hwBdes3uathkM0bl24yWSLemR
	kbL6kYUDW1BI9x54zg8tU9kDa4kR7Sj6G9MTNHpcsOfkvOfWFTnvkpQco2xQNhUFUUQB15dHy1F
	YmbgLpmmHptZAnlk/xs5S5V0gTRqqghy/WtzqtDuj94utkia8C9dNDymg6pucgsM3+2s3DzkTy2
	8KSAhv/MaOZY8WP4aALbFzEY8fINfRivYoUqIwS3VK8S27/sEeXDdvzBYLEmZ1SRN6Zo/J0vQ==
X-Google-Smtp-Source: AGHT+IFy9AOL0XZAW314iBU7PN1wAQk22EnHMu31kd1tAVh11JfXOyXoRocWK3NJXq6iWOnv76XMMgmNoj26Q+851TM=
X-Received: by 2002:a05:6512:4011:b0:592:f72f:c1d8 with SMTP id
 2adb3069b0e04-59a17d0ceffmr4689655e87.16.1766459967809; Mon, 22 Dec 2025
 19:19:27 -0800 (PST)
MIME-Version: 1.0
References: <20251222150235.34919-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20251222150235.34919-1-bartosz.golaszewski@oss.qualcomm.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 23 Dec 2025 11:19:16 +0800
X-Gm-Features: AQt7F2oIhxgGHerdzbiWe8ZSd5-OTgGfh7cSzAPDbvOiCtJ4ezQNimNvcoit_0Q
Message-ID: <CAGXv+5Gpf+U8ih_QvZmEwSQgkb2c0wesLNePCG=eDqy0G7F-vA@mail.gmail.com>
Subject: Re: [PATCH] clk: mediatek: don't select clk-mt8192 for all ARM64 builds
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_191932_070585_6CF1C1C5 
X-CRM114-Status: UNSURE (   7.97  )
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

On Mon, Dec 22, 2025 at 11:02=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> This option defaults to y for ARCH64 meaning it's built even if we don't
> want anything related to mediatek. Make the default condition stricter
> and only build it if ARCH_MEDIATEK is selected.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>


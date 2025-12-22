Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A6DE6B25B
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Dec 2025 23:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1PTRj5IbPheHyKPLUeQn09lt7a0KA8xUVM3vs4ytqHE=; b=PQNRuCCrkl987uTX4C2F6HFY5z
	T+OGqkiR1hIGFKf99NmN7y818qQvNY2RhQ+pIG0XVQhiZ5ZjaADhnh03qmUYUGyDTo++CMoiiogC0
	8qFf9Rpk2jILyYEY1NFUNKcXfzveUaNGmJRqTnvXwxTLhC7dqri2+3NNSXqW5vVUUqq5qaOMz2BxO
	XjqjcjlE6+lLJiDCLVlM5qonqvFTx9rjn0Jfw2ETBReXUy65vzEWokrFyMOYn4XSjHFDfwVADb6wR
	3NRuKGA8pF+G+EcKJWCcPihCMZFrAjXgzd2foUFQxnzXfki85C/WGG7JyJtFCcF1s7jgsd1gmmVaH
	0m+ON91A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXpB1-0000000EGCQ-34mW;
	Mon, 22 Dec 2025 23:18:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXpB0-0000000EGCA-3DPt
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Dec 2025 23:18:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C920860172
	for <linux-mediatek@lists.infradead.org>; Mon, 22 Dec 2025 23:18:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77DA1C116C6
	for <linux-mediatek@lists.infradead.org>; Mon, 22 Dec 2025 23:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766445533;
	bh=1PTRj5IbPheHyKPLUeQn09lt7a0KA8xUVM3vs4ytqHE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IHKlr+6Gl+QA6DaryNduIe7WNRMfP/E6B1HbR+itsvFugogI1qMmYADh8rnIcXmNK
	 PKRGX1Eb/Hn/078PsXt6gwtRFo7Gg1sFUlfWavz7rQFCxG5psWmo49HEAKbqti2/fz
	 A2il37qqTBEs6Cw1bCzYM6zJeOUKjulJ1zJo8luVkqsRxNWYfeB+D6XxKrCu8UW3At
	 JNrDfJJ1XxNdiY86a6wVSUUf0yCo42r0DBj931tkjFHjJfmryQmXqOEIDoAdcEjBbH
	 s9nXS7azO2fxm1zST5j1Ek8F2UutDiI6uNawqwZzIkim17PjDCkfsgtx5Qql5JmZlY
	 r7c7KNDBSTy+A==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-78fcb465733so19061607b3.3
        for <linux-mediatek@lists.infradead.org>; Mon, 22 Dec 2025 15:18:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVr68HUGzTNpk+bKxc2Ibv4kuvom17o1d5VxulMU3R0U+2Y+IFaW7/UalNKmtOJ3qpBJXshH5hF3URP/hD8rQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyoyIDWEW0t2vu+qQk4pPJbOYLb99xhIQAZgVj79ewFA2wlhT1o
	85OM8tMM4lUAIvkRmW6d9NdxxH8q5NvrL4+SbqgkmQFwoUP/orV28gv8uQ47QORaUmBA3sx4vBK
	gsfOJOPSUucf1EtK+3/ioNTp9BnYLRiw=
X-Google-Smtp-Source: AGHT+IFLuNG5vfFv+hvdMwlVrLtVEINXP+UqBdcB4yXJij0JrDbJSKnUkVy8zi/D+KeXicJLx2KQRsl8vzD85DfIxMQ=
X-Received: by 2002:a05:690c:6c84:b0:786:827f:6fe8 with SMTP id
 00721157ae682-78fb41ac9e0mr105561577b3.58.1766445532634; Mon, 22 Dec 2025
 15:18:52 -0800 (PST)
MIME-Version: 1.0
References: <20251205-drm-seq-fix-v1-0-fda68fa1b3de@ideasonboard.com>
 <3b13c7a2-f7e6-49fd-b3bb-3e0a1fe9acf3@ideasonboard.com> <CAD++jLk8-0Rkh16T+R1dh6=e_f9U1i=AKOk1Y8dLGV4bxzRtFg@mail.gmail.com>
 <817b2358-0920-4b7a-abb1-133103d0f9fe@ideasonboard.com>
In-Reply-To: <817b2358-0920-4b7a-abb1-133103d0f9fe@ideasonboard.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 23 Dec 2025 00:18:39 +0100
X-Gmail-Original-Message-ID: <CAD++jLm_0xweD4tRJ8ZfwmcOe2BBGCsUuL1UWUiNM+Gpbq3Zuw@mail.gmail.com>
X-Gm-Features: AQt7F2qVusB26rJf3VFnv1cbbMcmw7gQTV_3PZwZEvdew2fS2i_2TmDT15TKrTs
Message-ID: <CAD++jLm_0xweD4tRJ8ZfwmcOe2BBGCsUuL1UWUiNM+Gpbq3Zuw@mail.gmail.com>
Subject: Re: [PATCH 0/4] drm: Revert and fix enable/disable sequence
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
	Aradhya Bhatia <aradhya.bhatia@linux.dev>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Vicente Bergas <vicencb@gmail.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sun, Dec 14, 2025 at 1:42=E2=80=AFPM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:

> >> Should we merge this series as a fix for 6.18 rcs?
> >
> > Too late now, so let's merge it as a fix for v6.19 rcs!
>
> Ah, right. Indeed, I meant v6.19 rcs.

Are you applying it or should I?
Not sure if you want some special timing, like outside of
holidays.

Yours,
Linus Walleij


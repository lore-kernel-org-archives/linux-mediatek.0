Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE94D2F7EE
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Dec 2025 12:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=40WaPL3xSyqPdfQ0BAFTST386p7tT1HulIdRWXHJkKo=; b=ZaBoubHGVwQhVsnCpZcbcU0NDt
	f9JufNiJotRbePMR+NcgH9ujnPySFrvSCcq0AGkY4Ztftbke3nyxXDrXdWmw7QuUl8ut8gxEP7qEJ
	Q8p4rnbl2KRF4KARsvsq/e82KMa6iWw/qJSC+BK+n+bFwj7wLxLhTKFhPgxqVBpBtVii6+V05G9zi
	tlKFZz7pOE2klMhlBASzpwdmpGIfknSBRZXIAQMj3FPZ2oGvBaQCSZeIPh1Lh2Qwji1k9EGEv0CCS
	8BWgJKpdwdizpvnFfQ78DENYNfAa1dN+xpIkn3PTDNSG412sI3PRoXeQ12gt/Kv09ghBnJfnu4j1P
	BzxLPOyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRV32-00000009U4J-157s;
	Fri, 05 Dec 2025 12:36:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRV2z-00000009U3L-17lx
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Dec 2025 12:36:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 611AE444A7
	for <linux-mediatek@lists.infradead.org>; Fri,  5 Dec 2025 12:36:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FFEAC4CEF1
	for <linux-mediatek@lists.infradead.org>; Fri,  5 Dec 2025 12:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764938188;
	bh=40WaPL3xSyqPdfQ0BAFTST386p7tT1HulIdRWXHJkKo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kA9jAiXM5XfELxuKU9/l9OpMOt7HLiUaJi/7R5aGry/eGkBeBaRtm1w9auQ3EGkDk
	 daZ1xEFxRCUxO2MhMrxLlHdzG/9Cu39Wj9QBJ5/OF0sQfGnnx7a4bL0FWzsUaRCSxr
	 GMcrXuuIOSvQDiqpufJzCiIGhx0LiwbHjB8F1SFsWyde9l4ZKQzGdkljBmfTpIPDTC
	 4xkAZ58K5JMAiu3XuGb36DJ6WypdTSVnzfpxILFJJKVOd2AJZH+tgSvVDBrx/j1dAt
	 TlNwWkvcoEH28P/xAPkWqu/tbBWQw+fvin+z6lcsIWsGHpn75h1HSrTV9aQWP99VJr
	 5h8spjUvoS/mg==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-78a6a7654a4so21446387b3.0
        for <linux-mediatek@lists.infradead.org>; Fri, 05 Dec 2025 04:36:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVIo26HWlMrs23mlNlT2yH7S6/H1wdEHGQVAXq3J4sR/Pinf0HHkry+zm9pIXuFQ746nIlj92gRYVr2DP3DtQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8pU4sDy1ZagT6/qkC1PSFbXml+csNKyrp3X7tONEqrGZYtq1K
	IBS3nChWthQmWyx0PfJi9xim8GNHR2kjZ83JcKYjhI1KY4Q6dl+evYkuaS2QAzMYGBfX+USwZbC
	w8e43zvH+5OYO+1XR0m5OE5DcVDevp4s=
X-Google-Smtp-Source: AGHT+IFJmlLvuUNZfx9GIfUBDjC2grftRlFjbvDqqrPRzj/oZgXVOMBUT7kbSYooxA8gr0guXcBsmXxXrD2+uuIJcXg=
X-Received: by 2002:a05:690c:6007:b0:784:883c:a88d with SMTP id
 00721157ae682-78c0c18ea37mr70979807b3.52.1764938187032; Fri, 05 Dec 2025
 04:36:27 -0800 (PST)
MIME-Version: 1.0
References: <20251205-drm-seq-fix-v1-0-fda68fa1b3de@ideasonboard.com>
In-Reply-To: <20251205-drm-seq-fix-v1-0-fda68fa1b3de@ideasonboard.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 5 Dec 2025 13:36:15 +0100
X-Gmail-Original-Message-ID: <CAD++jLkpWoHe5qYSABF1GeDq-9hZh7ZdL-+8Xqu5MA_erzNqsA@mail.gmail.com>
X-Gm-Features: AQt7F2rYtL9k7rH39ohC1dih2VUr1gAYC2XO7dYs8vpOSbzH63P91fhZJWxLMZY
Message-ID: <CAD++jLkpWoHe5qYSABF1GeDq-9hZh7ZdL-+8Xqu5MA_erzNqsA@mail.gmail.com>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_043629_341858_01775C1F 
X-CRM114-Status: GOOD (  15.94  )
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

On Fri, Dec 5, 2025 at 10:52=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:

> Changing the enable/disable sequence in commit c9b1150a68d9
> ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
> has caused regressions on multiple platforms: R-Car, MCDE, Rockchip.
>
> This is an alternate series to Linus' series:
>
> https://lore.kernel.org/all/20251202-mcde-drm-regression-thirdfix-v6-0-f1=
bffd4ec0fa%40kernel.org/
>
> This series first reverts the original commit and reverts a fix for
> mediatek which is no longer needed. It then exposes helper functions
> from DRM core, and finally implements the new sequence only in the tidss
> driver.
>
> There is one more fix in upstream for the original commit, commit
> 5d91394f2361 ("drm/exynos: fimd: Guard display clock control with
> runtime PM calls"), but I have not reverted that one as it looks like a
> valid patch in its own.
>
> I added Cc stable v6.17+ to all patches, but I didn't add Fixes tags, as
> I wasn't sure what should they point to. But I could perhaps add Fixes:
> <original commit> to all of these.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

The series:
Reviewed-by: Linus Walleij <linusw@kernel.org>
Tested-by: Linus Walleij <linusw@kernel.org>

In my opinion Laurent is the more senior maintainer and my
trust level in him is the highest of all the maintainers, so
I think we should apply this revert series if
Laurent ACKs that this is what he thinks is best for DRI.

Yours,
Linus Walleij


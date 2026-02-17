Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA65BE909A9
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Feb 2026 14:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w7/ZxD0gyzUi+GQ6guwRmxS/saZ8Vlcke1WYSE/BbT8=; b=IQyaSINSOw8a1zzw6HczaZDXtF
	PysEBtnRxYect+v36ZritGX4kcTEQRJNZ3673Ea7N1sLtikU4YtNOAZYMVq6LIM7KiOLel3YhJtOO
	wViLY7xo3wIBngJ2GYZ03j6axUzVLqudpZBJr5eQYnUH53ouTVChibEj4ZEL/Gxl852eaQ6K3OL4X
	ShU13fLRd2EBpqzwIks/SQEGA9Y7OUwEXfcYMfLny853wTrx7ahyrNG/22l3HINeKhQZGJeL66DNL
	ipycarOBYodKeINClwKOrQgHlvZAZ8mAW/basTSzTLWW3VKdzskdPY+QkkhcNUsZ3oQLqSJLfA37g
	O29HbEgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLhy-00000008OXK-0ZmL;
	Tue, 17 Feb 2026 14:05:46 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLhv-00000008OWD-04ND
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Feb 2026 14:05:44 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-64c28495b3dso214205d50.1
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Feb 2026 06:05:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771337141; cv=none;
        d=google.com; s=arc-20240605;
        b=TPYjf+Bu0Hv3OIGIkV8KE40T6CnkBGKjauJod9HNhV1zsen0mbn651murynLcdGDW8
         Js4uUm8Y/1ptH/RUl/ozJW5pw0Y5Z/BGN8+e92RaBFOj9FOR7wSlgQxLiP27WZ57d4k5
         7bAGGEdOmexSv0BRaNrTxvDudP95dbuY4j0xlyq/mRZHUZWLgeRWRmog6i+ggUw/XEpi
         ktGWVw2JPEtKJ6G9dQM9jW3ZRQNf6a4SzZaZZzgXNwfKjXvWy5J0JFFdX38dFe+ZwKt8
         dgrBcOa8KpQ972Qh9G0AKxAMWyeM8swucb7JyjwCxi5FbolXFg111sfpTjNA66o+A3/L
         Pgqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=w7/ZxD0gyzUi+GQ6guwRmxS/saZ8Vlcke1WYSE/BbT8=;
        fh=p/sg+1GdMg8TqVgPIzPeukuA1IV8ONtGXe8OX5MidMY=;
        b=HxqxCHzOfpCqsp8uvp5/IAbVipx4CRfXbZo8X2nulAtnqqX7TbgT72whl0LfjZqyqW
         x7jfoQwi526YY/5ZXZyfdAO2MDNknUPeMgK3xLInH1snkQl6F45rnkDKZ9hvOrtYNORv
         SsU9V2ltq+u7ucPeKUQ6jmbOWYOY27L6ER3rmkZH5aWjHfrn+iI4mi2vyadrLAlTs/VE
         TPLba5bJwtBh7P2iVq1aepYQCIRApoP3/QWaGqPScoHTith0+Zdren+hdybFjFebc0VC
         c3liIZr9l3A6CXK+jzmTh/XxBTFhzUq/WyaHl+Rd5RSnjh3g59XhaIaWOskg/6ELXE5I
         1RwA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771337141; x=1771941941; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w7/ZxD0gyzUi+GQ6guwRmxS/saZ8Vlcke1WYSE/BbT8=;
        b=jEToiA/52kZg3odX3YQh5LhzQ0tfP5rMXkvznN4OpIunh3RDsxXySzLNkiyg0eFPMr
         hD4nQaaMbSTfX7ufmm2aiVhGvH/4Dg1l+RrHuqB9foPE8W3hvuttid/+ursHtQ/uciDc
         JZiPwkpanbT/msJvX3yif5zzAIAfvLEqVm/CCLcATkoMWwMXB+61+WQpmSssknvrQpsd
         SqCmnyqppI8m66yx91Vf3BKE8ajhXw9z6Iz+qs9HUbx6Or6Va29aPMZCqgezNJzz7f/4
         nmjemHb1JQ7AY/m8aY2ozlQSITCHUeJpLUHsDLRMSE6faGddgFfDE5k0D6Zy+tdda/ld
         BgPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771337141; x=1771941941;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7/ZxD0gyzUi+GQ6guwRmxS/saZ8Vlcke1WYSE/BbT8=;
        b=VH2KhitsDDL83kFzXR+xSSae1gwTn8PrN0tKBL8XQjYBlqNIfLB2W6EjqRU8pvjYEz
         QSkWRwOavipV8qGbGO35LW72qUxprqkeUKX2T35nwWGCqbHbWKaCPuCN7AL3xke5P3Qa
         taZY+Totf51rcMmcsqFzMEbVG8ZpV0yAlsHFwpK7CB0VDGz8d/AjWxqqF1b4debBWPCU
         eCyTift5O2yvmogyF0RPXdWo3x99M9h6ojvjCIcGmHEXTZp2XKbhVzhpVflcFt0Kd7zY
         enUenRzomvEtQIhvbui/epw5s7LB8a9rEa8egNGk3fW31pD87+lUnA+A8wfWjzfRkLaE
         N9vA==
X-Gm-Message-State: AOJu0Ywr/jK5JL9dwrmBTaMb2yvUcUa7nK3YBzie1o3yPuveIqqQNdJ7
	91IfblIyUHMZzS6WJuOIyj9V2czpNBBMYOML5tcF0TpPx0+mHThKbL3VEkS4nicNZB1B9xi5m1w
	aCSuuy3HPyXDkOWGBgOgWg0nVM2DHyrs=
X-Gm-Gg: AZuq6aJmN/bTLRoD3PGg16dubiMigiNkdfjG+eD6x21jGwmvuWJkTJmGxKQsFEfytnM
	SSz5a4dz7+tsgAvugUhbz+4851ijiJKkHqM+zR8v6ibhMzs/+GXASTSV/W3fmIppovrWADgX7Sl
	LzTTo1+emDpoT38eSO3uM4nfgcyCpZaV8HQEnf8kmyj1wlGoK3p6aHfYvY0sHOyFu0Jf7gERg4E
	0TnChClOQBSxwOxvMk/PQIyWrOTvyI5gL2DzEA7SjhZzoSAZ5yrz2M+CyAbWqTynTfGoCfSx6ZU
	IMuEUA==
X-Received: by 2002:a05:690e:1c1c:b0:649:f09d:a6cc with SMTP id
 956f58d0204a3-64c14b29c19mr10963024d50.1.1771337141377; Tue, 17 Feb 2026
 06:05:41 -0800 (PST)
MIME-Version: 1.0
References: <cover.1771258407.git.l.scorcia@gmail.com> <ff920a7cc94f2b0c03d4bb55142030fded30d07c.1771258407.git.l.scorcia@gmail.com>
 <20260217135828.4hgbyhnz5nuzm6p7@skbuf>
In-Reply-To: <20260217135828.4hgbyhnz5nuzm6p7@skbuf>
From: Vladimir Oltean <olteanv@gmail.com>
Date: Tue, 17 Feb 2026 16:05:29 +0200
X-Gm-Features: AZwV_QiVnluoIVm_8_wyxtM9osk-BEP_4tSvKqw7PjMg4MAO7-oL-lW1MUMi7lE
Message-ID: <CA+h21hoTJXkJr4_KWtFsxUMeqOXesxk5WKZbr5GWHawAi=idKg@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: display: mediatek: Correct
 compatibility for mt8167-dsi
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jitao Shi <jitao.shi@mediatek.com>, Fabien Parent <fparent@baylibre.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_060543_063577_3BB91B61 
X-CRM114-Status: UNSURE (   8.10  )
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

On Tue, 17 Feb 2026 at 15:58, Vladimir Oltean <olteanv@gmail.com> wrote:
> To help the build test automation select the proper base branch, you can
> use the "phy-next" or "phy-fixes" git subject prefixes when generating
> your patches.

Ah, sorry, I missed the fact that only patch 4/6 touches linux-phy.

What is the merge strategy for this set?


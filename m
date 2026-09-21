Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397E2C982DE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2026 10:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/tDLQ7kiHFPBmC66BABbwtjlpncgEgg8G3PARGPN7c=; b=ACZBndxZA87noyQzXE4+Wyte0U
	BatrqdDwOYysI/kZo1Ma7xF/QSCNX6rspJFO5W6rzN+7qYlh8y9zn0DsOaSUAOmLfjxjjDhpRTsyd
	L5aug7K7nwiscwB6hs9z+0zskRSPkNCvdqLeC/eZcBpTeRYaSkGVsz8k7t+2id2VQbqOtL2iZHLUY
	wxhswPnIb1KLBOrmOw8ndvqkNRWHyhs6ICA+qVB6lKpq9QSX/o+rgl0rshrhEIOIu0R6Z1ukvjmUN
	tbMvabDvZcwJzF2nvLyQaAzeqp2iqW1JSDp/4ScEzAGYwEEVoqCPsB9wD8M6afpv2lzF54Df5TnEm
	zNKfbTJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bO2-00000001iPu-1cAn;
	Mon, 21 Sep 2026 10:36:38 +0000
Received: from mail-ed2-x10.google.com ([2a00:1450:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bNz-00000001iOw-0yEj
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Sep 2026 10:36:36 +0000
Received: by mail-ed2-x10.google.com with SMTP id 4fb4d7f45d1cf-6a6056be4d2so2274675a12.1
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Sep 2026 03:36:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789986993; cv=none;
        d=google.com; s=arc-20260327;
        b=lKq5nPlm4cgj01RA9VntFBolPERlzGcUanZPoI0+CNIL5yHDj3JTbUKA/mkQvZ6lXC
         Y75RM8NzbzwMsG9PGV+jmBuAU/kLJTHGF/5Nqrtdyd1586+6oFaopYJMhuqUHhUs1xbJ
         +ASyEUy+pmMESpKLoVb4zsFRuBlsAYMS49ETARB+IElI6HiwYoR6Wrt4fyc0IoXX2IA8
         YSgdA9rKvpc1zODDgdNYTPKilN4qo2bdUT1vMc61vyutqoXFlzQqMFuT44aVabTOXi8X
         TW5dLcCs04lqESBx4lxfd5EQYcoUwl2tOKdXA3+lmjD7ZKyEpfWFXM8xoX2xBa0d/e37
         tZow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=h/tDLQ7kiHFPBmC66BABbwtjlpncgEgg8G3PARGPN7c=;
        fh=ChRvQ0Hb4xhGzLZDBOfzrjX6Ttaay+75S05QsgsUkFU=;
        b=TkD9Q46PABNAt0zNJmLBXZHVuMAsXNRWdEvcwAxbzrWk7ZDjfJXqEABWJmfsVdC4dX
         y/bN2hohN6zwNvbgUwL/48pgUIYaV4Pv6AVtUEzVFJw48iewfaBmcBdrjADVBHOZzycn
         Px2hmJPoGxglcIpjb5MDUv3FM73Niqr4fk+44GA6fMb5tkQZYoqIDcB16eKNHnGnoEyg
         JNIYmR8VYk0KPSI2mxqrZFXPDx+k3+ajA0SxtJkDJe5BRO7afoR3Vw2hxYnUsg3hc0eV
         hVsxvFXz7Iqb1SV9U4ldvmfLuR5cbRwYrhoXb2m8Z09QoEw3rnbq0X8lYGfh864221YE
         G5ng==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789986993; x=1790591793; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h/tDLQ7kiHFPBmC66BABbwtjlpncgEgg8G3PARGPN7c=;
        b=E7oKYJCeNtTBjp38YI9ujQoKaSxxb/P/2mrMWbJkOKMgjxr9dOovteyixAFl+y9Rzh
         ix59L5e6LviBF4Q8FmXttNMAXL1ntZfhODdAt3lhQMFrHjyOIgWGhBxN5ALZX4rEYu7O
         3HltHGNlfeOLNUFfGHOGNYDa/ATnShKdZy19C64zAzteNMgaJwj0FKGViNK1UGeEDCpq
         PuMpsoDFA6adu0YBuUEPXpOzldi94HUVu0C+N8Q/BssTAh/FLycX4nCiA+qRCjre+t6z
         Rn7GuO/AhYSoX7F9UdrmMZsbidTgG3NegnzvYXswekWsb1zQ1Ix2X047n9vc4QtvBpGu
         qz/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789986993; x=1790591793;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h/tDLQ7kiHFPBmC66BABbwtjlpncgEgg8G3PARGPN7c=;
        b=Tv7hRTAH4kKKnzBPFcyeL+sceGqiR1mOK55YYTZ8S2bA7WEZhkV6LV3qjhARsX5CwF
         8g6Gzsuov6Q2s0EbwxJZTuSaNBWu0z/Mrxob/M1eN0hJ+jtnIvCOf1Z1FIsXMiukTSVj
         cSf3u4zvyPOKXu25onl9nFycFuxG3wdag32s7lirWA3GiqHSJWjldxNqWssl28/nl8R9
         ICs79DoVoUKIsZj2gHoocDsWdUdbAwxjhJlUeNPBiJGxLPyv7XIJo9MoGMlrKxXruI7l
         BtSFkjVIKKVeoRXg6KsACZVT3oB1A3z5YcJj0eWNXlw5gTXkkD/qDXU9BkD9YWvERxoH
         6iVQ==
X-Gm-Message-State: AFuF++kbelzs++AxTYqtJQK6WS7WpgbvXNmWLdFlr7nVn8qL6BxQOc0Q
	K/nPwQcaEmDM+Oeh41eKSHoUDA6qUIlkL2dgnF4TnT4/vGOuvu/IycTfTzBLdHp+/B8ICaI2jBz
	0xhd7ulkQbwNS4ans0tCzdJdmZD1DyZU=
X-Gm-Gg: AYBFou3sG91OwFKBuf1iiEzH3s/N+tjRqovZNn94AlLrD3uPbPmkejGVh6xDhZyWkfF
	OYxOeFv7d/FTbuop/JUyoLRfYh8Tq4hXNdpVle1snS02KuErD9AsUCqETfl1z+38OgTZbpANo1A
	vKYvpyz500eaO4Flf0u6cDQfm+iVKkgpizD0Bf52axz1vtdJmPySb45FkicwGwexWlJrJTgYg8R
	xK3QBMjS5RpgzNTdkANDjxzTa243n9lkrf9m9CLfzEC4VFC5BdoH3J4hFUXx9QKtaUzdzyqdbPt
	A4zLWZVxtj9xtVWDYZ6yBuzdEBwfgAbH0PvlMCdjLQ/HOdYjOMdoXw==
X-Received: by 2002:a05:6402:4547:b0:6a9:f88b:14dd with SMTP id
 4fb4d7f45d1cf-6aa4f97d7cfmr6238277a12.1.1789986992392; Mon, 21 Sep 2026
 03:36:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260918175736.355305-1-l.scorcia@gmail.com> <178998607025.21155.9680834242820851509.b4-ty@b4>
In-Reply-To: <178998607025.21155.9680834242820851509.b4-ty@b4>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Mon, 21 Sep 2026 12:36:20 +0200
X-Gm-Features: AcwNN1VQ6S9fCy63ty823Nyxcerwh9XF-bIr0lhnPcmyyBWQe3Ulp9EvTrhD9Cw
Message-ID: <CAORyz2+E9LY+6sb+0G-deR8ZVZK_xu+p_hvp8aKteVVhHpeBRQ@mail.gmail.com>
Subject: Re: (subset) [PATCH 0/4] Add support for the mt8167 display pipeline
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>, 
	Jitao shi <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_033635_308251_72DF9B84 
X-CRM114-Status: UNSURE (   7.23  )
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

> Applied to v7.3-next/soc, thanks!
>
> [3/4] soc: mediatek: mt8167-mmsys: add routes for all display paths
>       commit: ae0968038f994d6e275f5dc94a27325ee751fe58

I'm sorry Angelo, please revert this - I'll post a v2 with the
corrections spotted by Sashiko [1] later today.
Thank you

[1] https://lore.kernel.org/linux-mediatek/CAORyz2KEfzcJ_2AphkPU6o-YhLAqudCXVdY+LDoynUx_FsTMJg@mail.gmail.com/
--
Luca Leonardo Scorcia
l.scorcia@gmail.com


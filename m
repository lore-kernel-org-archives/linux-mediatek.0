Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DF5C7EE22
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 May 2023 09:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0wg6shwNIwwRwkhfOkTgCr9OKJegA1DzRyg52qKzAeE=; b=MxCn4JHERgwRNkLC26ODBQi5uS
	UEOLGwROhA4oVEBSniEuZClPRTdqzGtPpQMapPVZb4KLHQseMc7//wy6+d619MZKt+49P2c8Lhb3r
	E8c/oHFoyEJE0PfexSfbtk4V8l7sQ/Eixizf3OhpQQK05h7FLGT5pqwOlFR36HmTw5Vt7F3GNTNAI
	n3/K9+4aYeMJWhmcvasHkRaxhEbzUQIt+9OzEuGd+HmPKSHOUF8obOC1tjRC47iSLTXEZcFQZ9F/7
	W7/QTnW1A1dxij44qOlCwlIb2Usn0DXQ7rGDcfgZUyoS8LbNl3yS06YGvf9oCZxziD208qwU9AHd0
	jujCUHXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzaEq-00CUZI-0Y;
	Thu, 18 May 2023 09:48:00 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzaEm-00CUWz-1Q
	for linux-mediatek@lists.infradead.org;
	Thu, 18 May 2023 09:47:57 +0000
Received: by mail-ua1-x92b.google.com with SMTP id a1e0cc1a2514c-783e4666739so1189741241.0
        for <linux-mediatek@lists.infradead.org>; Thu, 18 May 2023 02:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684403272; x=1686995272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wg6shwNIwwRwkhfOkTgCr9OKJegA1DzRyg52qKzAeE=;
        b=S2WWolW1jn+wgLVUhlxoiii/6QVTjUizpIsXpMURcKDqGpWBHB5V40WX32jxC4o+Vz
         xdIyCaA+GXrMOZHI5+BRfjptlc5DzEucEh9wkYBO6sA+QwTn8hWa5yFIBKc4XzbY26Bc
         Yzn/lqaxlJKCSbQrbINpJsd9B9POYPLTyUWzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684403272; x=1686995272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0wg6shwNIwwRwkhfOkTgCr9OKJegA1DzRyg52qKzAeE=;
        b=esBoCfb1w5eC/LyymRVg6AGq6RLx6VBOWfkGrFrHGzyrlwyQvPhEIOnC/+dtPjzrqq
         F3S55a9C6oXTjM/UhTfEjYQLhTZJHv9XIm5hEEXv8/c+aWPJbFrv2VuaFonm+aICfO5o
         GSsOsBRf8caPoEf36hksOgPfuuAasvaN3AZLQhrf6J3I+qu3zb/eWMTL8tU4CBM+OZLW
         TP93IsYZcN02lWpl1OmBul0Ut+YH++ZAJ2lo5+bhiKKmeFBeud+XUq7PWjIqcU0HzsA0
         u2qKM1aFuUQuFEZeLWWXhPz2MYcSMkBq4WHWR3DAC8DQ6e5n4OtF3p6wW5mC7xESOo8W
         W4ZQ==
X-Gm-Message-State: AC+VfDxO1MkObZ4j4y6wsH4VjCQ2rvk8gDqeOSogb8nZfOe0yb0Wh081
	aHlNYHw8sU33A2cgqep1L3dYujOfIcIh31tF+KpERQ==
X-Google-Smtp-Source: ACHHUZ60eoWoZUBqR1HIJE8nKIEe2ryuS5bJ8rKbXaBjLvR6HbKInnu2RTlWZrWSvYRwdHCvElTH6deS1M9M1Yz/l0M=
X-Received: by 2002:a67:fe43:0:b0:437:d900:6603 with SMTP id
 m3-20020a67fe43000000b00437d9006603mr281259vsr.24.1684403272445; Thu, 18 May
 2023 02:47:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230518040646.8730-1-sen.chu@mediatek.com> <b9531c67-ab85-5ba4-6d86-9fc83974df4b@collabora.com>
In-Reply-To: <b9531c67-ab85-5ba4-6d86-9fc83974df4b@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 18 May 2023 17:47:41 +0800
Message-ID: <CAGXv+5H+peO6fhuE9jj2t6DS5EPRyg8m=zc3ACDGdvm8Bes+RA@mail.gmail.com>
Subject: Re: [PATCH v2] regulator: mt6359: add read check for PMIC MT6359
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Sen Chu <sen.chu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_024756_503821_39B62C05 
X-CRM114-Status: UNSURE (   8.13  )
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

On Thu, May 18, 2023 at 5:32=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 18/05/23 06:06, Sen Chu ha scritto:
> > Add hardware version read check for PMIC MT6359
> >
> > Signed-off-by: Sen Chu <sen.chu@mediatek.com>
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

No fixes tag?


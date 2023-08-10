Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347F7C04A6A
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 05:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=90vuit1vtETcc7ICm483dG4LoGioHBxHspT621cfQB0=; b=QSUfcLzY1qV/Oz1kuN+wcCEHD5
	HsVpQUPljBrJdNmbPvCz1gwmSAkYAEH/45wgs9sXNHS9wFh2UuqwoOklqe+SlcmCOWVE+hm/kZHJ5
	/lNAIptKIIWQCDqjJe2pgO8AO3OdwSdbUTiIk5cZMtX7h5u1eS/Ee6rx1/qJs8pv2BawpYq6YSrUY
	p0AumTAxCAZENcEe05VosVBzjr9r+MmypC9PLk7xnrKdNVGP4vYuIaNkqrxvNYhF+6uTl72GxLY7n
	7uNrKUnUfuvAF/ZW8R1N2HpRh2CnqIurZhgiZH8HYsJ9KG5y9+ksg4BUN3a8jVUBXyLmpmPjuc/wt
	ANhxaK1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTyHG-006a9A-1r;
	Thu, 10 Aug 2023 05:32:06 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTyHD-006a86-2S
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Aug 2023 05:32:05 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-790fef20fafso42175139f.0
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Aug 2023 22:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691645522; x=1692250322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=90vuit1vtETcc7ICm483dG4LoGioHBxHspT621cfQB0=;
        b=WJJogRNM6Mk8P3sdz8L3D0d80nJu2cpmp2YPfhgM77MzAqx9eFdDFbghqW6ZOkuWd6
         ohv6qZZkuNtUr18E2yqc2cLIo71iXRjEvDDYo7h+dzlXwoQa0RBN3WLJ9yF/PAsgp1MC
         LW6uQNaHXuBndssmA9PoIHV25ZFOoBAcsZStU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691645522; x=1692250322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=90vuit1vtETcc7ICm483dG4LoGioHBxHspT621cfQB0=;
        b=CB6DihcNq9Bi7/Q12BNx9JD5UTdrlH8NRKwk1dDdltcRWWk+z16KGGEhSKV5GSiQMs
         Exlh6YEvhfXuHq+u0BspGD+yI84BelGuef65r3rzdGlNsv8vuqed1ele+iG1j8yHuLts
         zyZhfviGgoEzRV1Ab7ufzl40j8I/BOAyudoucyjiXCAzh/pxx4W1A5vdj5yDDeUgBAJJ
         RR9gR0ySlKG9ud+baeEf7WZ6XcsIV83/CHz3cJRN+Pz5fJA8Ru5zHLGLjlE/0nuHj6i3
         SZMqHWt6chS2DD1pUR4RdYpSVfEoRmbn3//+MYo52kRVnNQ/UO9Nv/M7bDTwTDJHOqHk
         chmA==
X-Gm-Message-State: AOJu0YygK6/8ZnAlQq6bXlPSv4awn1oKDtXZh5nBmhjooMfzdkEKbVAD
	jTSnEOAGzzvB0Hty18hM9/xcrvoe8ONrUJystdE=
X-Google-Smtp-Source: AGHT+IFJsXMTkthXW6zjbQV9zbSGTWER43f4tW9mGwG3bPMmFdYQCTFynsAjdfVKUy1jcbe4/G4+Eg==
X-Received: by 2002:a5d:9d47:0:b0:787:c08:6817 with SMTP id k7-20020a5d9d47000000b007870c086817mr1582150iok.5.1691645522135;
        Wed, 09 Aug 2023 22:32:02 -0700 (PDT)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com. [209.85.166.42])
        by smtp.gmail.com with ESMTPSA id a5-20020a6b6605000000b0078335414ddesm244261ioc.26.2023.08.09.22.32.00
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 22:32:01 -0700 (PDT)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-7908ff76516so13968039f.1
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Aug 2023 22:32:00 -0700 (PDT)
X-Received: by 2002:a05:6602:2552:b0:790:aed5:d0b0 with SMTP id
 cg18-20020a056602255200b00790aed5d0b0mr1722545iob.0.1691645520345; Wed, 09
 Aug 2023 22:32:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230809181525.7561-1-jason-jh.lin@mediatek.com> <20230809181525.7561-2-jason-jh.lin@mediatek.com>
In-Reply-To: <20230809181525.7561-2-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 10 Aug 2023 13:31:23 +0800
X-Gmail-Original-Message-ID: <CAC=S1ng4UKNy2ZtJr1YUAtZ5M+A5DgRWt68ibKaW3ohwV6foTw@mail.gmail.com>
Message-ID: <CAC=S1ng4UKNy2ZtJr1YUAtZ5M+A5DgRWt68ibKaW3ohwV6foTw@mail.gmail.com>
Subject: Re: [PATCH v9 1/7] drm/mediatek: Add mmsys_dev_num to mt8188 vdosys0
 driver data
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Eugen Hristev <eugen.hristev@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Jason-ch Chen <jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>, 
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
	Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_223203_831559_40216981 
X-CRM114-Status: UNSURE (   7.31  )
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

On Thu, Aug 10, 2023 at 2:35=E2=80=AFAM Jason-JH.Lin <jason-jh.lin@mediatek=
.com> wrote:
>
> Add missing mmsys_dev_num to mt8188 vdosys0 driver data.
>
> Fixes: 54b48080278a ("drm/mediatek: Add mediatek-drm of vdosys0 support f=
or mt8188")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Tested with MT8188 and the internal display is up and functioning.

Reviewed-by: Fei Shao <fshao@chromium.org>
Tested-by: Fei Shao <fshao@chromium.org>


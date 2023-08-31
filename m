Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80723C83F10
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Aug 2023 08:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lI5HuTSJh4kLrQZ9upvSPMABH82Jidmy6stP6xhqC70=; b=vP9BhvaPwXWWnRyPiFQTkwpgb6
	J4ctFbkMqBNIzvFu67vQbyJ9s730ADeF7QmR9Y8h+jsJ/6wOaxDmaSM7KTMh5ee0+LBAn9pjSKJs2
	/3HPdRpm6yfOVKVEy+rsuBamfzjs+X95eFZ2dNKDW4xLVOuoEVHbIYIMtBt4jMwzFuIyNWF/Xniaw
	5OMD2fG+dixl6txyhChQhvhDerY/CnlXRRhU6cpeOJFOI9xUJUddHdqJ/vHoms8jGzOjOpi5Afu0S
	O0TQD6N174zoGEVzvl/XAALXn/khzwVUNGwQ9avfwyMl+t14eJN3B3PfXjhgJtwv7uU3ncshLk9uO
	JN2zJVqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbchO-00ErF1-1I;
	Thu, 31 Aug 2023 08:06:42 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbchL-00ErEI-2U
	for linux-mediatek@lists.infradead.org;
	Thu, 31 Aug 2023 08:06:40 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-34ca22e3b3dso1791775ab.3
        for <linux-mediatek@lists.infradead.org>; Thu, 31 Aug 2023 01:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693469199; x=1694073999; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lI5HuTSJh4kLrQZ9upvSPMABH82Jidmy6stP6xhqC70=;
        b=QFr/D+1j4WrlcCou9oLASUqudT6kbORN6VqtB+jxo94COLgoowgdXHS9pOTU8CupIE
         hx+3WjasdtjqBOX8T8fv1i4U7Hpv7QztaMI8x92gfiwl9vU1DoYEfSB7zgMyxN2p07wW
         OrmHeU9r/qfNDV5IEKvhZuRTYtg8wLX356ZLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693469199; x=1694073999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lI5HuTSJh4kLrQZ9upvSPMABH82Jidmy6stP6xhqC70=;
        b=Tai3lS/+c1A8CHiHwCnJAlUGnLgxKUqPquPX7H9qiGF4e+w2QuHUeCQZZYsBeeRfJq
         +JUvydlptvzun+gz3sbvtMgdxhT8c7VNggUkK9RBtppVnJfDirt4yMkqvxFnNRc1tzcs
         R8tzF1B3nq5DQ3FYbcv55ydFaAKyW4GRC4muqRT8EcaDWKROtiqAIyMaWvxMZ+60zRI0
         NpZ4Hz6DQCxzgXIuYV1futp8qBujNsUI6Yioax3TCc/b54Siw3p70tmp9wRU3j2zTwMj
         raoWcay1Qx2tKGfUo0sXZgoMLexsFXrl1Lt8GnVnm11AwW8KAfVpfApg8Qe8vHqZCgDg
         tq0w==
X-Gm-Message-State: AOJu0Yza5heIK66cS+bCZOOCD6n3lR8rMJxHdaJit9rG/eZeRE6Aop+m
	/DM+t2FcrsszcVUJmpt/eAy77PKan9cPCZ52tEQ=
X-Google-Smtp-Source: AGHT+IERlksCk7bhAThHrYRHUebdms4YH2h79TS/LTsILb20RtHA4l750oAaEDkX3quOp9zx/NZ6SQ==
X-Received: by 2002:a92:d90c:0:b0:346:d51:9922 with SMTP id s12-20020a92d90c000000b003460d519922mr4931356iln.13.1693469198855;
        Thu, 31 Aug 2023 01:06:38 -0700 (PDT)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com. [209.85.166.52])
        by smtp.gmail.com with ESMTPSA id t15-20020a92d14f000000b0034bad7e8a50sm282547ilg.80.2023.08.31.01.06.38
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Aug 2023 01:06:38 -0700 (PDT)
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-792707f78b5so23008539f.1
        for <linux-mediatek@lists.infradead.org>; Thu, 31 Aug 2023 01:06:38 -0700 (PDT)
X-Received: by 2002:a5d:9d15:0:b0:786:fff8:13c2 with SMTP id
 j21-20020a5d9d15000000b00786fff813c2mr5435565ioj.11.1693469197856; Thu, 31
 Aug 2023 01:06:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230714094908.13087-1-jason-jh.lin@mediatek.com> <20230714094908.13087-4-jason-jh.lin@mediatek.com>
In-Reply-To: <20230714094908.13087-4-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 31 Aug 2023 17:06:00 +0900
X-Gmail-Original-Message-ID: <CAC=S1ni1LvViXbP-euO8trwmwn68Y7-=UxX4W77fc10+TVi2PQ@mail.gmail.com>
Message-ID: <CAC=S1ni1LvViXbP-euO8trwmwn68Y7-=UxX4W77fc10+TVi2PQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] drm/mediatek: Fix unintentional integer overflow
 in multiplying different types
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Jason-ch Chen <jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>, 
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
	Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_010639_826833_3C93EAC2 
X-CRM114-Status: GOOD (  12.15  )
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

On Fri, Jul 14, 2023 at 6:59=E2=80=AFPM Jason-JH.Lin <jason-jh.lin@mediatek=
.com> wrote:
>
> 1. Instead of multiplying 2 variable of different types. Change to
> assign a value of one variable and then multiply the other variable.
>
> 2. Add a int variable for multiplier calculation instead of calculating
> different types multiplier with dma_addr_t variable directly.
>
> Fixes: 1a64a7aff8da ("drm/mediatek: Fix cursor plane no update")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

Hi CK,

It seems like the series was accepted but this patch in particular
didn't make it into the tree. Could you take a look?

Regards,
Fei


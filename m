Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF1CCD494C
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 04:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2aBYYxm4V3k4FyEjLrLJ9/n/H90Md6QsttKISLF22a4=; b=VBQq73Gw1PrI0HYpFVXwEz4TMj
	sE+XgQX0Ik4akEdZDch2bErUIv9yiSR+I1M1rxyhf92kJrreiDwsz23H7NJtNXc8TWCDIBdC/U/uG
	hhvJ2KEO56bjuSLANpQLBnzMSE9z5ag2Ny/bkffGFQjafPQ+dZOLM+Pvzp4Bqfd+iGzGFbhP3aTOW
	xclhZ3vqaTKpjhlT5gNL0c42OB7dHy8IWJjyyhdzFUgAcDc9IeOo7rbealAEZrmqoC0N4++su9hoR
	us+eqfgmW253hg3PT9mYqpD4XBf5d3MrY4t/81XrPQx4LH4kd/nRfHiyLh05KpldaZJwBri0Ow8eN
	T5FPDMsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjB0k-0050QP-2X;
	Thu, 21 Sep 2023 04:09:54 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjB0i-0050PQ-0i
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Sep 2023 04:09:53 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2c108e106f0so8162601fa.1
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Sep 2023 21:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695269389; x=1695874189; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2aBYYxm4V3k4FyEjLrLJ9/n/H90Md6QsttKISLF22a4=;
        b=WQlcf7aa3MUHe47wgGiEtIbMfbWKr6zTk1motJ6zqkuFRLUyU/GCfM0fdt1dJulCZc
         Otpd0+Ss/U+jr7o+Jjw+K4+CFcp/oDAxsN1kmjBjBo06UZebiHRNUANPYKu1//YF9GA5
         yKOpnmHc5xlhw9iqkLuf2GmK5tPuJsLwOenyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695269389; x=1695874189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2aBYYxm4V3k4FyEjLrLJ9/n/H90Md6QsttKISLF22a4=;
        b=tKxvCrx6NqgPm9pFt04WkQbLfAzqQPTEpVWj7A1v5ilv7Upre/Viol3uoei6yVF6qy
         jVUvwAu8LunaFM3cUmMWhE+8Ny5gcc/vOQFeJVyY/gQPbk/M8vzbvRGVnGDEDqdmE2Sf
         d59Dj6V8Q7K3b4Efcz+oDhj1jWnHNrmaPCIvuxq3qFhjMKgYvczeAKLKQ+Ee24a22y05
         SLKr3slUeW5kdwFiUbTAHHaa59fLK8kGf73BOYPzE/CxdDoKVQ6a3Pi2p+0iy2Dh1Y/O
         kEuE0ELshoHZIzcT6Di+5fDXqW/kZE5XxuT2gUftKH7RcGZH8+a/PDhBlI+uPRkuuF/a
         nHPg==
X-Gm-Message-State: AOJu0Yy4tKUdWO6SmQCL1NGygRuDxPGxvnlBvflQQip+OknLo47X0j6U
	a4V+BirTlcdOefM4VfQOpLfLt49j3D6ybIlaaSZNFQ==
X-Google-Smtp-Source: AGHT+IGdIV8J7fxjUNbRUv5HJhGzBY+D1JG/lYO+jffLDerOCNDgsVdIhjbf+HuUVjEXXFJfi0crYYSdZkt0BFEhkOg=
X-Received: by 2002:a19:e051:0:b0:4ff:8863:be01 with SMTP id
 g17-20020a19e051000000b004ff8863be01mr3396045lfj.8.1695269389034; Wed, 20 Sep
 2023 21:09:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230919092336.51007-1-angelogioacchino.delregno@collabora.com> <20230920150332.318851-1-laura.nao@collabora.com>
In-Reply-To: <20230920150332.318851-1-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 21 Sep 2023 12:09:37 +0800
Message-ID: <CAGXv+5Hr1woRL5z6b4k6e+FQKaVyoUmP4vAt=RrEgjEwq8bUhw@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: mediatek: Refactor single core check and fix retrocompatibility
To: Laura Nao <laura.nao@collabora.com>
Cc: angelogioacchino.delregno@collabora.com, andersson@kernel.org, 
	kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-remoteproc@vger.kernel.org, mathieu.poirier@linaro.org, 
	matthias.bgg@gmail.com, tinghan.shen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_210952_300080_18FA3CAF 
X-CRM114-Status: GOOD (  14.03  )
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

On Wed, Sep 20, 2023 at 11:03=E2=80=AFPM Laura Nao <laura.nao@collabora.com=
> wrote:
>
> On 9/19/23 11:23, AngeloGioacchino Del Regno wrote:
> > In older devicetrees we had the ChromeOS EC in a node called "cros-ec"
> > instead of the newer "cros-ec-rpmsg", but this driver is now checking
> > only for the latter, breaking compatibility with those.
> >
> > Besides, we can check if the SCP is single or dual core by simply
> > walking through the children of the main SCP node and checking if
> > if there's more than one "mediatek,scp-core" compatible node.
> >
> > Fixes: 1fdbf0cdde98 ("remoteproc: mediatek: Probe SCP cluster on multi-=
core SCP")
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
> > ---
> >   drivers/remoteproc/mtk_scp.c | 18 +++++++-----------
> >   1 file changed, 7 insertions(+), 11 deletions(-)
> >
>
> Tested on asurada (spherion) and jacuzzi (juniper). The issue was detecte=
d by KernelCI, so:
>
> Reported-by: "kernelci.org bot" <bot@kernelci.org>
> Tested-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

on Hayato (MT8192) and Juniper (MT8183).


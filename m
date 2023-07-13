Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B58EB64DD
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 08:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7bNjmQBLzRndIeDOo3XPwwSKET0eUhbNEBYsBMD/HWg=; b=4pBG/pAODvMQJmwHOd12922Ole
	ArHS9sFfbt+0f0s0O8BBE5hZqvTLiLbcQRVbMzV+kQXQ63X1BLiVBDzlBSbl6TCoNod2GyJI9AaMI
	zQg+lVZB24m6w6eNyk8ges0PKCtz/PxdpRg3MMD8rjdwf1x5DSBtP2HZHa8WbWwSE5WdMysLWO9xs
	QbHRPnZYK06ajDRyrs4Byd6oWbFq0lCXmF+mgt3+9pXc4M3c7aACJd9u4VaRr04CZRYtppee+1uah
	Zbpvx+j955RlaaQ5Aud8S4W79PoyCBNZtz2bS+Qo3Ra03tbLXBlu+bNdB28+9JTeGau3/mpnTfbMi
	Y5YkCjKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrF6-002LPV-1c;
	Thu, 13 Jul 2023 08:00:04 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrEr-002L7e-1L
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jul 2023 07:59:52 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-7837329a00aso11345539f.2
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Jul 2023 00:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689235186; x=1691827186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7bNjmQBLzRndIeDOo3XPwwSKET0eUhbNEBYsBMD/HWg=;
        b=QLw4Vwt8hxPTWGJatZxpqd2ELYnQAZuZkdvvNDQDElxkk4KfP4kockhDp9RRz52imF
         msSheeQUB033kv4xjSYBV9QtqoL+aH6EDS5PIWOzohJptv9Hfzv1LlhNMnrhy+Qjv6cj
         TvBnlZzFI8TAbql0M0a24ghgqq354A6k3LK7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689235186; x=1691827186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7bNjmQBLzRndIeDOo3XPwwSKET0eUhbNEBYsBMD/HWg=;
        b=dXKIF5USkbmqgctdAbcoejnDtFn2o9CpH1Zrhm7bMIJNkePW0IjzL63/zbmo6c9CfG
         kDdRbGMMApLsTGZjtowmDhCIYOsfFmEJUtUF5f/EOp/0HXtAk95f8GXTcLwPGDebyWfW
         DLMowls/LU1RMdt3YoDVHrzNuh9sLk72hs6Eef1XDor9pz16qdjstqQPUfT9i3/8SN9x
         cq+/6YTDIi9i96c7XMi9JaLEOCD5DrV9EV0nlg4PBdJ5b2VcibsbVLDHGIP+HsJtVh1i
         GjcRiPDghde0HcWRQjjKt+qUf6tieEStlppbykBU7bSkJG89tBRuVPGnfKeU1LLcvYjy
         TptA==
X-Gm-Message-State: ABy/qLa+i9QSLgUqQu0sFqY36XZg969o6Nuzr0jREkicFjpOp6ybUtvW
	xXJxjsnG/PGc7DsnxXj72SG7pwe67MluYqsrvdU=
X-Google-Smtp-Source: APBJJlH5N5U3dGKXCTPyCd/nY2d/bDThruMt/f5ObqEkhj0qi6K99laqQB5FCKjOrF8Bt44DNNatJQ==
X-Received: by 2002:a92:c903:0:b0:346:70cc:ac7e with SMTP id t3-20020a92c903000000b0034670ccac7emr848776ilp.9.1689235186132;
        Thu, 13 Jul 2023 00:59:46 -0700 (PDT)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com. [209.85.166.52])
        by smtp.gmail.com with ESMTPSA id q23-20020a02c8d7000000b0042b35e163besm1804667jao.88.2023.07.13.00.59.45
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 00:59:45 -0700 (PDT)
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-78358268d1bso11280439f.3
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Jul 2023 00:59:45 -0700 (PDT)
X-Received: by 2002:a05:6602:356:b0:786:cd9c:cf9e with SMTP id
 w22-20020a056602035600b00786cd9ccf9emr1296590iou.2.1689235185426; Thu, 13 Jul
 2023 00:59:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230412115250.164899-1-angelogioacchino.delregno@collabora.com> <20230412115250.164899-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230412115250.164899-3-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 13 Jul 2023 15:59:09 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhpsUFrAz7dS5K-G+Vjw50vxN=n7OFQCB1d-JF6_n-nXw@mail.gmail.com>
Message-ID: <CAC=S1nhpsUFrAz7dS5K-G+Vjw50vxN=n7OFQCB1d-JF6_n-nXw@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/mediatek: mtk_dpi: Simplify with dev_err_probe()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	daniel@ffwll.ch, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_005949_496389_CE368477 
X-CRM114-Status: UNSURE (   7.74  )
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

On Wed, Apr 12, 2023 at 7:53=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Use dev_err_probe() across the entire probe function of this driver
> to shrink the size.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>


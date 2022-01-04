Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF20C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 07:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kigu4z/xo/9W31czQPfKGC5AQbTSMHM7iHVOl+Vp3VM=; b=iJIs99OmzE1dgm
	IVH4NjPi7sdCHNu1R+FB/wbLtl5db0lbUV/UCgck+NoW1w/x8dje3u4g5SUNqf3iVXx/dheK9x5dp
	CSD3EVyQaJRqEFr+ExtCTchP59JBmZ97cBg4jiG37YVxyGKk2APGXB3M9jo/FIdDLfdjbO4lXXCTO
	5xmLWC/VBZc4H/eQpdarZn/q7lgWbn1mTf7B/5Z9OChIcht5AHTumA3dceYq0U1SDFkPFg9cHBFGX
	n+mEl3UtrN8V/RGDLyJaJsjXeOsbUjCysQKWiaUrnSr7m8kcp4pZrYHfDz5F/1NKyTfosh2/wVdW6
	4rkieFU93WsqKYcowxgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4eVB-00AXvT-8S; Tue, 04 Jan 2022 07:45:01 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4eV0-00AXsU-DN
 for linux-mediatek@lists.infradead.org; Tue, 04 Jan 2022 07:44:52 +0000
Received: by mail-lf1-x133.google.com with SMTP id h2so69320646lfv.9
 for <linux-mediatek@lists.infradead.org>; Mon, 03 Jan 2022 23:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CsNGkAuTfXI5FN0re853yKsBlp1/TfiDupH7mdPtEH8=;
 b=iLIudQiTyfDFYG/CACSF02mgQWXC5aLYLwa9g/2H8JEsh1VrCJl6nDz50rIl4zqHUl
 ygOBrnzXzegoATZ+ELlPM94rvvsajU+fBFw8V3JabDkMleG7XsvJhIQea9k8oTFFlpo5
 Yi7VDCdnDnzPtsRb7amOK0sV+skf1qsFsSKWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CsNGkAuTfXI5FN0re853yKsBlp1/TfiDupH7mdPtEH8=;
 b=EOrsAQoZKVR0yR4ccn3qlIhiAwt2N6sFm1N0ybx4QJ1vqtSZXOukegDkLJszhZqdzI
 Hjk40IvLSHhTgVpsf+3bTu4ASAeX4aM/meL1DyC7A9ljrduR5PyLPsI/sT0W7M4FHg38
 1so+UdxarEJpC69cq4O0Fetcx5hCNzqnx7UN8LigusfHCX0xYMw5fUNl7V+SZ9iYy5r8
 XNxzbqEMyRdqFtlD68d6+L+bHQEdGjH808BkMK08Nrepx6QmEeFUZdSYKhZp1irWrlXc
 YVSQQMApLTy3CYPOPQoOnUUKtG816f73pTP6lTSSIMvxtjZhT8c19gsmkJQPG/cBet1V
 Yung==
X-Gm-Message-State: AOAM530HHd1B5pg3f3vs/jWdnEaWEuTODinHXmlEarxq6Ggu4ankXQd4
 AUGfWS831+x7LJK+GJ0eD5IncWKx8Gquuo+mGWKbaA==
X-Google-Smtp-Source: ABdhPJw0YC6U4HEb98OAFpcmS4FVKcETi99MHEMDu4r06NwCCTOcXAZuz1wxcQjSjFJ4W/qnp4p37ec5ZL2rrahOJEo=
X-Received: by 2002:a05:6512:e9a:: with SMTP id
 bi26mr41350197lfb.371.1641282288318; 
 Mon, 03 Jan 2022 23:44:48 -0800 (PST)
MIME-Version: 1.0
References: <20220103101855.17350-1-angelogioacchino.delregno@collabora.com>
 <20220103101855.17350-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220103101855.17350-2-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 4 Jan 2022 15:44:36 +0800
Message-ID: <CAGXv+5EONgNiQDk0eOVSnVG_U6_=XSpDWADt73x2=tZPt1gL7Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: mediatek: pinctrl-paris: Simplify with
 dev_err_probe()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sean.wang@kernel.org, linus.walleij@linaro.org, matthias.bgg@gmail.com, 
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_234450_459993_CEFF12E4 
X-CRM114-Status: UNSURE (   7.03  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jan 3, 2022 at 6:19 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Use the dev_err_probe() helper to simplify error handling during probe.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

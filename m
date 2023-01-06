Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A043BC3DA7A
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Jan 2023 17:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NPGjO3GLxwuKoc7lZtIvtYmPySePxCmc9A8414gqSgU=; b=vopZ14gUfDd5tBMIkOCOAWy1+W
	M911F8bP0oN6ol1eLJfgqBRqm0/ip5rqgb41y3oCWQAxfe9eR+eycRYsI9uUYfi2q/AHFGa9mf460
	p71cqR68IjqLdR2Ki0tDI8ImDUsQOlSiFrcnPGFcjoi+nBLJM4No2E2Q3O9X4herx3DBlfiCw0j7A
	3rj/p+rwEXMvuOcAdsFnoR8mEm/9QvqAnYhvM6850YCTreaFBObZh8UjXMiVnilpn8hpxpCf6VPQL
	soBen2yft4CivcILtznDi5pQdkkCIBUZ388RJwBrGqiMM76nnFGvZTG/d5BYKrluz3Wm1B+S+s9BB
	5xRpqwUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDqHN-00BDVG-Hw; Fri, 06 Jan 2023 17:13:17 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDq5P-00AroI-5P
	for linux-mediatek@lists.infradead.org; Fri, 06 Jan 2023 17:00:57 +0000
Received: by mail-wr1-x435.google.com with SMTP id m7so1815754wrn.10
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Jan 2023 09:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NPGjO3GLxwuKoc7lZtIvtYmPySePxCmc9A8414gqSgU=;
        b=euSC14S8bRke4P9nxYzrLsV7/Rs+V6Xwl16eqrk35fgRXHrcJW5M+EQ3TnnmVVz0OG
         imulyWr/yTkRznDSLBl6k+WUX9Hs08bCyaj/QtWTBFWr7PY4Bs/uZgGVLA+u+G0kjK1Q
         qXyAQWkNWXr2Jtmwao2CR7rfbv8Gr9gBMeR00JF4LoZPF4CGI8jAAZLlvp+/VbpPfmIo
         4eeQb6ZkqPijQpvRdJPZbbz8MfSqPjoTyC40kWVWydVWtcd5HC6/wjxYGrCZJJ8aS6w/
         OHJDK985nTHcaHYGlN3Uos/RdUc/afXFpdOH7junzOIQUY5F7bbBQggu0lFe/Q4h5PNO
         TfVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPGjO3GLxwuKoc7lZtIvtYmPySePxCmc9A8414gqSgU=;
        b=jMriBQJ3nTiuy6ZBqyh8YHVOddCgfQTud38jXm6s39eNGreNh+h3ZjRh6VFuNy7jvS
         F5BBgWftSwOue6+9uK6d6CDUraFuJfpaE0Lcu0QLTTjqEACArVI2cjX0t/rD8tqaPjTW
         kk/R/wiozGEZ6pJdWODP117blMGpNQZAimIp96kGk05M/IXXnvcBZC2a9j3g88B4p9cf
         adXU2ynKrc5mXl8XfRd+11HzVFRh831eBNdfJ7nrHrDl+0c4SSS+rdIG9f7uSlFaKEZY
         L4ADbuwd1xVPVRh2MM1HHmshG8W4dtJJ7D1ettN15LZZUJYQUPuO6rMVMN6W6ZxclYaw
         bWFw==
X-Gm-Message-State: AFqh2koYMl85OiegaLZGofS4sa8ju125BAkDTTDkgjEABDfUUesTvHLP
	CdXJxJxvNmf+KienplOZhHRKUw==
X-Google-Smtp-Source: AMrXdXuFqZYcBKNOWyaXZXz+967P6PyjNmHIk3ic4subWD87vHVwOE8AwQVtHuWeEOjpKP7UFEo2PQ==
X-Received: by 2002:adf:da51:0:b0:2b6:daf8:52ad with SMTP id r17-20020adfda51000000b002b6daf852admr3402719wrl.52.1673024449899;
        Fri, 06 Jan 2023 09:00:49 -0800 (PST)
Received: from blmsp ([2001:4091:a245:805c:8713:84e4:2a9e:cbe8])
        by smtp.gmail.com with ESMTPSA id f8-20020a0560001b0800b002423edd7e50sm1633417wrz.32.2023.01.06.09.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 09:00:49 -0800 (PST)
Date: Fri, 6 Jan 2023 18:00:48 +0100
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	johnson.wang@mediatek.com, miles.chen@mediatek.com,
	fparent@baylibre.com, chun-jie.chen@mediatek.com,
	sam.shih@mediatek.com, y.oudjana@protonmail.com,
	nfraprado@collabora.com, rex-bc.chen@mediatek.com,
	ryder.lee@kernel.org, daniel@makrotopia.org,
	jose.exposito89@gmail.com, yangyingliang@huawei.com,
	pablo.sun@mediatek.com, weiyi.lu@mediatek.com, ikjn@chromium.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v2 04/23] clk: mediatek: cpumux: Propagate struct device
 where possible
Message-ID: <20230106170048.p4d3rq6kehmf3adp@blmsp>
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com>
 <20221223094259.87373-5-angelogioacchino.delregno@collabora.com>
 <CAGXv+5F8QZGc4oDKJAGbpvubqiewvngURpNhrenS3pcGQNrOYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAGXv+5F8QZGc4oDKJAGbpvubqiewvngURpNhrenS3pcGQNrOYw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_090055_248261_B4C943C0 
X-CRM114-Status: GOOD (  15.81  )
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

Hi Angelo,

On Mon, Dec 26, 2022 at 03:07:10PM +0800, Chen-Yu Tsai wrote:
> On Fri, Dec 23, 2022 at 5:43 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Take a pointer to a struct device in mtk_clk_register_cpumuxes() and
> > propagate the same to mtk_clk_register_cpumux() => clk_hw_register().
> > Even though runtime pm is unlikely to be used with CPU muxes, this
> > helps with code consistency and possibly opens to commonization of
> > some mtk_clk_register_(x) functions.
> >
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> 
> As with the gates patch, could we make the |struct device *| parameter the
> first one? Also for this case I think we could even drop the
> |struct device_node *| parameter.

Reviewed-by: Markus Schneider-Pargmann <msp@baylibre.com>

clk_hw_register and others are using the device pointer as first
parameter as well. So I think it makes sense to do it the same way as
ChenYu suggested.

Best,
Markus


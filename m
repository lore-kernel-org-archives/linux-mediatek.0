Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D0FC54EBD
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Jan 2023 11:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/p/iE9FkOKMo7gwBFTP4+PfxlZi9hnBSH41zreYTFY=; b=yLYuwVxxkYa5hZyfKv+RB6wRr0
	i5HZewlKn8Qgqnp99f3Nk4LIGVeUZY3oRxTOf7i0RjLbjAe25010jjMx6m2/olSKW/rosrfqOPd5g
	zf1S53d1/Rx09z6wm6KViY5gP9ZxuJVh459McVJ87So4pvqk77NlO8KAvNrp5L3DArNuY3FEjVyw6
	LtSdrgYccF8hx6HA0kNM1nvYlkMt6f8gsjdhNa09CmQDWNuhExu3bJm8kk3GqxzoCUrPEASDrU+yz
	/aJ3lnmjf3CQV5XH6heHc+F3zkqbOHlCfiNy2R1HGqAwRIqvD0HzX6JjYCFq04BUt+GQ1Awkolvdc
	xa6Pwu2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFw3T-00Etmm-TT; Thu, 12 Jan 2023 11:47:35 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFw3I-00EtjE-Vb
	for linux-mediatek@lists.infradead.org; Thu, 12 Jan 2023 11:47:26 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id a64so18755190vsc.2
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Jan 2023 03:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j/p/iE9FkOKMo7gwBFTP4+PfxlZi9hnBSH41zreYTFY=;
        b=SLS2iJF8Cp/L8Htgd1U5Rj5zBINtlHnlv6QMAZ0oGzQW9CY7NA3jttx7MGhbzxOuoM
         IoDMhbuJ4VFqIHMntVaKdORn/KMGHZsZAhARzCWqUEChLZRD8NACJDnl/LWfmVfSq07x
         yAW9nCNVlzAd4MUTuqEUv89eJ+kgDblaTDDRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j/p/iE9FkOKMo7gwBFTP4+PfxlZi9hnBSH41zreYTFY=;
        b=ASALHn71ow3M3SGHrIp8XMGu29a1U39VasxvB4sXAvOixN8a53AIEJQNFUjaRMlumX
         gjYU5ZTSo+vqBgYyP+EydXkUAnhd751TRZ13texNYKdJUoRvMTjGCJGYt2EaTrbV/1d3
         PhJ38zZtwmf+e1kEP3Pv+i39sBru17GDE/q3daRbWfGypqrt7+hnuRfK8FF8Uu5XO6dC
         SvjD6DBwRmEu+HDZVv4r70jDGWaGBPaixBynWgTH1qQyMFdf3/qFrXzDs10GuEjVMJb4
         1jvlFf4Bovel84n1matXOVhOEBsGT2o+kZqkY6joUgwB7hTmGNc8fs99jIuAtcggUiE0
         4LRw==
X-Gm-Message-State: AFqh2kryr1WiikiEmJHTqL6muq/EeOnCUi5iKwSGrRogJrGbmhjiyzXb
	YQC2p+SjWiYsNMqMVopDa4wc/2315S7I3einhPplhg==
X-Google-Smtp-Source: AMrXdXvSajYR9jV6VGsPH7TwZTubfkHmhhX+kXom5wSr5YNKiTnawmEt7PjpbDQCDMbfYdgjqI/uCAYVJWaS0J83yRk=
X-Received: by 2002:a05:6102:374d:b0:3d0:af13:3b6 with SMTP id
 u13-20020a056102374d00b003d0af1303b6mr1897629vst.65.1673524042864; Thu, 12
 Jan 2023 03:47:22 -0800 (PST)
MIME-Version: 1.0
References: <20230111123711.32020-1-allen-kh.cheng@mediatek.com> <20230111123711.32020-2-allen-kh.cheng@mediatek.com>
In-Reply-To: <20230111123711.32020-2-allen-kh.cheng@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 12 Jan 2023 19:47:11 +0800
Message-ID: <CAGXv+5Gpzz-pp+YSQhFkH1cejGB5csNnz_Qwop_7Fkbxm6SHxA@mail.gmail.com>
Subject: Re: [PATCH 1/9] arm64: dts: mediatek: mt8186: Add MTU3 nodes
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-mediatek@lists.infradead.org, hsinyi@chromium.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_034725_075273_1A298D4F 
X-CRM114-Status: UNSURE (   7.83  )
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

On Wed, Jan 11, 2023 at 8:37 PM Allen-KH Cheng
<allen-kh.cheng@mediatek.com> wrote:
>
> Add MTU3 nodes for MT8186 SoC.
>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Tested-by: Chen-Yu Tsai <wenst@chromium.org>


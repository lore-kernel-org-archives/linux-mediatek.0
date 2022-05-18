Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C2EC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 00:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ip4ScKmSmp/DqZnIywUNaRwQTr9bvBxQH5u8UJJ2aEU=; b=JkmztgrM8dcdOD
	kT/TStkiHH0uSxYAJyewOyKVPu/4t7eTn84DeUqh989PqHjVmYrYqns+yLg3cgYfmiKgww8zS5Qdk
	9l7yoooJ1Pb7UvPVWMdHkvVqLITL7IJbTMjEuzPGHZtDxzIweqSt8m6QUBzNsZlwuM4u3rko7l2uI
	NIiizX6JKzaCE99Dgj8hCICJzvKVRewTO+ThGu+ovxqJEK1CEuQWffzuxWMyMxlpyRx6W2HBqTLN3
	miAHq5fngQ27SehmsOjBEpc79goCq8VNYrYvS80hc3+e6hePZeDZ+k2nUcopAT174SfIE/EMCdmD3
	+S28sWztET5PJC/ZQ4qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nr7qV-00GOVK-N2; Wed, 18 May 2022 00:47:23 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nr7qK-00GOS5-IH; Wed, 18 May 2022 00:47:14 +0000
Received: by mail-oi1-f176.google.com with SMTP id n24so880327oie.12;
 Tue, 17 May 2022 17:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0ivlprhS2h/cMofiRva12AAeDajNBcseyKIWCyP6GFM=;
 b=h6kWmXk2FpRPwj5Q40O9Dndyc5aw4XXzYfHv5zaQN2TcN15MU+U8PytSaTNqWnqA5O
 dx1vSsv7LA8qTUVfxHx3E7bzuNZS9zqXkJYDUKAnMyz5VIj4gIDQkfdHymmL/QlQbjOn
 PxDuJ7DkKammA0TlbfQ+NGph/SKATdMhxhPrK4Ja38ZNxGfkTPqju1RmzSJVzn+SwXAf
 4Duv28Hga4GkhdApoebtX83msiFcjZj9S9OoHkiv6MWaYwTl0OHiNlP4mIYol4i2uYYV
 aIFt2Nh1TRmEbOprPh4YfPkwREXwSBUgee2vBMJz0tKrK7RV6oqegqjcx39xTZ4vHsor
 mByg==
X-Gm-Message-State: AOAM531wi3UTV1E0P5I6Fk2qM9EooF8ucXGcxrVlJkxCJO6Wkj0nHggJ
 lvecWk2OGZtnUPxj528mqw==
X-Google-Smtp-Source: ABdhPJxK2fsakt9+qAEinnu8Nr0SM6/F4v16Hx09go8CdR87lPDVyRjaWRPTxV3yCRv0iS+00W8Uvw==
X-Received: by 2002:a05:6808:1525:b0:326:c179:1b1 with SMTP id
 u37-20020a056808152500b00326c17901b1mr11887569oiw.69.1652834828532; 
 Tue, 17 May 2022 17:47:08 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 w10-20020aca620a000000b00325cda1ffb9sm290734oib.56.2022.05.17.17.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 17:47:07 -0700 (PDT)
Received: (nullmailer pid 1965783 invoked by uid 1000);
 Wed, 18 May 2022 00:47:06 -0000
Date: Tue, 17 May 2022 19:47:06 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 y.oudjana@protonmail.com, jason-jh.lin@mediatek.com, ck.hu@mediatek.com,
 fparent@baylibre.com, rex-bc.chen@mediatek.com, tinghan.shen@mediatek.com,
 chun-jie.chen@mediatek.com, weiyi.lu@mediatek.com, ikjn@chromium.org,
 miles.chen@mediatek.com, sam.shih@mediatek.com, wenst@chromium.org,
 bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
 kernel@collabora.com
Subject: Re: [PATCH 0/5] MediaTek Helio X10 MT6795 - Clock drivers
Message-ID: <20220518004706.GA1950724-robh@kernel.org>
References: <20220513165050.500831-1-angelogioacchino.delregno@collabora.com>
 <7ed1b785-389f-9730-4686-bc6b85cc8f6d@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7ed1b785-389f-9730-4686-bc6b85cc8f6d@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_174712_633116_40C447EC 
X-CRM114-Status: GOOD (  14.80  )
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

On Fri, May 13, 2022 at 06:54:49PM +0200, AngeloGioacchino Del Regno wrote:
> Il 13/05/22 18:50, AngeloGioacchino Del Regno ha scritto:
> > In an effort to give some love to the apparently forgotten MT6795 SoC,
> > I am upstreaming more components that are necessary to support platforms
> > powered by this one apart from a simple boot to serial console.
> > 
> > This (very big) series introduces system clock, multimedia clock drivers
> > (including resets) for this SoC.
> > 
> > Tested on a MT6795 Sony Xperia M5 (codename "Holly") smartphone.
> > 
> 
> I forgot to add context to the cover letter for this series, so I'm adding that
> in reply to myself.
> 
> This series depends on Chen-Yu's clocks cleanup series (clk_hw) [1] *and* on
> Rex-BC's MTK reset binding-cleanup series [2].
> 
> [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=640122
> [2] https://patchwork.kernel.org/project/linux-mediatek/list/?series=637849

As well as the schema conversions in my tree. So I need to apply some of 
this? Provide maintainers with details on how exactly a series should 
be applied if there's a mixture of subsystems, dependencies already 
applied, and dependencies not yet applied. I'm just going to wait for 
explicit requests of what I need to apply as there's already too much 
Mediatek stuff floating around. Last merge window was a mess too.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C07AC64EC7
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 03:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yTTUfpY5FBze/ZdJsTMclUwYRTvL4mC8YWDC0HHBaDo=; b=DWCAF4oKEmzzzaUi7T262UMsP2
	sEDnNKaddd3H5DHDMCrin9HpvalybnM9ZtUR1gJ0qd2CDtKLbQOnLFtT+e+ObcrGJUQol6tLc0OJ4
	AeRKhf7kyySET9sjR91sn4PaJYq2grAPPNnCbJ/R5ZCqTDiEY0TVASiuomQvCnoj+IcMGFrwK4ywM
	JAfwcJslgWZ652WAMqqm9H8UHqN9hfuZ7aCHvVoqJfPJYp+k5wtdCjC0sCfkhwpcGEoPouNqXk3tS
	fdd8e30dC/utkrcpFTyfCq+1vDhZdmHZPWATN6ZFQNKdLQozg6qqcrPJOFfJCInu1v9yeNIXBusOt
	8Y6yDACA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUJl0-006WTk-Is; Tue, 21 Feb 2023 03:55:58 +0000
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUJkx-006WSp-EU
	for linux-mediatek@lists.infradead.org; Tue, 21 Feb 2023 03:55:56 +0000
Received: by mail-vk1-xa31.google.com with SMTP id g17so2319419vkl.8
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Feb 2023 19:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yTTUfpY5FBze/ZdJsTMclUwYRTvL4mC8YWDC0HHBaDo=;
        b=LdWHnd2Swi3aDPIeLDYDnQy/SdWrk5WWezojEhx3GNTFL/Z3ampZ38AUjhpG7kOPLh
         a2zMHNXGNT59i9PFUvBYLBzBWZKMsmXxWEjLKmjLWdGY0KyrntMpaqMf/pB1xiF1gfwU
         Sjsi5pSdY2BAlMpDKBiPt/GxCIuqAPEGEqQZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yTTUfpY5FBze/ZdJsTMclUwYRTvL4mC8YWDC0HHBaDo=;
        b=31J5gVDCPxzdJne4/CH0dUeLI6mXiEIwEk6AyVd33997/TUv7NXZwFUyjUgPuarKbQ
         YC0nkcS+wbfaUkgY93sb1h/GLE4f42r9EoeCHVE13WA2+DoxryqPepwMmTj0F2a6tQ0+
         li/2VnFP9WDm6XtcrLnNf4braFou2U0uBw1tJeFE99i9zRNtcqLdi64lcuM/7DAr1yyS
         fN/LewiictQFoedPEwhb3V92upJP8Jb0w7o3rBHQq7k0Z3DiixLjZrEtIdNE3dX07Pan
         c75MbmN4BYMBhMz7FlK6U14vchqBtlCWAffWQSkiEa5rjO7gFUwh2mU3zf4Nb8+OZzuD
         DutA==
X-Gm-Message-State: AO0yUKUZ6BHZh0vCbth8dGpKytJAZ4UgnanNtRew8ZWVHMuqZSiAO4+o
	pf/MZY1Ic7BXS+ddUUEUTIlVEY1ode3B+TFkvR6NJQ==
X-Google-Smtp-Source: AK7set8Jj9rIJ0M1z0qzvgZyXsHbOHSifaxMAF2WDRHnciHO2wQ0GHx1+ow3JKQ1jckTrglgegfQO/AUz+jddSbN0Vw=
X-Received: by 2002:a1f:a3c8:0:b0:40b:9:82fd with SMTP id m191-20020a1fa3c8000000b0040b000982fdmr813692vke.18.1676951754153;
 Mon, 20 Feb 2023 19:55:54 -0800 (PST)
MIME-Version: 1.0
References: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com> <20230220150111.77897-47-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230220150111.77897-47-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 21 Feb 2023 11:55:43 +0800
Message-ID: <CAGXv+5FHQG6CBcRVUYdNXdxRQVRpmnVN_EiQ=knm48B_7ugHqA@mail.gmail.com>
Subject: Re: [PATCH v3 46/55] clk: mediatek: Split configuration options for
 MT8186 clock drivers
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, 
	msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, 
	yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, 
	sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_195555_505416_641967AB 
X-CRM114-Status: GOOD (  10.92  )
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

On Mon, Feb 20, 2023 at 11:02 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> When building clock drivers for MT8186, some may want to build in only
> some of them to, for example, get CPUFreq up faster, and some may want
> to leave out some clock drivers entirely as a machine may not need the
> Warp Engine or the camera ISP (hence, their clock drivers).
>
> Split the various clock drivers in their own configuration options,
> keeping MT8186 configuration options consistent with other MediaTek
> SoCs.
>
> While at it, also allow building the remaining clock drivers as modules
> by switching COMMON_CLK_MT8186 to tristate.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>


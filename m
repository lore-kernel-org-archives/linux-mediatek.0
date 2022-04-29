Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D653C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 08:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2jqpDSrrrW3uzLFl2ql9DJ+bffb4qKkNRS+ANZjq4FM=; b=x+RWdHUIB+ZEdR
	HFYEFIgwtie3leFIKkJ/F5d3ljou6iS84OvokpY1UuBydwjMqZJ7vl5UJuZL2L48abluQrR8YQEJy
	0WjEMpc+4u3qcSUSI7k4Ut0+IkhUpbD2v+cxbON9hYWfULrfh8yn5UfI8r/ZHsgjWicrHZPjPCLRy
	hkmB2TjC47FuZ6gC8m1ZqD0QjIGMWK0QkpLAfID3BZmL/WhVtANVsZx5MmBPKuiXdEspFfENYaoPK
	k8dtYyRxdycgDXBLTs5RR5twl1jQHdaI4vicBX4XE8+D2NcZYKMhJgeTLxl1h1e7Vqkg108GIpwPx
	lB4il5079sah1xFadBOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkMI1-00AHT2-2q; Fri, 29 Apr 2022 08:47:49 +0000
Received: from mail-qt1-f181.google.com ([209.85.160.181])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkMHd-00AHLd-HP; Fri, 29 Apr 2022 08:47:26 +0000
Received: by mail-qt1-f181.google.com with SMTP id f14so5240045qtq.1;
 Fri, 29 Apr 2022 01:47:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6sgYQJjr5iy1crCmQpq1/lmSUnF0hBfImD2gP+L9eDc=;
 b=WjuuRdTLzTYNnRjQLwq9IG41UW14iUi6QK2SCxvzilFpzqERolWGkdIJKcrnVaXRxr
 IiicG9GDsSlbboYfYqQhlRCXWne5BWMGC/uk2jMKoh09iEAalY4h6xYBpu76dZKtcCgk
 fZxbfEffZrW+LKuTcc5wdEz6oX2c4esDNi15vr8dcjwlfU9YoqUVAaVH7GzBX+sFOpp1
 iF+EKThEzNAggMgniSyna9ENwIVPnL4BzyF3CcA7+fugssEH+DW4jqrlK6+rpBlfcJDZ
 mBffH9z26dvL5in6cdW81CUFW/dv8XuKV1yPmZvhQUwawEDsCys8jF6RhyqbXP9qtsaX
 axIQ==
X-Gm-Message-State: AOAM532YPJMnCU6iqi6yh3Bg5apMMbRU5hIVKXCYy9/YLB2tI/p5u1Lp
 u+sAucjKI7IV31e4Jc1+zfmusOYUCwRfPeSa
X-Google-Smtp-Source: ABdhPJwv3dNfYTUFPKxsxERObbBLJ2OeNWvQYf//+NXKSaxS0mDlm/recHr6x0cpI2fBU9Z3tYCRew==
X-Received: by 2002:ac8:57d2:0:b0:2f1:fa23:a415 with SMTP id
 w18-20020ac857d2000000b002f1fa23a415mr25760948qta.322.1651222043171; 
 Fri, 29 Apr 2022 01:47:23 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174]) by smtp.gmail.com with ESMTPSA id
 f39-20020a05622a1a2700b002f367d7a7a5sm1414410qtb.23.2022.04.29.01.47.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 01:47:22 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id i38so13245349ybj.13;
 Fri, 29 Apr 2022 01:47:21 -0700 (PDT)
X-Received: by 2002:a5b:984:0:b0:63f:8c38:676c with SMTP id
 c4-20020a5b0984000000b0063f8c38676cmr35590406ybq.393.1651222041398; Fri, 29
 Apr 2022 01:47:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220428093355.16172-1-jiaxin.yu@mediatek.com>
In-Reply-To: <20220428093355.16172-1-jiaxin.yu@mediatek.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 Apr 2022 10:47:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWYJofetMwkAH4d8UzKZH77hxwRhXrMhaECOs1suQV2PA@mail.gmail.com>
Message-ID: <CAMuHMdWYJofetMwkAH4d8UzKZH77hxwRhXrMhaECOs1suQV2PA@mail.gmail.com>
Subject: Re: [v4 00/18] ASoC: mediatek: Add support for MT8186 SoC
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 aaronyu@google.com, 
 Matthias Brugger <matthias.bgg@gmail.com>, Trevor Wu <trevor.wu@mediatek.com>, 
 Tzung-Bi Shih <tzungbi@google.com>, Julian Braha <julianbraha@gmail.com>, 
 ALSA Development Mailing List <alsa-devel@alsa-project.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_014725_612227_23DBCB7B 
X-CRM114-Status: GOOD (  16.86  )
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

Hi Jiaxin,

Gmail tends to mark your patches as spam.
Can you please make sure to use "PATCH" in the subject line, e.g.
"[PATCH v4 00/18] ASoC: mediatek: Add support for MT8186 SoC"?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

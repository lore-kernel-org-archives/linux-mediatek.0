Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A178BC636CC
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 08:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yeus9HGhMFXg91Mu8k0KRBkqLS/oz0WZH65lxIAAuJ4=; b=d6+VdPwBx2lCalNnOZlOXIZyzF
	EOsgu5I6PAVpTxALJQZrZ5Vt6pU0Qv507ESFwbNVVPUDSr1Z204zRYc/JCnJWNnnJYJAZo9hbVpph
	CBaCdfcu+O8zATMX+/soFO/NzspzQn5L+SobiZf6Mp8vTkbvrgGrPOeZdbDHBVKbbgATrR/8YV+/U
	day1LhqkbxgkhH923cv8cmT+Q8bzExPpyCgHBk5F1jQDG7HLSg0jrRGGGmKX+brb9YKlKpNB7ZYFF
	+elpRoge8IShSeTeYL+c+zDP5n2ZRSk6atQhT/+yEvhtDPg8DYrzBGWdH61zUOesr5ZOLBSg90Bgi
	RLD/v8+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSZD4-008uPW-0D; Thu, 16 Feb 2023 08:01:42 +0000
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSZD0-008uNq-Lt
	for linux-mediatek@lists.infradead.org; Thu, 16 Feb 2023 08:01:39 +0000
Received: by mail-vk1-xa31.google.com with SMTP id i4so771080vkn.13
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Feb 2023 00:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Yeus9HGhMFXg91Mu8k0KRBkqLS/oz0WZH65lxIAAuJ4=;
        b=fTLKg5kLU68Zmml8hKrfx4b3q25rkw8FQ3LD2kEO+bvOdm5i9zCH+LVNaofNI86K/b
         44ssSWiBlkNTF0SFpRSG0JfsJXnR8OWbE0Dsp+JZ5IAa4kN5/OoxHKZFg4DNSwMvFkxd
         W2NPydnU3jvW614Q+PZI0H+NpYLfDLZ/L0TeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yeus9HGhMFXg91Mu8k0KRBkqLS/oz0WZH65lxIAAuJ4=;
        b=O24SLVw6IfoCJPt5TVTwfpI3bkrV6flZjuzVokNuTu2hfp3Uv2ydwifnXNsOjsPHS1
         TOYerYACZaTylDvMCQTmhZQIdrrH8ozbo+IPKIj4CWVU1UUGJ7lhBHBghZQY3phEKBJG
         QiYIbd1rZoYvjD43QxbopplF1e+zYCerxOT2A123CmOfjzDX87A2ktlFyktLPKWbs9Bo
         KfxRGoOkZNSv1FqW3VGZhEuA9fnCTu48Uuy59V1IQXZ9O0jxpeHOWMbGSE7RzvJZeh5V
         l5xGRuNH0EUngD7acUDDq7ojnmcbMwbldSFhiy7pbX1XKeIK5tIHos5Mtx23Y4iDs8o0
         pkUA==
X-Gm-Message-State: AO0yUKVZElRPyi9Dc+Ce+oT2CLSIetoQVX7r9R/Cir+8JxT6ADIzRiKw
	NIkM2GwNNiBgAu8R831w8judAWk4YA10YwAFHoOgMQ==
X-Google-Smtp-Source: AK7set8MjxO55yFgtHWdPlTTau1K5AmbjLybjRWoEF/cRynJ0TSRLk4s+xuSxJmb3mqmZlt+EtAJ2do0nFQHLfogWFE=
X-Received: by 2002:a1f:a447:0:b0:3e8:66ce:a639 with SMTP id
 n68-20020a1fa447000000b003e866cea639mr782890vke.2.1676534497366; Thu, 16 Feb
 2023 00:01:37 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-18-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-18-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Feb 2023 16:01:26 +0800
Message-ID: <CAGXv+5H1Nz6Z4h4qbiuxxZEQJwDjMw4JykbDoNRGEkN3LS69Cg@mail.gmail.com>
Subject: Re: [PATCH v2 17/47] clk: mediatek: mt8167: Convert to mtk_clk_simple_{probe,remove}()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, 
	msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, 
	yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, 
	sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_000138_729073_A308706F 
X-CRM114-Status: UNSURE (   8.27  )
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

On Tue, Feb 14, 2023 at 9:42 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Convert topckgen and infracfg clock drivers to use the common
> mtk_clk_simple_probe() mechanism and change this from the old
> "static" CLK_OF_DECLARE to be a platform driver, allowing it
> to eventually be built as a module.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>


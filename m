Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6E3C636CC
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 08:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PDwdCkBr+epoTFV8128V+K8ZDu4uZiFedibzdz23bSY=; b=hq0fgtumJBpWq7cHUV+aVXwTeQ
	tNIMoIPoi9C/FIEq2rb3RMMx/LeS9T7UBtpWoCFmRGKor8VzhX3m/eK6GYOjN2FoZhgl6m2ANedWH
	l5ABheHOr4xqjLovanFv1lA+K0jWQHlfSjTPtvl2zx1edTpnjfQ1Q/bf09rrtkHWRZqN1IdDVIPSH
	SmW07wAGYKa1SMYiob4UzKCNwT/4FrkkUFYbdY0yCGB1s5y8ZCc6mzpRosVnEJkJN9eev775k2t2g
	tS4wzkAdw2f0WO62l2e9St6546ZBjfwe0TvF7UlQQ46h5W8NUrLi+qHidsvOKWttFPQ/H494bztXB
	VDBxcLBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPfor-00EbRI-4R; Wed, 08 Feb 2023 08:28:45 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPfoh-00EbOW-9h
	for linux-mediatek@lists.infradead.org; Wed, 08 Feb 2023 08:28:36 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id k6so19085200vsk.1
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Feb 2023 00:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PDwdCkBr+epoTFV8128V+K8ZDu4uZiFedibzdz23bSY=;
        b=evtZGJLNjmw9Zm4yLdTXY8KBBja9oIjRep6uxIqQmpn4T0huYcPiv+gjhczlK27ZEA
         1nIgQ8Vx2VTTBD5GZBYzQ+fmXsxYTrUkRNvIZfzFAyzT7rq0Z1c424O2AY3RxD6lM99p
         bHFbQcz6EyNmWuDnfmpIshtHoFIbtyHaoYqO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PDwdCkBr+epoTFV8128V+K8ZDu4uZiFedibzdz23bSY=;
        b=4QlPdVQwDi5oK2NGkiMZsAaibkHSQwzQHDEaIGMiZqkumscL3yTXQ+ItSUbcPOdVIl
         LtrCmndhw0JAoVuZaac8Kr1sV8DzZcdSwLFkwMIeDc59uMyyzTl2ApsH3c2QTkRwM7RT
         YzZ47RNh4fVs00e/yJKU4AesC4wXNnR549jKiSJdjOiMWLXmWDbXJtbwg6aflGRGaNne
         ygn7PGFM/hjW6g2FUQdrdqg74TvuBClYmEk4nslKbcAWmbLDNczacU6XCl/6KiYTJTf5
         RWeYu7Jl9AtnWS2j7vMXBGeSdI7r+PaTcn8MCRvRG+kEovsY29BgvZNc4rHRjZYx0BHI
         qvlA==
X-Gm-Message-State: AO0yUKUvnAB31FrodNamzTcVidGQy5IyXDPGcaKB4nTOCTf5vjPssc4E
	UFW7VzMtmMYOofH4YN5DwcjueEZomdIcJsSe7E5eoQ==
X-Google-Smtp-Source: AK7set/hpRWfHJFWXLG17yEKzouX556hGHZ4DtbxJ5D9T8cyICAY1smDzFL5vj/d6St643qyfmjA84QzpHZ0Ei2fbTQ=
X-Received: by 2002:a05:6102:4b8:b0:3fe:ae88:d22 with SMTP id
 r24-20020a05610204b800b003feae880d22mr1523855vsa.65.1675844911888; Wed, 08
 Feb 2023 00:28:31 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com> <20230206152928.918562-36-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230206152928.918562-36-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 8 Feb 2023 16:28:21 +0800
Message-ID: <CAGXv+5HTP0cLGEQ+qkAt8nsOp5DqCOgPyAOJ66fF91SKX=hZvw@mail.gmail.com>
Subject: Re: [PATCH v1 35/45] clk: mediatek: Split MT8195 clock drivers and
 allow module build
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
X-CRM114-CacheID: sfid-20230208_002835_356753_C838458B 
X-CRM114-Status: UNSURE (   9.94  )
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

On Mon, Feb 6, 2023 at 11:30 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> MT8195 clock drivers were encapsulated in one single (and big) Kconfig
> option: there's no reason to do that, as it is totally unnecessary to
> build in all or none of them.
>
> Split them out: keep boot-critical clocks as bool and allow choosing
> non critical clocks as tristate.

The power domain controller references vppsys*, vdecsys*, vdosys*, wpesys,
imgsys and camsys. I'd argue that this makes these clock drivers
semi-boot-critical. Maybe mfgcfg as well when we add the GPU?

They should be bundled together at the very least. The power domain
controller not probing disables all display and multimedia capabilities.

Also wondering if we should have "default COMMON_CLK_MT8195" ...

I suppose the same questions apply to other SoCs.

ChenYu


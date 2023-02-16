Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE9EC61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 10:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aC0UZCTaZwODqWa60Uyhp4WnMR7OWFiD7msBoAVkJA4=; b=xa/k7QzgJ328roXijtYHOSGVE9
	BJcXVzxt06hwxo5BpDF/Gs0ozsN3ChqQqoAGPxlVlRzLU04Pn+Vfk6CghAWvtqDsbStHu07aeeXfR
	6pBVBlhWQqiwh30fYELFnIea69gCAv849BbCqzES5fx+WMEHiBJz8Sos0bBnw1OAtGMesI4K43Z0/
	auDb0hT51uxF7RLXCmvNpQMFg2X2W4RAMAOd/Cl6NfcQpBt0qOgcG0tlhUMC8ycOu5kI2dqC7VXgW
	S7evT1yFqDFjRtoSRRsiRnh5mg9Og0wGMWS1dUFCS+t4hm1BkuXSrl50qHGeKf5w9WnESGgYXdWZj
	3ZaXa2lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSbUk-009Yzo-H8; Thu, 16 Feb 2023 10:28:06 +0000
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSbUh-009YyU-PR
	for linux-mediatek@lists.infradead.org; Thu, 16 Feb 2023 10:28:05 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id d66so1411594vsd.9
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Feb 2023 02:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aC0UZCTaZwODqWa60Uyhp4WnMR7OWFiD7msBoAVkJA4=;
        b=htrWahqkdR7BI3F8kB0NkYMgKTrwmwm96JkeJku5UN773iiC76dr1Vuj3h+k3wxLuJ
         mlVpcoxw28S9V9xkApmJxmAkvQREJCSwGQYT37ZrSVK2YtqP2fiqSDkcD6iOkLcYHRl9
         oNWuBqSjy5fEClLHgaynPefkng2WmdqVsXmMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aC0UZCTaZwODqWa60Uyhp4WnMR7OWFiD7msBoAVkJA4=;
        b=tZejFfbUS9WdCbctTCLYTZX2xvKbUzjcUUK8TFHdNB6+6qoIrpz3QSDG1QDS7xN/HI
         A896HqNCR6QVVrzfHi99gAOUKBzULaTbv43ZnsJOgXPLfcLWbm+ybwzzkMMJI6cI2l8w
         yEJAN/Td1ifulDtj4NvTW9JuvsJIbRJEo/pEK8AXzLmWIsNphukvyYFLns2PdPUtvFR9
         MzIKORJ6GeZZNxFnXxxD0IvF/D1W9y+VWEnJ0Izcft2Dx3TG5YC4PDrS6cWI54qgyogk
         2TpmkZu2qFW4HXcgsUWjhB27LUNVqGcBTq7yL9aazbQFgl4OnZN2Tz9C3YD9rZFlqMCg
         ThVA==
X-Gm-Message-State: AO0yUKWcNxzDeibuWqh41QU0V/keeD4lQSFvEQyzt3196R1I9KDJ/8lk
	jyNe5hPdrkGB/a9YZYQo3+V3IyLHSDi1l4wjFmBKFw==
X-Google-Smtp-Source: AK7set9S1a9PnO5AlC0aIUcyuYB4GoqrIa5JQM3cAhXe6/vzdJZfyC8Ugb35qpq0pzDqN3S8b4loTS4XI5MfTKfgMT8=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1001620vso.60.1676543282237; Thu, 16 Feb
 2023 02:28:02 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-22-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-22-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Feb 2023 18:27:51 +0800
Message-ID: <CAGXv+5GqF=PN_ZTLAHtpbOQG7VhsGJmVu8x8zVMWSn5X7uQ93g@mail.gmail.com>
Subject: Re: [PATCH v2 21/47] clk: mediatek: Consistently use GATE_MTK() macro
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
X-CRM114-CacheID: sfid-20230216_022803_870147_4BCE6570 
X-CRM114-Status: UNSURE (   8.26  )
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
> All the various MediaTek clock drivers are, in a way or another,
> redefining the GATE_MTK() macro with different names: while some
> are doing that by actually using GATE_MTK(), others are copying
> it entirely (hence, entirely redefining it).
>
> Change all clock drivers to always and consistently use this macro.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>


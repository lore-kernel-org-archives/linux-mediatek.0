Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44573C32771
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 07:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JSGq+UJdZHZI7m7+R4s5lT3YI7bcQs6FVi/cIp+srik=; b=DzDQYr3sOuEwCWgHRG7jVxroUx
	/Tts/b00aKyupiFohFdPWzAyxZQrsNP2km3pIPZSXVQf7mYL7nfajeif2KY2bjmNsj9phDtTeYkjX
	I7t8p7DMagSdTkL+CAFgZSWPZuIw4Mq2G3gBK1S88p8m9YvfNuSfswsNeqlUPiWmbefQQqwfxswJh
	WkZ7FZgZypAlqkUviM2BZlF4dIYSh+TM29NA9Sk7cUP+iRnIEO2IUBd0m2ZS+H2t5UjdSO6yb5tGL
	wx18G1pPzeO+VpER2zi7fFr1zLTqUUL67pMAmGhQNSlfYkeXJ00cyMCX5fjWHTKwUsz7h1pVfkSKZ
	n0jgiGrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ociDu-002d8q-9S; Mon, 26 Sep 2022 07:08:14 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ociDd-002d0H-By
	for linux-mediatek@lists.infradead.org; Mon, 26 Sep 2022 07:07:58 +0000
Received: by mail-ed1-x52d.google.com with SMTP id z13so7630060edb.13
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Sep 2022 00:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=JSGq+UJdZHZI7m7+R4s5lT3YI7bcQs6FVi/cIp+srik=;
        b=hC8eV+FOx3YJcNNqaY+XiFeY+2Nqsm9G4oDCO/a+cex2r8/iNo8V94MyR+IcMynnfX
         Kl5WUO8utF3U3B4raqaM6u/9W9STCcBj2oGetI6QL7LwGTNwDYIpSf+/KaT/aCrtkFSN
         B29U+6SmA/saBUhyv552ASfMNEBcAX2n/OOz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=JSGq+UJdZHZI7m7+R4s5lT3YI7bcQs6FVi/cIp+srik=;
        b=zGl5oAyjdzXe0K3FIffgOdfY4+8P71DnBQng032WZBdiTZLyHVbH7wQ8InHs+xEL0I
         Fhr/aY5tFwBaQT6iChQEt/rSfqmZ6sMzCT2zzPG3HisUFols9YmmxeWCLXmiQ1fMk8LV
         k3qlO7NE0xQ+EaTcrWW2jT+VP8fbMv72RkdQykWmpB0nXEDBBBgpLPU6aV3vk7Dop3dJ
         nXcZzFTOnNSVFBnJcqTmNcYaTP8IUYs5j5ukUowBKNknOomzBtIXif69B4QG/qS/Q/TM
         BorbyX7g9d4E+uQa/mqVJ35amxqV/6pBJM24Wo9wPWZnKzoiQP18IpRkTLBstnT2S9pe
         z4iw==
X-Gm-Message-State: ACrzQf07OfbFcjnxlnudXMrc0eTXZYuXFiPcjLxITfumTatzFIobs7lp
	z8ZRTMwzuBg8vdt2b05lD7dCtCXi0iqi2oF309cO0A==
X-Google-Smtp-Source: AMsMyM6jkTKiLKSqDZxJdnx4sI0Vk0Ohi0/4NFzL4mGK7QELlD/W4obOucDIKNq/Qv9RKu/hH0qBuRIpgRfNcgKh1sA=
X-Received: by 2002:a05:6402:90e:b0:443:ec4b:2b03 with SMTP id
 g14-20020a056402090e00b00443ec4b2b03mr20572019edz.71.1664176073670; Mon, 26
 Sep 2022 00:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220813083319.45455-1-y.oudjana@protonmail.com>
In-Reply-To: <20220813083319.45455-1-y.oudjana@protonmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 26 Sep 2022 15:07:42 +0800
Message-ID: <CAGXv+5FZ2YKccJQQmALvu53y+z1X7REwY0MHm-WZ=A=gTCQ8CQ@mail.gmail.com>
Subject: Re: [PATCH v2] clk: mediatek: Use mtk_clk_register_gates_with_dev in
 simple probe
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Miles Chen <miles.chen@mediatek.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_000757_426256_87132901 
X-CRM114-Status: UNSURE (   9.05  )
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

On Sat, Aug 13, 2022 at 4:34 PM Yassine Oudjana
<yassine.oudjana@gmail.com> wrote:
>
> From: Yassine Oudjana <y.oudjana@protonmail.com>
>
> Register gates with dev in mtk_clk_simple_probe.
>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

I've queued this patch up here [1] and will send a pull request to
the clock maintainer later this week.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git/log/?h=clk-mtk-for-6.1


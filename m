Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845E8C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 04:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nMw+UMSQ4TE5upCLwYVM8e4uxVIPBxcgxH/5ZJ5W6zo=; b=1Gqnkg5HnBO1FL
	bx/6m7eoOegaMYVUduQ5U0G5JRk9UOw+PXibtCTZ2T1evxrC851R1Hp3IqTsJMzqcYoBRM0WvX1Ra
	SeofsQMu+eMIZiD6bDH/8B2tXw9hY6qgefN+F4iiN1EwRjfRAyCT9D5isHUzEhqL0VvaIWFQlNDKS
	QSPs5aHz3LWNX3FBpN/Ux3tF3vTT5Jfi+fVwiyA0uoh/RjXf78tubhw6YEP9xyJgBgJ19I1Dx/cRm
	t+bkWJ1TF/vzje3xu1lWpOew+EpyHGQfNvdCqqmNlSok25ptlplBKhOZ7odb5qoz4iz7L+hjgwapW
	rNlpWuRhZpiYfhnRGeTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nruaS-00AUs7-6g; Fri, 20 May 2022 04:50:04 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nruaG-00AUn4-Ho
 for linux-mediatek@lists.infradead.org; Fri, 20 May 2022 04:49:53 +0000
Received: by mail-ej1-x634.google.com with SMTP id n10so13478422ejk.5
 for <linux-mediatek@lists.infradead.org>; Thu, 19 May 2022 21:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G+rF6dhHbqvrEHl1JWCO7qzVBXB368ohsf4MuiTQiGc=;
 b=ZOuuxSvg8cjtrSjVsHC3HrcS4loCp7wFy+f6Np3AgYS0CzySnmkUv+4mYG9zHnv8ne
 1vAVNQiWeEr2Yn9HphkCERYB38suK9P+DcVnterVzxpYuv4Mq+IVxpVVS1J/MIuFojpQ
 /y4nqyfZ1QbwjMIy5PtGCH35SRYTPqk9OI9B4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G+rF6dhHbqvrEHl1JWCO7qzVBXB368ohsf4MuiTQiGc=;
 b=H/DJLZQROSOBVeK5HTmxEHdv4LDXLuE68rzfR+PaSMSi+YSy2SG9pygbMhWunfZs/l
 dgG32ULe97v/86jOWwSJqpaXihfq3XVRcswf2qZX/tylFj4/n5PThHU4431s3+t53kt0
 8aiwWqednH50+LLUfjDSDQcQqHvF9q3oF/f92yUcC5EUF2rSgHn5dzei8ipP+NRh01M7
 Uj2tyWrKQZgsNu1repT8E1gcFzCKXctExLENYgV2u9+D3TYSfNWx900jTh7zYLmAQ3jJ
 GWOTFuMUpdQWA141ct+dI2ninl0v/QAqyfdl4Cw83VFUrkz5nrLxk4d11rmHL012Qxu/
 XJwQ==
X-Gm-Message-State: AOAM531irfrU9W38tju0lGW/3MeZzvOnek5nWJ0kNNimoVTZdU0+NBBi
 sPGp+UuWHtidCjPL6lZCEpGasGjtSM2Ba60GE2+85Q==
X-Google-Smtp-Source: ABdhPJzGKNfnnGJBNEgXcSGNHSdo0I8dXA7F0rfAVqQ9CybvOQZe8592uBcZxReyMAUCaispAKzhJxf4iQLyBJlbE0s=
X-Received: by 2002:a17:906:c142:b0:6da:9781:ae5d with SMTP id
 dp2-20020a170906c14200b006da9781ae5dmr6803613ejc.73.1653022189315; Thu, 19
 May 2022 21:49:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220519134728.456643-1-y.oudjana@protonmail.com>
 <20220519134728.456643-3-y.oudjana@protonmail.com>
In-Reply-To: <20220519134728.456643-3-y.oudjana@protonmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 20 May 2022 12:49:38 +0800
Message-ID: <CAGXv+5GnjY1DOWHx-B4PZqNi5tnWOgYQ_TCk6YzhtEnPQnVVnA@mail.gmail.com>
Subject: Re: [PATCH 2/6] clk: mediatek: Use mtk_clk_register_gates_with_dev in
 simple probe
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Yassine Oudjana <y.oudjana@protonmail.com>,
 Miles Chen <miles.chen@mediatek.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, 
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_214952_682012_841BAE58 
X-CRM114-Status: UNSURE (   7.50  )
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

On Thu, May 19, 2022 at 9:49 PM Yassine Oudjana
<yassine.oudjana@gmail.com> wrote:
>
> From: Yassine Oudjana <y.oudjana@protonmail.com>
>
> Register gates with dev in mtk_clk_simple_probe.
>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF506C636D7
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 03:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Xlugm3pXAui3DilCpKF18YnSL5Zk3BvOl+coQBmpVo=; b=puTc6Qn11P8XsWfK5DL8+YYsbj
	1lVXe4gUbhDyrsFhP+4JEZaGVLGwxcBTIqVOczGA7S6OohKihwrJal5DTxPGrEkoiJZf4LjG3HNVM
	DHLv0F9dAseQvhDmJRdyzK7tDMQ8gp1R8yTLqGy2V7Amm6UBI83n9KtgU93BQMtCb9WWr+hEOMNik
	JW8BP2vBjD0XzYpw122QBRBo4/Jrxd3fgluqcbMeAPY2epegpQTaN/dDttC8WM/PxQTzhAg4hRNUZ
	axD0x9z6HcjjZbyq/pJrzmiX0XHhmSFZxLHJS0dr6B4o9tj2w9MoXUfOmj316lzio/BFHB2DeNdbQ
	+bI35WEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUJZh-006TT5-4z; Tue, 21 Feb 2023 03:44:17 +0000
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUJZV-006TPx-Te
	for linux-mediatek@lists.infradead.org; Tue, 21 Feb 2023 03:44:08 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id f31so2867084vsv.1
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Feb 2023 19:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1676951044;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+Xlugm3pXAui3DilCpKF18YnSL5Zk3BvOl+coQBmpVo=;
        b=kcl1T8GcpUTdYh29tvrYlgWXtNo8FgluIlnTF49/6hRsUxJFXwTTlD7wcbrqnSs4Y6
         fT3SZ9RH/rzmeSVYkBn1V/Cyngr9Ci06ZdeiQtnFca+U1+D7bt0rdOF8vvlQFn2tF7pQ
         XWhk/d//Dm6K+b0ryelYpCe6PDay2rOuf94lE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676951044;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Xlugm3pXAui3DilCpKF18YnSL5Zk3BvOl+coQBmpVo=;
        b=c535XhGoJCbtcRnwo4o33Da8rGgCObNVM4poQZqiavnrV7ZqzVb40Z/+zF2P85DB/G
         0R3PUwBIVw/jUmzvR47aTVNdVyeHjtEzlrQNEiYgK89p7oyNW7+4GuRorMssrxGSSdz+
         83R8n+sqROst+l8fuBaUgRKLPp/zKOEA1Ht0Jh8Q+aM9i6c3lUlUTrpEQL7WAEPPoKAh
         MXX/5DH39jptKm8DBSgI1yJhKrMm3FCxaVI0n7RXLGKW54XFRI3wu9vBYUOL6alU1Ffp
         0qpFI4qTOuNX9TsTEFVJKlQd6uZXnYV5LAlKOLnAu3TNyiHxlBPZLXji5frE8bFbpBlo
         foJQ==
X-Gm-Message-State: AO0yUKX889hm9PBo4U0Pk6uGjr4fkVlnVL197UQW5xI9Ys0sN1/YeNA7
	4MvxLDShwsdY8x1/ttTN6TOEtKvaWf6xkXscC10D5A==
X-Google-Smtp-Source: AK7set99PgQG/skcb8vDBY1z3nQ+BRz+fEyyfxl+F96z8xZG8IfiTHWVCnPD+wJav+iNFejJ1+D8eL+9Ev5yb6xerm0=
X-Received: by 2002:a67:f6c1:0:b0:411:a14d:6bac with SMTP id
 v1-20020a67f6c1000000b00411a14d6bacmr829792vso.44.1676951043909; Mon, 20 Feb
 2023 19:44:03 -0800 (PST)
MIME-Version: 1.0
References: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com> <20230220150111.77897-27-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230220150111.77897-27-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 21 Feb 2023 11:43:52 +0800
Message-ID: <CAGXv+5GpkOvOkEg5cnFguHaMCtBH-2v44gO7O8Hd__6Ffg1Zgg@mail.gmail.com>
Subject: Re: [PATCH v3 26/55] clk: mediatek: mt7622: Move infracfg to clk-mt7622-infracfg.c
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
X-CRM114-CacheID: sfid-20230220_194405_988661_CE4D18B3 
X-CRM114-Status: GOOD (  11.66  )
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

On Mon, Feb 20, 2023 at 11:01 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The infracfg driver cannot be converted to clk_mtk_simple_probe() as
> it registers cpumuxes, which is not supported on the common probing
> mechanism: for this reason, move it to its own file.
> While at it, also convert it to be a platform driver instead; to do
> so, also add a .remove() callback for this driver.
>
> During the conversion, error handling was added to the infracfg
> probe function.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>


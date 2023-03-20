Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD0FC7618D
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 10:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yVu+5LM+n5S+m3afYfpgcD0EeRGmLNpp+tXakDwzmT8=; b=3ZGsbl6rqtqT3NiQVOXi3AIT6b
	QPqiXDWMEiI+4JP4ZGRJ4pwnou70z1qwxBJNdp+K/CvyaRhU9xn5Evk3jGHGIojEVvxGzXpx4tFXN
	D0tUsKMiVGbPbYUz+ivb6FUkv5ilY0kQiI77e248hKUFr2T14J3nre3d/dYHvrjIeLZwkbuiSdzCH
	wK0Om424he9wpmi6XtP9Xwzf0IB/QTiH0511ifcK+4Pnjz3yuEwYpH47dmiZwx7GU0FHdlR36IffU
	lfmyDjMnfCeaQ9H4C+fLdfpAv82VNi8Yg1sOr4DddV6sgxD+ND/8y/QTiQBnWwGcv+jg5EBsOoH82
	RvMM9ElQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peCU4-008aMW-1J;
	Mon, 20 Mar 2023 10:11:20 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peCU0-008aL9-2Y;
	Mon, 20 Mar 2023 10:11:18 +0000
Received: by mail-qt1-x834.google.com with SMTP id d7so12333323qtr.12;
        Mon, 20 Mar 2023 03:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679307074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVu+5LM+n5S+m3afYfpgcD0EeRGmLNpp+tXakDwzmT8=;
        b=beWuDmyL+NNsrvkK7dFnUmnYw04XKdrb13EeNF9Px9lt6H5FFNrH6JdvPf4+NOVRbW
         UmEdZ9NJTRhTvjGJuV7GLe5wwPXQw516KPGlgxFMg4AXNDkjB2z1HJp0v/+9ebI8ynBX
         3qtKBzEtxu+8mh1pAR6BgraUkxLRQqtUCn0O63niGzZnYvNrFB8RUEzftYvWxoqqkPtC
         C34/aZNEmUvXUiBrAEkti0IENYv63XGjTczE1c8SH6OGJTYPhk08alV3aJsJ1uW88fzA
         wZeiSGiM1C34wXrunmox3djy4K8/HHe0utwlH785SRutcG1OeSvBigKYkBkMgUxc08wZ
         BYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679307074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yVu+5LM+n5S+m3afYfpgcD0EeRGmLNpp+tXakDwzmT8=;
        b=POZjj2BT82/kR05wHLakVk3/z8UlmowyI8nHJptfkjzPU4WCIrmvLMg+evmzRr9ogO
         hlRJj+gZTuLIHS0KdAXBLtDPYUspKrX7T1Yya+pn1itNuwbo6/fSv35nWwua4BE1Vvps
         3v3tDegf88i80tMtdYsQ9FEzj3PTs3Mg63I74gQfs4oFfzsRD2pwZRiYymOOw8zLRePn
         LNtOkb2EXX78swxifpbJ6CwhnlP4VQAKm4gomhEkavppz5eDwL2i+0skr1XIaQRenJuF
         wkgT1yECfl8/2YiDnrwqy8BBRt4zqcNn2h8JUFD2xMd2dwHr8WkrpClEsgHA7RPACp69
         SsYw==
X-Gm-Message-State: AO0yUKUxmryYnUySiVsz7nTnHhWGDbjfHNovgBI4R9O9fFVYPgke6kl6
	n0CZjBuSmgBvH2R0BVV7LhKxj5ZedGtxBjoQRBo=
X-Google-Smtp-Source: AK7set/N/c1j9jpxMoJtOx8hIYRYm3z6xjz0i0SNt/oDvYWlcoKOLY50Y1BWLlTU5klU113E28kOdzETszUS/8JqKvY=
X-Received: by 2002:a05:622a:1aa8:b0:3df:58e7:4aa5 with SMTP id
 s40-20020a05622a1aa800b003df58e74aa5mr1704739qtc.0.1679307074525; Mon, 20 Mar
 2023 03:11:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230319115925.1317654-1-sensor1010@163.com>
In-Reply-To: <20230319115925.1317654-1-sensor1010@163.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 20 Mar 2023 12:10:38 +0200
Message-ID: <CAHp75Vf9kwhbZaGjZeN5Jq0Wr_yJtDdj9N48-3o79AMORqmS3w@mail.gmail.com>
Subject: Re: [PATCH v2] drivers/gpio : Remove redundant platform_set_drvdata().
To: Lizhe <sensor1010@163.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, geert+renesas@glider.be, 
	info@metux.net, rjui@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	f.fainelli@gmail.com, sbranden@broadcom.com, shc_work@mail.ru, 
	j-keerthy@ti.com, hoan@os.amperecomputing.com, fancer.lancer@gmail.com, 
	orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-imx@nxp.com, kaloz@openwrt.org, khalasa@piap.pl, 
	keguang.zhang@gmail.com, daniel@thingy.jp, romain.perier@gmail.com, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de, 
	grygorii.strashko@ti.com, ssantosh@kernel.org, khilman@kernel.org, 
	mani@kernel.org, ludovic.desroches@microchip.com, andy@kernel.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, jonathanh@nvidia.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, michal.simek@xilinx.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-pwm@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-unisoc@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_031116_827216_E9400CA7 
X-CRM114-Status: UNSURE (   8.86  )
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

On Sun, Mar 19, 2023 at 2:01=E2=80=AFPM Lizhe <sensor1010@163.com> wrote:
>
> platform_set_drvdata() is redundant in these functions.
> the purpose of calling this function is to place data
> in *driver_data. but the data is not retrieved in these
> functions

You need to:
1) split the series on per driver basis (not all of the drivers are
going thru the same subsystem);
2) improve English grammar and style in your commit message;
3) carefully explain in the cover letter your methods of finding the
places you think need to be improved.

Before that it's a waste of time to look at your contributions.

--=20
With Best Regards,
Andy Shevchenko


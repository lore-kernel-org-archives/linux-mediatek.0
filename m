Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C108AC636D4
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Feb 2023 04:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oGBLPshZPGMrS1uWiQyc0lNEwV+H+9iGELbs6/oqYEE=; b=M2bv47HcdWaWSIDSgFrAULyVko
	3ZBsfPzWGA8jCrkeD4qeez6Yuwtb9bFbtXrH9QXY8+ZXy5bZvDEPxOaan2z4njTsYV/12Ob91qp6k
	mDsHtx0xzG/wpwAabqIzA0j3zlCXowZoJjzJBPKhihmQWt86oyfB8+ZOrwYy0FcKwcPukPWkCXFva
	VAw0hGyPw3KbDvgPC5BkOMu7QTB+NagwraUGros8MR2HQahMX/auU1NSxSOSWXKe8TyBm1vwaBMjI
	QfnwCr24CTUdpmEkZ/ATyFxpVcZ5MQVXEjOglW+R4ZgL/R7FlrXEjiCjlPkgC/a5LzlHr6IHJqNle
	bHhNHjfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSs4c-00CZ4A-5f; Fri, 17 Feb 2023 04:10:14 +0000
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSs4Z-00CZ3S-SY
	for linux-mediatek@lists.infradead.org; Fri, 17 Feb 2023 04:10:13 +0000
Received: by mail-ua1-x92a.google.com with SMTP id s21so676322uac.13
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Feb 2023 20:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oGBLPshZPGMrS1uWiQyc0lNEwV+H+9iGELbs6/oqYEE=;
        b=AcI0DMBS+/8O38CDGd3KCIk92zOU6tfwU6NbqMhu2JUhWe77Vhh81T2y1DTRAiwgx+
         2hnqx+Sgd4LCgmOmMAd3UYsr+V98siDYvfRf0eT80lANMitKBGpnwvDiQ3bD7bY3Arbn
         BMkMTihpdrBeQjYAbmMW1a26t+ktCH4Yb5T5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oGBLPshZPGMrS1uWiQyc0lNEwV+H+9iGELbs6/oqYEE=;
        b=an/DytTLwxYUMtfU0doMGnvfLKPOXz1tlDD1RqBUPy/M2OI57krE3LlEPePrDJw1LX
         2WIeeoEDPbRHPlIaeZoYcAaoC6SGFjiPGwo7B6R3+6nFYubfLXgSfthan0ASZ2tLr3U4
         5LuwQ9lv30J1lXGshP6r3y6ktf+6cSH14e28rd1kkaH0z1wbsOyLCWl2gGInIqqZ/ZER
         Z1LhF3zKYlfL/PLXBsYRrO9LkLONNMemKRLzDf5wZF+v03S5hcr7HbcpAZBYje/oeCpf
         ILexjsnrLaLJ3SOn4hsTZx6BQFksOOr1zmla5WVNsML0weBpPDXSBONrDaGkTjreFBRx
         ADsw==
X-Gm-Message-State: AO0yUKX/Yhsb4SI1fIUkESCoZkOD4r+YLROBSMSprxm616g8BTyyk/aX
	pFTzMGCv3IC7bqaFvhFa14OpTL42n4OyKLqh0oNgIQ==
X-Google-Smtp-Source: AK7set98SeNGl96EZizNQbwyR9dDOavG0wqLsoG9BX82J6+26nzoNTPbkoI/Xm8xERtgLUXiCG8Vl/Crx/a2DbTjOIo=
X-Received: by 2002:ab0:318e:0:b0:688:c23f:c22f with SMTP id
 d14-20020ab0318e000000b00688c23fc22fmr1246817uan.1.1676607010310; Thu, 16 Feb
 2023 20:10:10 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-30-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-30-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 17 Feb 2023 12:09:57 +0800
Message-ID: <CAGXv+5EEO2RMzwkknMEwYZmtO7PbDhOTj_=yRrU0UHeCdc==iw@mail.gmail.com>
Subject: Re: [PATCH v2 29/47] clk: mediatek: Propagate struct device with mtk_clk_register_dividers()
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
X-CRM114-CacheID: sfid-20230216_201011_990918_449EC9A1 
X-CRM114-Status: UNSURE (   8.42  )
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
> Propagate struct device for divider clocks registered through clk-mtk
> helpers to be able to get runtime PM support for MTK clocks.

Sidenote: I think we still need to call pm_runtime_enable() (or some other
function) on the underlying device before any clk_hw_register() calls are
made for the clk core to pick up runtime PM support?

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>


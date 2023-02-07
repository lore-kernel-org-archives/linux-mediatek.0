Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C3EC636CD
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 06:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JzZxhqIK8VhysJ5sWFrp6HBP0d2gguK8lzGF96oeeJY=; b=aWy7yKvY8TFO4lnANumeC4X6u4
	8PirC5BdUNHUFsq/QIzRl8z3dWZ4CGTTJtmmu1vuDPjSXTGOAfqGlY15YQiEZNFqF2azny9rkdiop
	R50fmWLScKmmAyQJ5Gf0mBtRdGKMqigYecWuYxEYALs3Jvgm2rVQgSn6Q+Sj0dzsJXH5olx2a3Ssr
	127aBe05SPsloiydXuiqxEmNB7UlEYIpIgmIdV1CsnCqoquJiCYrkcC3X+3t9/M087440bbN8wiX8
	3VMpxH8UIPdiRsqQz9pm/2LU9smtQyxqA9zCRhpons31QjrrFH7qCJkZmEHPL9UUD0bAJALCAG3wz
	uP9iFQaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPHGI-00Ax9A-3z; Tue, 07 Feb 2023 06:15:26 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPG72-00Ap7f-G0
	for linux-mediatek@lists.infradead.org; Tue, 07 Feb 2023 05:01:53 +0000
Received: by mail-vs1-xe30.google.com with SMTP id z22so1117999vsq.11
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Feb 2023 21:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JzZxhqIK8VhysJ5sWFrp6HBP0d2gguK8lzGF96oeeJY=;
        b=k9hUTA70o7Pv03Fw+mhKWYoNw4WzoTEgJU4opObsu/oieKz2vo8+0EzrZdclvkFM2l
         34zZdwyIUTed5eK+R6GWFBJhpEEHuBGkRvbui8S+7SDPNd5UnjVpL7aV5gN3N7DzoBx8
         H03d53epQkYi81+4qHff9il0/LWAUGelm3NRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JzZxhqIK8VhysJ5sWFrp6HBP0d2gguK8lzGF96oeeJY=;
        b=HsUriaX2lb4983rg87WbbcncnUsSKAea6wus4qI1VgVamsw5UIyK1DcqsyH4mBoiq1
         gZFwD+2TQYEvCGjJSbiWwxUQq+H/xlAiJPGOjuImSCH+mSaSAMn1yVUzM66ipYVKKsd+
         BYkttfFCyVkB+mgyEjAJ0gJptKL8PrLlO4O577r8Q/0aM2FCwejKoodf/Il56+M0gneY
         TsxEqCfrGbvne0KN6Mp46gh7lthrKjjYbIknj7qSAENOjFmx1Sw8AIE824KtrULTLx3n
         +C5WyWY5e1hY59OjWmFCdXwlUCm4PKQzVjoN3fJ4B22/WWhF9nvmf8hGRqAWb75NQeYh
         TEjA==
X-Gm-Message-State: AO0yUKWgjg6vQUIKo9RyEfUBYxY4CnjO6lelV9ZC/8oRI90UK1tQFobb
	QvS2eXYtkqdCU11u89x4kgC4rejUMTdtE1OHhoyuaA==
X-Google-Smtp-Source: AK7set9Z70LfNVS6WrBF5dXe2VuLYtlYTHr8qqFya8+8Mty35+VW4+2UeSbTXwSsqJOqw6PJvuPi/t/tzMePg+eAeOg=
X-Received: by 2002:a67:d206:0:b0:3ed:2cd6:deed with SMTP id
 y6-20020a67d206000000b003ed2cd6deedmr501277vsi.65.1675746106739; Mon, 06 Feb
 2023 21:01:46 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com> <20230206152928.918562-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230206152928.918562-2-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Feb 2023 13:01:35 +0800
Message-ID: <CAGXv+5H+dFdrXB1dWRwzU+CsBe6rE+ge1T7St08kueSgepA-kg@mail.gmail.com>
Subject: Re: [PATCH v1 01/45] clk: mediatek: clk-mtk: Switch to device_get_match_data()
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
X-CRM114-CacheID: sfid-20230206_210148_674570_C4B0A36B 
X-CRM114-Status: UNSURE (   7.14  )
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

On Mon, Feb 6, 2023 at 11:29 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Instead of using of_device_get_match_data(), switch to the generic
> device_get_match_data().
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

though I don't think this does anything for the MediaTek platform lol


Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E685C05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Feb 2023 04:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4sTtq7wFwfGuxLqDxyAbIt3LJdsd3KOuYS5ANkRiYHw=; b=qEbWqVWV46a4bbNJcJWtwtMliy
	xuIII6s4FCNaRlZelPGeGLI2uJ2ROeZu9W06KvB1VF9Z9KUNm5ic1Yn9eyyZe1GGdY4fB3k8bDyE3
	lCPmqOLsiVETkUnbkXAwrnMskT+tgOviX9GN+sWjWEKN01O/N8cEnOdkG/PLMbWvh5fYP/AOYKTTV
	k9mPIx+j9H10QcTFSomnZLYhsWopPE62+lPBDxi/b/hSPi+lTiuqC4xRruXJd8vbxw5VC0e7Rpylf
	RvoEM7nsO1TP6mXdcz6JM0+BOGd0Kfo/ZDhXPBA3Z4NJurgEfWfS0HBsanCItN2CqTOFc6Ezaft3b
	JzsdBeUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSsEO-00CdP9-04; Fri, 17 Feb 2023 04:20:20 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSsE4-00CdFZ-0r
	for linux-mediatek@lists.infradead.org; Fri, 17 Feb 2023 04:20:02 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id v16so3193478vss.5
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Feb 2023 20:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4sTtq7wFwfGuxLqDxyAbIt3LJdsd3KOuYS5ANkRiYHw=;
        b=IWaIjlWzGtsANAL7ZOY9G0Rlf7IIg1kBFaN6cS2/4Wfm4q1nVRLdAzybjw9kIFtWdC
         QuXTT8lfhSiRPRiYZNkQyHOMU+ziG8o3fw6NXxM/XgySm9IyIZGJheJIsm3gC3vkFK/H
         AZ1W/3GqLzmGhXO7wC4wThyN1L/P5FvnMxMtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4sTtq7wFwfGuxLqDxyAbIt3LJdsd3KOuYS5ANkRiYHw=;
        b=OCaBCBgSEr/KcJOeTpSqla/d1jz22oJeB42giKiFwumcLzi1pNFwmeUS5BqUWsMenC
         0x6ZYfQRVkBwjvw6FQYsTm6/UVsZe2uXMJoVNg1eY2eRWnl4IIuDLeJXDuNrROoIpDPN
         2SdaTdvcI6LaJ1NartS9CKdrst765j3f1HFT/X6vXHWRJkyOrNG7DmAXrLooBhurShfZ
         SjO/5hk8dq65Jx/KbR9XOsNieLqALtEyXgECfsgcoHDbBAeM0asuZGLKpAYFZD/v4Hpa
         PQUP6rbtNWusP1jVeb5BAd5pC/FpPWJFc1a8u/Uhk3xlIm1xv5rAKNaD4yMH5KHGZUO0
         YjOg==
X-Gm-Message-State: AO0yUKUq1jKPV72yNTlzgV++jDQ8Lnj+4Pi55OJYzskLhfaq3q/zQLzN
	9p+QL2+E2+4HHc3Az7sK72mhfeT1bYngyhoL8yVMMA==
X-Google-Smtp-Source: AK7set+TWoZwk25NxtdG8DrZrA0ocSyVUePkzShg/KIelJ15xWrmFKfqafySgze6zE4nGexNOj4qAqkDHQsO0OWilTE=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1527880vso.60.1676607595777; Thu, 16 Feb
 2023 20:19:55 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-35-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-35-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 17 Feb 2023 12:19:44 +0800
Message-ID: <CAGXv+5E3KCRyaRpkYab0XmT8XDZQO21RYBpKVgCcGtWmZ+dv3g@mail.gmail.com>
Subject: Re: [PATCH v2 34/47] clk: mediatek: Switch to module_platform_driver()
 where possible
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
X-CRM114-CacheID: sfid-20230216_202000_130304_02ADA8A5 
X-CRM114-Status: UNSURE (   8.87  )
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
> Lots of clock drivers have got both .probe() and a .remove() callbacks:
> switch from builtin_platform_driver() to module_platform_driver() so
> that we actually register the .remove() callback.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/clk-mt2701-aud.c          | 3 +--
>  drivers/clk/mediatek/clk-mt2701-bdp.c          | 3 +--
>  drivers/clk/mediatek/clk-mt2701-eth.c          | 3 +--
>  drivers/clk/mediatek/clk-mt2701-g3d.c          | 3 +--
>  drivers/clk/mediatek/clk-mt2701-hif.c          | 3 +--
>  drivers/clk/mediatek/clk-mt2701-img.c          | 3 +--
>  drivers/clk/mediatek/clk-mt2701-mm.c           | 3 +--
>  drivers/clk/mediatek/clk-mt2701-vdec.c         | 3 +--
>  drivers/clk/mediatek/clk-mt2712-bdp.c          | 3 +--
>  drivers/clk/mediatek/clk-mt2712-img.c          | 3 +--
>  drivers/clk/mediatek/clk-mt2712-jpgdec.c       | 3 +--
>  drivers/clk/mediatek/clk-mt2712-mfg.c          | 3 +--
>  drivers/clk/mediatek/clk-mt2712-mm.c           | 3 +--
>  drivers/clk/mediatek/clk-mt2712-vdec.c         | 3 +--
>  drivers/clk/mediatek/clk-mt2712-venc.c         | 3 +--
>  drivers/clk/mediatek/clk-mt6765-audio.c        | 3 +--
>  drivers/clk/mediatek/clk-mt6765-cam.c          | 3 +--
>  drivers/clk/mediatek/clk-mt6765-img.c          | 3 +--
>  drivers/clk/mediatek/clk-mt6765-mipi0a.c       | 3 +--
>  drivers/clk/mediatek/clk-mt6765-mm.c           | 3 +--
>  drivers/clk/mediatek/clk-mt6765-vcodec.c       | 3 +--
>  drivers/clk/mediatek/clk-mt6797-img.c          | 3 +--
>  drivers/clk/mediatek/clk-mt6797-mm.c           | 3 +--
>  drivers/clk/mediatek/clk-mt6797-vdec.c         | 3 +--
>  drivers/clk/mediatek/clk-mt6797-venc.c         | 3 +--
>  drivers/clk/mediatek/clk-mt7622-aud.c          | 3 +--
>  drivers/clk/mediatek/clk-mt7622-eth.c          | 3 +--
>  drivers/clk/mediatek/clk-mt7622-hif.c          | 3 +--
>  drivers/clk/mediatek/clk-mt7629-eth.c          | 1 -

This one looks fishy. It wasn't converted to the simple probe library.

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>


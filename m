Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C9BC636CD
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 06:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zP2ygbVdDON6yUIfexoROgjUPhLPhR3gUrJen46Rt4k=; b=v5Dn2s7882SiBkPo1nhHztbQhx
	BHfYQ8pJxkL3u9AlfMu9v1NRmmPPWZh/KiLzPYgKKA1QS7OgzGjtWPIXOc1txLuVwI6yqeObYFDQ4
	e+NDzbhC6N1Bpk4v+Ljbtq0K6v87gbizsxv6JKDBQeqnqvbh7JsrYJQTcjLM4tiSK/tRefbaw9rp4
	s+soYqyy1orvjZDuTg/rf1kkGKbDz5Fw50ajfXDA/dO2f7EcQz6OUCQjl/bToR0WmhPdZsv4h3XWO
	2vxoyvjSCNIwvRnzfOszsgGnPxFr4pVLXEfVwZaawd6cOmUvBuY5Zy8euXKPCJfwItrkRAfxi5c1Q
	5PtlH9dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPHCv-00AwL1-AB; Tue, 07 Feb 2023 06:11:57 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPHCe-00AwBn-F7
	for linux-mediatek@lists.infradead.org; Tue, 07 Feb 2023 06:11:41 +0000
Received: by mail-vs1-xe29.google.com with SMTP id g3so3829557vsr.10
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Feb 2023 22:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zP2ygbVdDON6yUIfexoROgjUPhLPhR3gUrJen46Rt4k=;
        b=njFbTgS2Fnz3eXZQG2IIJq44fTew4djBUK9I5vGRHno7jZJxYxJ1F+n/A6/9kRBU5+
         V5jzuzeDn1fRqBRoQ9ckiOYh3BaOU8U9oH1FdOkOana/r1CA4Db6gTTxjrwrr7JFCVWz
         CGBPbLeqbDDy2BWvEu3oUXn4Liaqav4bL4kdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zP2ygbVdDON6yUIfexoROgjUPhLPhR3gUrJen46Rt4k=;
        b=u928AqGEa2C+kq5F/12TvJNE7BIOheXv2SUTII2eD83zsTfQunbB87pEOhv48CvCP9
         yVrXJpgf8gzu1EOoLxo3KnK+rT7bzuDlrbvzGcU1K4CMaqFYjLwjkJagQC539ANAILcX
         Vk38dkxffhO9FuuqasokQAJgVe24c/qQQrdOXiUQiplHot77fWwdwHphHUeV1A907xzN
         gpZnSx/z9wr5NGdGv84rlb5boON+TmWhENJispWFKYrWl+f06+P4jExtGoiA0oPiGbv1
         Iyb36v1B4JpIAvJJOAsh6UhoesWAuDIk7YpJuiUEV78PvwXNva/6npGWV0SlR3X4LRIu
         z2Cw==
X-Gm-Message-State: AO0yUKWWMkZ8t2jEJlYNk6yF2ibuu8PJGTxd4OgmQ2ekNppybqirQ+22
	Er951bhWtYJTEaz3KBWni6jLA6N5ep90SqcteXoZGg==
X-Google-Smtp-Source: AK7set/rPPS4UD3H+wPsyBdYQgSN6AGYtE3iy5mIdz5UsLRmTWNhHy9DVvsGzrlJ8515poglceCc81LaO1hE0/O0uFg=
X-Received: by 2002:a05:6102:3d18:b0:3f7:93c4:9e56 with SMTP id
 i24-20020a0561023d1800b003f793c49e56mr545453vsv.85.1675750297266; Mon, 06 Feb
 2023 22:11:37 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com> <20230206152928.918562-5-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230206152928.918562-5-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Feb 2023 14:11:26 +0800
Message-ID: <CAGXv+5FxX4tue8owuxbrA2NNxmQdCnYj7orbam8AUFismTA1jw@mail.gmail.com>
Subject: Re: [PATCH v1 04/45] clk: mediatek: Add divider clocks to mtk_clk_simple_{probe,remove}()
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
X-CRM114-CacheID: sfid-20230206_221140_523453_42521795 
X-CRM114-Status: UNSURE (   6.83  )
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
> Add support for divider clocks register/unregister in the common
> mtk_clk_simple_probe() and mtk_clk_simple_remove() functions.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>


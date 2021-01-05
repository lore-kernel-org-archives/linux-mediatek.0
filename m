Return-Path: <SRS0=qO9d=GI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A6DC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 22:41:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE37922D6E
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 22:41:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE37922D6E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rukVmrLEJtBLKXDVMm8vNI0JOT6fBuf3wgsT2ktTTb0=; b=CnkO7MRLwCNiGs0NO336vEpCA
	wbdigwLdISAyCqsiVv1kmhtfnULL78Tni/j497s3LIJBPla1l0yalBn+qRTH7xQPr9EmmVPTzX8ZB
	v5OgRXJI4AJksKqxDUi0IFP2gtoHFfixzunn1GHnagNo0VNQj1uQ/lxK16Xc5Xc5FC7H44FFtMT0L
	IW7xljIdlURoyuXTX2V/3GjvWgDvqOBmHC9sMRskiu9HiNGidsfz951vpO/XjxfpVR54COfQ05kEz
	rRpZJuzmi4wV9IEcarmDfnD626bMTUZ+KajKYco4Oagz1J4XYhQuBOPiC++FvKUdW5fFL4R8HT/6c
	fFFGT2wSA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwv0W-0000of-L5; Tue, 05 Jan 2021 22:40:52 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwv0U-0000nf-8M
 for linux-mediatek@lists.infradead.org; Tue, 05 Jan 2021 22:40:51 +0000
Received: by mail-lf1-x134.google.com with SMTP id a12so2257486lfl.6
 for <linux-mediatek@lists.infradead.org>; Tue, 05 Jan 2021 14:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A9uJ+mRMwMNCjTDA7H/Mm7rI4bw9j4iKv8gt3pZkI1A=;
 b=Iox6T65sT6cbzUPZGs6r2WT1UcGm50nonReKeZ1J9nPB9NCFRrTteX4vpPI+xFbO5l
 DyJRrwiNFFCbY2XIBy3K9qn3WvApzDXm1+kiDGRu5h/EGoadlZzUNz3BD/CFOc8WTXEz
 vPdh6UWNFEgHmXg4bZNO3U9Ka3Nq2kFEdazHzEGZywA0RGy1DE5NVGloXaV3mAg2Ci0y
 WT6ZnmvP8TLpc5Aqr8jJWsz0EkjwjZGg1azMyix5WFrmrIoyomnN14DFpNfvrk+APLTw
 DLLRg6m2/zNcpCXLQYOZrTiBQ91ZhMLBFoYQnf7H2al5YY6LENFsEZFLDFTQ+mOq3eqr
 6i1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A9uJ+mRMwMNCjTDA7H/Mm7rI4bw9j4iKv8gt3pZkI1A=;
 b=VZFHwzzS9vTQviAR5Fvq4GLbYXYjjhaJ3Siv8kx1obDvH3Ei2dYw6g7TdS0SaEvXFU
 H8UK2e/rw549BjCrgMhU1uu5RJeGP1z7A0s8RyiDc+9ZnTg99+0h8M3/HLnsuiFszxIK
 R985Xpibpuc7lkQILdPd2wtU7p5ACneF9ukfinCXJGOuWFPea0GaZx6MuErGmxv1YBw0
 JplI5qhbG/wRIEF37rpfdBE7SfUPr5aoOAK8cksNnS4TnKJjHL7H4Xyo+N5HthzzW2Z3
 Zhi52et3/UVC0YQXilvxo8oMdj/lP6PYulD255zoehci62pFk3E4VbCOjlHgj+t0D2JI
 oJyg==
X-Gm-Message-State: AOAM532xGy9eoXvgrtjEHMzC9VkVo2Pl7VJXVm9QMW3f0Xgo/vScpci1
 fkzd9oQeC7ZyX51Xz+Qgpvf+kQkSL3VU8qGw8hToDw==
X-Google-Smtp-Source: ABdhPJyrC7fldffb5OLrFw01LwrgpdXzjc/LW2OSxOLTM/0TxS5i8SQmbP+5jZ1/YeIQPTX3gsunWenkiAOIokiJrt4=
X-Received: by 2002:ac2:5597:: with SMTP id v23mr563643lfg.649.1609886448380; 
 Tue, 05 Jan 2021 14:40:48 -0800 (PST)
MIME-Version: 1.0
References: <20201228090425.2130569-1-hsinyi@chromium.org>
In-Reply-To: <20201228090425.2130569-1-hsinyi@chromium.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 5 Jan 2021 23:40:37 +0100
Message-ID: <CACRpkdZpGd0qVLk1y7y01K8-rrRhNFSYuCzs-GGnN5_tRzKfOQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: Fix fallback call path
To: Hsin-Yi Wang <hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_174050_337195_2F1CBEDC 
X-CRM114-Status: UNSURE (   7.82  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Sean Wang <sean.wang@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Light Hsieh <light.hsieh@mediatek.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Dec 28, 2020 at 10:04 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:

> Some SoCs, eg. mt8183, are using a pinconfig operation bias_set_combo.
> The fallback path in mtk_pinconf_adv_pull_set() should also try this
> operation.
>
> Fixes: cafe19db7751 ("pinctrl: mediatek: Backward compatible to previous Mediatek's bias-pull usage")
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Patch applied for fixes!

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

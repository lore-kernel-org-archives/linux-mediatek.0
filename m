Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C43C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Oct 2022 09:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98IO7v4xe6xTRSMVmEU9y8rCEMPnvS4WCx1Z1aI89l0=; b=3n4eNTFUAUNHbWGJubSFl6mDc4
	mLxzWlzD2b1kzUW5JgjJULQLDv+Hkej8MX9S3A/vlLou/5OKG825KvW/Nz0ByPsB9YCIaB09b6d+/
	jv5809Vt0J81i+XKCfz3SwS3sqKtXTm1+xGlOv+T3WGBDnwuSdslYsQXTLMId/1jYlPLziD3LXPoa
	rv9Ug8MQ7rR8vOnlMWRCAdZPFr9qRLeUA+zXX8tRMfV7xsKgd/V7ZUikjx8R9mvOj97CvLSrP4T20
	GIyl7KK7rc2FXXIZT+0b4Jcl740K2RcR2X1TYu6dujzSCAWiQ5K6gIkX3T6iRUNzKzKJA5wWqy108
	bFcOcPpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okMrp-00A5Hw-0B; Mon, 17 Oct 2022 09:57:05 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okMrm-00A56F-JX
	for linux-mediatek@lists.infradead.org; Mon, 17 Oct 2022 09:57:03 +0000
Received: by mail-wr1-x42b.google.com with SMTP id bp11so17620511wrb.9
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Oct 2022 02:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=98IO7v4xe6xTRSMVmEU9y8rCEMPnvS4WCx1Z1aI89l0=;
        b=X8rGc/bfS17IEWrbeqU6BDUWLSP0QJsGnetoIaACMKO3KrZZeIH14r+vk0yvwUux1w
         XxI0FwnhDHZlc7P2mU1QHOY7J7ixf1I6vMdVZTXFk1Pjq0kxpeH4GH6o+6B9vxzBrKCI
         IcKNX26a15LhYiZTL2jwLp+3chgnQp/GyZCC5IddBhNM9zihPopt+9PJLsQihaQpzKQ8
         Q1iSz7Tsp/IGeCf4oOnDm1yeYi/1fU3w6nU2rbTC0j0PMrdQ6P3amUgISMr/hrXKfJR9
         abbqrOO1GRLVvnLXeRFANZz+ENUz9ArzKH0Yqq0N5bXddsCYcpkDEvk9BAK6u1HKCS/K
         BpwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=98IO7v4xe6xTRSMVmEU9y8rCEMPnvS4WCx1Z1aI89l0=;
        b=W+rGtHYbyUxRgh5KkKrU+opmb3Tev9p1CZpBAoB8XhozLM/Mv44EttwPleW9dTn/oW
         nd/nfJQGiAden/tIfYUABLErtrlBzxhPci4icEwUmX/J7zt44FsgaUiDfwvB3S+TVJZb
         UGZ6Fv8QE3xfE5PcGBbDzhDvfNAAT8oKxT/GHdJZFP4GTlJ6Vn/j72q9wabQB0tvjyX0
         f98v+/eTnNwAYppdQjNU8vl6OrICDHGcUvwJETH36q8/5lKjUR6UUrp3F2NYJ9wK607v
         CwC5eBrKJsDLUDqpPO1641JsZfNGqTDvW1/rCJDq/dGWjYqHX19Z05JIasvFn4iJt7gy
         3xyg==
X-Gm-Message-State: ACrzQf2zg5QVCxDFZawh6ZWxOYYm9NIjYbEauyMKPXWI7uiSPeJStlv0
	YHdkNVxVGSjYq5JshrUI0ZHZfiKk8/JU3AG/G4GQj65NW9Q=
X-Google-Smtp-Source: AMsMyM4bkoes3awa7pSmHgcDYadIFtXhLIf56hwmM6LoX2tPsA/sqRrULDZ+14SgjJXNDSgjr89adq5Wa0Jkh5+XvbQ=
X-Received: by 2002:a17:906:5d04:b0:77f:ca9f:33d1 with SMTP id
 g4-20020a1709065d0400b0077fca9f33d1mr8065569ejt.526.1666000610608; Mon, 17
 Oct 2022 02:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <20221008164807.113590-1-linux@fw-web.de> <CACRpkdYNZGJaVN0eRZPmkmWr=it7xZtAPM=qV0EyQWUZgZ68hQ@mail.gmail.com>
 <CAGXv+5FNQmx4Mxm2fTkWBazX7B_LzGuTY3cQK5f_yO4cE5c8mA@mail.gmail.com>
In-Reply-To: <CAGXv+5FNQmx4Mxm2fTkWBazX7B_LzGuTY3cQK5f_yO4cE5c8mA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 17 Oct 2022 11:56:39 +0200
Message-ID: <CACRpkdYk4HPUTg3UxAZPkydUHeYtMkOVRGR-Zozrh5=VxfFcZQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: allow configuring uart rx/tx and
 rts/cts separately
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Frank Wunderlich <linux@fw-web.de>, Sam Shih <sam.shih@mediatek.com>, 
	Sean Wang <sean.wang@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_025702_669806_944CE5A5 
X-CRM114-Status: GOOD (  13.84  )
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

On Mon, Oct 17, 2022 at 11:49 AM Chen-Yu Tsai <wenst@chromium.org> wrote:
> On Mon, Oct 17, 2022 at 5:42 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > On Sat, Oct 8, 2022 at 6:48 PM Frank Wunderlich <linux@fw-web.de> wrote:
> >
> > > From: Sam Shih <sam.shih@mediatek.com>
> > >
> > > Some mt7986 boards use uart rts/cts pins as gpio,
> > > This patch allows to change rts/cts to gpio mode, but keep
> > > rx/tx as UART function.
> > >
> > > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > > Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> >
> > No response from maintainers for a week and patch makes sense
> > so patch applied for next!
>
> Could we add "mt7986" to the patch subject? Otherwise it could be taken
> to be updating all the SoCs.

OK I fixed it!

Yours,
Linus Walleij


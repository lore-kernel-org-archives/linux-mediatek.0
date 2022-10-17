Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC64C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Oct 2022 09:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ODsmbg7BkAQxQqFdr9mvdYHhSzuV8ymKABrXWhG3P/4=; b=TnFpb4t2BMgcF/dRQ5y8C0Ot54
	GHuKdbL/4YZ7wwFuKwehtdXaKiXqF+dJKbFjWTFdW7JtO1laOiQQLSN6jJBpMS6kIf7G8ybiaARKT
	PSoWSrN5Y+OoXKueSAhAHALZgz51e1tPLyRGH1YqksHJWw/wz+iccmfdKMncnS74meXEVsyjZkD1u
	HBx8o4SmukP3re3T6lIR6KprBtb2Z3T2cYLTCvxZWmDbBJO+QMIThUoWP4drvz3H2V7y3VYBl8VCD
	s0qS6cB1RUops1v2LHzMsYWaDHN7pyAOLvhunsawDoLI9ob47yAj3a4M7QlSPtyKjhsLni5+kaP1w
	S3j6/Vog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okMkg-009vt5-5G; Mon, 17 Oct 2022 09:49:42 +0000
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okMkc-009vsL-UH
	for linux-mediatek@lists.infradead.org; Mon, 17 Oct 2022 09:49:40 +0000
Received: by mail-ua1-x92c.google.com with SMTP id h25so4141955uao.13
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Oct 2022 02:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ODsmbg7BkAQxQqFdr9mvdYHhSzuV8ymKABrXWhG3P/4=;
        b=NHNdLlZ6k0TfGJkws9Sv+KJR26eBvLaMd2f9LZ3OfpxmaiO7ThqL2Jssn4aqmQBQei
         9bT/OUH9ZlMXLMUtAqFb2xCm5EA5EJoy4u7nujATCTvH4gcp6Lji22oQO32xk2r9m0e0
         ahktLMcfqtk0jzDCuCnQA9I0TLUr+fsCskXx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ODsmbg7BkAQxQqFdr9mvdYHhSzuV8ymKABrXWhG3P/4=;
        b=ydItR9vTCLqAaV2vgGQddMSXMxbnxaSGSUSzLKpb/sop0KrJM0HUzGQ3TFtIHtaUoJ
         mBELstQb3EcR3EXmbFMBVa4NMac8Mj+MwJNs7Flfd7PWglX2KzhX9wP1Gp/xpGOnRkQG
         dhT/iB9v5pk2nYwt0GgoWckgcgTYI3YdPL2v5EiFDv8UMvIHDc89RZG486hjS571i4oQ
         AnWLq7YGEVE9gMxEBpfCn03wxml1aYtLtKEKqsb7icH4BWhdO4Jpb6x4fs3pf7cYrWfp
         utssGK85t7uNkdArT+WIKV75fS9RebC42+8KQrpf3FHXv5Rva8PRnTyDz0Icpa0dgibs
         Rrdg==
X-Gm-Message-State: ACrzQf1K3YYFgUxXyhmIt1pIWxlprnSgYT01Bb1uTd+la+mlL5u/lhcB
	/MDueMmLgeJr20pa57LppxqkcUASh7jrwhrAdDplYA==
X-Google-Smtp-Source: AMsMyM6F3rJpTxDDVrEGahK/LEkym9dPWVfJuS8iQS9gvSIlZxufJp9v5EIVgFbOEkOvFbdsxxmNhoqULjOJlqhCpwE=
X-Received: by 2002:a9f:29a3:0:b0:3d6:4c6f:9d92 with SMTP id
 s32-20020a9f29a3000000b003d64c6f9d92mr3849868uas.43.1666000176425; Mon, 17
 Oct 2022 02:49:36 -0700 (PDT)
MIME-Version: 1.0
References: <20221008164807.113590-1-linux@fw-web.de> <CACRpkdYNZGJaVN0eRZPmkmWr=it7xZtAPM=qV0EyQWUZgZ68hQ@mail.gmail.com>
In-Reply-To: <CACRpkdYNZGJaVN0eRZPmkmWr=it7xZtAPM=qV0EyQWUZgZ68hQ@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 17 Oct 2022 17:49:25 +0800
Message-ID: <CAGXv+5FNQmx4Mxm2fTkWBazX7B_LzGuTY3cQK5f_yO4cE5c8mA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: allow configuring uart rx/tx and
 rts/cts separately
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Frank Wunderlich <linux@fw-web.de>, Sam Shih <sam.shih@mediatek.com>, 
	Sean Wang <sean.wang@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_024939_026252_C6619C2B 
X-CRM114-Status: GOOD (  11.84  )
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

On Mon, Oct 17, 2022 at 5:42 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Sat, Oct 8, 2022 at 6:48 PM Frank Wunderlich <linux@fw-web.de> wrote:
>
> > From: Sam Shih <sam.shih@mediatek.com>
> >
> > Some mt7986 boards use uart rts/cts pins as gpio,
> > This patch allows to change rts/cts to gpio mode, but keep
> > rx/tx as UART function.
> >
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > Signed-off-by: Sam Shih <sam.shih@mediatek.com>
>
> No response from maintainers for a week and patch makes sense
> so patch applied for next!

Could we add "mt7986" to the patch subject? Otherwise it could be taken
to be updating all the SoCs.

ChenYu

> Yours,
> Linus Walleij
>


Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87873C369DC
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Apr 2025 08:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WJvHqnebj7+LXJjSH0Mss95pSFkkrTByr1+7aZOP8NQ=; b=fY6OK/c5h1erZN2DLh57N9Z0ja
	9Kntx2S7tueJSxzrHGAq4LdMJ56prJW3Y+TZfKvIAvuhvdOh7r4jWOxPLyfz2WBK9NGG78nGsNtAq
	qSEipCB+0qVZoz7q/56xsVFWfkzYaw8C589G0s4Gqf7Hp6/sBV+4X3FHmrst+oVCLsIGXKjgloYpT
	kORQHsHf7H6v6UvBDx+snQeTCy+K2lTRfNjeNlgQ7dXanvVZ/WGozM56V7uOi81N8WSyh3IUPV+Of
	DM/T71DcIzfYgPx6s5ZvgsAEFp3HG8kGGXuj8LjSVrF2QNag9FTpEhwmjdgvVJHO/p3W4MYFzmhPI
	Xb5oPCNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gYz-00000008yuZ-1gjP;
	Tue, 29 Apr 2025 08:43:37 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gUY-00000008yB1-2imv
	for linux-mediatek@lists.infradead.org;
	Tue, 29 Apr 2025 08:39:04 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-3105ef2a071so56526881fa.1
        for <linux-mediatek@lists.infradead.org>; Tue, 29 Apr 2025 01:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745915941; x=1746520741; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJvHqnebj7+LXJjSH0Mss95pSFkkrTByr1+7aZOP8NQ=;
        b=oBLNERm7HA/vgrdybXbBDHev4+NTSfs4I7/gS1tABSLqPu8UKRHAMJUXoox9u2cnyM
         lDZpcb16ojGpceoy+eWhc7aZnQ9w/H2/D0kLLZmOME6Wa8Mbbb4GsQiN5oUaDeLGEOnt
         WLnLSEiYopo/qf1v+3jRqK1zCZj9m+esOuXp+2+PLYUNjIfzjmanVWiNhL6mehhd3Gd+
         tpHqR6UxYVQHZB56a5gTSiqePDqe89NaHGbRsHoC96wlwyUFI03qZ9RaFCO/Kx3d3Rws
         LQJZOdj6oSO6wwD1YbUcpwntPx6xDwcYJA+2zxXeUva9hsg7HRfZCykbcnJnpLmrB1l+
         SF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745915941; x=1746520741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WJvHqnebj7+LXJjSH0Mss95pSFkkrTByr1+7aZOP8NQ=;
        b=lzKHfgM5ZU3kalhCjVa2AE6m2TFIq7vJMGVgxYv1pMVKTo7EJqDOxTXRD832CbFfcb
         rUdwKBpsoXSiewvilf40sxD9U9dradxa07CQ4e7lYKdx6/4Hhc7vbXf/sXz+JNogYaGo
         FgbBkINolz+c+XTKRVgTHLrZWMeHUAkGOEEJOb24fEzCzTAP4dj23bwtB24MGstSkFOv
         4eAxL91BkpKVGYz5FMBB2rQc9DN42QoH6+84sJmzlzNHlpStaUlFl0atFqueEJbrWYxj
         X7Xs74DmiPgBW7bs/z8qzD0ymIdXgoyu2yDKCk96Uww9b36VnzNqAvi2a04tL4IHbnLg
         vSrg==
X-Forwarded-Encrypted: i=1; AJvYcCVTtvgOpHbOB44LWurL88oYrMgLqn7bUK1LSRSAr21GAhJ3sm08sM5AFuu6cizbCtrYyw8q2SjkninUlKKXCA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwA4rdBmkd1zMy52LxcRFTx1SP+rVkPyfV3PcR5hwAnzjv5nHGx
	+aJcUIICM9g00SvCBttoMsmI6vSsS39dbZLc3QGJnSIXGn8QsU+t4ruQSHVI7kjSFuGLVt0LB8l
	g9I1+CRn8gU1rbh654DakeHp8/O1iQajjoDjr7w==
X-Gm-Gg: ASbGncv47Ie6plzcDm3/HAoihs3pXT+SWShBj/fHtJijBujqsiaTPL+g9sUb+tkA5WB
	a4iMeDtJvgMHfuKE7UQwE5xlPk82i8TRdP0e9pe0yZZRB2t7q1dxxSjtMI6FoE/Iu0xFAwoqwaG
	gZp2AQ+cBHTK3NbxB1umqQkg==
X-Google-Smtp-Source: AGHT+IHkuz+Fr/AzkwRns1/8PwMuipfYmUnKsBB7y+2XYRW44rUzmChg+OFPShozfJlNPd9b1oQDGXqsThys/IDroaE=
X-Received: by 2002:a2e:be88:0:b0:30b:c569:4665 with SMTP id
 38308e7fff4ca-319dd7960aemr40874831fa.29.1745915940769; Tue, 29 Apr 2025
 01:39:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250424131201.157601-1-colin.i.king@gmail.com>
In-Reply-To: <20250424131201.157601-1-colin.i.king@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Apr 2025 10:38:49 +0200
X-Gm-Features: ATxdqUGYIHeg8-bt7mFBhXIoGyjQbbgQkhokYrl1ZFztjgdxtKATBXtQXvjtsjU
Message-ID: <CACRpkdZf1KgnYKXbCWEWZA4Cd748HBHDh6Y6f2OD3Oyshoe6YA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: Fix sizeof argument pctl->eint->base
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_013902_679205_ED56E37D 
X-CRM114-Status: GOOD (  10.25  )
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

On Thu, Apr 24, 2025 at 3:12=E2=80=AFPM Colin Ian King <colin.i.king@gmail.=
com> wrote:

> The sizeof argument is incorrect when allocating pctl->eint->base, it
> should be *pctl->eint->base. (Generally, the size of void * is the same
> as void ** so nothing is breaking in this specific case). Fix this.
>
> Fixes: fe412e3a6c97 ("pinctrl: mediatek: common-v1: Fix EINT breakage on =
older controllers")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

The mtk eint handling has been refactored fixing this issue in the
process (AFAICT) so the patch does not apply to my devel branch.

Yours,
Linus Walleij


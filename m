Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40EF7C54EBE
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 14:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jBN0qqZmEO6agxFx6shL5YuCyHbnFiNITxRT6RYpaio=; b=NjyRcqOwAttPQg5MZGmY22IMqA
	FD7egcfJIBSAjrPll/isPjoegwiG280jEJpomisx6ky/t4kUiBGRwapJCtKpPE2U9e2Hr8fpB/2M7
	j2b169lgTlg3nmbeLxjeAkWDAk3HXht7g46o6iwm53FFVvFRtSgSWtL2TPi0pwegYfIE9Bfhain0Q
	S+ortR+Hv+0xJYxiBLHiGeOgh9KHNGjQk3adFXJRDwLqu9i1ICN2PQFMTyiuE3NwYxpN0lyxzdwkv
	HYC3ZT1nsiEjQgHOJIoAA4ISijitEV4s/fuWfV/12diZPq02YAqVO+OOXeLB+MRAEUBtyFQwA3ABE
	9spv6RTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHQ7x-00Aiin-99; Mon, 16 Jan 2023 14:06:21 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHQ3p-00AgPq-UR
	for linux-mediatek@lists.infradead.org; Mon, 16 Jan 2023 14:02:09 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-4d13cb4bbffso261218467b3.3
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Jan 2023 06:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jBN0qqZmEO6agxFx6shL5YuCyHbnFiNITxRT6RYpaio=;
        b=kp2JJXWO6Ibamd0ggGyKVGdOk2rZmq4Wu0OtMY7qeNePoqDUGvIwZ1LWbqtNPCMrOC
         8qlY8ydzFTrHMyZYUK5/yD6v2R12kNmEqKfLD29QORzNDCszAh5yCg3hkYjybf0G7urh
         BOcj3aUn3y5MLitr4hSpJlRIXsAGRFz197kRW0SYrSdzgYlCAnKglVQYBUI0X9o8nuna
         y9CDsfdD9KyIclsNpoEx+uKQ+G/mZxAopGzWL+0+td8OfrRRJuK+O8Zr+xdQxp6V9a5t
         DEWYGX47hDH5BaEWqNzlSfPoDmvTjfYMIgPw55Q9KBpwB81IR5vSmt+jS6QK25FZese3
         xU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jBN0qqZmEO6agxFx6shL5YuCyHbnFiNITxRT6RYpaio=;
        b=HLsCizilKssyltv2jPNAGGm8CYfL6mY59osZh2+aGgYVXxPstDMKtfs0ckmEKBH/BT
         PHBXffIT1OsZXdlexDXR8jo3h3oJcMecc+iCc/uOPTjHt2LEczznClhodxaKyfUBTFOH
         D4v42G/MfxEPWFVibVjLvs6zGwBfPOppQ+ZQwaXl/uYGu405J3iEhsW0MEAFzSb9HPLp
         jXIjw7DZIACR0kebEOVf1z3PiiNtXWvVY+XGSbUYIQkbZtJkqTjyZevobJ6qRQMQJlrm
         nCqOK6qF2iRsFIN4O9MOCpWdSGkD4V03692ETtwpYoTqaUuoOkwDO3cNe19L2uX7m4fB
         4yRw==
X-Gm-Message-State: AFqh2kouB/pFLwEEHU5pirxWFHP/nJ9jtwZ5aIFIlzD+seE9SLfrcTFk
	SmJM3QcPYjorl4dGvO3/qEAqd4paxe1hSEJeSNAeSw==
X-Google-Smtp-Source: AMrXdXvqmQ9+o9+EmKo29Tdj/UF8drW+qhhsKA0DVKdhHYftt4XJGXYrx6cN1uqDe3lZutSwUFsAQIvfvGxWnQLxkBk=
X-Received: by 2002:a81:484c:0:b0:36a:de9d:825e with SMTP id
 v73-20020a81484c000000b0036ade9d825emr4536130ywa.477.1673877721776; Mon, 16
 Jan 2023 06:02:01 -0800 (PST)
MIME-Version: 1.0
References: <20230112184340.79606-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230112184340.79606-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 16 Jan 2023 15:01:50 +0100
Message-ID: <CACRpkdb4ziKT7vSNre4bsfkG3EEc0b_VaxJ=8XLqqCDad=jXSA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: mediatek: Remove duplicate assignment of of_gpio_n_cells
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sam Shih <sam.shih@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_060206_042440_814310BB 
X-CRM114-Status: UNSURE (   7.86  )
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

On Thu, Jan 12, 2023 at 7:43 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The of_gpio_n_cells default is 2 when ->of_xlate() callback is
> not defined. No need to assign it explicitly in the driver.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied!

Yours,
Linus Walleij


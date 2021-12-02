Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0B7C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Dec 2021 01:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5rAN/GlG0jrFFZhDiVSeDOSvFl4BsdkNQAnyKiIM86o=; b=mMn4aucPn4oYDy
	RUA+WRllPwNIV0TfHy7s3qw+VIMYwMXBViOcNm/af+mkkyVk4YzGn/YvtwHJJqSPCpoC+SjfRDAT5
	3LiWDxTV1ZlHGnJQkJ094DAcqjg5NXs4A/pj3+JP3ef32Xkl5aF+0PyxRh5x1sNtMlFl3tEIMmuXW
	/8nkXE2Y+YOTDbYvjXXVRi/mAVsC+GeG494//8/uuC8dOqdquRVWBiPyFDHOIw+6ALN6qaJ5u0VE4
	7L76/34mxE6wfRk6MKyyvl9ser6a1OHcQxrm/mB0ZA835dqFUMvErt1IeJhf24x+Ih3z1I2RNMMaA
	i9QeNFyeu4IiMjfKg99Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msazH-00AX7M-Pq; Thu, 02 Dec 2021 01:34:15 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msazE-00AX5n-Rl
 for linux-mediatek@lists.infradead.org; Thu, 02 Dec 2021 01:34:14 +0000
Received: by mail-ot1-x333.google.com with SMTP id
 x3-20020a05683000c300b0057a5318c517so7629111oto.13
 for <linux-mediatek@lists.infradead.org>; Wed, 01 Dec 2021 17:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d+XuG6Rhxamfp5KgQN3NSNvn71J8gd9Dkbo91ezHvzM=;
 b=Dnf2tQiC3StpM3HKjMeU3Iu5fadGK74GnNJqSKkXG2OJDZOWMDwhhl8VQcYrJhP8AI
 Pz1NbTh+QTHdHVi8CCNNQgbu6A/S1t6S3I/KxGYp4W4A8il4ubUGszY7oecBACAd/3tA
 c6PignUqCFaSBa2TyhTEfChrrMX+TmuaOGkjMUdBqsqoZCOMx2wpWR/tQx6FUJ8ch+Ki
 G+FcT0zUCNqpK10exFaV0ltXmRwtRdrNAHvWrpWJr87kFeAPNhNtbMXPr+G4U8h3Qf2k
 Y/o4KXkXrJ037G4hxnjCcPLWsP8eUrR/h2gi7o7wxwg2mA+UX46Ljtu/WqD5Oigo5Hmx
 bxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d+XuG6Rhxamfp5KgQN3NSNvn71J8gd9Dkbo91ezHvzM=;
 b=ntFTs66WHwXa1C5CimBOzVkMC9WPqtY6AjhL21vSCVEYla3ZFqMQpzSh+zRSjsWuWm
 s68Qe0oNNMtUyT9yaCPlcJeg/VuXg+FKCjhxfPaD717vHZJ+XSLGCBtaEgPx2eOKsio1
 VjvJ5kuVwfXbpjuOcWYXRbjo8Ulw8sHOMQiDDM+h/lGeCOcHodz36F6pCJPU1OuO0SYh
 y3xezZMxEERumFTkuF6ifGlVark+gC1IAAd0YngYn4tlKaF1xmyat8DNdvG3u3/431bQ
 NkO3IdFzcv+Ev8aYTJizpPXOJgNvEQ2fOGuPOlwh3QIOdCJan07JI49vXTqU4bkZXPv8
 x4gQ==
X-Gm-Message-State: AOAM533GITtcZ/tvW4rssP0dsp6/0brHxrxOK6ekDFpMpY8z/XQTX0Hw
 IqAFD5JxIfKU2G1uW8Pk8DHtTWRqFNLymTYyzXUJzCojoBs=
X-Google-Smtp-Source: ABdhPJxGovl9b0ONJrEu2UZ3i/fVl7WOkeEyHyn2CDkXY7adn4ma4KQPYPb6fSVGJGVoRKHYeiLM7Lf0H1qxR67cqZU=
X-Received: by 2002:a9d:ed6:: with SMTP id 80mr9055479otj.35.1638408850811;
 Wed, 01 Dec 2021 17:34:10 -0800 (PST)
MIME-Version: 1.0
References: <20211127140836.GB24002@kili>
In-Reply-To: <20211127140836.GB24002@kili>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 2 Dec 2021 02:33:59 +0100
Message-ID: <CACRpkdbaAgzdvOmjT1y+0uKTKhJgWFJc-Qx2qQ7wkq=2GBq+Kg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: add a check for error in
 mtk_pinconf_bias_get_rsel()
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sean Wang <sean.wang@kernel.org>, Zhiyong Tao <zhiyong.tao@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, 
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_173412_930533_93F732C8 
X-CRM114-Status: UNSURE (   7.75  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Nov 27, 2021 at 3:09 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> All the other mtk_hw_get_value() calls have a check for "if (err)" so
> we can add one here as well.  This silences a Smatch warning:
>
>     drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:819 mtk_pinconf_bias_get_rsel()
>     error: uninitialized symbol 'pd'.
>
> Fixes: fb34a9ae383a ("pinctrl: mediatek: support rsel feature")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

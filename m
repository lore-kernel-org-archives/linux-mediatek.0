Return-Path: <SRS0=oKwZ=FU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 884E3C4361B
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 12:42:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B27423124
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 12:42:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B27423124
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a+W0gc+20/GXIZDbZWcCSaDivx2JqBt2o7xBLlH8IrE=; b=qO2FYUCxO74z9/AC+QuAHY3un
	MJKanioOOmc8xHx7CR2rscGmL2j8l2rK/hcm+SNecwmu7dYcyySN0o7/uq1AM8rXbEUFtNwT0YMrE
	yO9Xti/H9wIHAR/JBLc0f62UiKohCVVkCBD1xQc92+kkf/lZAxHFZYdXa0tcLWe5ZoNSRCTiTjE1Q
	PgjshOW6yp1UFkbLbAezi5AcH9urb6PJOHI4zEfqT2e5OKWggzXyCwIGTsk9VFgqMzZeJMvXo4dL9
	wPno14Us1W9+z6U/P4Gm/lqahWc6R748LpdOY+SqRPMRaEcaV4G8aMJIelQy9p1TNJmZBXvRiTWJF
	mB436yIUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpW80-0000uE-QG; Wed, 16 Dec 2020 12:42:00 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpW7y-0000sU-41
 for linux-mediatek@lists.infradead.org; Wed, 16 Dec 2020 12:41:59 +0000
Received: by mail-lf1-x12b.google.com with SMTP id u18so47946901lfd.9
 for <linux-mediatek@lists.infradead.org>; Wed, 16 Dec 2020 04:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JdWZ2Pk1OFPUwPBsoB678Mi8MqbdY4ggPgKtXlI/SK4=;
 b=tmT2NwDjj8bfQbdMkIGY2YjDPKm0YLTfWJZk10f+bQMuSILDTxEAVs0VdfmbkUqMHC
 Tjd1yn1ZkdF2HBjgzVPs1dz6rd4Aygot+krES5typbxrzS4egI/+z08allpO3l3TOeb+
 RQLxJoPUyVfnJeoG7i3Q0r7saNMLmY5bPb3WqJ54uiBdCytn1MzufdJ0DLscPiHqKmAg
 FJ4K+AYpxPJ3Hke98FrPCPIhGxC0fMCwko8Q0qlKApJP3bDLlGmtYhM/onpb95d6K9Mc
 f3BUudJp4PQrUDe6crxuDhyR7vw7xiAk/j15gqvx57gDdNaGVMpKqBfrbgrIv6AKVrLm
 NUCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JdWZ2Pk1OFPUwPBsoB678Mi8MqbdY4ggPgKtXlI/SK4=;
 b=lrrSyvhRRg5kZsrKXScUhyOIGMpVKuyhNd8UbNJZ2Wl9v7AGm5fZcVLHJD5HvfIpQe
 sMHx9G+UjNzmnig1JR3lva383g6WSwWFqvlQGkw4zT4mq+hifUEIwgMPROW3+RtUdySh
 BQoOCIWueJEyxdazuCBqjqg2zXJBTDVoQhuozeCHMUjmqK5Mdcg45rqfVKo2tW7nqYD5
 RbuZUCLhc04OaikNYBvjah1eaBa/0zqPP5cLuagZhwUP+8S/MN497GN/SVFpDL0sCY6O
 8iy5k0qh/dYxNa7wyQ9lDq4DRKnAiKHPtH8RMnuHJAT8VVJd91YFbi5RObQ8MXPDolHI
 WuKQ==
X-Gm-Message-State: AOAM533rRw3iraSx3N/NJUNmqY4VjvnE7IIUSUsv3a5vYHPstOL1khUl
 lzW+mTk4jAApy1THPeJ63t0U24YXmf1fLfR05TBK+B2AfHw=
X-Google-Smtp-Source: ABdhPJyZMYbSapCUAF75EOCuZAjdXjhZ+BEiBYaZzhIBzbUzf7PgwgU03PMTn0yH5XnqH4CgTnhtc/1VsDlALIWtp7Q=
X-Received: by 2002:a2e:b047:: with SMTP id d7mr9572843ljl.467.1608122514851; 
 Wed, 16 Dec 2020 04:41:54 -0800 (PST)
MIME-Version: 1.0
References: <5fd76cf2.1c69fb81.6f19b.b16a@mx.google.com>
 <483b08f2-09c3-e753-d2ce-4e34fee627f3@collabora.com>
 <CACRpkdbozXM3FHQB9+GcPJZdNT+Vi1223m2uEqqJ21ukY1A4Gw@mail.gmail.com>
 <8e5e0251-9450-5c93-cd2e-c44779a72b0c@collabora.com>
In-Reply-To: <8e5e0251-9450-5c93-cd2e-c44779a72b0c@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Dec 2020 13:41:43 +0100
Message-ID: <CACRpkdb8Bgie3dJME5qQwu_33b6zVYzAayJnHJUCzrkntpNNXw@mail.gmail.com>
Subject: Re: linusw/devel bisection:
 baseline.bootrr.mediatek-mt8173-pinctrl-probed on mt8173-elm-hana
To: Guillaume Tucker <guillaume.tucker@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_074158_449304_47880762 
X-CRM114-Status: UNSURE (   8.46  )
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
Cc: "kernelci-results@groups.io" <kernelci-results@groups.io>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Sean Wang <sean.wang@kernel.org>, Johan Hovold <johan@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Collabora Kernel ML <kernel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Dec 16, 2020 at 11:10 AM Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:

> > It seems we need to teach the core to ignore the name (empty string).
>
> OK great, I see you've sent a patch for that.  I'll check if we
> can confirm it fixes the issue (something I'd like to also
> automate...).

Yups would love to hear if this solves it, it should be in today's
-next.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

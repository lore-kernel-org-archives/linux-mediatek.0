Return-Path: <SRS0=uRRy=DF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 641EEC2D0A8
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2020 07:15:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F105F2078B
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2020 07:15:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XTOslK5l";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ARNv/b4y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F105F2078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eBzCrUrakePefP4YRukycv+Us6qOziblTIHZ0gK67Zo=; b=XTOslK5lbsLMCi7fgO9reiLxX
	v2NfYfP7IkwanScFU8OdIWd3i33sI074rnxguhmLX9I1nXF+KxNVoA83q3y1LpFHtyZazOqKvK1NL
	gDOhyahpsAMSbtt3UVgTTR5YHjunmDAnvUamdXKKouejMkM4u/Sd6QG68QyEkjI0s9G6DnarEm7ZL
	L10EAe8267sayDgHZ8J+x3jUDTgiXnz2SfKMxd2E3Q7vBCz74vCjJJcBSeIBfu19wj1iFUp2ahsnC
	ykPTSk0o40dLtN2ZNdKxfj4RJXNERwY+WzT8kXd8K7LtqqpQRPxUYO2RZP6986xO2En0SUK0nWHxf
	blGx2V8hQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMnNO-00035c-Ij; Mon, 28 Sep 2020 07:15:10 +0000
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMnNJ-000347-UI
 for linux-mediatek@lists.infradead.org; Mon, 28 Sep 2020 07:15:07 +0000
Received: by mail-vs1-xe44.google.com with SMTP id w25so137172vsk.9
 for <linux-mediatek@lists.infradead.org>; Mon, 28 Sep 2020 00:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kCXdMKNDB4m8MlwDrPmz+XV4KwYnVdM/qHc8DcVYWww=;
 b=ARNv/b4yV78actnJ0SE5pQEsF9qbZjb0qiYFZyLvAAi7wtsltM+289weq9fVgYDHZ2
 pUAdIXSWvcnjVZFJ9LX5QxfoGp+JVEitm4WwFE2AH5XJDk4NUM2XKYMDKqvG36nDGfjM
 yz7UcuT73+t78gooBxyXTqxo6hFnVWwhhLgQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kCXdMKNDB4m8MlwDrPmz+XV4KwYnVdM/qHc8DcVYWww=;
 b=e1dTbeqvh43Yos1d+a8T+BYv5p8jdoDFtCVj3B0QsIWEptAX2HWuMmt+wWN8jmgj4p
 s5yBdMelxbW+8+neMl/IFodfPqGCfgcUSMF/X0v2LCEx86nkhcyFDSoa2tAki8grRQrW
 kzrhs+aN4Bv4XiKLSXrfayHx2DqY+XiLAgQtugRm7Izt81eym3BdSWQnNFtgigrdzkI3
 sVu/N0DJlOX9FBHeRi7Mokh4PzJYPDpRfiw/JOdhYNf3Q+iWKHmvs/wp3rvpm1Nru6Y/
 N6Pe2NMhwcjxmaY0acqHW4Sofxg/mmZu+D9i8+8JG4xawfvlHX74IHMHthabJPOQN/3W
 N2Vw==
X-Gm-Message-State: AOAM533X/LU/YKf26GFr65PLqFQbKLiQJeby6F3rdTOGyLL7Tx4ik89V
 5wRV7Q53xmW4RuadVsrUj0XrxvnY4r0M8pfNGRukiw==
X-Google-Smtp-Source: ABdhPJzgpnpkOxCGPLSVYGGd+XgZUifTyoBe8zmUJ1pjig3VfddPP2GwmgKduNv1AMm7rusj7VWmXWs6Kk031JOtkXw=
X-Received: by 2002:a67:fe07:: with SMTP id l7mr4701508vsr.21.1601277302935;
 Mon, 28 Sep 2020 00:15:02 -0700 (PDT)
MIME-Version: 1.0
References: <1596705715-15320-1-git-send-email-weiyi.lu@mediatek.com>
 <1596705715-15320-7-git-send-email-weiyi.lu@mediatek.com>
In-Reply-To: <1596705715-15320-7-git-send-email-weiyi.lu@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 28 Sep 2020 15:14:52 +0800
Message-ID: <CANMq1KByYjeD0D81sPzDxx5SzrPvpGxPgm+xvLWcFsmfUJDWBQ@mail.gmail.com>
Subject: Re: [PATCH v17 06/12] soc: mediatek: Add support for hierarchical
 scpsys device node
To: Weiyi Lu <weiyi.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_031506_048995_E47B2B31 
X-CRM114-Status: GOOD (  14.98  )
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
Cc: James Liao <jamesjj.liao@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>, Rob Herring <robh@kernel.org>,
 Enric Balletbo Serra <eballetbo@gmail.com>,
 lkml <linux-kernel@vger.kernel.org>, Fan Chen <fan.chen@mediatek.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Sascha Hauer <kernel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Aug 6, 2020 at 5:22 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
>
> Try to list all the power domains of under power controller
> node to show the dependency between each power domain directly
> instead of filling the dependency in scp_soc_data.
> And could be more clearly to group subsys clocks into power domain
> sub node to introduce subsys clocks of bus protection in next patch.
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---
[snip]
> +static int traverse_scp(struct platform_device *pdev, struct scp *scp,
> +                       const struct scp_domain_data *scp_domain_data)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct device_node *np = dev->of_node;
> +       struct device_node *sub;
> +       int ret;
> +
> +       INIT_LIST_HEAD(&scp->dep_links);
> +
> +       for_each_available_child_of_node(np, sub) {
> +               ret = scpsys_get_domain(pdev, scp, sub, scp_domain_data);
> +               if (ret) {
> +                       dev_err(&pdev->dev, "failed to handle node %pOFn: %d\n", sub, ret);

minor comment: this error should not be printed if ret ==
-EPROBE_DEFER (use the new dev_err_probe?)

> +                       goto err;
> +               }
> +       }
> +
> +       return 0;
> +
> +err:
> +       of_node_put(sub);
> +       return ret;
> +}
[snip]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

Return-Path: <SRS0=7UDR=CC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E45DFC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 09:51:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3EC12071E
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 09:51:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fx0ibibX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gwrOQjkE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3EC12071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7IwqerfXGMJisuToY5+WQwYNOQBCt5ncvP22I29G0G8=; b=Fx0ibibX62XIG6vohsBp1Cjk1
	9k+gxqlaw5pvZ6nY1pA6zbP0K7WVOcXoCRPKY0GJnZPlGcWMa5NHXQYNOYg5ASEjXS8Sqv+vso6sO
	q9Gwa5xfr17DDI87ZowLS4Logr19+P9oJtEjsQDq3Hf0Q4PCq0qvNafU09vVASa5WVLb6HQv5b0K0
	Olc9vhEyRe/I+OLyIeUyjVbCWJxPBTXDGRkSCdW/up7HHq84Lp01r+pjz+tkD7gM6UIzVCsSHsXmb
	EvOInyCDNqmVVs1XqHE2P8lgoWjOv3fp+5fT7IGqDtGFYatbRXrRnlJc/UawRSMS2/syeDZS5MGbS
	LYS21t3rg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kA98U-0005ZK-7P; Mon, 24 Aug 2020 09:51:30 +0000
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kA98B-0005Ur-W7
 for linux-mediatek@lists.infradead.org; Mon, 24 Aug 2020 09:51:13 +0000
Received: by mail-ua1-x933.google.com with SMTP id g11so2418253ual.2
 for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2020 02:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yz4RpUPjXN0rEe+NPaAYtjgKBt6C1RIGXkmwJF5jkgs=;
 b=gwrOQjkEr8mU7KaaAvaiAAA8NJOEM2J2XPF4XkiF+0H6mxM41bqjeC1vPUm2mW9IJz
 KOT9xeXVIyu378YvF2B9Rs93IfbrxYXfv1oayDOFnZMkvzT4x6Kfc/m/o8grcb/8HbAM
 eyclKodQAUqKuqfmsZxu4VUXIpwYETjjukZB0rdaJ36LcEwXMyg4drimpgUfcNlTWSga
 bfCkhvAynwO/2Ski6Zv5OAneGpSfq9VM4NSg/6W5pRnXItzF8JgWkAkt2FAlA2VeVst7
 OjhIro8DJJrNScCsMmkYGkj88TE2ZesRBFAumz3N32QjeJIy85KLWfzLeGjOlTyl60gg
 G1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yz4RpUPjXN0rEe+NPaAYtjgKBt6C1RIGXkmwJF5jkgs=;
 b=PQM5nzeVUYytSGfN3DjSgXGKvlnbm07ZUGg5w0+q0IQq43Ry0c4YiAFsgeR3W5+CKT
 VKUIxOG8SkzMOOEl1IldCH9/Jy1qLRj+HncnOOWsCGouxs4mFukuoZGBFriWmJA0e/br
 6CcC2BCafJhoZuhA2vOdNwPXsbgc/LhPjcO/wXwAwS4t/G4a5M3ys6zAWyW6hTL+/3Qz
 dLWl9CuwxNzPJScNDYTg108zfyjxcouatsRBnPnZ0+AFOKZfuiusDq0syC+FLPsEg3Iz
 5fUf+EqhOKKTVJwx/8V9Yuj+yLaP8tTi3kS4LJUZoujaJ4lr93/ULDcGYCbNPAtzRYPg
 0hFQ==
X-Gm-Message-State: AOAM533Ynbf/70Lge6kQInYJ43GsPZ3ym7sqyr8sdJhRw00koAMKFgzu
 HLeBLoY4A0DvlAiacFkLm/NrpfV7qfYyE4bDtkKoCA==
X-Google-Smtp-Source: ABdhPJxyr5RXxg7nVYL9oxZZLdid026evyd0F8roxZTLNu3CVL/h1TKDQxL9idB3zXmgept7Yeod85ZsHcTA6BpWWHk=
X-Received: by 2002:a9f:2190:: with SMTP id 16mr1745320uac.19.1598262670146;
 Mon, 24 Aug 2020 02:51:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200814014346.6496-1-wenbin.mei@mediatek.com>
 <20200814014346.6496-2-wenbin.mei@mediatek.com>
In-Reply-To: <20200814014346.6496-2-wenbin.mei@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 24 Aug 2020 11:50:33 +0200
Message-ID: <CAPDyKFoTi91bqvosSvk4ALB7HobVf4aOjDoKkP9GgyteMfOQuw@mail.gmail.com>
Subject: Re: [v5,1/3] mmc: dt-bindings: Add resets/reset-names for Mediatek
 MMC bindings
To: Wenbin Mei <wenbin.mei@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_055112_512551_987ADF43 
X-CRM114-Status: GOOD (  15.17  )
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
Cc: DTML <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "# 4.0+" <stable@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 14 Aug 2020 at 03:44, Wenbin Mei <wenbin.mei@mediatek.com> wrote:
>
> Add description for resets/reset-names.
>
> Cc: <stable@vger.kernel.org> # v5.4+
> Fixes: 966580ad236e ("mmc: mediatek: add support for MT7622 SoC")
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> Tested-by: Frank Wunderlich <frank-w@public-files.de>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.txt | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.txt b/Documentation/devicetree/bindings/mmc/mtk-sd.txt
> index 8a532f4453f2..09aecec47003 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.txt
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.txt
> @@ -49,6 +49,8 @@ Optional properties:
>                      error caused by stop clock(fifo full)
>                      Valid range = [0:0x7]. if not present, default value is 0.
>                      applied to compatible "mediatek,mt2701-mmc".
> +- resets: Phandle and reset specifier pair to softreset line of MSDC IP.
> +- reset-names: Should be "hrst".
>
>  Examples:
>  mmc0: mmc@11230000 {
> --
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

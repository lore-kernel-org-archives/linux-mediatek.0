Return-Path: <SRS0=7UDR=CC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 629A3C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 09:52:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EDD32075B
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 09:52:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PwMuM3wj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="viaSbKYk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EDD32075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a6vUdEvTGfTcEW0ejIe3LFo7EnibBZy+F+h9jmRFy08=; b=PwMuM3wjeE0hYOubuIiLRBb/y
	BSUeUuk2rztW0/yBBK74l1mhIjozWLRci7yH3b39Fw3kEKU3mzyns6SFsTsg4o7KX6xfJ7pdqYYwy
	eIQ71HZ+U1a0BzrqfuaEMmo27IS/0NohPx5E29xjga7PtNs//2u0D7TeRB+tjeMT9zueP6HCscetU
	42TUp8f6/fdnPes2RGH/gJ19bI48EdDjBu8UfWPGJtqDviknJdULSKgCxTT9bgiWDf4OYitvdJO/8
	H9zyJMyfASR/SF0ADdznXLWDYXh8/Hr68inVKvan2N+o0Vt4p1H+KAMSrNn/m1DT+34ZHLr7feFhf
	neovcpeFA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kA98o-0005gZ-VV; Mon, 24 Aug 2020 09:51:51 +0000
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kA98L-0005X1-UW
 for linux-mediatek@lists.infradead.org; Mon, 24 Aug 2020 09:51:23 +0000
Received: by mail-vs1-xe42.google.com with SMTP id o184so4109179vsc.0
 for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2020 02:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tQVuDdH8Zvj1M8HLAuvz5oG4f0c+4DnopFb9nohLKXM=;
 b=viaSbKYkt3Ve8bKIQEqECLhqvB8aKO+ihxIs+NH5lCkzHixhocn/PB4nGT/XA599s/
 Q+TA0g/qbcuLiUHw6XpMggqiZ1vdsV8KqQaft0CEheeblOkjGrWAGw+6CJ8Qr8bOtMpW
 FpZQzLT3i1eRllSVw3osF8yeNE1P/B8EHnKLB0O/JY0ljpRogF6Uj1k8GDipwqxAcmpZ
 qlBCpsL22zcCK7Eb6u7eF6tRgtS15PT/bP57r1LCYR6ZgYWa164KtOyT3Begp5KvRos1
 TDzO2DlrGkkQS83WnUyDpS7uLvPh+tpXuFD6EY9i2Kf4tyvEIrahvH+dCXW2jDpa/8MQ
 LX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tQVuDdH8Zvj1M8HLAuvz5oG4f0c+4DnopFb9nohLKXM=;
 b=J9wE8BrKPNg18sq0BPvJrNrotNcvKOExIGynwtzaMuTZcuh5a43Jk2NyklJsl5Z34p
 GJqVb66hu8tHTm92jwSl1FFcijr5EctfvJ4zA4R3SeAYSI9pVA+qcqWOwycQEMkH2Wkt
 dk0BkKGS28cHJI2KZ3Sn+jfRGY9v3VzOak0/bLb9pgDMG/h0KjpaeWAUenKq+jsU01v7
 /7lk590vcW6ZNXB4DQzbKqtv8o0wF0BDkDtqtDIlL34P51tguUFMAbknOIPXUwzxuAUx
 /7/XisdFGsg3HZrKJ3TUN/DuVQ6fkc/aChgD8m+Ln2MAt/tIy9NIWPFPWeNvLhfGDBKA
 rWpQ==
X-Gm-Message-State: AOAM532Ll0NbBnkqgKo5rss2dqnH1+nPfpMjlwpLP5YYYw8rpPvaiGyM
 yzjAKIbDDvOX+Cxaxwnkc2/OYl2Xz3Ls2d02EuHL5A==
X-Google-Smtp-Source: ABdhPJz1ej/yqCDXyFjyLy7ZlP1cm49cSWXutwlzE1D8OKP6S+DBPfEDkJzgXFbDyWrfWa93Ar32IMcM2cb1jLVp9Zs=
X-Received: by 2002:a67:2f06:: with SMTP id v6mr1293230vsv.34.1598262680151;
 Mon, 24 Aug 2020 02:51:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200814014346.6496-1-wenbin.mei@mediatek.com>
 <20200814014346.6496-3-wenbin.mei@mediatek.com>
In-Reply-To: <20200814014346.6496-3-wenbin.mei@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 24 Aug 2020 11:50:43 +0200
Message-ID: <CAPDyKFpt6-a+pkTXb2RZdx=yTONetugSCKbtSsRD2xQ3PRPhDQ@mail.gmail.com>
Subject: Re: [v5,2/3] arm64: dts: mt7622: add reset node for mmc device
To: Wenbin Mei <wenbin.mei@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_055122_156449_B36DDB0E 
X-CRM114-Status: GOOD (  15.15  )
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
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 14 Aug 2020 at 03:44, Wenbin Mei <wenbin.mei@mediatek.com> wrote:
>
> This commit adds reset node for mmc device.
>
> Cc: <stable@vger.kernel.org> # v5.4+
> Fixes: 966580ad236e ("mmc: mediatek: add support for MT7622 SoC")
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> Tested-by: Frank Wunderlich <frank-w@public-files.de>

I can pick this for my fixes branch, together with the other changes,
however deferring that until Matthias acks it.

Kind regards
Uffe



> ---
>  arch/arm64/boot/dts/mediatek/mt7622.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> index 1a39e0ef776b..5b9ec032ce8d 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> @@ -686,6 +686,8 @@
>                 clocks = <&pericfg CLK_PERI_MSDC30_0_PD>,
>                          <&topckgen CLK_TOP_MSDC50_0_SEL>;
>                 clock-names = "source", "hclk";
> +               resets = <&pericfg MT7622_PERI_MSDC0_SW_RST>;
> +               reset-names = "hrst";
>                 status = "disabled";
>         };
>
> --
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

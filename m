Return-Path: <SRS0=FJ4T=K2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3BB9C47080
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 May 2021 21:40:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8885A6128A
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 May 2021 21:40:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8885A6128A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ke1/3B1rrfBOEeltXMIDu8Ri+4fC7aMZMz6qwPPzAPQ=; b=vpRN+/QonNuMXV
	nIdhFxpn57JvH6W2JIUQL/+RKbCej78vNJlLEYSRpFYEQZpyQNTmCBSy/6rzU3xjHCttlivpWyf8r
	6XGPwdBhaZF4brzFclzNXSe5IF1xIRfSKm1S7IvX5Pr6+g1xEW6OKR7JJo7hmnGHs4D2xW6dJIciZ
	Zi7ZHzFZ6XkPhbc3jYhT9pJkMMR69sm7UWfLLRcmRhavfrW36JpG9aqaa3qxJGh52QMjhw2/Pl8qT
	Jj/UeZC/0W9EdYmB+pKdUL7p7Y0MeLGX9E79ud5wjad72WapBZGwrEsUJ/0PObL9g018Fk5fQbqqe
	k0gpFt7wuy9NcQMXIYTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnpdj-00DVhe-H0; Mon, 31 May 2021 21:40:03 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnpdU-00DVdI-Ak; Mon, 31 May 2021 21:39:49 +0000
Received: by mail-ot1-x336.google.com with SMTP id
 i23-20020a9d68d70000b02902dc19ed4c15so12299688oto.0; 
 Mon, 31 May 2021 14:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UBAqPc0844PoWS3M7cf9GbxSOhoga0pQoriulkgqEfI=;
 b=VUhxW2pyepgF1UbJULY3i80Z7aTZ03X4+C9wxowTbK/qTQIQxtmmbv+6XpGF39gU8X
 SOJk8buqMEKMC0eiPr16TX7/g9SStnxfNL4m5MMTm95wa6cyDkvvXgx7P7DPjuwH+wyj
 6y+Afd4I5e96U3c19zRoSQmPaOuBEcjqfGIUZhbiWrT30DjRTUosV7J8Fq3sny0zilbe
 RQtX97qrgZ9okAs+v7ZSmepehw4RuilIzG5rA7uLUj42inWsaC2fXZIKFyzG7xIkAQCM
 O8BDOpr4mXJXNVLROiwbITssFmAeFOqK54Cr89PAsiwP5Ml3vbEj48LM0RNGxPNNDrXU
 hldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UBAqPc0844PoWS3M7cf9GbxSOhoga0pQoriulkgqEfI=;
 b=WzN1ao6EsE0ZOCZc9cjb9NU4IaGofdFSIlRLGMYPqqB6OtGHr88GSnff7AGDMYRHNC
 Ayy85+1nMyrIMksi/aGC7x2lBesZMhBr7b+lM1tYFkszA8DKE7ReAZKYFTNnblgHvzHV
 eks7OQJrOH9+Pr2X4lljBOca+wRdQIKeJNZi9STy7K+SLiGZeOIld9y3oBQBHuOktFpo
 MBZET1U6rcj6IadZKTZC7pBJ2RjWz1xvSWjuOrp1Kecxyr9TJaomzwhHjnrWxrhPbFkm
 RDA+9ezHFeeywuZPcutKDyx4RwgjK8RUGA6gE3esN92+Md7azO6mESokvfu4UQEFbZnj
 lOOA==
X-Gm-Message-State: AOAM533WrYDSAV5nH8qm9W0h1g/EoWvsYMb7OHPoV5DGPXipRwtdRYR1
 eOpLO5PkIZRqPJARnAWDU4wkwaRWMGkCPOoeTG8=
X-Google-Smtp-Source: ABdhPJyjzicDYy8DtErVQRQGm+5j16c6SZMMwzcmDJRbeRntyIHK9Eht8sVCld0S38tB3hX9pMWfM4d+dX3FsATtJHY=
X-Received: by 2002:a9d:7a9:: with SMTP id 38mr9579203oto.362.1622497187649;
 Mon, 31 May 2021 14:39:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210531043502.2702645-1-hsinyi@chromium.org>
 <20210531043502.2702645-3-hsinyi@chromium.org>
In-Reply-To: <20210531043502.2702645-3-hsinyi@chromium.org>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Mon, 31 May 2021 23:39:35 +0200
Message-ID: <CAFqH_53DWQVRVHVr8EVSR6A2oVqC4_4VjkE6n77g5kfBaa2+4A@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: mt8183: remove syscon from smi_common node
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, 
 chun-jie.chen@mediatek.corp-partner.google.com, 
 Yong Wu <yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_143948_396479_3FB87037 
X-CRM114-Status: GOOD (  17.02  )
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

Hi Hsin-Yi,

(again without html, sorry for the noise)

Thank you for the patch.

Missatge de Hsin-Yi Wang <hsinyi@chromium.org> del dia dl., 31 de maig
2021 a les 6:36:
>
> We don't need to register smi_common as syscon. Also add required
> property power-domains for this node.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index c5e822b6b77a..e074c0d402ff 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -1263,13 +1263,14 @@ larb0: larb@14017000 {
>                 };
>
>                 smi_common: smi@14019000 {
> -                       compatible = "mediatek,mt8183-smi-common", "syscon";
> +                       compatible = "mediatek,mt8183-smi-common";
>                         reg = <0 0x14019000 0 0x1000>;
>                         clocks = <&mmsys CLK_MM_SMI_COMMON>,
>                                  <&mmsys CLK_MM_SMI_COMMON>,
>                                  <&mmsys CLK_MM_GALS_COMM0>,
>                                  <&mmsys CLK_MM_GALS_COMM1>;
>                         clock-names = "apb", "smi", "gals0", "gals1";
> +                       power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
>                 };
>
>                 imgsys: syscon@15020000 {
> --
> 2.32.0.rc0.204.g9fa02ecfa5-goog
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

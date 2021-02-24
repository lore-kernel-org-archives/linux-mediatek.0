Return-Path: <SRS0=l1Zb=H2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CA47C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Feb 2021 10:30:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0A2564E21
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Feb 2021 10:30:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0A2564E21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uN4us2TLWn27RAmIW1lLPRUMOLc9Og463gwMO8il8/A=; b=DqINpKuCzEMD/8/OCb8/TDccv
	WGFeVTI9oyjj7fyJaJGAg7SQSj4hPqxkKqSIzGPDmsGN8bB+FXIziv5RUz8dPCIGrNmJaiUTscBBy
	c6YhrLkTTEIIhamHS1r+19f/NLTK88cnqmIUGPImM9Y9egqRxp+xlOKVAD5yzldfh/Zy5c1RI69AX
	c5SqCubkgGDY/fMIeI+3LvaZWNlZPPDhKXDdQXqN/tyIpXyXFbIsQdih9VlWRJ8cOrJzTwW8SKILJ
	5oE3l7RO7EKxKcNS7zcZIY64FmkvtZzbeOrUY0fmRNlloC/QXvVcI5Cpoi56lA481hXY7HvxtBJBg
	X3D5vil8A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lErRA-0008B3-CZ; Wed, 24 Feb 2021 10:30:32 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lErR8-0008AW-Pr; Wed, 24 Feb 2021 10:30:31 +0000
Received: by mail-ot1-x329.google.com with SMTP id d9so1633686ote.12;
 Wed, 24 Feb 2021 02:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LHRQW4ov53dg8KtZocnNCqA58r4Ul8zUg/imzVFJZFc=;
 b=EnkaliE1ciq3lJsaGMsd9guJwPz3qqBhkyv705iky4f2luq6423jNunBujtuRHTR63
 VcZ69LgprCzJdbV+BzZn/7s5p18kO+2bE1W64iC0Ax/MYg7z1/qVptQJi9tdY3IOtACk
 LGEtzSznv6EMxiji9FAo4IE/q5wAeMqisJj6M3RLFpFctazqBVjVhwky2Ro2f6izQ2ll
 lzhY6fFaRkgRdkZYy970aB+yBiUL9lJxmx8dv5fh0GEL9Pxes6eA9jrphM+V7fYnYy9Y
 dqCsdMdVH+WFx2k32wDd3VvcpO0bjpuVE9Z6DiBpFAyiMEcIXvwgcNmhbtaC6B9tZjOh
 uleA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LHRQW4ov53dg8KtZocnNCqA58r4Ul8zUg/imzVFJZFc=;
 b=N00G7bz4eMV3Qg1m5oorcHnQlkHc+Q9ChPM3jJAwIXCVECH+QWCrqvp7+SK2TWyh3z
 c/UPoXTYSulagn4pDO5wxiv2WeqxyeOXXnmNsUUxBZTfnHzMFqb1n8f9nRNAhav8NThP
 98WlBBakdQq3CBBpveDO2++Uib7JnseQHmA+46yvRMYAIMx9SW8TK/PkQUpjY9qqqgob
 hhmFkcsZ0OYp9NxQThTRcQtrHsJh8t882lsSNLQwUGVBmSARqT7dK/9vUMTyzm9YcHUb
 nnjStDGd73WQMfXLBQ3oPX+7GCXTAas9mzF5hh91OgIsuLl3omx7fjYWunU87oJvGxZn
 WWxg==
X-Gm-Message-State: AOAM5321Dg1n3uLdL80jyvGBryFFPRTbBTJj0AT54y33EtCqsRfPDjw5
 cNZRHuvMGp7BeLnwkRq9Kq6EHDV06duzSAHs4gk=
X-Google-Smtp-Source: ABdhPJxh5OIPDq2CBTjJ7ZNMjE/kYFTRuFbby9aNHs2PdkfliYoiudGLr9iuEZPgWbQ2v7uHDEcuPl+Kk1u1ifAaMeQ=
X-Received: by 2002:a9d:7f86:: with SMTP id t6mr23808369otp.362.1614162626506; 
 Wed, 24 Feb 2021 02:30:26 -0800 (PST)
MIME-Version: 1.0
References: <20210224091742.1060508-1-ikjn@chromium.org>
In-Reply-To: <20210224091742.1060508-1-ikjn@chromium.org>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Wed, 24 Feb 2021 11:30:14 +0100
Message-ID: <CAFqH_50BWF4sQnJAnVZDf3Dbuw+LaN67q39DvOh7ipzqNeNEMw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mt8183: Add power-domains properity to mfgcfg
To: Ikjoon Jang <ikjn@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210224_053030_880600_804F2CC8 
X-CRM114-Status: GOOD (  16.52  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Weiyi Lu <weiyi.lu@mediatek.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Ikjoon,

Thank you for your patch.

Missatge de Ikjoon Jang <ikjn@chromium.org> del dia dc., 24 de febr.
2021 a les 10:21:
>
> mfgcfg clock is under MFG_ASYNC power domain
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> ---
>
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 5b782a4769e7..3384df5284c0 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -962,6 +962,7 @@ mfgcfg: syscon@13000000 {
>                         compatible = "mediatek,mt8183-mfgcfg", "syscon";
>                         reg = <0 0x13000000 0 0x1000>;
>                         #clock-cells = <1>;
> +                       power-domains = <&scpsys MT8183_POWER_DOMAIN_MFG_ASYNC>;

I don't think this will work in mainline, at least, the reference name
should be &spm

Thanks,
  Enric
>                 };
>
>                 mmsys: syscon@14000000 {
> --
> 2.30.0.617.g56c4b15f3c-goog
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

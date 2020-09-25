Return-Path: <SRS0=ZCae=DC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99AF2C4727C
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 23:28:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BB7F20829
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 23:28:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O8VQg9Wj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e0cvkNaM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BB7F20829
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=H2xNSMOibfWbZTKqFOJC1LndCC83Jvb+eaq3+aygaCs=; b=O8VQg9Wjlb3CYrZOwtfG1v40u
	d0woaevPDgFZP4SxLRYvqMsVYkNHcJXr5yl3gXmZ9a31hqz3jN4GSUWWoZN+vI3+cNjGHrt3vSaLb
	msxit74GRHusiwAbiMSsJBywEGpOzUGM4YK3xwYbiVsS2hopXL8AkXrXO9/mawM0HjMJ/DM1VBTE9
	rbVYfcoaUhBQGETAZYC00CkZzvdf21L53fE8wpFaWAVUVvWSJrVAE3BBg9EFAneZTjjS2zSqEnmQi
	rK+9qNsDUEljjAHpI63p53q84LTtNZV/j84WJpkYSGFn3c3PUcYweRdzrXUwEh0ZSglmr+cKSSQV7
	6GzVKQ++g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLx8K-0005sK-R5; Fri, 25 Sep 2020 23:28:08 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLx8I-0005rL-9q; Fri, 25 Sep 2020 23:28:08 +0000
Received: by mail-wr1-x443.google.com with SMTP id s12so5660169wrw.11;
 Fri, 25 Sep 2020 16:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jd47j1+vGN6OIJO/6iA19FE0KaxRE5A5CnfIKpoQkIQ=;
 b=e0cvkNaMlbUX2F2XwkFA4O2XZ1gNve3Ojv9lXdCwbijiJoDMN3hnIYCOhxRzZSKUoi
 6TSrKgLebJAZoaisEhYGNYAkwhSfxITLRQX62EPKxnIhc4cO6J7KdEGtxMB7WJJmdo+U
 HieVElZiIaskvsSJ/vPbI8Pc2BMtQiqgfJ37wbWEwChKSub/wwRk8vLfrZiROI6SL6QR
 8FQQtaWLkC87LqyrKcM+eVLCQhxdLwBve2q/5aNnFKMF+La7rH9EHiQHNvBvTxpjax+3
 GtFsD8J3X3d0ti6cvdvvyjRirm0JsDpaAZp0eYPNaTrwWsd6upKVP1e23cD7zK3bFbbG
 +T1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jd47j1+vGN6OIJO/6iA19FE0KaxRE5A5CnfIKpoQkIQ=;
 b=cbM+vIoLR8g+TrKTJEKOGc8X4ylG1caCGvrTXI6++zteF55Ro0V0GumcyBvbFzrtbp
 f1AEPZ8OpYZ6M9EE45PxrUJxi5yOq3yw5MSgsL0m8hDh59C0+tuuzwjrbk7vQ+6djtdz
 GgGArqi7vKyVlhUp4KJ7nSRu64oACuSPeHPmFORo7Hw33BfsICPi1WrnifHvalvHbnvB
 9Kg+dgTPbrLsbNK45lkFd8iK+qhen0RU539SQl6yCD5tIF3bnd1afB0B7eb4UDqKY/Em
 gnFwym3o9j1FixGDuzh0A4mhMfPQ8AU8w9grhG3mmrod296p47UUkRw3A1PLggpdN37+
 9Kgw==
X-Gm-Message-State: AOAM530XxiLB4c9hsjIRoma6zKhmUitZbMSpu5+rr2RWuoYPqQDC3wUv
 P4nWqyso5RBhwHNT+Nza7A8=
X-Google-Smtp-Source: ABdhPJxmiVQO4JVB3ctsSfBW+PcoODSIgWVw8c+BQzM7TOtebjMW/fPmPX3kva7fEZARFVBTu6LCjA==
X-Received: by 2002:a5d:6552:: with SMTP id z18mr6601067wrv.32.1601076483385; 
 Fri, 25 Sep 2020 16:28:03 -0700 (PDT)
Received: from a-VirtualBox ([103.120.71.253])
 by smtp.gmail.com with ESMTPSA id c205sm551758wmd.33.2020.09.25.16.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 16:28:02 -0700 (PDT)
Date: Sat, 26 Sep 2020 04:27:55 +0500
From: Bilal Wasim <bilalwasim676@gmail.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH] arm64: dts: mt8173-elm: Remove ddc property from panel
Message-ID: <20200926042755.78b8e013@a-VirtualBox>
In-Reply-To: <20200826090218.682931-1-enric.balletbo@collabora.com>
References: <20200826090218.682931-1-enric.balletbo@collabora.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_192806_477584_FDD9506D 
X-CRM114-Status: GOOD (  15.02  )
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
Cc: devicetree@vger.kernel.org, drinkcat@chromium.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 matthias.bgg@gmail.com, Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Wed, 26 Aug 2020 11:02:17 +0200
Enric Balletbo i Serra <enric.balletbo@collabora.com> wrote:

> The elm and hana devices uses an Embedded DisplayPort (eDP) as
> interface for its panel, so the DDC channel specified in the binding
> is useless.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
>  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi index
> a5a12b2599a4..1fe5dac24ba1 100644 ---
> a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi +++
> b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi @@ -86,7 +86,6 @@
> volume_up { panel: panel {
>  		compatible = "lg,lp120up1";
>  		power-supply = <&panel_fixed_3v3>;
> -		ddc-i2c-bus = <&i2c0>;
>  		backlight = <&backlight>;
>  
>  		port {

Tested-by: Bilal Wasim <bilal.wasim@imgtec.com>

Thanks,
Bilal

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

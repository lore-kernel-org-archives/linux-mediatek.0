Return-Path: <SRS0=SroS=L6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87FC9C11F66
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:00:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54FA861A0F
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:00:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54FA861A0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EYNQZQ2SKLcZtMBb+mFTRa4HFcF3qagc4sUbljz7YJQ=; b=T5mhuFPge9hPn+
	ob2MFvSdy25gyq1pdsuCL79XADTHHm5MNTe0NHw+60qsPtcgEnGL1ADkfipAkyZvTHros+oRNdoty
	vHNqbiqpbSoGpG1c0WgTdUvJc/wY2qk3c/njzb6uHZzcREqZX46P680DriOEZL2wsBhUWFJVkI27a
	HeCdXLp24oIW+Zw8ski+Ikk4/JWmGYsTIdjE0zGwH8iEzCBf+/XM5xminjL5jWsDkJ9evYBWGSADz
	ATM92ERR3/JVG+A1OrnfeNdcCYjZ8TMqN8JYAW1FTHZj2qkVUvAN8d+ni4psG7QLa41FdDFniA2Qd
	qOtdfEBYcX4qOdrOmjWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0ion-00B90K-UL; Tue, 06 Jul 2021 11:00:45 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0iof-00B8wl-H8
 for linux-mediatek@lists.infradead.org; Tue, 06 Jul 2021 11:00:38 +0000
Received: by mail-io1-xd31.google.com with SMTP id h6so7369533iok.6
 for <linux-mediatek@lists.infradead.org>; Tue, 06 Jul 2021 04:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D9cJE9ZmLAhI4Z30OwANBpOGqptuN+YARhU6HockOH0=;
 b=OHgy1t6yQ7FLN3DygkT/BL+g1Fd0Y0bRZKpFs6VjQGau1kDmMGzL7F0PoN0fZTXJd2
 Qi9N0mqttZRAXdoPHG83q7gdrpYsOkUxdIvAJSSHYSGWL4DXfbc8zWv9CdDOsFCBwtT+
 D23O7XCfv/5/VemHuPMLO7xRZ/ifUDfmjlDdKhcNWYhZ3Ybp1Q3BCBHt85KSa1KysN1P
 VCJ6i61tTgQHnvs3ll/ziMz3PeOedLUZnwLerwbilVNQKAVBx13i15r3WJ6V0BBIDdUm
 E0GS4Jm+xxRGuw1x7Jq93k2/zwBGAfrYJz1HGkhFn/hcxSJVliDJet/g+YqaXSia3VbK
 P5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D9cJE9ZmLAhI4Z30OwANBpOGqptuN+YARhU6HockOH0=;
 b=SaORfLUPoPTAF3+3TudHtbYseJQmVdEDqEA39tuaNZE4pSobOcnuCg1eJmEi48g68x
 ACPlJ/RYFMg2/Fysrjhby2twIHPajWkWSJMVf6zQeqbQAROUyjIhe+9+QdKqir8ryZHW
 UuzWORmUVP4krUh/N6K3EITIiV2Z0I48daMbWNTiSRxZOhCrQH4yHm0ef+uIBDY5E2Z9
 /4PWu5TvpQqM0G287YD/n9WXs/sfBM2Q673+mPBlLajThUG4WRAymtUAsW+sDntTt2dB
 hv7v6erTttA9AZgbBwFxIX4cxPik8pE/zj+Bpii3lHztMng9jwraC3dFiWp5oedRn0Oc
 jwCQ==
X-Gm-Message-State: AOAM533Svy9ByG/CgsNzJXmKhxmvQK2/UvDjweJhLvuP75nrRZvxAcjO
 ADkTdxwR6FhRLP+IDI7GhhS1+NdajuEQwml0At9k+w==
X-Google-Smtp-Source: ABdhPJwQeTYajARaI85ZZA6cdpsrwFxnkE+PReeU0ZLQgcXDRmZbVRnHS07ukEQ4C29jdKjOddBIiVCJy35vC5fgxEA=
X-Received: by 2002:a5d:840c:: with SMTP id i12mr15050087ion.185.1625569236207; 
 Tue, 06 Jul 2021 04:00:36 -0700 (PDT)
MIME-Version: 1.0
References: <1625038079-25815-1-git-send-email-kyrie.wu@mediatek.com>
 <1625038079-25815-3-git-send-email-kyrie.wu@mediatek.com>
In-Reply-To: <1625038079-25815-3-git-send-email-kyrie.wu@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Tue, 6 Jul 2021 19:00:25 +0800
Message-ID: <CA+Px+wVE=QKh2-+RZevLUweFEUuoovW-1=Da2AWzB1fnJP=EKw@mail.gmail.com>
Subject: Re: [PATCH v2,2/9] media: mtk-jpegenc: Add MT8195 JPEG venc driver
To: "kyrie.wu" <kyrie.wu@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Bin Liu <bin.liu@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Tomasz Figa <tfiga@chromium.org>, 
 xia.jiang@mediatek.com, maoguang.meng@mediatek.com, 
 srv_heupstream@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_040037_611292_AB10F3ED 
X-CRM114-Status: GOOD (  13.53  )
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

On Wed, Jun 30, 2021 at 3:32 PM kyrie.wu <kyrie.wu@mediatek.com> wrote:
> Add MT8195 JPEG venc driver's compatible and device private data.
> compatible = "mediatek,mt8195-jpgenc": this node would only register
> jpgenc device node;
> compatible = "mediatek,mt8195-jpgenc0": HW0 node, this node would not
> register jpgenc device node, but register irq, init clk and power,
> remmap register base and do other resource options;
> compatible = "mediatek,mt8195-jpgenc1": HW1 node, just like HW0 node;
The commit message is not easy to read.  Please rephrase the sentences.

What does "venc" stand for?  I believe it is a copy-n-paste typo.

The commit title "support MT8195 JPEG encoder" looks better to me.

> -static const struct mtk_jpeg_variant mtk_jpeg_drvdata = {
> +static const struct mtk_jpeg_variant mtk_jpegenc_drvdata = {
Why remove mtk_jpeg_drvdata?

> -       .irq_handler = mtk_jpeg_enc_irq,
Why remove the IRQ handler?

> @@ -1548,10 +1551,6 @@ static const struct of_device_id mtk_jpeg_match[] = {
>                 .compatible = "mediatek,mt2701-jpgdec",
>                 .data = &mt8173_jpeg_drvdata,
>         },
> -       {
> -               .compatible = "mediatek,mtk-jpgenc",
> -               .data = &mtk_jpeg_drvdata,
> -       },
Why remove "mediatek,mtk-jpgenc"?

> +#if defined(CONFIG_OF)
> +static const struct of_device_id mtk_jpegenc_hw_ids[] = {
> +       {
> +               .compatible = "mediatek,mt8195-jpgenc0",
> +       },
> +       {       .compatible = "mediatek,mt8195-jpgenc1",
> +       },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, mtk_jpegenc_hw_ids);
> +#endif
Would expect somewhere to reference mtk_jpegenc_hw_ids but failed to find it.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

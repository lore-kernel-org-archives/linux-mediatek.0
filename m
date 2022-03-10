Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF29C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Mar 2022 20:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rf3vVQDJSbT3voQff3nnnCVDk025laZG7mjA1LevEpU=; b=X77pQIdpAO+lOK
	7/gLn/VsrryV3gKvS82fVdA+2/Wq80XQURQP+yHkDrCAKqc1lWP+M+UPFlXlXLsNVbQjjWfWCd+XV
	Z7jboKYPGg/mMR7ivacie+UUXMydZOEOiqZ1qogvL3gXvUIK/cLdQ6JDikCWSABxtRlvOP7o8yx2z
	XK+36ELv34oOheTsDmunfS/mp5xb9841sjemfaZlQUJTRDcHhjPAFrXnKt6DKRznh+LuuNRYE/LFh
	PMoNYe4c+g8ckc8SCRR4O6GyEk8oWa11pqXHfXhJqv1bWXklm7M+NU+h+a0SgJ2qed3HuZJBKgBc5
	DPR/0Hd4CdNpKk0gAdaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSPea-00DzrY-4i; Thu, 10 Mar 2022 20:44:56 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSPeO-00Dzp2-Dk; Thu, 10 Mar 2022 20:44:45 +0000
Received: by mail-ot1-f45.google.com with SMTP id
 e25-20020a0568301e5900b005b236d5d74fso4934826otj.0; 
 Thu, 10 Mar 2022 12:44:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eHD+QEEE7WXDBy+HR8ki9zNPunEiiwpvW7wALZuHn0U=;
 b=Y6vjTaCutqEHPpFaX1ilDtZ0f+zfZTyk/IBLHERHqjTfaz7eUf4KgGfQRLPXZodAse
 1WkTwSZzUv8zX0Y40rgucP2YbndOUE8A6whilg51MFe2XS3jENildjyiGX3xVLL5k2O4
 ALPbr1nHB/+PdJRMhsHDntl/Zq2K8GCBStfrtdtvvUJt4ecKCa04YZ4lEa73eBKZgWr5
 ls4k80+b4TGeldnh+HPUo1IWBd4QDs4fAVPb1C17imm+74HCxTwur8oaHD/MW0o4ARBK
 A494Is0ktaO/wAHMJIWK/RRBryzQS79AyDVf/Ck/7cVAANXVdKJuEPR4IsSMPhxnPFEj
 j6pA==
X-Gm-Message-State: AOAM531D+ZJGTnaRaUXOjeDk71soBL03M2aeRoQrztCgHx5E3Z3LU4Bq
 ajqGgqhSr4r/DYTepNbGCQ==
X-Google-Smtp-Source: ABdhPJy3TwiukHGegqsMqO5kZKdbFiV+T89f8ON8hygQNaY6t2GB85ddp3G6Dcem5mUuTRtykYoulQ==
X-Received: by 2002:a05:6830:1ac4:b0:5b2:319a:8c3 with SMTP id
 r4-20020a0568301ac400b005b2319a08c3mr3511801otc.203.1646945083574; 
 Thu, 10 Mar 2022 12:44:43 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 l3-20020a056830268300b005b21c30a3c5sm2975223otu.29.2022.03.10.12.44.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 12:44:42 -0800 (PST)
Received: (nullmailer pid 2036124 invoked by uid 1000);
 Thu, 10 Mar 2022 20:44:41 -0000
Date: Thu, 10 Mar 2022 14:44:41 -0600
From: Rob Herring <robh@kernel.org>
To: Tim Chang <jia-wei.chang@mediatek.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, fan.chen@mediatek.com,
 louis.yu@mediatek.com, roger.lu@mediatek.com, Allen-yy.Lin@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, hsinyi@google.com,
 Jia-Wei Chang <jia-wei.chang@mediatek.corp-partner.google.com>
Subject: Re: [PATCH 2/4] dt-bindings: cpufreq: mediatek: add mt8186 cpufreq
 dt-bindings
Message-ID: <YipjOXdCNUxdy+ey@robh.at.kernel.org>
References: <20220307122151.11666-1-jia-wei.chang@mediatek.com>
 <20220307122151.11666-3-jia-wei.chang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220307122151.11666-3-jia-wei.chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_124444_489548_E8AB1EEB 
X-CRM114-Status: GOOD (  15.23  )
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

On Mon, Mar 07, 2022 at 08:21:49PM +0800, Tim Chang wrote:
> 1. add cci property.
> 2. add example of MT8186.
> 
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.corp-partner.google.com>
> ---
>  .../bindings/cpufreq/cpufreq-mediatek.yaml    | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.yaml
> index 584946eb3790..d3ce17fd8fcf 100644
> --- a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.yaml
> +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.yaml
> @@ -48,6 +48,10 @@ properties:
>        When absent, the voltage scaling flow is handled by hardware, hence no
>        software "voltage tracking" is needed.
>  
> +  cci:
> +    description:
> +      Phandle of the cci to be linked with the phandle of CPU if present.

We already have a binding for this. See cci-control-port.

> +
>    "#cooling-cells":
>      description:
>        For details, please refer to

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

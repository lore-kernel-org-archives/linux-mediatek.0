Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B148C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Mar 2022 18:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i3ubypruPk4HQCfLn6a97Be+TgDxgyTXKVbbsEhT6tw=; b=Z382JkaViJVI5t
	hM2xuE29R8k94l7XF+kqHsvCU36w2G28WwIcI87x0qUfVgHN+ymG2IYmCzrUcrj+mROUorIXDrKTX
	TGMI2fADNPl/W8xlNVYiFZpr1ifV6MX5a/XR7HynMZGcCMnilOwsOb5pYT8DxR2C4uH96LawsnrWt
	Q6oDxoRpLLYeh8F+BEjWoH8SynZkbOb+ICsUkW1E6whyEDpTtu2VqyLF6AouswgmpkUXz26qc0+BC
	xmHvkhFmhxoba3Nawas42QT9f2BL+sMQ4ysqDXZ86jhYsnCtcq8dfPUlIrnlbESc6kexKxdV8189l
	U5QyKelXQ8VtRXotILYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPTPq-003kbK-O1; Wed, 02 Mar 2022 18:09:34 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPTEW-003guX-4p; Wed, 02 Mar 2022 17:57:53 +0000
Received: by mail-oi1-f173.google.com with SMTP id 12so2414453oix.12;
 Wed, 02 Mar 2022 09:57:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=05AcTChGbiFBLynp9DvAtwr3COK0/aCXGa8Tju5HppM=;
 b=zMf/qM4kRW0vwHxaEbJS4iwXQXhOzjB1a/L6n9bDsuovPdY/4qTRxwQEvCmO8GTUyv
 gRrbVeBLO6DBG+CJwsM6V8YoBrJFstCpZSyrzPiZoTb33ohq/wHAw3+aiJ1lYqu+zj10
 bY0mvkWEOjYFUU+VxGEn3kfzQ+LDzm8DzQeE3lsiHFOiCtOw9nBFVX7BHXlthhSH7xeA
 Al/lfoySSAbhCtlWrBlAp9KDJtpXeDu0o0xTubD0627+meZSpTLEeB+L7v0oCP6Y8rP8
 e8pvj4aDDXvNSknrN7hEsTmx1dk6k289zNgg/v+kldmKVuxPOm8mEbEXdyyir2IJ2PvL
 JIDQ==
X-Gm-Message-State: AOAM530JQuY8pYlPXSqVgesVCqC4gG2AodcI+obqZDt38hBLYjCaA8Dm
 FX6FDoULiQkH5R3tX3dWPw==
X-Google-Smtp-Source: ABdhPJyHQTcjbRnh4UmtMno3JHe5lPOWGksstwll6PVTU6ix1I/HOLvFSH67y9+7H4D7TY87X4+AQw==
X-Received: by 2002:a05:6808:657:b0:2d7:5604:6472 with SMTP id
 z23-20020a056808065700b002d756046472mr940862oih.39.1646243871318; 
 Wed, 02 Mar 2022 09:57:51 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 x10-20020a056820104a00b0031d11ee4175sm7778723oot.37.2022.03.02.09.57.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 09:57:50 -0800 (PST)
Received: (nullmailer pid 3964330 invoked by uid 1000);
 Wed, 02 Mar 2022 17:57:49 -0000
Date: Wed, 2 Mar 2022 11:57:49 -0600
From: Rob Herring <robh@kernel.org>
To: xinlei.lee@mediatek.com
Cc: thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 lee.jones@linaro.org, matthias.bgg@gmail.com, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, jitao.shi@mediatek.com,
 allen-kh.cheng@mediatek.com, rex-bc.chen@mediatek.com
Subject: Re: [PATCH v3, 1/6] dt-bindings: pwm: Convert pwm-mtk-disp.txt to
 mediatek, pwm-disp.yaml format
Message-ID: <Yh+wHbOfYZukhcix@robh.at.kernel.org>
References: <1646199106-26879-1-git-send-email-xinlei.lee@mediatek.com>
 <1646199106-26879-2-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1646199106-26879-2-git-send-email-xinlei.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_095752_248685_DF645581 
X-CRM114-Status: GOOD (  10.53  )
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

On Wed, Mar 02, 2022 at 01:31:41PM +0800, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Convert pwm-mtk-disp.txt to mediatek,pwm-disp.yaml format.
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> ---
>  .../bindings/pwm/mediatek,pwm-disp.yaml       | 65 +++++++++++++++++++
>  .../devicetree/bindings/pwm/pwm-mtk-disp.txt  | 44 -------------
>  2 files changed, 65 insertions(+), 44 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

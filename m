Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE87C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 19:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7UvrZW9vDC7+RAHxe3Db0y/3HEdMAVA+5rTcMO4tU5k=; b=D5AinHovLAiPxE66uX9UhsXTsR
	I5p3FsnLQaHo54VuK8Ic2xYkNigZ+p8ftBWa1MTsvuKSaGojSo+OGlFPdgRJs2lTlgHA2RT8QQNGu
	5F9BwLhtasiPUMYZRKoV7xSRArUQU+wp71a5Oo6NN9xM/AN9cfJPGGCuJabzSQKkIOwjQCe1h5e4e
	BUj4eQ7/QItRMzAJkC/OfV9yWo2GKq4VBbZB9er4Vb37CWngCHTXyEgcswqqDv4xdPFew5+Nr5Hsl
	YiZTkobDPsYSJbhub7pa2zC6DYhk4f8RZozG2mWgaNnS9vJNEDpLsP0ieD8yp0grYIJOupejfbdlH
	rAuT8rzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeLM8-00B8cb-Mt; Fri, 30 Sep 2022 19:07:28 +0000
Received: from mail-oi1-f180.google.com ([209.85.167.180])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeLM6-00B8bE-3W; Fri, 30 Sep 2022 19:07:27 +0000
Received: by mail-oi1-f180.google.com with SMTP id d64so5662302oia.9;
        Fri, 30 Sep 2022 12:07:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=7UvrZW9vDC7+RAHxe3Db0y/3HEdMAVA+5rTcMO4tU5k=;
        b=ol1xV3aNRTb088ytA4KjaNwjV+MqS0XApYZ6zKH+SGl+q/rdoI6YMIPJWJ9XKbvppv
         z4+wpd+8q4sCTlxLO+PlEaQxbi68DCF5kbzh6t5I+whX0W+JJCp3eql8Zl+cMh3BQYel
         yngE9OsB37bLMonfqZnCyn2uAbwqJ58mi7DlBvTTYJcd29jb1a13oBtJh7jCjJg6995u
         f/ssqoJadyiI6GCnQ+o0+FCZzbuUOqxYGRO2/ENmVYMCu8EA4TvuNYuAT038KacDy27v
         iXuaOCurFTUev1AAoKI9W8f3KTDlubJdXLiiGLSUS6u9vfPN2/qoODiecsvVr8m3HTKi
         XL4g==
X-Gm-Message-State: ACrzQf1F5YKX1XDLgKPASO8OqJ0jlTy/ELJ3bxvMr2p8KzUpmJHG9s3V
	vj3FRBdETdAeqLb7Y7sdVQ==
X-Google-Smtp-Source: AMsMyM5VXIZVfTULchEFX18RTnyFn2QWWcEhn3g4x9WvoM1p60VQNjZFgoQU5cttkyqY8L9g9cfcWw==
X-Received: by 2002:a05:6808:645:b0:353:2f37:553c with SMTP id z5-20020a056808064500b003532f37553cmr39700oih.212.1664564843865;
        Fri, 30 Sep 2022 12:07:23 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y37-20020a05687045a500b00130e66a7644sm905655oao.25.2022.09.30.12.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 12:07:23 -0700 (PDT)
Received: (nullmailer pid 692263 invoked by uid 1000);
	Fri, 30 Sep 2022 19:07:22 -0000
Date: Fri, 30 Sep 2022 14:07:22 -0500
From: Rob Herring <robh@kernel.org>
To: Johnson Wang <johnson.wang@mediatek.com>
Cc: robh+dt@kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, sboyd@kernel.org, angelogioacchino.delregno@collabora.com, yu-chang.wang@mediatek.com, kuan-hsin.lee@mediatek.com, Edward-JW Yang <edward-jw.yang@mediatek.com>, krzysztof.kozlowski+dt@linaro.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: arm: mediatek: Add new bindings of
 MediaTek frequency hopping
Message-ID: <166456484158.691972.4837005507829251946.robh@kernel.org>
References: <20220929114624.16809-1-johnson.wang@mediatek.com>
 <20220929114624.16809-3-johnson.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220929114624.16809-3-johnson.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_120726_165593_A58E9512 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 29 Sep 2022 19:46:22 +0800, Johnson Wang wrote:
> Add the new binding documentation for MediaTek frequency hopping
> and spread spectrum clocking control.
> 
> Co-developed-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
> Signed-off-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> ---
>  .../arm/mediatek/mediatek,mt8186-fhctl.yaml   | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-fhctl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>


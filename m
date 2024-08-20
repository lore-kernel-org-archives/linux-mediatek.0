Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325D1C5320E
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Aug 2024 11:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fInxDh63lUo1pJrQRWGa0VqFjDqKSYMTvciu7osvTj0=; b=Zqh3JpW1EW3tN9A44mWerTgnsW
	k9TlaXtUk4o3iixQK8vwmG5xNARq6KX1MrQSPPjo44Hlac7cD2RJpXdI3ENqNA9c45qlzGN9I92a7
	28GDLdnXn+GcuRySvmyrl5eOyVVNmE9cWYPe5Tu4i0uRLJi2J1bpvXmRHMCKoiIWgJndMJRjAEmns
	bRsCurKrsGNqnlw+J9G9MgbVLppT0RJhEOa3SSCXCSA5cWfw6yGe1ioJPHayInL3xLcqWg/PdDJTM
	NpHKeZC0L3+VzJBK6Lk9U/TOz7IIflokxw+RVfLWX6akcoiSgWLige2MQ0UnEggV/ysl7hGFtWLtl
	2ng8n8JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgMkp-00000004xfm-2fRe;
	Tue, 20 Aug 2024 11:10:23 +0000
Received: from mail-wm1-f45.google.com ([209.85.128.45])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgMkm-00000004xeP-2g6T;
	Tue, 20 Aug 2024 11:10:21 +0000
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42ab880b73eso4499385e9.0;
        Tue, 20 Aug 2024 04:10:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724152219; x=1724757019;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fInxDh63lUo1pJrQRWGa0VqFjDqKSYMTvciu7osvTj0=;
        b=Xvvpy/+942oM86PAMJFN7N9B0Qu+mzl0k2XcvRdPpE4WXRhmOuMcZYauholxSCSuN8
         DVNibm14qDY77MWUK3VOw1GoCq6eGSCgib/GYwtAYuYw6UOpiTFm15F9yiBwqIPEfKW0
         2HzLw/m4CeCuDiHMBllkeTCuMcw08YWkAnYzPbjx/0c36E1b/x71yPJnSoc0lVNK+d55
         meB/gbNUVbodTWqbOHo5fxdHOE91+4yKwAwIw7JhscU+JmBBm0w+3EGcjfwVDQ8ywz55
         yReaPoJenYlyud65CBtXKmXE7JQ0jRgu2+xugsGvKg2NEn3HfHiaU/7TAJx186LTkT0o
         AwtQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2AQ5RjzA6/bc+hr9ypu/TsP0jhFHswemO1m2MqckmoTufAWR7pqUB04O+QunV3/BaNBofWSpd2fshU2uTuEbB@lists.infradead.org, AJvYcCV4DfdmV36rzO/1r4d3Hz73VxRi+yD0zMWi9Yp7rXNseVJtKAyJbryGlgkpxaQxDlxtLU5FfRudzbxUa0gwUks=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0I9vEj8DmVgO7fwhjATwxz8soba7mWQIrsE6UC8NSxPGLn2Jg
	iL5ifV3W7EeC1dZ1tdgw5b3BBN/fZrJ60DkMQYSRK8FG1Gcn8Jlp
X-Google-Smtp-Source: AGHT+IFKueD4kujwz2iAYYiHm0x6pXa7zOH0dqc0XttMsjnIJ4KVsIzJEoUzeluMlqGg4HQjTlqfbg==
X-Received: by 2002:a05:600c:1d07:b0:426:5f02:7b05 with SMTP id 5b1f17b1804b1-429ed7a6156mr84932665e9.2.1724152218409;
        Tue, 20 Aug 2024 04:10:18 -0700 (PDT)
Received: from krzk-bin ([178.197.215.209])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-429ed784726sm139348495e9.35.2024.08.20.04.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 04:10:17 -0700 (PDT)
Date: Tue, 20 Aug 2024 13:10:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rohit Agarwal <rohiagar@chromium.org>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, ck.hu@mediatek.com, 
	jitao.shi@mediatek.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: display: mediatek: dpi: Add power
 domains
Message-ID: <b5wtwpkwgg3tbwya6zllmymaaf2qvnyfbspkynr2ruzncej2ql@qloslxfinvos>
References: <20240820080659.2136906-1-rohiagar@chromium.org>
 <20240820080659.2136906-2-rohiagar@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240820080659.2136906-2-rohiagar@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_041020_702339_C6E79EF4 
X-CRM114-Status: GOOD (  10.74  )
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

On Tue, Aug 20, 2024 at 08:06:57AM +0000, Rohit Agarwal wrote:
> Add power domain binding to the mediatek DPI controller.

Why? Who needs it? Why all devices suddenly have it (IOW, why is it not
constrained anyhow per variant)?

> 
> Signed-off-by: Rohit Agarwal <rohiagar@chromium.org>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml     | 3 +++
>  1 file changed, 3 insertions(+)

Best regards,
Krzysztof



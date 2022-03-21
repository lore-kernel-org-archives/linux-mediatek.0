Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C61C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 23:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XiAg/qnSMGu+uIO6GYlhPzR+54cY68NKGa+8eT8gqfs=; b=oEhug8NiSPsxp/
	oR6k9+37UMqdB6ODNv9Mr21DkXaIR8wXLQbEJ5as/sE2vG2o3+EIkKBFZ6aJ3fBm8wXevyvsXvKcX
	GAjtLyU5fNQ4JPcqSgxMRQb+qCc3Qo1qOdrnm53GZOlk7qmZLsMDT4T9WYlLhjaMQeRtSOR8JDzMK
	E9f53t5BnR8zZoP00Z30Uag0LkUgCXsJiNs2GcKFoCqIuT5YCqSIH9ZbGAIB0N3P7LPYsBwojF1nT
	RBvoU/6W727MRaO6dD1tnM4ghU4YwHwZKBgLpMuD32ZQzxHChtHAH2DPp5rXH+8RQ3fatUNro9rwT
	t6DWz8jH+fHmHDHAZGGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWRbS-009RGH-4l; Mon, 21 Mar 2022 23:38:22 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWRbF-009RDp-O1; Mon, 21 Mar 2022 23:38:11 +0000
Received: by mail-oi1-f179.google.com with SMTP id v75so17957166oie.1;
 Mon, 21 Mar 2022 16:38:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8b7Epipii5BGkqqnIUmpeTC0jmBsZOQ1Tko6IQuWeXc=;
 b=mtZ6Q+Ly7gXVnW3jiGcQoA41G5DinC6Ml3a9BPv8KIbHJSVlqqAAdcTaLvBUzh+XaH
 wWE0UC6Ccn4K6v+T9NVmKhpTglOgpnaPkZEXg5EqdRlCBHI4yLCZQP5at1fL73W8FCOn
 elkyUAm6Vgrtg9XeNJIiIHiDr/pX7YSsJTDybtDH65S3JsiSC/eLSXoTV6HKA93jyTx/
 rLoOoQb2MaeieOmhc0GrB5Ah5iH3TcI37cUSz8OO/CUMzx6jIkiYF9drMoNloBHEdbj8
 S24o4kgkhw7TjKw5Lodlmv7q6AS8RSRpggX49yyfR+HsqG1YdCSNRNBPEIiHIbO9Z9sZ
 /hEw==
X-Gm-Message-State: AOAM530K9UeJCFBlZyEpj+OTfJI8afXXr1ns+SQrRhO/IhRTFcvPA4Vp
 pr0BHvadk+amY0CkV8MYUA==
X-Google-Smtp-Source: ABdhPJxCD1OsOX4lizds5dSzn7Refv1mW/OIYri/zgYxYxIMkJZDVP/QLjzeYyI8RQgJfaT60iQ2qA==
X-Received: by 2002:a05:6808:9b9:b0:2ef:7562:1586 with SMTP id
 e25-20020a05680809b900b002ef75621586mr772018oig.261.1647905888839; 
 Mon, 21 Mar 2022 16:38:08 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 l13-20020a056830054d00b005a3cce351a1sm8235978otb.28.2022.03.21.16.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 16:38:08 -0700 (PDT)
Received: (nullmailer pid 757601 invoked by uid 1000);
 Mon, 21 Mar 2022 23:38:07 -0000
Date: Mon, 21 Mar 2022 18:38:07 -0500
From: Rob Herring <robh@kernel.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 devicetree@vger.kernel.org, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 19/22] arm64: dts: mt8192: Add the mmsys reset bit to
 reset the dsi0
Message-ID: <YjkMX6loduiyQdZy@robh.at.kernel.org>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-20-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220318144534.17996-20-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_163809_808221_E9CC1668 
X-CRM114-Status: GOOD (  11.28  )
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

On Fri, 18 Mar 2022 22:45:31 +0800, Allen-KH Cheng wrote:
> Reset the DSI hardware is needed to prevent different settings between
> the bootloader and the kernel.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  include/dt-bindings/reset/mt8192-resets.h | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

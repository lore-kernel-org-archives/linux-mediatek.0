Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1B2C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 07:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+swl1eoDyIFr3xZiFCjq+5TuXvrIafBTMCLvNMu3l4Q=; b=xmbpo10dXF2YnC
	qiYPufxgzewTDuKHxEi/cKRD3JVTgjI0McF4AUL0mP4G+noHtQMLBrJV2KwAcjxHg69IiGmj2sCqk
	FAcW+cRSVxUJOIYXkNTbSm7cKboZi7eM4/aaBsR0j5rEXDUbktRKYIOJm+5s/mi1D0hw+zuP8Uqsr
	XYXNXN6Ul35FjWx0b9dAh5qm62KJAmSUXB548FYI4XofBkZnlRvzM5r2XbYnIlszBKLhIb7lwxNZZ
	wRiwFhyzArG4ngDD7jikdCGVMX/odJcftjlfCEtPaFUgd11Uxs7TcZ3dHDpI+WncjxC67NRjzRNHy
	UGqpcCXv9i3ZhnvX80Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njyxk-005LPV-9w; Thu, 28 Apr 2022 07:53:20 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njyxh-005LE2-RZ
 for linux-mediatek@lists.infradead.org; Thu, 28 Apr 2022 07:53:19 +0000
Received: by mail-ej1-x62c.google.com with SMTP id m20so7840882ejj.10
 for <linux-mediatek@lists.infradead.org>; Thu, 28 Apr 2022 00:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=0oibHn2Km2ySnvEkLorLPqHJq9AlGnF8cV/IfEW7+rA=;
 b=jc5jg55FXTDdxCxGDJc6DGnGUOpt1hrU5hKu4fBLqD5wYzvYkglbe4l0yMxfUVQKyd
 IAZ7Czbm1m5lV5+saZGrgf/efjQgLu//xnv1zpY7XDm7/kYrFfoYBmQ0toBzzdkF+bP7
 OdiacFiHHUCor7aRXuLDuDTK3gvyLJMAtvuCEzSg5Tq6/7oyRX7PxtsJcIB2p7h2CVwA
 hEiuY004/DFgdm+4qhfT0D/WnV/KCDH+RlhJHqVQUqkq8uI1E8fiFoXu7rFCHVI2jeiP
 6FsPW6hbmNyJz4LTb6l7LJWXEuTpGSC3KL9Mu3nwGXOiS9uWYDUVWtDCIypg9A25mLTs
 UTcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0oibHn2Km2ySnvEkLorLPqHJq9AlGnF8cV/IfEW7+rA=;
 b=i/FKn02Y4Z5UVHn9x69i2cg/ofWsY6tdFRqT/rsqMmyNA06O9Vfsiw0BiszmdqptK/
 IzaXvlPE1YfvAwn0ddlYcF6Vo7LC+7IyrO0zyVWLFNgayK04bxOR3ctYw54t2cYShCzS
 CQ4BR5Dptd5TgZg1ywO7smHGyFWkZ7pF6LgCUoKiiZZ1Hb6Mi92FaSXInnUWCrKs1/q3
 TDA5/vWKDNpNzOmqOkgRdUgHh0XJA/ZWnB4t0KnKEdJ8GiwOVdhfb07f/hXonvqlJyi5
 aYiUatI4tJfEqA2zESL1EAJxcXyjpTOCLQckdpnqZrzrAnNcJlHD1fvzvU6dF5URNVa3
 ElLA==
X-Gm-Message-State: AOAM531VcOQ2zKHUDVU0fjHoD2Bzm41HHG6fRgLNnG5ANJKFjpB8MNXW
 xzHonV7yNdgBpayuGs5n05P3iQ==
X-Google-Smtp-Source: ABdhPJxx3QKFffHZRJQse3tZOgUc10rVzWRfiShcG9PFJzOjQyDIh5pJC4d6bradtLB2Fbe8B5A4ag==
X-Received: by 2002:a17:907:7f91:b0:6f3:d6bc:cd5b with SMTP id
 qk17-20020a1709077f9100b006f3d6bccd5bmr3247671ejc.460.1651132396327; 
 Thu, 28 Apr 2022 00:53:16 -0700 (PDT)
Received: from [192.168.0.160] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 n11-20020a170906700b00b006f39c00b27fsm5227415ejj.13.2022.04.28.00.53.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 00:53:15 -0700 (PDT)
Message-ID: <a76c9312-895f-3626-b9ba-cf71fe285a86@linaro.org>
Date: Thu, 28 Apr 2022 09:53:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/7] dt-bindings: usb: mediatek,mtu3: add binding for
 MT8195 SoC
Content-Language: en-US
To: Fabien Parent <fparent@baylibre.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220426134106.242353-1-fparent@baylibre.com>
 <20220426134106.242353-2-fparent@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220426134106.242353-2-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_005317_941783_30684259 
X-CRM114-Status: UNSURE (   7.98  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 26/04/2022 15:40, Fabien Parent wrote:
> Add binding to support the mtu3 driver on the MT8195 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

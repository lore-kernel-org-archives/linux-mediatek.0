Return-Path: <SRS0=QnWu=IY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DED1C433C1
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 01:46:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3219661A3A
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 01:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3219661A3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WYjR5mnlA32ljzW9BzhZe5v27d2iCvse5ppSC2uf+LY=; b=Z8qPDYFwLLUwgsa8LP9mBJCKd
	h6kaZN9zODa78FrXzXo6mj7/3xLSaZnoUH/nrOzihEBEmy02i6hA6EnHW/K0adqPQunYLUPCpntNa
	q5CRYTBnduLpujbHwmt0xzySrz8Tj9vPLQKYaIdmGZTgh1C4ztsznnw4NyCqgJOYh80+PqBcXyjgR
	Z1WsoRvTv/ACMAa0ucYBOnJ1mgoe+NRa36TITNGlZ+NVbNxpBPtwD3aKiPOwcH7C92JLyBCkWLznf
	uBnTElzyjsEntEiGBQoIdaAxXNLo2baIEIWnvIuot0Mr9MZTA/SjeAR+FXYQ89c0F2nBm7N5ES+nj
	n2FOAZySg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPbYP-002VWM-3x; Fri, 26 Mar 2021 01:46:25 +0000
Received: from mail-il1-f175.google.com ([209.85.166.175])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPbYJ-002VUt-AH; Fri, 26 Mar 2021 01:46:21 +0000
Received: by mail-il1-f175.google.com with SMTP id t6so3776120ilp.11;
 Thu, 25 Mar 2021 18:46:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=r8oIhicR0M0rWsVThiNvSmTLmYajZwzOVB1v/JAmNUo=;
 b=kI2/tSI6DbZe6uz2CqwfQXTyIVFpQGOaTUV4uMnMqPAvrBAc61Vng9aerKP+pV3eme
 htS81xzMIYcoWYgTa6oi9AfDAKc7YxgugV4YmFpTUpRCMuoJh/Al+oDoOGYR85/uinA0
 w6CLGk2zeVVDMaZkNDK5yXN6bln6inJLvAYyVCZYE56FbHfSfmAaVsD1SqqW9KJuOjde
 bl1UUQXRzarebSVca/q/Em+ByDW16x9LW8Sy5uxgyUv3saRGmbFC0vprsJYfzA4EKmyJ
 71TVvssvUFXjSIUQQH1axOU8i3NUA5R5HcpdwiyDJ0EcEWuMGOvcNI/uxvVhfoVv37f6
 RMnQ==
X-Gm-Message-State: AOAM532oEoAlOFbR55g8f6O+n89BVYAQHShIeeHuHMwzMjAZB63AtKK+
 74f0Xtykd46Ej7tpRGvehQ==
X-Google-Smtp-Source: ABdhPJwPChqbBJ77wIDn5W+k0ERwri8ICIG3Ysr443SmIFXqsQ/x1s7q28o5ZtNwCs7WuCdCIH0oGw==
X-Received: by 2002:a05:6e02:1143:: with SMTP id
 o3mr8643517ill.104.1616723178197; 
 Thu, 25 Mar 2021 18:46:18 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id f15sm3616031ilj.24.2021.03.25.18.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 18:46:17 -0700 (PDT)
Received: (nullmailer pid 2154103 invoked by uid 1000);
 Fri, 26 Mar 2021 01:46:13 -0000
Date: Thu, 25 Mar 2021 19:46:13 -0600
From: Rob Herring <robh@kernel.org>
To: Seiya Wang <seiya.wang@mediatek.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh+dt@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, 
 Chaotian Jing <chaotian.jing@mediatek.com>, linux-kernel@vger.kernel.org, 
 Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org, 
 Jonathan Cameron <jic23@kernel.org>, Fabien Parent <fparent@baylibre.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Stanley Chu <stanley.chu@mediatek.com>, srv_heupstream@mediatek.com, 
 linux-arm-kernel@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>, 
 linux-iio@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-mmc@vger.kernel.org, 
 Wenbin Mei <wenbin.mei@mediatek.com>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, 
 Vinod Koul <vkoul@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-serial@vger.kernel.org, Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 7/8] dt-bindings: phy: fix dt_binding_check warning in
 mediatek, ufs-phy.yaml
Message-ID: <20210326014613.GA2153687@robh.at.kernel.org>
References: <20210319023427.16711-1-seiya.wang@mediatek.com>
 <20210319023427.16711-9-seiya.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210319023427.16711-9-seiya.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_014619_696179_49FA6CCF 
X-CRM114-Status: GOOD (  11.86  )
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

On Fri, 19 Mar 2021 10:34:26 +0800, Seiya Wang wrote:
> This commit fixes the warning messages of make dt_binding_check from
> newly added mediatek,mt8195-ufsphy in mediatek,ufs-phy.yaml
> 
> Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

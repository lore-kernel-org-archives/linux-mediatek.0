Return-Path: <SRS0=7QZl=7W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 935CCC433E1
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2020 17:36:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 669A8207C3
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2020 17:36:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dPkFO7kP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 669A8207C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+of5P3TlouvcYUY+ZEMEkc5HTWvsvWx7dT2It5gwEVY=; b=dPkFO7kPPCVGEO
	N/DpetAcmN1+AnU+s7IyYqCoukAa5ZAwJxI2oubzGF/4ZvpNB6UTaio2lbkKIJk64S70R7AT8SD9p
	ZlQMUfTFJ0om09+RJgTWY4T/N8Jq4I62WIrAhw347YrcGqjDNIEfg3NnRnqFDRTweBpWJGvXNQCQM
	HRSiw5IJJjcBxUi0QKlWejB8lWazQZ2aB3LHLwaHQZ8H9foE3AmmZFrIdYBkCZr2N26iT7BeHU1M2
	3SNeMsU6JxLMLK8BVMKPaesiO1DUpdalnXvJHttJ8k4crGA2p+KRW6+GlEc2VNYF0jDTRs/5Husul
	e6od8DrunM7jeChWcEVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiiB1-00081o-7H; Tue, 09 Jun 2020 17:36:43 +0000
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiiAx-0007zD-Dc; Tue, 09 Jun 2020 17:36:41 +0000
Received: by mail-io1-f66.google.com with SMTP id p20so23646912iop.11;
 Tue, 09 Jun 2020 10:36:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7dNnoZ1rdnzksidSAoSZhnIgLkiZGWEcPmE8xec0a/I=;
 b=BTPLnPuEApLztP20MDZhrfKcC8lmiv3x56MzD4CQG/L0nBoZxWGMmNt6EFqOXcuB84
 Wnw2HOfWJGBT1RYRov8tMVHEn8LUkjCtE/aZuX5Buh4CovWNUtMwHzTeHpQB4MMOx3AE
 dcGn/YJuXuLPHBYNWU5nnw4ABto799jiQ9jGvD8lsoj9dgd+UUHfLegL5zhmdQ2GVdcU
 o+arnyCAWAkiR5P1uj9jbRvsbtEEV2p4oJhNUCQFoFA9CGDooNnOHaFeEpOBPWsGhMCx
 YzG6dRY+fF1QnhnGVtJ0e+k3/ed5tEsoPjcU4nj9KsBcNGgEAB30pjcro56D2L8LoUlL
 kd3g==
X-Gm-Message-State: AOAM533tWqXfN69kPu8A3SgjxUJVIscIE51ecZKeCym2ACNHcVdRMAUi
 Kuy5jDj+nzm6z7WtEvC63w==
X-Google-Smtp-Source: ABdhPJx/yiiBlNgsHUuSZP9/9xQBsqT57J3LHhF0CAayD6QmiM8GHdAZbeyCcaqsGh0uWxqQeNNQvg==
X-Received: by 2002:a02:a78e:: with SMTP id e14mr28221151jaj.9.1591724198380; 
 Tue, 09 Jun 2020 10:36:38 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id y5sm8056179iov.3.2020.06.09.10.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 10:36:37 -0700 (PDT)
Received: (nullmailer pid 1126603 invoked by uid 1000);
 Tue, 09 Jun 2020 17:36:36 -0000
Date: Tue, 9 Jun 2020 11:36:36 -0600
From: Rob Herring <robh@kernel.org>
To: Roger Lu <roger.lu@mediatek.com>
Subject: Re: [PATCH v9 1/4] dt-bindings: power: avs: add mtk svs dt-bindings
Message-ID: <20200609173636.GA1125574@bogus>
References: <20200609104534.29314-1-roger.lu@mediatek.com>
 <20200609104534.29314-2-roger.lu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200609104534.29314-2-roger.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200609_103639_466028_C12E123D 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat <drinkcat@google.com>,
 Angus Lin <Angus.Lin@mediatek.com>, linux-pm@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@kernel.org>,
 linux-kernel@vger.kernel.org, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 YT Lee <yt.lee@mediatek.com>, Fan Chen <fan.chen@mediatek.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, HenryC Chen <HenryC.Chen@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Nishanth Menon <nm@ti.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 09 Jun 2020 18:45:31 +0800, Roger Lu wrote:
> Document the binding for enabling mtk svs on MediaTek SoC.
> 
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> ---
>  .../bindings/power/avs/mtk_svs.yaml           | 141 ++++++++++++++++++
>  1 file changed, 141 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/avs/mtk_svs.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/power/avs/mtk_svs.example.dts:22:18: fatal error: dt-bindings/power/mt8183-power.h: No such file or directory
         #include <dt-bindings/power/mt8183-power.h>
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
scripts/Makefile.lib:312: recipe for target 'Documentation/devicetree/bindings/power/avs/mtk_svs.example.dt.yaml' failed
make[1]: *** [Documentation/devicetree/bindings/power/avs/mtk_svs.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
Makefile:1300: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1305800

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

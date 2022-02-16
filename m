Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13221C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Feb 2022 04:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1wiJADzwhR5cPHqbqfzwDWHtL4Vae+aR638ZcoYp4bY=; b=u0QKTFzpPPbQVe
	yrkrbT2he5NXb7+0q9HwLKM3xb9ZHcOwzaWKnpZCvsaQPkuoxPJb3QQZZCcYVU3tiffpp3XmiZTou
	2B/AJysP9tw/0ZKTaP0h75KSBHkbtu5mRPtBB9Z2UVD8Sa+m5QkUqpv0Rj3mQeC+Dd2EHkHj9DasV
	jX4dX2brKhU3Q2MkLIrN3ovS8awgRN1Q0oh0MDonLoxkMgRnSNLZgiYt2oK4Oypjs7FFAAb0U18DA
	Qc3cOQHYHXhsblFdsZFCxBuWvtO3Kro3w1bcRs4icaJ/SWx/vQxeDhLr2XhTL80McQHAE3p+i3xL+
	ccph1z+kMXmSgWZB/lpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKBaN-005TR3-JS; Wed, 16 Feb 2022 04:06:35 +0000
Received: from mail-io1-f42.google.com ([209.85.166.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKBaC-005TPD-EH; Wed, 16 Feb 2022 04:06:26 +0000
Received: by mail-io1-f42.google.com with SMTP id q8so914863iod.2;
 Tue, 15 Feb 2022 20:06:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=+FhN6H4sJdFIwAxrGa45xsxIVEXRnp64Rx9ILQ4TAu4=;
 b=KaJ4rIyQrwcHTHv6ktcYRckQHixTzpgvp9ZzKwRBaGnMzPRkTSl8D2rvqCaRdFpg5c
 3aX4HpMyPBdKa8w4cJS6d5gMy+/rZ01HPToPhZ+qBiE8rmaHpNp0vNwT9qnT+/hO/cGb
 R7p64B0KyLOmgHrCLzww/UeLCW4lffSs7N25ym+bvDWiy7alXzwGtSm8Muw6BWfKuS8L
 nTt39gq2RXBZrplnrnIN7U2rbK9/eK0Q5zqOJakqYIKGZJaulHMTk/6Y4aQzfM2ScGy4
 bZCpvToq/Ql5WNQwP5ReqYAivImbzXPiujjdvg9Cafq5lsFC9pSYGpTAyjBAR3fDn53J
 +wSQ==
X-Gm-Message-State: AOAM530gpTXoO8FglCjQwe//r8SbcqJVkyXTsXy4XENLII9djYIRA736
 ekjTmswWlIQ1pXYjq0ES6FjHkVN+TA==
X-Google-Smtp-Source: ABdhPJyJENO8J9J/BgMWhhP/uor8Gq356mJ2fVFAnZn6K8d9RLQjrlR5CKBvS9G6tzeoxnb0cijV7w==
X-Received: by 2002:a05:6638:1409:b0:30f:843:f953 with SMTP id
 k9-20020a056638140900b0030f0843f953mr586132jad.22.1644984383486; 
 Tue, 15 Feb 2022 20:06:23 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id g19sm3023031iox.39.2022.02.15.20.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 20:06:22 -0800 (PST)
Received: (nullmailer pid 298289 invoked by uid 1000);
 Wed, 16 Feb 2022 04:06:20 -0000
From: Rob Herring <robh@kernel.org>
To: xinlei.lee@mediatek.com
Cc: u.kleine-koenig@pengutronix.de, robh+dt@kernel.org,
 thierry.reding@gmail.com, lee.jones@linaro.org, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 matthias.bgg@gmail.com
In-Reply-To: <1644847276-27622-2-git-send-email-xinlei.lee@mediatek.com>
References: <1644847276-27622-1-git-send-email-xinlei.lee@mediatek.com>
 <1644847276-27622-2-git-send-email-xinlei.lee@mediatek.com>
Subject: Re: [1/1] dt-bindings: pwm:Convert pwm-mtk-disp.txt format file to
 pwm-mtk-disp.yaml format file
Date: Tue, 15 Feb 2022 22:06:20 -0600
Message-Id: <1644984380.781456.298288.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_200624_500902_120AD6DC 
X-CRM114-Status: GOOD (  12.93  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 14 Feb 2022 22:01:16 +0800, xinlei.lee@mediatek.com wrote:
> From: xinlei lee <xinlei.lee@mediatek.com>
> 
> Signed-off-by: xinlei lee <xinlei.lee@mediatek.com>
> ---
>  .../devicetree/bindings/pwm/pwm-mtk-disp.yaml      | 60 ++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/pwm-mtk-disp.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/pwm/pwm-mtk-disp.yaml:60:7: [error] no new line character at the end of file (new-line-at-end-of-file)

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pwm/pwm-mtk-disp.example.dts:20:18: fatal error: dt-bindings/clock/mt8186-clk.h: No such file or directory
   20 |         #include <dt-bindings/clock/mt8186-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:378: Documentation/devicetree/bindings/pwm/pwm-mtk-disp.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1398: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1592602

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

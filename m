Return-Path: <SRS0=x1vn=CR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FCA3C433E2
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 20:34:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 398A7208FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 20:34:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R8g4pZj6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 398A7208FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2NvOeWPPmemSF5ANor8hY3Co4B9M5OLexR6XT1/seaM=; b=R8g4pZj6b7faQ5bFc8xoadBKd
	tqEZYcxaDu68xEGG4tX05VwIGi+mxwI947j/V56NbQE/gaa8F1yvHdhD68kCw9PZF194vB48Vbq8N
	jeqYnq7SPa7meuXtzXBBBZuR1QZebht+K3upTjL5Cil1VAZj/H7zcQsewJN8aUzdIYAI3v6tJKsnP
	x1584RImga2J65s9SGVuubHgRhss0j1ZUpkW0rSA+2vKSXHLI9JOIONxQDtVOsVGQYMDyhpHDyVUe
	yOGtZuJ5xPH9ckC4krzkdZMRtvYlLNuCFJwUAkVBtx6+Rb97JnPMv6Awk8vhetQ3bCf3dLZ2a+oHp
	ER0mIT+1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFkJb-000400-OS; Tue, 08 Sep 2020 20:34:08 +0000
Received: from mail-il1-f196.google.com ([209.85.166.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFkJX-0003yv-In; Tue, 08 Sep 2020 20:34:04 +0000
Received: by mail-il1-f196.google.com with SMTP id t13so185823ile.9;
 Tue, 08 Sep 2020 13:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gleTakc4Nn6mTISuQkejPMu6ISZTqy+j8/Bxw7G61oU=;
 b=GhskKucbKKritiO7iI5YJW9P3Yxn6WpSBgf1r26GI0u3WCk4kVbosfoD7gZh1QPQLo
 jcrnZoN8/KpGQQMpgUsWJAI5h5crveM7/rSNB+9qLSzsuc/QPpuAKzzYtTtFq/OE6EGR
 ugz3UPClm42Qsbju93O+aHBbJRKdHx+wkrLO+db1R5Yy/MlBhhef5pwAfmxpRcRL1AOL
 HGLbZpInunO7K1+fQzQdU39o4npaqGSRDbcYBr5aJ9l8glUJFCHLfA1vTp3C8lIEVjuf
 ZVO8UVX1hWdWQOqn/lnL6juLngUZ9YHaG88Y2OGcAXapO6p/bd0Jlnh9RPtuz1CMZ4iL
 iwMA==
X-Gm-Message-State: AOAM532ifTDaR79/L0t6sCL5BCVCaXzIxBqrJ+1sbqP9WAGe37u3pMwm
 9KzAgk8avbE2TtmDW3IkYQ==
X-Google-Smtp-Source: ABdhPJzCHoj/ZvrJj7t400J/VsMUBFrd75e5tcT3ln+3OZZL67b775TNHUe3xKteGxNcW5bAkZ322A==
X-Received: by 2002:a92:c049:: with SMTP id o9mr483817ilf.193.1599597242634;
 Tue, 08 Sep 2020 13:34:02 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id k14sm217738ioa.7.2020.09.08.13.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 13:34:02 -0700 (PDT)
Received: (nullmailer pid 868500 invoked by uid 1000);
 Tue, 08 Sep 2020 20:33:57 -0000
Date: Tue, 8 Sep 2020 14:33:57 -0600
From: Rob Herring <robh@kernel.org>
To: Cheng-Yi Chiang <cychiang@chromium.org>
Subject: Re: [PATCH v7 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine
 bindings
Message-ID: <20200908203357.GA861143@bogus>
References: <20200907100039.1731457-1-cychiang@chromium.org>
 <20200907100039.1731457-3-cychiang@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200907100039.1731457-3-cychiang@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_163403_641042_78C6E0A9 
X-CRM114-Status: GOOD (  16.76  )
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
Cc: Taniya Das <tdas@codeaurora.org>, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, Heiko Stuebner <heiko@sntech.de>,
 Takashi Iwai <tiwai@suse.com>, Rohit kumar <rohitkr@codeaurora.org>,
 Patrick Lai <plai@codeaurora.org>, linux-rockchip@lists.infradead.org,
 Andy Gross <agross@kernel.org>, dgreid@chromium.org,
 Jaroslav Kysela <perex@perex.cz>, devicetree@vger.kernel.org,
 tzungbi@chromium.org, Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-msm@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, dianders@chromium.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Sep 07, 2020 at 06:00:38PM +0800, Cheng-Yi Chiang wrote:
> Add devicetree bindings documentation file for sc7180 sound card.
> 
> Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> ---
>  .../bindings/sound/qcom,sc7180.yaml           | 143 ++++++++++++++++++
>  1 file changed, 143 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> new file mode 100644
> index 000000000000..ae809346ca80
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> @@ -0,0 +1,143 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/qcom,sc7180.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies Inc. SC7180 ASoC sound card driver
> +
> +maintainers:
> +  - Rohit kumar <rohitkr@codeaurora.org>
> +  - Cheng-Yi Chiang <cychiang@chromium.org>
> +
> +description:
> +  This binding describes the SC7180 sound card which uses LPASS for audio.
> +
> +properties:
> +  compatible:
> +    const: qcom,sc7180-sndcard
> +
> +  audio-routing:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description:
> +      A list of the connections between audio components. Each entry is a
> +      pair of strings, the first being the connection's sink, the second
> +      being the connection's source.
> +
> +  model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: User specified audio sound card name
> +
> +  headset-jack:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle of the codec for headset detection
> +
> +  hdmi-jack:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle of the codec for hdmi jack detection

You already have links to these devices. Why duplicate it here? 

What if you had 2 headsets? This doesn't scale.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

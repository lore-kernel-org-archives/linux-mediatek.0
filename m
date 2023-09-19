Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B058CD54B1
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 10:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SQHjsvNbiZrx4g9lfYTl98XMHQ/DiEm4zN7iWnjsvMo=; b=wheqVuIm5egyY2+6syPJM/fUxp
	/C7h4yBzlkAEjU2/djTCoFQg5JrHiC9cMh95eTF05y4iNVJVEJ3WoaOqsuvXD2cE3h4NcmRkHzKZ5
	+B7UFCnLJsr6IamKHbfAbrOhPNY/7ecArcq+ETTKP1PJuKZ2CImw3hVexeedI8BhBXPC/H14RnWpy
	4HkD2tGlB7m2VLOdtZ5/tQVZL1PPxTDUC855cGiMV/K6bbzBmox/w1qQBxGfRkQ4Xo4Eze180vNSB
	U7gVJ89kW7nYqoeBl7e2nTs6RsSn5WVZ0KMg8p0dl3tJmrrGW3ypft7hsrhaMjWkzPN0mp5UcVvDB
	YKzxcO1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiXy5-0001Qq-07;
	Tue, 19 Sep 2023 10:28:33 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiXy2-0001Oj-2a
	for linux-mediatek@lists.infradead.org;
	Tue, 19 Sep 2023 10:28:32 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-502e7d66c1eso8678723e87.1
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Sep 2023 03:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695119307; x=1695724107; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQHjsvNbiZrx4g9lfYTl98XMHQ/DiEm4zN7iWnjsvMo=;
        b=F2LIpFyGhEjSFNltNHkJ/Ku6rlIY0+9+RCy4qIKn8qDb3FIK93oGTV59xY7G7C9Rbf
         SI3TxSWDnzKudGusDDJ+K1X/+YjwqIPWZtSvq2/U/bnje7f9WwBeMgu9g2BBJMTDZnyV
         mUFt8wVEjVRzNHNW5e9wwui2jWrlfH+I5VJrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695119307; x=1695724107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SQHjsvNbiZrx4g9lfYTl98XMHQ/DiEm4zN7iWnjsvMo=;
        b=ar6ruZu9S9AWSNFzvV0zP4UAG2cBt85e8ITJeTVKuSBpuM9khrhiq7f02PJ1e5h+dw
         BqraaAvANh6f8cvpwTA4GV376Y119wfxu0nprk/IbLnaCx0lW1kHR026KGdRDQfFrzSI
         FW7odJ4kk48yqpCdR/eO/syHz0u+brk2eBGMAi9UXBKRhk9gyeeYwT5hP1Hthh+n6eN2
         V7ke6EOTc+g92HngofQQQUknOpDTqM/eWJHVsuwaZUAvihjisd4kGHut/ekMK1gzq4pl
         pN9xb6d4jr/ZppgN8NIvliTgcatIHRykXYudyq59oVN0EH7+s4OKflG1wegBaxqqcxlS
         m0wA==
X-Gm-Message-State: AOJu0YwnKwVz5DLB5hC4TGx8ta5U/BbKR0A9qcZIRKUemNJXYNoluON/
	jEZqLxie9M+yNuED0Y9gmBauIX4WOhM7ljLc5hKSGQ==
X-Google-Smtp-Source: AGHT+IGM6xnlFEOYsGOy4vaMQaQCBEdxtKKl8J/sGO588nMpavoXIoMxtEAICrfWJ2kSxArbOreXBVnaWhrKp8Pal9c=
X-Received: by 2002:a05:6512:36c1:b0:503:3245:6eda with SMTP id
 e1-20020a05651236c100b0050332456edamr833333lfs.40.1695119306913; Tue, 19 Sep
 2023 03:28:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230919095938.70679-1-angelogioacchino.delregno@collabora.com> <20230919095938.70679-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230919095938.70679-2-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 19 Sep 2023 18:28:15 +0800
Message-ID: <CAGXv+5Hk2Hd_GPk8WerpyZ0NGtoWOiMPY-LquJxLGbG2Wo6FMA@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: dt-bindings: mediatek: Add phandle to
 mediatek,scp on MDP3 RDMA
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mchehab@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, moudy.ho@mediatek.com, 
	hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com, 
	u.kleine-koenig@pengutronix.de, linqiheng@huawei.com, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_032830_833743_060D2BDD 
X-CRM114-Status: GOOD (  14.41  )
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

On Tue, Sep 19, 2023 at 5:59=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The MDP3 RDMA needs to communicate with the SCP remote processor: allow
> specifying a phandle to a SCP core.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  .../devicetree/bindings/media/mediatek,mdp3-rdma.yaml       | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.y=
aml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> index d639a1461143..0e5ce2e77e99 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> @@ -46,6 +46,11 @@ properties:
>        include/dt-bindings/gce/<chip>-gce.h of each chips.
>      $ref: /schemas/types.yaml#/definitions/uint32-array
>
> +  mediatek,scp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the System Control Processor (SCP) node
> +
>    power-domains:
>      oneOf:
>        - items:
> @@ -98,6 +103,7 @@ examples:
>          mediatek,gce-client-reg =3D <&gce SUBSYS_1400XXXX 0x1000 0x1000>=
;
>          mediatek,gce-events =3D <CMDQ_EVENT_MDP_RDMA0_SOF>,
>                                <CMDQ_EVENT_MDP_RDMA0_EOF>;
> +        mediatek,scp =3D <&scp>;
>          power-domains =3D <&spm MT8183_POWER_DOMAIN_DISP>;
>          clocks =3D <&mmsys CLK_MM_MDP_RDMA0>,
>                   <&mmsys CLK_MM_MDP_RSZ1>;
> --
> 2.42.0
>


Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E8AFC433FE
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Nov 2022 03:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nGToQRK0DXw7c1IROX4VhPmgoLvBloa1KH2z+OM+UGg=; b=ZfMIzpYXd5bjgMo7wvDhsb4BjH
	JJqnsb1b+PbvLsoBY3m6UM348re4P9+gOHBqWVaCE2RNxRsehH0PSNqdtTl/YIv34wPKdYOpQF9Kv
	bWJRpjOecAXV1fZR1TaJ5vZuwpz1eSSeRvwXgms6dMRs86fte7Mc00m2p5reocu/cnLsmdj5HK3hA
	s2bMrhtHFAIk56gFc59uQrEt02pkGVgLrv/C6+hS2DWrZR9fG++JCJ1RCHDjot90PJqzQKYnosY/n
	phw+ouvG1sklv8Q7B8zi2ROcwoLzpJMNCAFmZQaBMHcrdpP8c2miYXz3aQQ69gCOwQM4/2u+Oygu1
	blF5SSdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or9Vw-005mRe-PH; Sat, 05 Nov 2022 03:06:32 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or9Vi-005mMx-HQ
	for linux-mediatek@lists.infradead.org; Sat, 05 Nov 2022 03:06:19 +0000
Received: by mail-yb1-xb36.google.com with SMTP id k13so3997517ybk.2
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Nov 2022 20:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nGToQRK0DXw7c1IROX4VhPmgoLvBloa1KH2z+OM+UGg=;
        b=CPY+9w/NotyoR2K8mPiZ618PyK22YxCp0SaqY76wYG7svkV22RWzh39pDuI6fnl3FJ
         lFRykuJZDpWiXOOBqTppN7aoJJbtQ0+rE/DWuw+XX0c/dSRay1rp1Ey05/E+WCvZ/Bjg
         igMiRkow60smusWFCyrq66Y2D4f5KUT3uuNRQh+Aw2jKJq1PHnxOyspGtuCpec4Q5C/c
         gx4CNCDSi+NFSNArebSYNtz3DJ7NtHf1Gs46UJtqtk9hgYD0LTl6PCAgyN5xli1snCgU
         op2YDQQyZ7vxi33xnLvxzgSVd/Xb/ncJY0CKciD/67fDX5RceabOytbAHDRo1ymjHMuW
         qmDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nGToQRK0DXw7c1IROX4VhPmgoLvBloa1KH2z+OM+UGg=;
        b=AHdwnzrfMonmOQkV0qZJwOuo2f3z5O7dq/dPBpQyxDCoqegJ/umhXbr+A+ztTvFUQM
         A5O3gq6XjwmFOnzEVa+8VJeBi7s9FKt19QQCBviOYbiBzNf4S478s+FbJXKHqoGSQa5T
         KPU6o7gV26YWAg/x+MQiWd5TG8jwAiW7KNY36ujERrpcNb8r8z/XPkB0d3UD2Gqkjab2
         JJhiQNmVYZEIX5OXGLq1rBmJK8KiPcsH3NQ2CQ0S+h9itmbTcr2k9SK2PQ1qzBc95++7
         I7hpLdHJjm7RDGP75cXjd1o4VJDOCdLqYeMAOIX3SaChIirmfKzlz7KApblVEZP7/MHB
         rIqA==
X-Gm-Message-State: ACrzQf0De+NFLAFRmWGLMsqIqyMhvFoqD3rE0gcD8WwG89sFPqojY/Bs
	r6jJDZjES0hJfPJ3f7OHfgT8nthzMiN9y+OU2/l6hA==
X-Google-Smtp-Source: AMsMyM5mjEha55s4t7TntUfGRbOeZ7n0QwDmEGTRga0tyK+7SOuQhQiic2xIjVB8WFzL1IEvui/sDKGlN11imSJp0FY=
X-Received: by 2002:a25:bc3:0:b0:6ca:6427:f00d with SMTP id
 186-20020a250bc3000000b006ca6427f00dmr34962639ybl.62.1667617575953; Fri, 04
 Nov 2022 20:06:15 -0700 (PDT)
MIME-Version: 1.0
References: <20221102125936.2176748-1-ajye_huang@compal.corp-partner.google.com>
 <20221102125936.2176748-2-ajye_huang@compal.corp-partner.google.com> <166759787920.2873722.6503685794432759025.robh@kernel.org>
In-Reply-To: <166759787920.2873722.6503685794432759025.robh@kernel.org>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Sat, 5 Nov 2022 11:06:04 +0800
Message-ID: <CALprXBbu1EFNMG2VwHd+k6kVkQXFLjKx1ojNPyKWJA-QPpyPaw@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] ASoC: mediatek: dt-bindings: modify machine
 bindings for two MICs case
To: Rob Herring <robh@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, 
	Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, "chunxu . li" <chunxu.li@mediatek.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mark Brown <broonie@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_200618_637828_EC1B767F 
X-CRM114-Status: GOOD (  10.65  )
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

Hi Rob,

On Sat, Nov 5, 2022 at 5:39 AM Rob Herring <robh@kernel.org> wrote:
>

> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
>
> If a tag was not added on purpose, please state why and what changed.
>

I Got it.  Thanks.


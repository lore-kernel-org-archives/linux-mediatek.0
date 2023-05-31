Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CE9C77B73
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 May 2023 09:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C7AepgM+CjOnswGlLxaNY+jm6TytFlnAe++3Sm4Kqp0=; b=3nwtaKsL0rZSVQl7x8bjXmqRYv
	ISUMDvjivqa3jzubHqx3kqu6NgtlLzuLLC4JcSQOfRZvwV0R7EbZ3yaFnt0QaXowksCir3sKOQCqz
	7wTKSD5LUtfVpJqm0G19rF4Cz04gmCeUBhf6okIXDH5kjhozVmHTrivrBatC0QSoW21dU2exzr2eF
	PAkIsQKqI9JaxacCzntifQYLcZiA58lSboSguZk+J2N/yaSSS0o95DzB7SQQRNoaPGfR4E08j3rf7
	ZxtUy9Nv8u4GUDIpetF4AukiM8Gytpf/T24dJpa+0a0AoKJIx+LDvby69ZGIl7MfFAOtDTNKX/c8Y
	rlFxgvng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4Hxo-00Gq60-1Q;
	Wed, 31 May 2023 09:17:52 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4Hxk-00Gq4d-30
	for linux-mediatek@lists.infradead.org;
	Wed, 31 May 2023 09:17:51 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f6077660c6so40101935e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 31 May 2023 02:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685524664; x=1688116664;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C7AepgM+CjOnswGlLxaNY+jm6TytFlnAe++3Sm4Kqp0=;
        b=MPGBHzPR4C/6l9q3gAZjvYeCTIQ+vM+3e5c9e697to4TKyYpcn9hdK9Nop4Wq1A0aW
         24ptlOq10d/IGVGWGTiSwEdk8zYLBGYlG0W/iEw57zDAK+ThmwbISHO1aFU49Pu696qI
         ssJm2Zncrrn1lrT8n7tBpo2uaz37qGWVZPuamfMYLQm1W7pJBZaa6aPkpGxY1PwpvgpU
         TthuJ8sQvDiTaDYLs5SOJ/Rz10kfJ7Yr+E7N4wKKRDzTLL38aw3DpNgtHNqXgZldWV/j
         sBdoC+NSmVod3ETLxRovw3v9OhUoH5jC4KdR6RciePveV+ILQixh9SLF7GsXfX0DoLS4
         nxPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685524664; x=1688116664;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C7AepgM+CjOnswGlLxaNY+jm6TytFlnAe++3Sm4Kqp0=;
        b=X2wrm2x/p9fdi098lTM1bYWJ230bF8tP0bZV9JEcxxLXTDVIRKwQyH/ezahH0MjCQZ
         H2l1UThZZ0lZMmpGLEvp6ljm/LhuomVd/MD4mCx68jx55VJqIe8rSFWmjnuEXuRvZ9Yb
         2vvFoBXotZhB4dzNklKYJI47qZ67CKvLPoUmdkDddU1yTublFm+xUcZA2MBEGW2uC4FR
         nFgbk2aC3ixVKtjtf2odzzXm6czuVgW51TWIc8coCm9FK55QN0v223PYTvD+X6nQuUMg
         vj9zjwtTrUJdWgfFFuKSVo+Onf00u6Rso9TA3HV91SykUtkLJqLjMqSjtCsiorbiFXP1
         pBBA==
X-Gm-Message-State: AC+VfDzqCTjeGXNY1PPu81rRxe81s1ODFy4u1coFyrqvVgOcxWMyyMf6
	uS/pEz20/KXexpvhbvpkmhXWsQ==
X-Google-Smtp-Source: ACHHUZ6NYp/JcTUWk5/h2fZGRs3qgogtaSb/m+zj5/YDtdgc2Asinv1mNGaNQIRU3GHgUOrKUZDBzA==
X-Received: by 2002:a1c:f615:0:b0:3f6:2ee:6993 with SMTP id w21-20020a1cf615000000b003f602ee6993mr3303330wmc.4.1685524664560;
        Wed, 31 May 2023 02:17:44 -0700 (PDT)
Received: from [10.1.3.59] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id n4-20020a05600c294400b003f3157988f8sm19683981wmd.26.2023.05.31.02.17.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 02:17:43 -0700 (PDT)
Message-ID: <7c1dc6d2-f87d-f577-82c2-92c17105e032@baylibre.com>
Date: Wed, 31 May 2023 11:17:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3] pwm: mtk_disp: Fix the disable flow of disp_pwm
Content-Language: en-US
To: Shuijing Li <shuijing.li@mediatek.com>, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Cc: devicetree@vger.kernel.org, jitao.shi@mediatek.com,
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20230531031001.7440-1-shuijing.li@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230531031001.7440-1-shuijing.li@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_021749_192789_3DE26CDA 
X-CRM114-Status: UNSURE (   8.74  )
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

On 31/05/2023 05:10, Shuijing Li wrote:
> There is a flow error in the original mtk_disp_pwm_apply() function.
> If this function is called when the clock is disabled, there will be a
> chance to operate the disp_pwm register, resulting in disp_pwm exception.
> Fix this accordingly.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre



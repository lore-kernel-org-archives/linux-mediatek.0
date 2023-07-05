Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 889B4C0015E
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jul 2023 19:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IQz3EobltSe+EmcdsuJx0KrcD7z5hVnsG8B8WJoHqG8=; b=ICqvGr+jgx3emHdjCs1pim9n/0
	2NC+y7y3ebkyZN2h4gI68oOWTVMSPqJW2qFYIsldx7Nv/zrrGx5n246kGv1L8T2AEbmIXWIynApck
	jTSTU8wHvREHAvZljDpwzGCy1hrkyA2wnPIsLxg+kuPFX9rho4pOmt6m4ftjU3omUn4IOCcRr6bpj
	Xwu5VD/qJ7dQE5O7bqVsVejb1mGMxDHnbml+8ykyFIlQGNHyUH7jfluxSiCerzuEnj5cOyHHLCVpN
	CW8bKvtQzj4dVxjCjPF/yeClUangANxRjcTkZSHWlbnAROeCXe2R+7zfD6CIcFXn2cUXr+BN15tYb
	fLd4dqvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH8Cy-00Gu50-37;
	Wed, 05 Jul 2023 19:30:36 +0000
Received: from mail-io1-f43.google.com ([209.85.166.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH8Cx-00Gu3l-0X;
	Wed, 05 Jul 2023 19:30:36 +0000
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-785ccf19489so333970839f.3;
        Wed, 05 Jul 2023 12:30:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688585433; x=1691177433;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQz3EobltSe+EmcdsuJx0KrcD7z5hVnsG8B8WJoHqG8=;
        b=jMfROEYxTqdwXdw9AEYARAtxq3414acben5MkK5Q6OBFUKPM1NvBtoZOBACa51cYrD
         rWVTvRHnH9jscNZcq37JiPX/aIFf4P7ZjRqK1ins4Ife5SJRrU7ARBk0sT+Dfa1k2nEY
         Pwm/ahnZRSIbpNgf0lx579yegC9kH11lfpfsFW62X+HEDNTPF+0bWy4q24CE3YQgghZt
         WmKkPSfvjlQC3QujBpsB5Ie7VkrwoeJ67n/WoC5ZsemeKGc6TivuUej/WjsLJSCVCa67
         emXgilTFaKRCdlIeIrmGeBR6TSRBVqCE3JSPFp7pTUTQ/BbxTWapuOTqP/3TFdBsp4/i
         S8vA==
X-Gm-Message-State: ABy/qLbY+zEaiPwEZjVc7YkyKCJNUqHYpoNyIn5JOjp9sLLcN8nytj4x
	s0lXmaB+hiCgCC+a6r9kUPzeXqxB5g==
X-Google-Smtp-Source: APBJJlHXL7CimwQLZrke3i7PIbJu/7Yp22eaIidFcKDP1kX78c3HPd0izvSuIzZNvMpJxliLg+IlUA==
X-Received: by 2002:a5e:a903:0:b0:783:7307:faea with SMTP id c3-20020a5ea903000000b007837307faeamr97528iod.2.1688585433085;
        Wed, 05 Jul 2023 12:30:33 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id ei21-20020a05663829b500b0042b6cb44429sm476699jab.46.2023.07.05.12.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 12:30:32 -0700 (PDT)
Received: (nullmailer pid 1702388 invoked by uid 1000);
	Wed, 05 Jul 2023 19:30:29 -0000
Date: Wed, 5 Jul 2023 13:30:29 -0600
From: Rob Herring <robh@kernel.org>
To: Jason-ch Chen <jason-ch.chen@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, =?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Project_Global_Chrome_Upstream_Group@mediatek.com, linux-arm-kernel@lists.infradead.org, jason-ch chen <Jason-ch.Chen@mediatek.com>, devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH 1/3] dt-bindings: arm: Add compatible for MediaTek MT8188
Message-ID: <168858542895.1702303.9157130705256283256.robh@kernel.org>
References: <20230705065744.25848-1-jason-ch.chen@mediatek.com>
 <20230705065744.25848-2-jason-ch.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230705065744.25848-2-jason-ch.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_123035_210389_ECC18FEA 
X-CRM114-Status: GOOD (  11.13  )
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


On Wed, 05 Jul 2023 14:57:42 +0800, Jason-ch Chen wrote:
> From: jason-ch chen <Jason-ch.Chen@mediatek.com>
> 
> This commit adds dt-binding documentation for the MediaTek MT8188
> reference board.
> 
> Signed-off-by: jason-ch chen <Jason-ch.Chen@mediatek.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>



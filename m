Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE4C8C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 04:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wWVwdWpzRVxiWjCKI305GTpyjGD1RYR4iFv4SjfE9Ac=; b=jj6T9U8d4S7BEb
	5K9lzhvPQnjNFahZbNo/9C7OyIAPYt2akSnQoVQKnqzkSsZMC9Iua8z0iKT9Mwzr2lsxJ4hkU4k1s
	JOXP2WulkqF3kPHsEM6AzeWKftLhkoEyk9ZM5srQaWLMPLBM4d/SzMqgERcZxc2xY6j7aWhLSJI3d
	DHionBiGNYVvZx0sBbCslD6MyCuF3Qgbq3b6/rDYjfXd+lKyiuacHSpP6yg4VO8YBwsHpHYOeGNbT
	zrObpV/zfgmATtsTjSoYDFTzKNAFFiJsRMbE75UPnKv9W2SVo27QCBPvUI3fWAQGvs0IeSNfFD3/z
	3MjTmL8zVLaDDFgImClg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niq44-0087MU-K0; Mon, 25 Apr 2022 04:11:08 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niq3e-0087DX-Mn; Mon, 25 Apr 2022 04:10:44 +0000
Received: by mail-pg1-x535.google.com with SMTP id q12so12351815pgj.13;
 Sun, 24 Apr 2022 21:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=J07yJYS22m4KdiXAROXYNCyrX7ou1e3ju2cq0MN47BA=;
 b=dJp4sBIE7mrsvaftVdcx5/hwggvIV06lddbZ0EQS38+1PBaN2vftdW+Lltq+uF3OoO
 SPR0iOg9ri9+3sHI/oUejxxocqZcjGHFZDgzLQKcn4ocjVeR8fkqnWTYIbCIek2IlMAL
 EBbRbtiTnO9749TvKsG0+zI8pJkNAogWVMy3FDHnBUkvXxeJXKUKSUat1uK030Q+O5e6
 PykuqCwhxgTDFLYWsPj/cvBg0769pij3TmBydmliJFTddb8zfPVqO1kMUbHnwgujcq2B
 F/bxVVirncNK/PLTUu19xJqT8G2x47Ln65IhjZYRQON53ed/sEahtw+BZL4rm33BFiv+
 YD0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=J07yJYS22m4KdiXAROXYNCyrX7ou1e3ju2cq0MN47BA=;
 b=EugwBEwVHosHRm8kpiaODf79H5l6RvoXf3xSUvmW/CJJBezsxHaTOukk17bQeqWjKM
 60k/vBucZ92kiEU1GBWn1xyWG+UWgBnBLkk33wsGWRbKPbm4qntH8ABQ6nBw5jrFAoFo
 TPcFLrSB6UK7YJkeNnh7Ww61fCwoUjdg7BQJTtgjCiHeP1z7fZ+6CdSMEJ+7WqGYtFJJ
 98F5uwUMRnFWJyYBwwenBajXxnDLLNFQAXlDAewv2iToce/ll/tDscfdcEERm5ZxjnjI
 jTLrsmCtvqHVmlh4hj4wDuwKmGlh83rBa6IUnGeAwU2PK56s6z40aHo1f8C8tfBQZ1DR
 IA5A==
X-Gm-Message-State: AOAM533zj5ijweJTwh4STvQGso42lrQTIX8CWPCpynrGnLnm/Uc2mJFE
 oFsnS8C4HkHMGNsFG60QHs8=
X-Google-Smtp-Source: ABdhPJyd9dtJLYaaGt59M7aFPkyctBWFkRsocgOcPsrYp5HLF2XDbROcMgywmajwcRSiYO73cSktOw==
X-Received: by 2002:a05:6a00:2444:b0:4fd:db81:cbdd with SMTP id
 d4-20020a056a00244400b004fddb81cbddmr16764423pfj.32.1650859839198; 
 Sun, 24 Apr 2022 21:10:39 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:282a:d50e:e0fc:c145])
 by smtp.gmail.com with ESMTPSA id
 j19-20020a056a00235300b0050a858af58fsm10122202pfj.145.2022.04.24.21.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 21:10:37 -0700 (PDT)
Date: Sun, 24 Apr 2022 21:10:35 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Fengping Yu <fengping.yu@mediatek.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: mediatek,mt6779-keypad: update
 maintainer
Message-ID: <YmYfOwVT7wbBXU3n@google.com>
References: <20220421140255.2781505-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220421140255.2781505-1-mkorpershoek@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_211042_835054_02D9AE34 
X-CRM114-Status: UNSURE (   8.38  )
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

On Thu, Apr 21, 2022 at 04:02:55PM +0200, Mattijs Korpershoek wrote:
> Fengping has no longer interest and time to maintain this driver so he
> agreed to transfer maintainership over to me.
> 
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

Applied, thank you.

-- 
Dmitry

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

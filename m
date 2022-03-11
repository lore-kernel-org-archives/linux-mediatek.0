Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F025CC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Mar 2022 15:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GyemIGKyeLsbfANuYqcJr9L31/LZPSp/cfu13iYDuuY=; b=G1C44qWXr3i4lT
	eAKQInpe60IPQABmApnWqC8GBq158fDdcw4OePQ8Zr8S1MKLbGNYROmWQaow+7EcioXEiS15z2B7g
	VBU8O0mV5wQHee4TohRrq4/Ibtm7NieXu+A3Ri2Rhmt4z2wTihnUiV204CbSWtasxElb3eG8MuJkl
	1rVOqtPSgTOIrLDjd+jWMsJGHF5t7eWepuDK0DRVKPsP51SlvejKKYPbCMBZDMhTNwfBv1MfI8gGG
	kB75e2G84eTyP5hfIaETIQX1fVmoyMQyZoEdMUM4jpmblVFRyU320sx36rftQYUsRiNX8ZV+cv7BO
	5zdXeU6syJmtlvfVpvQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nShZS-00HDTf-RV; Fri, 11 Mar 2022 15:52:50 +0000
Received: from mail-oo1-f41.google.com ([209.85.161.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nShXx-00HCjc-3N; Fri, 11 Mar 2022 15:51:18 +0000
Received: by mail-oo1-f41.google.com with SMTP id
 s203-20020a4a3bd4000000b003191c2dcbe8so10915976oos.9; 
 Fri, 11 Mar 2022 07:51:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hPWhM8gN2fHMMyrikld9pWWRJCFMx1eu3IDjtAq9vSg=;
 b=E9VRCjWL5DRuYE4g3ZcdZXUB6PzvbpZoAFfhdcCwyuz1MGbvZioktPY86v5qNU9TLk
 asFyz/8BYFvPW6wIxt6fXpnDmvWsNzAknSaoE6jFYvySd9H4+gefYLxyEmqir8D/Zw9s
 U3L1D8sAovDlqqmdBzEcpmoe2aNDeaRiLWba1KviEVcsGVivoaGLo1xWmWOiH802cxoP
 06H8ZhIYF510sIqTwMQiXsKKE/78oUzxJ2yH7vibXg8LDi85O3pifi9SYOSgM7Tq08nq
 9QOiAKSiT21YsUt4nCQRTvhFx97QxcvUdXuu9G+Hj4x3n3Hb4SlxyqBBh94mdaXjkw74
 OCYQ==
X-Gm-Message-State: AOAM5302FPY3d4MxSg09NEBO788I73yi6FtJot8KWJwSf6jZdgRPIIb4
 1fVvLznaCPbWZ/Tbg6dY3Q==
X-Google-Smtp-Source: ABdhPJz2sr1dPO2TtCSOl0PyLmP0mZIX3n1FVaxV/vXDtF9QhVnqHd4tRPJROZ4bwmk+VGMkC8zkjw==
X-Received: by 2002:a05:6870:2318:b0:d9:a0fb:cec5 with SMTP id
 w24-20020a056870231800b000d9a0fbcec5mr11325663oao.77.1647013875390; 
 Fri, 11 Mar 2022 07:51:15 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 v10-20020a9d7d0a000000b005b229f99815sm3660710otn.80.2022.03.11.07.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 07:51:14 -0800 (PST)
Received: (nullmailer pid 3868129 invoked by uid 1000);
 Fri, 11 Mar 2022 15:51:13 -0000
Date: Fri, 11 Mar 2022 09:51:13 -0600
From: Rob Herring <robh@kernel.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Guenter Roeck <linux@roeck-us.net>,
 linux-watchdog@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>, hsinyi@chromium.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] dt-bindings: arm: Add compatible for Mediatek
 MT8186
Message-ID: <Yitv8TKk8KJkVg9Y@robh.at.kernel.org>
References: <20220311130732.22706-1-allen-kh.cheng@mediatek.com>
 <20220311130732.22706-4-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220311130732.22706-4-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_075117_175732_AA6F2BAD 
X-CRM114-Status: GOOD (  11.48  )
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

On Fri, 11 Mar 2022 21:07:31 +0800, Allen-KH Cheng wrote:
> From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> 
> This commit adds dt-binding documentation for the Mediatek MT8186
> reference board.
> 
> Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

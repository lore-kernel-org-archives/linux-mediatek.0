Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13042C83010
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Aug 2024 09:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yU74Z1taMGbV+l39s12NXbpyp4bl/SLE0B6UFkVkWLE=; b=C5XCEa3ucDyGKFs7y/4faGBDRq
	NgnMBigmDCZrTC39N32oOpV69gmtKtIUgPKTZeo+NUHo82ENctqzBIbGUhJaazQnEncDC3IjjsVwI
	1m41AkF9mlPES4BnowuIYUwoZz/x8jECxDgxQ0hTRJZG//LIWwN9FU0L/mudO9DIKDzdAS8T9FzCP
	6jeZzM6TN0ljRT8AvYhJS/lubal3FppIKeqGclcdoEA5ueyC4PYuO8SaDlQO3N63y5Qyx5u8dyJ4Q
	PnCbsNsqZS2kOc0ALCaKkauxjr2lVW1Zr9E893tAzaeLPv9N2ZSFtg3hjuHDvm+P6wOw/d2vbI6zs
	7sgrndxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjb51-00000001HW0-2gSI;
	Thu, 29 Aug 2024 09:04:35 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjb3L-00000001Gw2-43FZ
	for linux-mediatek@lists.infradead.org;
	Thu, 29 Aug 2024 09:03:04 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5353d0b7463so694906e87.3
        for <linux-mediatek@lists.infradead.org>; Thu, 29 Aug 2024 02:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724922169; x=1725526969; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yU74Z1taMGbV+l39s12NXbpyp4bl/SLE0B6UFkVkWLE=;
        b=cWhUymrFNSbpcUx/bQx7TveXl8tlvKuGLyyovRaU75FCQkXudH6tNC28iBDXLSbKeq
         zmmgFP6VquJLKxKCYH8ldh2kMikooEq3LeCuB7gI8fjPLClU/hqkFMMQTAyzapBnvN/0
         ThGzXAxpMJy3/FkjXLAH1FHcIfFCVjE4cEaa+4RysWT3eJdMcQkoyucsrVsukSdUZj9i
         2C8aBVd8cJCIhBldLe6EOXHfxYU9UynAH8a0UZ0NbXBn49+hy9mUZqb5PfzqcRk/B9Ua
         BgQ2kH+iXrewd3Wu6lLSnjTd+xFLDj9mnz/KsKC3lM26zoa60wKng3wVF6no8hp2cmrY
         1qeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724922169; x=1725526969;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yU74Z1taMGbV+l39s12NXbpyp4bl/SLE0B6UFkVkWLE=;
        b=EqbXwzM7RghmJyZ1YM95Vx0KQrTminlH2CBeDaLbPOVY52b7j58Bj/Ieh8cr9+P5vA
         DbghiapPRiuhcSCpQUWzXThQv24t017ePhmUT90koCL19y0u7hOy68fiShRk1LsYBp9j
         ezwxTMGBnA2ZdZqPHd6Dep2A/Lb+sIWAs0JSzi8mnGraPLWTWyoqh3jUZQB2Fn3894VD
         Rjnhv9YbUqGmTccz92/hxK/yy+2jy2z6YgoJ5e5DgDuM/vkwjnt4Hf/yd3QktUYtXyvP
         4k3Ck2WwGVwP5mr09uPqVhrJIDc6eRXdczGNor8u+BR0C+V8AT8w1laT8+gGNXbmqqtt
         qN4A==
X-Forwarded-Encrypted: i=1; AJvYcCXJvGTCLvg0FEItqJ1YVCMYhX7t5AhjE1DQ9UmobccsZYSjQ4EFIlGJtD9MkHerYZSoaqxieCj8zARYjXbFRw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxOVOr3a8GW3FLlAmR09QEwnAi+cSdjstWe+xGauw4L1WMTb5d3
	v6KqfMkzC2S2ttVBFHxz+B+yKwwCm7Q6k64g6WqSk38UlP9cz0dXw6wq1sd/dBo=
X-Google-Smtp-Source: AGHT+IEOG/Fqff23S0qeqzOkwCb6zYTfMyOgmyR3JgJ5MsKUOkzSuMuafc5IyicZkjqzBwKINyngaQ==
X-Received: by 2002:a05:6512:baa:b0:52e:8071:e89d with SMTP id 2adb3069b0e04-5353e5acc6fmr1722676e87.40.1724922168807;
        Thu, 29 Aug 2024 02:02:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-535407abdb9sm99698e87.72.2024.08.29.02.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 02:02:48 -0700 (PDT)
Date: Thu, 29 Aug 2024 12:02:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 07/11] phy: qcom: qmp-pcie-msm8996: Simplify with scoped
 for each OF child loop
Message-ID: <3omsbwonwputnyns5h6rq52bsafqb6is42jk6ty5pv7z2wmyvs@jeb33bmeotyh>
References: <20240826-phy-of-node-scope-v1-0-5b4d82582644@linaro.org>
 <20240826-phy-of-node-scope-v1-7-5b4d82582644@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826-phy-of-node-scope-v1-7-5b4d82582644@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_020252_396970_4539A89C 
X-CRM114-Status: GOOD (  10.40  )
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

On Mon, Aug 26, 2024 at 12:07:23PM GMT, Krzysztof Kozlowski wrote:
> Use scoped for_each_available_child_of_node_scoped() when iterating over
> device nodes to make code a bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry


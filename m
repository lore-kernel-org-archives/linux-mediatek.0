Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DC2C4167B
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Dec 2022 08:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+TD5tjlJr06e8+hQP4RV+wiuVFoaq9bvVuc6zSOft8=; b=0+Z03ONuxsOBrn/ncDbw/cHVLd
	y/HTyNcdmnP9pQAq1pSCWmYZKrn4L/YoOPuxgQ6er0xXxoH2GYqN9W3LxfiPS3TtagwoAj0E/qa/M
	TUzYQLV+yoRJK4j9zqSLdWoK76BAwuVdLrCyDKpSpR4AcM8w6ge3F6beJ7dFrNwpS7H0aFnK9sVBH
	z0PC331iDs/rLyMJ/uOl31jT4mSXrh+1K+6jZxt1fF+mopjJk2a7VMQloxVud4rYsGz+mo642MkzM
	76mrZoeK/pycMDz1rkv6lHC43ehgrtDmPGld+zkPNQv+/N2oo/xOUFm0dgAExsq1QyuGiTLRtksc4
	DarbgKoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBAqg-007KfZ-Ef; Fri, 30 Dec 2022 08:34:42 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBAcW-007ETH-FD
	for linux-mediatek@lists.infradead.org; Fri, 30 Dec 2022 08:20:06 +0000
Received: by mail-vs1-xe35.google.com with SMTP id x65so7126713vsb.13
        for <linux-mediatek@lists.infradead.org>; Fri, 30 Dec 2022 00:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4+TD5tjlJr06e8+hQP4RV+wiuVFoaq9bvVuc6zSOft8=;
        b=G4a6pvhRGTZ+uAMtcCdHwuA4ZgJkdJU0jDmkG/nvCkmXcgsnqXemLPhxXO81lB0TFS
         IaDgSBZQmn0uHCvucOzFxZmiyuHTZYDEjApq8AoPo5BZk4tXTbddK1FhWkx6Bw1q3VbY
         pmHVDMFoV7aKFCGuflInLWDzdHvQnj1u3NPdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4+TD5tjlJr06e8+hQP4RV+wiuVFoaq9bvVuc6zSOft8=;
        b=zyo5XJRFJ2dccowBioIhYY84GcIVSzOTqJhsW2lvarB4BQVA7zNavhrCXUeO2/aMAo
         lAV1o86bysUF2Zo74UR5Zrx+f2HLfGisHxlefKLjjS0umxYXGmVfEzzRO5b2QTKzbvl5
         4tWND3Nxi7/KXtEZA+aCluGMWLF1F9g1r5+BUol6ocNXTOs0HB/Ay3t8XxN+ZXHTZE9i
         FIDce6FLT+ZAKZd4/QnTT1n+BY9IE/BiwrFdyi3NNsbW/WcZvhzJFcnRMVwHkUfe13To
         91HufLfYI8WI26CkzxGxj4JgkF3DzA0nTiEWzGG+Hxu42aSGXCxaQCiJf0WcCdcjrSk1
         6o8g==
X-Gm-Message-State: AFqh2kpycUxSuPAaNDLk11Ej4d+S5hxhJonGWNPYrRqrrMbi4DchfszB
	nKGZ8rGPyDsQ1iKLbNQo3w6/kEROyo9YwJ+TEWJ0QQ==
X-Google-Smtp-Source: AMrXdXuAQ+AfcldxK29BpiQ1dOQS6okUitNiNCau3Vs0Wew3cn4017tMWvd4ZScjpCBrohBQ69zYN+UWb45AMVugflU=
X-Received: by 2002:a67:fbc2:0:b0:3cc:fb59:8c71 with SMTP id
 o2-20020a67fbc2000000b003ccfb598c71mr24039vsr.65.1672388401627; Fri, 30 Dec
 2022 00:20:01 -0800 (PST)
MIME-Version: 1.0
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com> <20221223094259.87373-18-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221223094259.87373-18-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 30 Dec 2022 16:19:50 +0800
Message-ID: <CAGXv+5FeUfmw9iUyS=-XhkvGueZ9uMxH8G3V_KnB-2uKy48ccA@mail.gmail.com>
Subject: Re: [PATCH v2 17/23] clk: mediatek: clk-mt8183: Join top_aud_muxes
 and top_aud_divs
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, fparent@baylibre.com, 
	chun-jie.chen@mediatek.com, sam.shih@mediatek.com, y.oudjana@protonmail.com, 
	nfraprado@collabora.com, rex-bc.chen@mediatek.com, ryder.lee@kernel.org, 
	daniel@makrotopia.org, jose.exposito89@gmail.com, yangyingliang@huawei.com, 
	pablo.sun@mediatek.com, msp@baylibre.com, weiyi.lu@mediatek.com, 
	ikjn@chromium.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221230_002004_609101_E02F77D8 
X-CRM114-Status: UNSURE (   6.11  )
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

On Fri, Dec 23, 2022 at 5:43 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Join the two to register them in one shot.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>


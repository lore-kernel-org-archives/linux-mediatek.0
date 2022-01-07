Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7AEC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jan 2022 19:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HWJ/BP4gSqmb4490ojjqQ06O++QUOOa4G4V9CM1SLN0=; b=UXIhDI4qjjKaKX
	RzI3v6eP6m23ZVJ1psF4VR1Mk+AFKJDpLYQRfpJVty7Y3pqSuPqcQGZCWvJ8/uFq70jBB28lI/YmH
	mjGbhdhS6rxbeZ+oICaijz39osEYooLO8/YWfgUIWiG3YB7NmWsg1p1quTw6EipGsLCc0vlMAEWWJ
	mafIvJ1jL0E9IrzwB1qJSg0Zh8Jkmf/GK1CgJ0cPUDGmAo0y5Udq/AIx0zMMlCKkBN/CTYcraXJ1R
	qZnQZsLNzomGCoo75vipBy+5lcI+kHvb00mOTNXmTtel8X+W9zdHTEZXTqY4ymVBhyD87dXb3pPdM
	ULO6gHR8a0C1L6ubwSew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5uYd-0051Wm-LG; Fri, 07 Jan 2022 19:05:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5uXk-0051Ky-Cd; Fri, 07 Jan 2022 19:04:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E70E160C08;
 Fri,  7 Jan 2022 19:04:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C66DC36AE0;
 Fri,  7 Jan 2022 19:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641582290;
 bh=nNx8Ez8RuJzMEX0m/nrXYhE49DyWxePNuMQ+s2d9OD0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=m5gR7RqmffLGvhknYYWgFF3VAibsPeF8pQrWF6J3+O0Kwz6qm6XXlJkcskjX1N4Q5
 /jKuE1HIfpPOcj538lEcF7XofVhmgV9bZnspFkZYIqt25o+CBtAuYTuwK07E4O4Eao
 IgV8kJKtof1HzpHJ448rDdWmv4pdIolVmAbycc8M+57w03HK8IHG//VGh/BuFQeuW1
 UYeWn8ZQhIBB0Nowg+kYaTHNYL/q61abrwLil2XugJ5CHdaYnlk0M5sBTabv0yV3fb
 wihs/R7/mPeK7wvKs32NSOyaxq+xdF+lXIsK6Ny4Tee9ezGd6ggzhvCI8qQQxa20qw
 Innkz7FsgnU5g==
Received: by mail-ed1-f43.google.com with SMTP id o6so25724521edc.4;
 Fri, 07 Jan 2022 11:04:50 -0800 (PST)
X-Gm-Message-State: AOAM532PDaOo1kxQulqZS+kebWvgPacC+GvH+X4eXuTv5xcUMTzwQ2ks
 YgT7gSFM+rPsB9bZ/0GeH02cHAUBFgdymWNgVA==
X-Google-Smtp-Source: ABdhPJw+wXf/3puw/6oK452xH+IpOasvCo6eBekERmd/axjyL/WBlDh/+JCf89iqY3bdCvCGkFWJtxidbbj8CqZW4bY=
X-Received: by 2002:aa7:ce88:: with SMTP id y8mr5876517edv.303.1641582288710; 
 Fri, 07 Jan 2022 11:04:48 -0800 (PST)
MIME-Version: 1.0
References: <20220107115345.9075-1-tinghan.shen@mediatek.com>
 <20220107115345.9075-3-tinghan.shen@mediatek.com>
In-Reply-To: <20220107115345.9075-3-tinghan.shen@mediatek.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 7 Jan 2022 13:04:37 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKctALMWbNytCP7TGKEcCaoOVpm4eHQ3PUHDy2AKrwfmg@mail.gmail.com>
Message-ID: <CAL_JsqKctALMWbNytCP7TGKEcCaoOVpm4eHQ3PUHDy2AKrwfmg@mail.gmail.com>
Subject: Re: [PATCH v8 2/4] dt-bindings: arm: cpus: Add cortex-a78 compatible
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, 
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 Ryder Lee <ryder.lee@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_110452_515264_ED578186 
X-CRM114-Status: GOOD (  11.43  )
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

On Fri, Jan 7, 2022 at 5:54 AM Tinghan Shen <tinghan.shen@mediatek.com> wrote:
>
> Add ARM cpu type cortex-a78.
>
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)

I already have a patch for this pending for 5.17.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

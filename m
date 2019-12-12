Return-Path: <SRS0=NAie=2C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A53CC43603
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2019 20:21:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D11032077B
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2019 20:21:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N1oOjvP/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D11032077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=maf8Tmig2dxp9EoA2mSZAAkh8FwWslnPnU5blwnUP/Q=; b=N1oOjvP/aEqjJs
	tmjBrksAzZvNDSdbSq2w8bBsMlwPk4nVMjn/cwdlj22c2Yc3kepHyrbIeLoknR/pKXBtcCmg3Xbqa
	Xjz6Kc9wqTsxKjjpl4WRy9TTSolfDuwDfoLxtdEJU5iVBfFhGpiNXJpUzl0SWMhKvbeDFjgxhaNDo
	3HCTkncTDPJeXT0Tn+z3bPU7xB9HZZLsyMK2//e/+cUN/k1j2aHYQlaM2c1FBRisUSIjQrdTJ2Nf4
	DJ2MgBAHc9ir7hEEh7/G27NMhllJaQCV9HmBO4ZKWoVhIC5dJNJWtNQKz7z8CMAt2vLlxiD1V4tVi
	4MWadYgEPzMhpspo/LIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifUxr-00069L-UM; Thu, 12 Dec 2019 20:21:35 +0000
Received: from mail-wr1-f67.google.com ([209.85.221.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifUxp-00068H-2S; Thu, 12 Dec 2019 20:21:34 +0000
Received: by mail-wr1-f67.google.com with SMTP id c9so4154460wrw.8;
 Thu, 12 Dec 2019 12:21:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CPNUf9ZfNsHV45XZGqiBQJlUTUhc2MVRp6BnooBqqSc=;
 b=PWiCKDDHQTXDBMhA0UqRWD+7jcCKH5cKGxwZxSfLLoDKt74oV/6u1Mw27Tb0Tk/SCS
 THBjIGr1Ddf/jx4GR0DNmki5jRaovivhDWUmDv0HXvC8IvrIJjAkvDvHNOCAm2YTfQEB
 FJXDiS1pHNBS8iOtqR1cUPAHsg/HafsOg+HY3rIV1qHkmMYSy7yEqkZX5GTDK8J4C8cu
 thS6lWPM8wBx3sK9oRQO5IsMnItaytxHTxKuY7Hl5fQObmFe/a7QY/GA9acuszP/Q/mF
 foUUK4f8Sn/KcG9VMQr+d3VRKPBVc4lqb3UjpSUxRzXnbKvpxjejgDlKnuv537SvxBkZ
 9PxQ==
X-Gm-Message-State: APjAAAU7pmzDN4wT8H/8NM7xyNc5QMqIvrVr8U5YEKs1zeCDPoL7uP2D
 qIbEgxlf8l/M47fsnnTL9Rt9wJAi
X-Google-Smtp-Source: APXvYqzzbodyVYL3FNuaGg6Zp/U+21dUGiWWf3SbMNFJoJ0+vWDhCy4pxUgA9VjNMpaXXox/nvLRBw==
X-Received: by 2002:a17:906:3953:: with SMTP id
 g19mr11516560eje.227.1576182089998; 
 Thu, 12 Dec 2019 12:21:29 -0800 (PST)
Received: from kozik-lap ([194.230.155.234])
 by smtp.googlemail.com with ESMTPSA id k36sm2772ede.57.2019.12.12.12.21.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 12 Dec 2019 12:21:29 -0800 (PST)
Date: Thu, 12 Dec 2019 21:21:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2 1/4] ARM: dts: exynos: Correct USB3503 GPIOs polarity
Message-ID: <20191212202126.GA3534@kozik-lap>
References: <20191211144638.24676-1-m.szyprowski@samsung.com>
 <CGME20191211144648eucas1p2065aac523ce190a5c0e6e2b5b11bd5ce@eucas1p2.samsung.com>
 <20191211144638.24676-2-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191211144638.24676-2-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191212_122133_113232_3B2CA4A1 
X-CRM114-Status: GOOD (  11.22  )
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
Cc: linux-samsung-soc@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>, linux-mediatek@lists.infradead.org,
 Stefan Agner <stefan@agner.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Dec 11, 2019 at 03:46:35PM +0100, Marek Szyprowski wrote:
> Current USB3503 driver ignores GPIO polarity and always operates as if the
> GPIO lines were flagged as ACTIVE_HIGH. Fix the polarity for the existing
> USB3503 chip applications to match the chip specification and common
> convention for naming the pins. The only pin, which has to be ACTIVE_LOW
> is the reset pin. The remaining are ACTIVE_HIGH. This change allows later
> to fix the USB3503 driver to properly use generic GPIO bindings and read
> polarity from DT.
> 

Thanks, applied (for v5.6).

Best regards,
Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

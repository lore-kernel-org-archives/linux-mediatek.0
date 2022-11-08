Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04980C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 12:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k4F6NNy3a9JKGxqIkVEd+ypPrQuW+NOqc3zUbmZnBIg=; b=WhFSbFpu6ND9WZghUKaxdVELb5
	iyfaTnW0AJsbc2f1/7/A6VeAlRJIa8zftIh9HJtGqr4gkMrFJxsC3Z7EpV5SQMavtCL7JQFPrHNyU
	ZXh7hfyxSwOCbPcdRlpeB6kV5+dK+hMpewKgsgFVGZxIgdkEOwvF+xrUnU9WuiF8a7w9YiZCBIGte
	upIq/7eDX+KBXEsBQhjWMlzKpyACgEzY4X7WI1lyu4PyQ3gkOSJwMqITqa0+EAWeNlN142xutuA/g
	qVYMIiM7rH3j5YtmWdrUgNMrnwp9ekQ9BEHw/lZcZKio3eRysMoeV3/crrFpV7K3xMKcjwpUaygCd
	fX+o3ndw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osNYr-0059S0-Oi; Tue, 08 Nov 2022 12:18:37 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osNYg-0059Oh-ES
	for linux-mediatek@lists.infradead.org; Tue, 08 Nov 2022 12:18:27 +0000
Received: by mail-ej1-x62c.google.com with SMTP id n12so38019111eja.11
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Nov 2022 04:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k4F6NNy3a9JKGxqIkVEd+ypPrQuW+NOqc3zUbmZnBIg=;
        b=RlWeLJGad5+ye5AWSLxrsZlN1dg8kSHWzv1Dyex3oEnUu8/bG91OG6U5MeFBmN8E3w
         vB+TrEkrrXt8lDF5bZBHwa1w7sbQ3vWilzy7lZNC6QWOHu6rYYgQ0tBbFALG0kCz+mHi
         nNEB8oDc6PF2uaygV+VIA92AdDSvST/wv3sbK/6tQKZC13bjPpzKEAzmonoTujynVtGR
         hf1IYQVWuZJGQI95y5fAzXAaWr4L087vfgeFdORzySmJgpa7FyPK6RMiOZwP7BYFXXy9
         jvqq7Br0xsN4Xm5xl5VeWwh8dC+rD7tvfnZvG2ycFlW4Eu1d1COYhK+M+YaQuUpY3zdM
         AnhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k4F6NNy3a9JKGxqIkVEd+ypPrQuW+NOqc3zUbmZnBIg=;
        b=P4BkRaASQmETkRwwe2xYi9bHFj7vTHhl0FcEEXqWQMiXF8P8jScvy/M1x6F2LmE+yt
         baHC+p66M2st/4eb9HV92x0+JciYw6YfNMWKvtNGYnv8nWfCioeNZmt/QLiLGxSfZorT
         0tBfiUDzAFs4vc1ard8nizCKwJjnfMB/X42NeJKCmGZEvaSwbIo6qjMv6PG2clViVXXf
         JcHQV0KRS8ihLSQAmYOE9MbnIoqmtFiNu165Oitun4eF/PiqmcgOgE+AXErCYjCw9ee6
         Tv1eu0KQ8SJknGejjg5rgUx6KafC3XG7Y3EXzX6fNNxtctHDX0bqLNNQ20k1YStRS5Ny
         hOfQ==
X-Gm-Message-State: ACrzQf07RUXzEFupE5bcvVsLIR+KorBEK9k1Jb6tEMmy0cD9os/lzy2R
	l6vesb20bOCzPXV94iGQ2QpOt7uBiR8bI860cEsrug==
X-Google-Smtp-Source: AMsMyM4H8JIEgzYp5NIJE/wBpxIx6VRfnGH3T2bKh2gbpHmDTB+ZvTSz2DsvECaRyOPOnPzNLNJLoLdNGi+tnImFGrA=
X-Received: by 2002:a17:906:4c4b:b0:7ad:a197:b58e with SMTP id
 d11-20020a1709064c4b00b007ada197b58emr53763030ejw.203.1667909904164; Tue, 08
 Nov 2022 04:18:24 -0800 (PST)
MIME-Version: 1.0
References: <20221028153505.23741-1-y.oudjana@protonmail.com> <20221028153505.23741-2-y.oudjana@protonmail.com>
In-Reply-To: <20221028153505.23741-2-y.oudjana@protonmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 8 Nov 2022 13:18:12 +0100
Message-ID: <CACRpkdYtJze2ziz+XBzNnsi_7r0jzujW0o=2P5Brgsi5QCZBuw@mail.gmail.com>
Subject: Re: [PATCH v4 01/13] arm64: dts: mediatek: mt6779: Remove syscon
 compatible from pin controller
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, 
	Andy Teng <andy.teng@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_041826_554311_3E948A1E 
X-CRM114-Status: GOOD (  11.24  )
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

On Fri, Oct 28, 2022 at 5:35 PM Yassine Oudjana
<yassine.oudjana@gmail.com> wrote:

> From: Yassine Oudjana <y.oudjana@protonmail.com>
>
> Remove syscon compatible string from pin controller to follow
> DT bindings and pass checks. Adding the syscon compatible to
> the DT bindings documentation instead causes a different check
> error due to the syscon document specifying a maximum of 1 item
> in the reg property, while this has 9. This pin controller has
> never been, and will never be, used as a syscon, hence it is
> safe to drop this compatible.
>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij


Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E4AC61DA3
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 09:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QBK+chRqzmbdbE5cm4Uz1XII0teWxpjTk64XAOcTlok=; b=XJnIrT6vJtMICl57slxbvmGEvz
	+TX702OcVFn2gM/hVae/BrF8Lv+nVbo2rbN8Km+1trQvgXjLdsl2xaAZwHlP7sOFEegWAq7w4IPWM
	W8uKefs890R35VtDCD3jBpNc0dEKoP0cadmoFQN11dQlxg+ClMJ47KfaA7krGT1DVv+cI+NkEMCB8
	gHzth9VhKy/GzoYH2mL6GZ1ajbErUqmgF1cJzUmDk1+sZcBBasIZpGP47+prJH8Qc/wjwZLq8gHek
	OFGps2BgllrQ1OT4GYOdn287mKpctykh20uYHGxu3+pAyM4nZNnRijlGTaI9dn8Ka2uvoIY6rgocW
	D1LcSdtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVTxH-001cqg-Du; Fri, 24 Feb 2023 09:01:27 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVTxF-001cp2-96
	for linux-mediatek@lists.infradead.org; Fri, 24 Feb 2023 09:01:26 +0000
Received: by mail-vs1-xe36.google.com with SMTP id x14so20457416vso.9
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Feb 2023 01:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QBK+chRqzmbdbE5cm4Uz1XII0teWxpjTk64XAOcTlok=;
        b=BPIgh+eQeTgXYE6e94AEFS6mL8ljjkbjKU7DImx1z2sMitZndpaAKGU6spAUTsDKkn
         b3twj3SpsWdIZXLBbq2Qn2BhaLLFU/+wbOnpCaM6HGW6rXReQSLwkBpZPXq+YugTKTus
         a5t/Hxc14nAs0cx9CkmaKlfE32+ao56WmtKvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QBK+chRqzmbdbE5cm4Uz1XII0teWxpjTk64XAOcTlok=;
        b=xEaP9Hb0InwdCkamThbmngg7wcgiPJGG7UY5G6W8AEPIXcs9T1BJlZxP25Zq1UlB2e
         PP6rpVQTcQK7Ljf391jvbrvJsFxfsbjlf1/zIV1l1O1CkaDkytemZciy6vVv8ik+9eR5
         9OaUeUgHtJYsPT5wrT62ufwIRrGFnVGx+kWJVICvfd+R1C0dUG78wmnAfuXpQLYYVWaE
         rLbZS+Lw5Mbz7GTRa8UsG8PoPV2+cAYE1BcHoRTSeP+dZ6Rfymzt6ZUO+W8ExdAynfnQ
         GReNMlKd3VDJqPzcIve1IFv87fxPNtTLD5aIS8IhgmLl7s3jOxi9LBBJ1DdIkHda95PY
         5SVA==
X-Gm-Message-State: AO0yUKVuJ8MVy/yWZqQfhj9Xtp3a/7xFYIrd6Fa3IT5aRAJO70Qs7v8t
	WXL810o21wvLcmqHOJ6ovs7OqEuWZlJXKEU8Q0BYmg==
X-Google-Smtp-Source: AK7set9TC5yZJZTk7JGtwENz7sxNaZjRUPyW1G7+VmdQi5xpJ1lU/wiSfu/h18lBh/yMOuq4XEO+IihERlmymu0kUMQ=
X-Received: by 2002:a67:fbd2:0:b0:411:fff6:3cc4 with SMTP id
 o18-20020a67fbd2000000b00411fff63cc4mr2007730vsr.3.1677229283567; Fri, 24 Feb
 2023 01:01:23 -0800 (PST)
MIME-Version: 1.0
References: <20230223145426.193590-1-angelogioacchino.delregno@collabora.com> <20230223145426.193590-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223145426.193590-4-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 17:01:12 +0800
Message-ID: <CAGXv+5Ff13sH9JTcBBi5j2mUX3BKOvpM=MxV-Fwwu370FdYjyA@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] arm64: dts: mediatek: mt8195: Add display pwm nodes
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_010125_381787_A6359559 
X-CRM114-Status: UNSURE (   7.19  )
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

On Thu, Feb 23, 2023 at 10:56 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add the two hardware PWMs for display backlighting but keep them
> disabled by default, as usage is board-specific.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

and

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

for disp_pwm0


Return-Path: <SRS0=GLpI=OS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 165F3C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Sep 2021 22:01:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE88D61131
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Sep 2021 22:01:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DE88D61131
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lAxU9RpelQXZ/KAJXcwoVQ0lc0QsvPceNExj1TfXtcU=; b=OjOGQULM6CKEdR
	dF9E1jHIDwORkgd3CRwE3hodOo3OaOSsMU78oiyLzxMI86lDnLaMAHMhCC/EAMuMdEXcR2L2EG8Xq
	ex0Cjf3k5E2hOUX4y67n4P1eNZIJ3LocA0YB4Hgis3YslnYgsfZxxyfQHW26Qqbin2M8ZEDq+H8Vq
	P0933gd+0K5EUQVmNxQXOjBsADhrj5baav9aVDPaCHaojSejI7shRG2TreK+93w79Cp1SjP7pjpPF
	jHnhrAUwI7mFaAzmT3X2oJh8UA33nJqbeLtt/dyDAGvCKBH9hO4N3uUScGIhOLabGLvoR9guFV2Se
	MhQD0705WUMwdEeDbPzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVLAJ-008wAz-2R; Tue, 28 Sep 2021 22:01:31 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVLA5-008w6o-QA
 for linux-mediatek@lists.infradead.org; Tue, 28 Sep 2021 22:01:19 +0000
Received: by mail-ed1-x529.google.com with SMTP id ba1so730460edb.4
 for <linux-mediatek@lists.infradead.org>; Tue, 28 Sep 2021 15:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GSMAPXo1PThgUYlUpGQDRfKG1H/fd1r5GZq0PpbbCCc=;
 b=ylGvyhAGItjO7WiKLBnz+mwd1ZvvxUzYebNGS6bN1GHcljmVhpdpWiupis7ctKb3qe
 DmGzGuTTiq5zLEOlnvoWK4DXIAAWyO4QgN73RS1GCiQ5Hh/pGciwsLnpiGKP9YJ+1o4S
 2pZM7SE1omvOzcDPBCGAMWof/F/rZdSgqXdcEwzHluPcp3YVn3pL/W9E5GE/WVpWfVQC
 9PlSwNUNNvVN7XYZGou2qjJSm+irCBIJHoVnxnC3ldMh3+Sw2sEpKTAZCBZQb3wQ9mku
 km13FBMLzRH4r6BdvvsDt85scfCsr2C1v7n6uN7AsSZF1SNSYMTvIpzMOi6aoTisYv+y
 5I2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GSMAPXo1PThgUYlUpGQDRfKG1H/fd1r5GZq0PpbbCCc=;
 b=7JztZiGzY97I25LT0DY7V1Pwe+GrGzC5pUZPK5706w72v96YIiW5UK30Xo+9MTBYUx
 8xf04GxtQnQXCzb2Kv0Rhk3uwmr+FOMi0IjziBB2khokcIdrZJ6qOFi+7nJ2hOgvHii3
 Zim6atybHza24kBSuZ6faC628D7uwmL55pW3jBvgy8+N67ZRidPGT2e0PzuFMfpd4Az0
 sQfOWUYDGW31+NUQ5xn86kHEk4vaCPZbyR248R+eUY+FfHyvTEIoSKU3SjaCsY7Rh084
 7JgAlPlzvXdgYcC7nKWfXL+wHHoVW9DiWrCMeDfYjGmSmAK9BYjpoQnRy1iXfZyeS2hd
 VoZw==
X-Gm-Message-State: AOAM533PZcZUkbJjm2HN9qOCzBulXiokONSkXyLzYv514sJ8YY8DfsZu
 yZjeqrqABZiJalNRBMb14+FQSwsxlhar8BVKVnReUg==
X-Google-Smtp-Source: ABdhPJwwGKfBVQ/xIs+wKo0BMv2aFJRA4Eg3sQ9gWVT7Ahfqlg1nwBWFVAmFc4yWxeML7PMGdB/NRmNZNSSpwYTCd8g=
X-Received: by 2002:a50:f60a:: with SMTP id c10mr10420317edn.250.1632866475924; 
 Tue, 28 Sep 2021 15:01:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210924080632.28410-1-zhiyong.tao@mediatek.com>
In-Reply-To: <20210924080632.28410-1-zhiyong.tao@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Sep 2021 00:01:05 +0200
Message-ID: <CACRpkdauJpfJfLazF+9VbeioR8UqLjYg+Sk6yPFnfmQn6Ky9Fw@mail.gmail.com>
Subject: Re: [PATCH v14 0/5] Mediatek pinctrl patch on mt8195
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, 
 srv_heupstream <srv_heupstream@mediatek.com>, hui.liu@mediatek.com, 
 Light Hsieh <light.hsieh@mediatek.com>, Biao Huang <biao.huang@mediatek.com>, 
 Hongzhou Yang <hongzhou.yang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Seiya Wang <seiya.wang@mediatek.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_150117_860756_3C76E65F 
X-CRM114-Status: GOOD (  10.93  )
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

On Fri, Sep 24, 2021 at 10:06 AM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:

> This series includes 5 patches:
> 1.add rsel define.
> 2.change pull up/down description
> 3.fix coding style
> 4.support rsel feature for common ICs
> 5.add rsel setting on MT8195
>
> Changes in patch v14:

Finally applied this v14 patch set for v5.16!

If any further fixes are needed we can deal with them on top.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

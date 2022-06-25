Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC99C43334
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Jun 2022 23:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BQOyEVvkOJL2O83DI3UYBzVtSEaEMIpzCqozO0F2ehY=; b=J+ufZKkwWRblF61L0HMso1+UUN
	OIl2V3TSXgkjrTC6faw7Irz7C9AX6tH8xc1/rK6au66YIqQeX4wggEsvEnZ9Y6+6T0aheEza5OtiZ
	3JeuVw6xXohKfB+2sCbXScHK554ha/fEkOX6zdMlP/27d6c6LSL1iJhlEzsNozOQwu3aedJ8QPepe
	GJhvUPLCrgP4nzu6mOxX9369R9UA0ffBpbhrQK4QaGM6xcW5cRfRKyD32LN9aTR3///4NQ4gWt1jh
	KHrfoC+8fIJFeAzWIa10XBvs25OSiRy+C+tlmnJZWeyS7MjTqM0OEXy+5RD89UURBWEFahAruk7bI
	1dDE0WSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5FAg-008PQo-EM; Sat, 25 Jun 2022 23:26:34 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5FAU-008PMM-Op
	for linux-mediatek@lists.infradead.org; Sat, 25 Jun 2022 23:26:24 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-317710edb9dso55642317b3.0
        for <linux-mediatek@lists.infradead.org>; Sat, 25 Jun 2022 16:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BQOyEVvkOJL2O83DI3UYBzVtSEaEMIpzCqozO0F2ehY=;
        b=LUGhV1hM4lSiMfJut49bsCyWlxE9bBgIv0BYhD/c68f0dyP4chEex43VO0HjGECLn8
         vC6LJWh5KX0Y+5JPYFbP1Y8wjcBrdLnF285kh/OTROeylflSMu1vDbGZHwtM6oRS29LV
         bShm3gxKztrn65SmCKmmyUhdqnrYIqiOBIYFlNv5ocKBrvNS2GoAn2bj1xgfGwbwsKdr
         569lMbYnZt+idn4Ucx/SzIhvH7PBzewwg/uaMWU4nYnZ+UQ5aSxditS1jcX9njz3sne2
         p1NVFgErVGxYzl+YuSSOk0tv/SdgWJXOj/wYVGPkhDQ9nCbCYwj/mZbEDPDO5GsBdgtG
         D8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BQOyEVvkOJL2O83DI3UYBzVtSEaEMIpzCqozO0F2ehY=;
        b=KjjhRbO2J94n8SSBT7PapjVLwoyPfD5dLOIJhX9ZOMxI7zV7zyRpE3RZgBbeDVbZfY
         CmgMoQpSOwFzgtUwjUIJMZl35OmaBV7DHSuyne4juOySjho9MbER4OhiM5Km+ZQpPlxQ
         3VxqcWddYX6P52WONO4euBFZXTSADJdKQ9vLGPiuD8EaILhpZw3hFHHoX83cV5XypqGw
         IzwhWKQvwnwa52jiiYLURecSz/CrwSAvz5BgsMM4Na/ZM4yDB40SHtr308sDw8jAE4H0
         ybdRGOr555vgA7Vt5uOwTuTLf1M8CbC6C1O/HDaeoAJDdRJvuVcM0EVZf+HbrCIxGcHq
         z3Jw==
X-Gm-Message-State: AJIora9m39RPkTKrElz+UqN31yfRO7rXMg5sB/lr3lj8teLq3xbVUjvr
	Wq9/sv48ghBPDUUCJCAtGMe2l8WnkbcWhPV+ExPEKQ==
X-Google-Smtp-Source: AGRyM1u38IgiG0U5f2CoPUsFms818bBD2ITxCAUhVuGu7Ttqjznp9wPrDXECN0JNJA3aCRZ/2Q/4pDq9x1jfenFR7jc=
X-Received: by 2002:a81:6587:0:b0:318:38c2:2fb1 with SMTP id
 z129-20020a816587000000b0031838c22fb1mr6855740ywb.118.1656199581552; Sat, 25
 Jun 2022 16:26:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220624133700.15487-1-guodong.liu@mediatek.com> <20220624133700.15487-2-guodong.liu@mediatek.com>
In-Reply-To: <20220624133700.15487-2-guodong.liu@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 26 Jun 2022 01:26:10 +0200
Message-ID: <CACRpkdaErxz-D6XQbTsAvPWAc+YSxGzzD+UfyP+Wv8YDAx662Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] pinctrl: mediatek: add generic driving setup
 property on mt8192
To: Guodong Liu <guodong.liu@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Sean Wang <sean.wang@kernel.org>, Sean Wang <sean.wang@mediatek.com>, 
	Zhiyong Tao <zhiyong.tao@mediatek.com>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220625_162622_904913_77DC1EAD 
X-CRM114-Status: GOOD (  10.67  )
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

On Fri, Jun 24, 2022 at 3:37 PM Guodong Liu <guodong.liu@mediatek.com> wrote:

> 1. The dt-binding expects that drive-strength arguments be passed
> in mA, but the driver was expecting raw values. And that this
> commit changes the driver so that it is aligned with the binding.
> 2. This commit provides generic driving setup, which support
> 2/4/6/8/10/12/14/16mA driving, original driver just set raw data
> setup setting when use drive-strength property.
>
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>

All patches 1-5 applied, thanks!

Yours,
Linus Walleij


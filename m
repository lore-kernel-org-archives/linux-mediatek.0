Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA92C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Feb 2022 00:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=APSR55RlErBrEMTDho5zQz1Ydno1F2tc4VHtgJSbfx0=; b=m2N3HNg/XuYceT
	KTGxGVCXehwM1ZD6Sb44oY1+jxj7o5m89MkweC8AilxWX0rX1oau1uKAVrrtZqR+8NJDjY+2LQ1tZ
	Yghpd1NdduEJ0wThWQ7RvMNce+RI/xV41rw3nclZi6lIiPHq9ZJ8JTwZqsBtKgIJnxsKd/PWgPeez
	KVgqekHI4dnQlWfnYr1Pb+dHY8tUQhAtDd9gdkkfrLPDkpA6ZtOvx4KJlbrqJ8MZfUYYbQCZHkOWS
	oHjlLAI1CwVcy4UcMBbAoU5TAP8t0bs3LdzUszoWLaNtiKeDIZ8hmS9l0F0wpWuZd46wT2sUFe6z3
	JpcwO3kcrVAogZC2PN0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIJWx-005HYG-OK; Fri, 11 Feb 2022 00:11:19 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIJWl-005HTt-0y
 for linux-mediatek@lists.infradead.org; Fri, 11 Feb 2022 00:11:09 +0000
Received: by mail-yb1-xb36.google.com with SMTP id p19so20251271ybc.6
 for <linux-mediatek@lists.infradead.org>; Thu, 10 Feb 2022 16:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SCMpPtMCiOJ/G+Eq+FzjqaIZUVvMGCRl0NKCrIWOD3c=;
 b=XBA4n8JWpO28GAY8KpOE5Fii8tHnNL0Lrh0fWhsI07c/cJA8Nz2/XqJrI8jSV2cGSw
 1P91jvRZCfGSCKLJFuS4PTIM4Jrs9opnFDu/wrZbAPpeYBJIuKAmK0RMYD5fuMInBFOf
 iqwoArv+BP9V2GE9k3aY5bFzaaKeNSPnZsA6cfEROnmQ+rJQkw2sW30UUjE4EuCq4ikh
 icWobOZJ4w6Rp/ozGYoTyCQTvUjdUEJIel+Nb5PzXVswvIAZiQ/1IjWYXRYZO/SM993j
 ArKAc51/+S5BDuPNadLYzJ1vU5rEqAvCBsfeSmPlSAJNUnwlrUNC4CLcwMutRgaVaLqY
 TrEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SCMpPtMCiOJ/G+Eq+FzjqaIZUVvMGCRl0NKCrIWOD3c=;
 b=Z7ASM4ouh122qe+YGXQ/EtyB3OZpIGrqxmkjJcDstz5dmw8taF72SA8h/EyEdjwdNG
 u1KzFF5V7Aac3CXXLfFqR9xWoRocAPr18ebqSTqKUygKstb/E1GWyQE62bTkUjcu8ZYs
 LD2ne9Xw5A3H4gwUgv/37qbP8bvK7T6PhJf02vaVjLVoJ5+JHvHCB4G3zqAGxHKW2mAv
 kxq7vuPcly3ZjKNKJuI9S0ihuQbBavkgAQjhn0YJB3tc9u4yDgED/rzKeFmbqF+InrZQ
 f/qSMvQSVEhsi4AneT5G8SloiL+HRcn9vqTk6D8fG0QCQun3l0kzm2RnnrP6Tgtx8A5R
 BFqQ==
X-Gm-Message-State: AOAM531emEZHkdJeeq/ZWnx5WLy2TQmR/FAdoszf/ViUTA1iCRAs3IdA
 ZdNAhaxb7plcaYEJOJIWREQYu1a4oAHtw4RR96i0Pw==
X-Google-Smtp-Source: ABdhPJz2D8S8vUC1h5FU6mERCeQjOZLOQvAmkY2lC5MMdhv3su82ZuGu4xueTzqReYLkVp6s5xRXwZIwEmBX5LooWjY=
X-Received: by 2002:a25:103:: with SMTP id 3mr9342711ybb.110.1644538265780;
 Thu, 10 Feb 2022 16:11:05 -0800 (PST)
MIME-Version: 1.0
References: <20220210062122.23974-1-guodong.liu@mediatek.com>
 <20220210062122.23974-2-guodong.liu@mediatek.com>
In-Reply-To: <20220210062122.23974-2-guodong.liu@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Feb 2022 01:10:54 +0100
Message-ID: <CACRpkdbNef4MH2UFOC6wvCFB4jUV6Qmar6H2Dqq9GYfmGtfkPA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: mt8186: add pinctrl file and
 binding document
To: Guodong Liu <guodong.liu@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, Sean Wang <sean.wang@mediatek.com>, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_161107_074774_110ABE29 
X-CRM114-Status: UNSURE (   8.41  )
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

On Thu, Feb 10, 2022 at 7:21 AM Guodong Liu <guodong.liu@mediatek.com> wrote:
>
> 1. This patch adds pinctrl file for mt8186.
> 2. This patch adds mt8186 compatible node in binding document.
>
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>

I see complaints from Rob's robot so please address these
or explain why they appear.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

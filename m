Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93035C28D13
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 12:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eTyJ5ysyBJphDxI681uzkkLxuflLaDMmY8laThwgM3s=; b=VU6paGH3aNwEEOaB7vYn+fTJTP
	34jw6sd4QMCJX5e8hlftxHv4qIvvfBXdv7FRdrCmz6mukP2V+cInMS8hyMjFewYXeaohT4Y3xZlMQ
	W+EoppyxMnLy2uvEeATKgWJXjsxc+34kISkSf9/dNulJclSxHUH/pipDotv7Kz+uBWROY4QYXx68F
	sMRSowHeGR6/8SwLJgQbMBdn8JbrQq0lsFJ4p/bIVPw+oPXg2jwU1g6ruo3TY4hJ3gu5kaLkGB0GE
	vG8ayKYmDxOxZTt+wnm2Rc4c9l7waM/NKySrL3AXSIVrXeEVis9b05r6xOziFeVVOB9jHqNHXiR+B
	H1vMT2ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRCNk-00E508-Fw; Thu, 25 Aug 2022 12:54:48 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRCNh-00E4tO-Bc
	for linux-mediatek@lists.infradead.org; Thu, 25 Aug 2022 12:54:46 +0000
Received: by mail-ed1-x530.google.com with SMTP id w10so13833655edc.3
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Aug 2022 05:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=eTyJ5ysyBJphDxI681uzkkLxuflLaDMmY8laThwgM3s=;
        b=ZZjLAnzUFfkR+G4v+IgfNQyxujKrroHVtRt6sLDmiBVTQl1pPP39LVWYfE+C14b7jy
         drFFGtc6MLy9HT+qhNoOGpDmgp9Nboo9hsk8n/VBZknHf0aWOQQyO3nzK40UoyCG0HzW
         fXNWZFVaOMNNvtkDmAdm9sA4YcRvMnM9SQnlAFfOo7DkBCBOSHh9X5DDisnwDiJP5v1w
         3G2pmpLNsi239BmZHC5GmDihLNEHiBKMXvDnQlNHcRwVVh7BQdClm3jrRWHJhv5h6f0e
         2nDWc2tbxe/8Dv5Tl/zjy2f33JnCJOxHzk2QC53ZDPcp/U36ngjXCxslQJEmi8JYCPPI
         ow9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=eTyJ5ysyBJphDxI681uzkkLxuflLaDMmY8laThwgM3s=;
        b=MqndUJ2pr/SZwk/4k6LZ2XHCr8FdE8SAc8Grcm0/SsJqEyuwE9gZxBnzIOAtOR6UBG
         zyOIO8+i5bdesKmACemGfchsGIu35Mec/QpGotm+5EYmChzeaoEPcMsZ3t4DEx8uo1he
         67SJ0dpevxI9OOQ9pK6Kzv1iOAbSzNIe6aRvy6QzGOuFTFMERbr7yccHCLrnWGUGR9pg
         9NH2An8tq8aPbXeryd3WTJfOxo+9fbKc0zTRqUsRuYFxiw80F7FoK/UkHNrQ4CkSPOjm
         3uWdNJaERTcanM1klpl8qTvgqpYwuIoQSw9C93qQAx2TnI1BmBYMCvmEKRHwPHaf2AAW
         RQBA==
X-Gm-Message-State: ACgBeo1fs9mtiwLsuZpkoMUy9GPJtvY0YASwWtCxi+UCxHv4nVp0ICe5
	8bU6CvRrbG25SR4mfdA/4ZrRBCyRgs6K9VH6SXC0ow==
X-Google-Smtp-Source: AA6agR5gBoA+DyRoVe1dyTC0LYezrrsqDvXPMxIYYWdtzgEXrzgLMkOxOeINwsG5S/OWaW8sXg9+wvi2winSXMVBq2c=
X-Received: by 2002:a05:6402:1f8c:b0:43e:8fab:76c with SMTP id
 c12-20020a0564021f8c00b0043e8fab076cmr3117148edc.126.1661432083303; Thu, 25
 Aug 2022 05:54:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220818075012.20880-1-hui.liu@mediatek.com>
In-Reply-To: <20220818075012.20880-1-hui.liu@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 25 Aug 2022 14:54:32 +0200
Message-ID: <CACRpkdbGjbd9Q9Chcnnc=3nD3XALsCdk7dz9mT3BfJdZs62xjA@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] MediaTek pinctrl patch on mt8188
To: Hui Liu <hui.liu@mediatek.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	wenst@google.com, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	jianguo.zhang@mediatek.com, zhiyong.tao@mediatek.com, sean.wang@mediatek.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_055445_413305_CE16E642 
X-CRM114-Status: UNSURE (   7.87  )
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

On Thu, Aug 18, 2022 at 9:50 AM Hui Liu <hui.liu@mediatek.com> wrote:

> Changes in patch v6:
> 1.Update driver file's coding style.

No further comments on this version so patch applied. If Sean
has further comments they can be addressed in-tree.

Nicolas: thanks for helping out with review!

Yours,
Linus Walleij


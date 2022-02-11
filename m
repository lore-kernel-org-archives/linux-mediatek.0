Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83E9C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Feb 2022 00:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jRcKLdrpb4jI5PqyL4wKhKsVFen2ukQSsmZVsI9hucE=; b=rXRIStA5PvJrbI
	HuG3zwiDEEl//oN8sIjDR2XBWXRosZtFnFUJ/U4Ei5PNn+q38VXR+Lg1fa4t/5QjHN4bJXCo0s10C
	Swkg1YCdX5oWlGg6DYkjj+RUeP/kP/Ps+7Wno3Rg1XncBnsJakY/qot06KgYHqyVL1j/42emqAAEC
	cIZzTo65JGZjhJ/szb1YtmEs++kTsQBcVgKx8+GVKkZ9cYfjNlsD6SraBuxkgnWW+sX/mBPxxFIhp
	2+kDZOmxo376MNffx3/VLB6N93O7o4KGNOR+1DfDi6LBP9AKwA9oYQ//adWIq3gGMbFq4L2z2+O9y
	oxmcvuHOh90ie3zxk8LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIK4p-005MRR-Cp; Fri, 11 Feb 2022 00:46:19 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIK4l-005MPb-9H
 for linux-mediatek@lists.infradead.org; Fri, 11 Feb 2022 00:46:17 +0000
Received: by mail-yb1-xb29.google.com with SMTP id y129so20418186ybe.7
 for <linux-mediatek@lists.infradead.org>; Thu, 10 Feb 2022 16:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Aqg2zYlKFhDU5R59omnns1h0zMhseRBVTVyLe6xPNAw=;
 b=X0L8pqDQdxoPIp+SQ9ATds+ARsJ5XaRoakuQEEb9AFJOQkztFhYCnS4eoc+7WtnGKs
 IsI/x2HthuAgMOz5p1lV5S0zHy571/uytyaHe9Es0b2tW60l4snqT95ZuJ+UA8SkdRfh
 aWdY5u7olCieQnKYht1p5QG5ZQf0gfpf2YXRz6Hn26bbnAQ8XSniclLvAF8ru4GJg8ie
 jY8OPuKSa+f2NFkdpfL7Qp+Bt2Vh53xHnARth/o1ESmN8uulrsmvf30hIXvcbA/e1lL2
 R5hGHRrGYCrVsTi32PzHqttKWX6Jc1xa1FGkhTcFZxvZKx9tKO/rSiTm9a6waUuh7myC
 RGIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Aqg2zYlKFhDU5R59omnns1h0zMhseRBVTVyLe6xPNAw=;
 b=tyOEMWv7/EZxhfQxu/U+utZ+8EermwBhRXoJgX9AWMwfd9aO+TKfybtYYJEkdaAJpt
 ccH5710sMwF5NrDLva3detU6a+eQ3MJG0Uu143dWuXSnrOSbkmsCYAaqaCWfBoccvl+G
 68IkbexxmH12+Fj2iEfmpKAF5F6ZboGtkyKq6WdhMMSBplECa7fFBE+rMFNrMBGOyPI4
 zzIagcX/9SbYXZPOZHjMmpJi4b8WLgOtbrYfKUMmkca9hQ8mUXdHGzN/lredStctbGxV
 ZfqKzfV3xBFRRC/RWye1h5rgccb87Owj99+2RIJVDC0T3RPSYOOn1fJU6Y44WrDa3SvW
 f92g==
X-Gm-Message-State: AOAM5339z6njB6nKi0twhhqDDuPfKU3TxQqx9vIhPAP6fMnDo6CtzdGN
 kTryri1C0v7XR65FBSw1apHSbh2Q8qBFfhcDz9X5xQ==
X-Google-Smtp-Source: ABdhPJxPdUAdZzu441vtdOPhtVOnx5TxV2FVC7NtVsI9RRP7ptyI1elK0lctrq3IqH8VqzMTb+ldzwpyBRi01HARJ18=
X-Received: by 2002:a81:4cc3:: with SMTP id
 z186mr10573147ywa.140.1644540373922; 
 Thu, 10 Feb 2022 16:46:13 -0800 (PST)
MIME-Version: 1.0
References: <20220202153528.707185-1-wenst@chromium.org>
In-Reply-To: <20220202153528.707185-1-wenst@chromium.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Feb 2022 01:46:03 +0100
Message-ID: <CACRpkdaqKAU7_HWoCqjnbmCEc77FKJD9gUFR+ARbmQmR9zRZSg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: mt8195: fix bias-pull-{up,
 down} checks
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Guodong Liu <guodong.liu@mediatek.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_164615_349729_B98E82A6 
X-CRM114-Status: UNSURE (   9.72  )
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

On Wed, Feb 2, 2022 at 4:35 PM Chen-Yu Tsai <wenst@chromium.org> wrote:

> When the constraints and description for bias-pull-{up,down} were added,
> the constraints were not indented correctly, resulting in them being
> parsed as part of the description. This effectively nullified their
> purpose.
>
> Move the constraints out of the description block, make each description
> part of the same associative array as the enum its describing, and
> reindent them correctly so they take effect.
>
> Also add "type: boolean" to the list of valid values. This corresponds
> to having bias-pull-{up,down} without any arguments.
>
> Fixes: 91e7edceda96 ("dt-bindings: pinctrl: mt8195: change pull up/down description")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Patch applied!

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

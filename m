Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D304C05027
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jan 2023 13:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3nA2n2CLTUWJ4vD9ZGbE+UeuAneXwldHq4cRkGDvQzA=; b=SE9H1SysxdLa+HmwtBT+eKPQ7d
	5qLKtf8MdOlLYcvwP93sGanwjPkw6iyQH8cBZUsm+wUv6NosyPNyphv4gWS91tL7TpZYHOj8ohtz2
	3J84WWY1knMIJWRoe/W3JHvl24/hOJzltD8A9I2wWaPN6HGH9c0g0QIEpCmDDfuXkwR9iLREHYzf2
	soSnoBGsAepjg3rTHoST/qQVimpPj5wNnYsyDgdmLEnd62+5mPgAyMqMANRIQWj0x1F8kpSRXi+0J
	SVUbNUetLl+3CJ2zMHAK03qoU6QnYKJKlIM/AZyZV6h6xVNVlsAnj8MikYdyg2oDKUzZ4TOcv0sYz
	MI1sW+vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL2UO-00AyeR-OD; Thu, 26 Jan 2023 13:40:28 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL2UE-00AyZY-CI
	for linux-mediatek@lists.infradead.org; Thu, 26 Jan 2023 13:40:19 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id b1so1939074ybn.11
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Jan 2023 05:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3nA2n2CLTUWJ4vD9ZGbE+UeuAneXwldHq4cRkGDvQzA=;
        b=h0d4/uB92ODoYzrZYmaVvUG1jvcTVC84b3cuC4xSkz94COWEqsOOr2IBowpVl0CpDk
         6KzGggs+wRnLPePErIKjd+MObcWfYQbK5L7NhK8ilrbc9pL/EFAA4EQCKIk77bKIOEHh
         P1q6wpH5pEuZZlVhMn9HMwfam7xVBuXARvfmkydFab+Hop7ms/oR01SaVcGEi8rWPCM4
         mmE/TS4q48Lh9ZHr9oiqRtEoRe8n+NKmk1P3xds7mwVwfXG0lJnz2UDQOOrfNp1h23V2
         DZQdPjse3MNVv2wq4ZgH5q97Fv1fknuS1qlKoQnW2UF0CzhzQvXorkqZfFt4FUkQCQ6r
         +0jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3nA2n2CLTUWJ4vD9ZGbE+UeuAneXwldHq4cRkGDvQzA=;
        b=RH/LTrNdQCk1jCdyMN5+YMgulOKGXsiBxoE6qNK72xqhdAqyLlX/L/6wMcwkEUXWtk
         Gebh0BWESJKGLNFMq/vv7XGwZ6jsv4uotNZoh1oGEyhkaDknmO1HWG4KeTDuDGaQgtwM
         y+76FPZDliXS9lkn/V76p9/k2rmbvIFwP8crMEJOrv//tKHMf+8MRlg765Jm4hWXeZQh
         e2+VxviyjsTLPFQAWlPGTQ4XMqZJCYeFfqY4O/145JYRal1gRvOU0r54DQcHLRz2abu7
         1uUgelCj+0geVWgzMZfViNPMWln3RRT83+EU/+MmKFa3qwpYIkNdskRsnA/rLiS3drEE
         AR2A==
X-Gm-Message-State: AO0yUKU5MNP/xnNwTatJnyOrm3Xax2t0CPtMCLsDiq9DXsVj0mEyoZHU
	d22jThfsi05MBX9Yg23D0D0Aw3NFpdsvDw57LrWySw==
X-Google-Smtp-Source: AK7set9S+ZAAT2EmYO2ZCACuwdKqYiWYHVPGt2d1pERtloAf8IObExq0V8YgsRI5XkikpiXSbqCjcrnLxbhCxfYYD2Y=
X-Received: by 2002:a25:d884:0:b0:80b:66c5:9fc5 with SMTP id
 p126-20020a25d884000000b0080b66c59fc5mr1253612ybg.210.1674740415100; Thu, 26
 Jan 2023 05:40:15 -0800 (PST)
MIME-Version: 1.0
References: <20230118062036.26258-1-Guodong.Liu@mediatek.com>
In-Reply-To: <20230118062036.26258-1-Guodong.Liu@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 26 Jan 2023 14:40:04 +0100
Message-ID: <CACRpkdZ626h9zzj8zjtqzVVp9=icRCzUts7+_SuUiuBatYBzcw@mail.gmail.com>
Subject: Re: [PATCH 0/2] MediaTek pinctrl cleanups and improvements
To: Guodong Liu <Guodong.Liu@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Light Hsieh <light.hsieh@mediatek.com>, Rob Herring <robh@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Zhiyong Tao <zhiyong.tao@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_054018_445941_E72ADCE7 
X-CRM114-Status: UNSURE (   7.18  )
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

On Wed, Jan 18, 2023 at 7:20 AM Guodong Liu <Guodong.Liu@mediatek.com> wrote:

> Guodong Liu (2):
>   pinctrl: mediatek: Initialize variable pullen and pullup to zero
>   pinctrl: mediatek: Initialize variable *buf to zero

Patches applied!

Yours,
Linus Walleij


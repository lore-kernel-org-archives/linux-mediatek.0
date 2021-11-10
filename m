Return-Path: <SRS0=x/8t=P5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB3BCC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 10:30:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 733B56115A
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 10:30:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 733B56115A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dt8eJzNtATYhyfPNn+3+Ji8pUrjaApuC2WsPMxjq1Pw=; b=VW9f+BLTQ7COpC
	whBV9OiiUD6c6E+oueQ12pRpqVLPSPF0btT5PIoJRvT84GprYZyy6tUCCtHaAqiz9W1rix79ZUw11
	m70LjRqKQzrwumFTC2HzKtQqb3LezHAUnFwq/ZhUbnlq3kKn92EyV5aaINGvZD8nJMRjlg1139gno
	zml1Ie5sksV4Eh0Hk2c79XoGWRCu8PNa77yMl0fXx7JaesuFJI/tjqp0phUSFF7CLiA/7kDOYiIUf
	c9ImudKcSTrQpF/FcSw72sTrqjpUuVg4gUNaI23Be+MTjDBC1VGTUyoBaY+wKXVqWv0Stq85CXvYA
	B3rjX28vkCrv9RNvPnpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkks0-00574h-6i; Wed, 10 Nov 2021 10:30:20 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkkrp-0056zH-C2
 for linux-mediatek@lists.infradead.org; Wed, 10 Nov 2021 10:30:11 +0000
Received: by mail-pf1-x42d.google.com with SMTP id o4so2233166pfp.13
 for <linux-mediatek@lists.infradead.org>; Wed, 10 Nov 2021 02:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rtnO7Bm6moxapJOpDmqW3UadGBsmBZSmf1oZQVTs5BY=;
 b=P3Zjx0Hyq+32RzMf/e+0TH7R6bZPDc1VQVGRm6mJklPXjJ3E2y7zll3a/h5hwzInd2
 d63C9cHfkm618jGYGz2nEbxTURHcRncu7AQy7kda908zmtTJmYdpod2M+GxzBQkOgAaW
 3pyJW9FPadAoWPwK/fx0Dc1zYve3/+A99znjsQy0RNF26CBDA/mW1FQOyXjer+8hdQVg
 KHPaswheEtKBH09v60AmcUAH3/2TMbbowGDQYdmswgZ4HnwD6jwN7jpBmhO36SZb2VhP
 uAzn+IF5SvZbDi5vO8caloxssl1Sqt0FspfoohNqFJyd62Cg6vs5JINLSu6arcJ/cviJ
 L0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rtnO7Bm6moxapJOpDmqW3UadGBsmBZSmf1oZQVTs5BY=;
 b=Cy2xwiId9DQ1iTQK+3bwhsiF42B9La081uqmKVd1LpqLoipPSxz4LRjjltnUawqwen
 PXdWgqUQQR2ShuSVJpjYoUI8zS5D/hX8VXT42BxWcyDtZtFCEC86VO9iRBzgQMONBQFO
 f2RmyfPqrIW/M1IU488qVfFibGmZLzpS+caWaaLUOFg5yPRp5HYeXYr8Vh7e3MGqwe4N
 rkDVcurfiHwo/CjSwxyOq27560uaOOLpzD43mrX2qCeOZ9DcQa3FCEaaBQCPqgm2jwRY
 +qlJXv7Kf8cEJdLQW38tG12o1RHgrUMw9cbG9EBNXM8Vdj2OuMu2DvK2TiB6HkHuomYS
 80mg==
X-Gm-Message-State: AOAM531fXq96/O88PL823rhue6/GpABaBntEI9tqkK6bqAvSyn5SjO/h
 I4lLXEF3Svvkt3EQmfLK1DzMNYs1sfVb+631B+6SpA==
X-Google-Smtp-Source: ABdhPJybXxLo5OYv4x3FX2EtYjPECd+qMB38G5dsYqeB2wevijTEozvPGP7GKTPKRoWDFUr1d6wpqdx/mT+1NE8lE1U=
X-Received: by 2002:a63:9518:: with SMTP id p24mr11113932pgd.80.1636540205425; 
 Wed, 10 Nov 2021 02:30:05 -0800 (PST)
MIME-Version: 1.0
References: <20211109125030.26299-1-yunfei.dong@mediatek.com>
 <20211109125030.26299-4-yunfei.dong@mediatek.com>
In-Reply-To: <20211109125030.26299-4-yunfei.dong@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Wed, 10 Nov 2021 18:29:54 +0800
Message-ID: <CA+Px+wXw96jDAbtuJ-Mt5MnY9D4xPX-6wGZq5U_hwhrg+5UNPA@mail.gmail.com>
Subject: Re: [PATCH v9, 03/19] media: mtk-vcodec: Refactor vcodec pm interface
To: Yunfei Dong <Yunfei.Dong@mediatek.com>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Tzung-Bi Shih <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Fritz Koenig <frkoenig@chromium.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_023009_426221_FD764A96 
X-CRM114-Status: UNSURE (   6.50  )
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

On Tue, Nov 09, 2021 at 08:50:14PM +0800, Yunfei Dong wrote:
> Reviewed-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

s/B/b/, the suggested tag name is "Reviewed-by"[1].

[1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

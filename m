Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DAF5D2503F
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jan 2026 07:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HBaom7v74+gHXWd7YrxJuL0o3qS56NROqcnQWMlUGCM=; b=s0z3+SiGMWF8YOFY6we/QwxAWh
	bfaFkxaZMdV3FZYg8aOdpRGdQ1GtTYLABj2R1ak+xANKhXHvOwt+XqlmLYG8DD95DKiuxbP1pfMFa
	/Sx33p2yDYg2tD97q8HQijrFW0KgtSQQw1+jcMCFZw/gCC/S377uRLTcps9r4WUnBVa6DAgOYuQ5w
	dr+5Bq7thTkY1OSN80sK6aubqufTF1ucofO7TLc38SQlJTMjg87kdqg5U/RzHSy8zhu9UwRyC/NxP
	9cK2z3aw1MBq7BOqz7XKnlMGAdQvOg0zSY1ZZ0HWHcCgNWuhvbHuiKGTVSFLVINgTdx4Fk9f0JUx+
	eyV11AlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCEh-00000004s1E-1A7f;
	Mon, 12 Jan 2026 07:21:11 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCEe-00000004s0W-41pp
	for linux-mediatek@lists.infradead.org;
	Mon, 12 Jan 2026 07:21:10 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-59a10df8027so7133452e87.0
        for <linux-mediatek@lists.infradead.org>; Sun, 11 Jan 2026 23:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768202467; x=1768807267; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBaom7v74+gHXWd7YrxJuL0o3qS56NROqcnQWMlUGCM=;
        b=I/9EU5Nzi5CpJsJ9KqNZwTAzuFnwDU3941NqdzQLREHc3pqxONft3AhxsyFnSC+8f4
         C8mzeUB+mEmcddAtRzAOPYFoY/0Iw6pxtyUU22WLHSvz5N4R9i2IBjge/By0FQAqIwzK
         Gu81zFffQhF/X4xbboOfPajHWTq7E+GDrWzxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768202467; x=1768807267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HBaom7v74+gHXWd7YrxJuL0o3qS56NROqcnQWMlUGCM=;
        b=Yq1jLtAQTW4TepAd7bPrwENPcaRODMkdJLiVMXLcOEcAuR6K215umfkzYPaygm9X03
         AhxYNw8r+017vydUH8JZW3oZqKvzxs3XVO2bzs6i1+BATkUI5OKPob8/jGtBGSqc9dHY
         EffjX30/+LAOJCb8iUpEltOLM6onLt+JmZeAHnl474+R0P0g2RcxhWE4ibud/5Zftj7R
         kIJ1QaMlNlzUONvAu1jwGm3vyKkv8/mB2BPEUyxLb2WEIRT0k0zCendZbneowegpS5TN
         7N8KgJzsiIbx8DR0T1gnywy5GnlFPOibYrtI5cYGG9C9mjzqfdRSZeficnDihm3Ba7Az
         V+yg==
X-Gm-Message-State: AOJu0Ywsv8UQsAj0+wOtesfP5wGl5Hhi13Q+VlGwjvjl8ZbMntE6XFfP
	aNdbSNSUblZ2O2/C+Dw3XgsFQnQeGIFukfsHKORA9wIQ2yV9Wg5wSCMC5QsriBPgfCSXXwB6UJ2
	aB/1b0hw2MOEJyStU6sCWDDv63wkVWsK//HVNGQMdD3ZcjGuKfsnANw==
X-Gm-Gg: AY/fxX5Xy9M7k953eHHpCLhxQKHTC5fOSq57wphqslmyti3rjPIzPxAOMH0PT3rjUaX
	gvXjUWculTtwj4FMzVch/9Cw94z5VhsALgz1hjfg0t58M/CUtsiac0zP5jVVs6WPUbaKmWqg2Zn
	atdQt35CWAwxYVdqnLKv7mruOqBhCKXmSQQBVncRvD46QFJ8hWtPS7c55AbmU/RXjaozSXwd7aq
	re2lmrQpXjagu0+XpYSXk+ziuR71yfrndgHNvKPGP6NpjHRpXtaBgjMBMayrlbD5SLuAJ81dTtq
	uK+RxpYMCOh084b1nuUpfEtX
X-Google-Smtp-Source: AGHT+IFHBYZnjE2UIMYyCZr1lmpvutyhqNd7MN48WeOyKPWqQYxDJZuAlIZdNeAX4+9N0k+bGMB+CsiFpY5ooLKHPQo=
X-Received: by 2002:a05:6512:3086:b0:594:2f1a:6ff0 with SMTP id
 2adb3069b0e04-59b6ef1892amr5277756e87.9.1768202467013; Sun, 11 Jan 2026
 23:21:07 -0800 (PST)
MIME-Version: 1.0
References: <20260109114747.37189-1-angelogioacchino.delregno@collabora.com> <20260109114747.37189-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260109114747.37189-4-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 12 Jan 2026 15:20:56 +0800
X-Gm-Features: AZwV_Qh9NvJukEMC2ZGE9lVW3yo6iRXBbDejhBCVijUHZb39tsOJnyn9JZhLLrA
Message-ID: <CAGXv+5Ea9bWvuQJuYBgvwrn0nRT-utdLLLo5e=hOzFY21kJYxg@mail.gmail.com>
Subject: Re: [PATCH 03/11] arm64: dts: mediatek: mt8183-evb: Fix dtbs_check warnings
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, sjoerd@collabora.com, 
	hsinyi@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_232109_313527_39D4A4D8 
X-CRM114-Status: UNSURE (   7.69  )
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

On Fri, Jan 9, 2026 at 7:48=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Change the Murata NCM03WF104 node name from "thermal-sensor" to
> "thermistor" (as that's what it is, after all), and change all
> of the pinmux main nodes to have a "-pins" suffix to satisfy
> devicetree bindings checks.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>


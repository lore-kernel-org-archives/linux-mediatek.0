Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D24C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 May 2022 06:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9xGDdzYyq8QLHkaBw5F48S7LcnhL0EcVYa6AmwlZZQ4=; b=pNK3gt9YEwACQg
	6+cA1PXZRjpkTrYxoZWzSFh/uwOfezM7zYGnJCg7XgpDGpkhjJq7lNwq7YlBhIHHvAXqzAstfJzI6
	pUFGGYkHYaADpEd6kh2wjlvKyo3XFGUs8pyqAhRCpMgBwfr5uO+XYVJyMxFFN77W6EG6bvZjAeoNw
	D87GD/lH5yavn1HkpZh5NLnomV9VD5wY9k0KvB5/cCL8qG9C9e/iIa+lKUjcGvFdA9ifUs1GCCdyZ
	CKV+K+dchmN5iOkNh39lo0isq+ov5tjpwLOR+o5TnxVT8TSW8KI+KQtqeDBSyATrp0NEIHelinLgx
	CmiBYnMEHCO3qFISwHCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntO1l-006wif-0G; Tue, 24 May 2022 06:28:21 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntO1a-006wfc-Ic
 for linux-mediatek@lists.infradead.org; Tue, 24 May 2022 06:28:11 +0000
Received: by mail-ed1-x52d.google.com with SMTP id s3so21705920edr.9
 for <linux-mediatek@lists.infradead.org>; Mon, 23 May 2022 23:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N3jdbvgtlnw8zIaSv0DQqGc3caOnAXLJMAe+8f0UCS0=;
 b=O5lAcyn/cym/3OrYhOLamVEgFGcZ2RXZc2FY/HnELt4FLoY5cU6Qzd1dh/CbLJMwNP
 qKUgSM+Muoz1BLCPqw4YgLhVdAV7cvJn8lsQADC+YX0odK5WcxdVUpSqQIpNLI+vWSVR
 bGYPWSffJOcjIzQxvLSsgg4r+doFWCFL4Ke0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N3jdbvgtlnw8zIaSv0DQqGc3caOnAXLJMAe+8f0UCS0=;
 b=G51r2S1H+ybMuHcO1yYTZvjt5gu9eZPDrD8juFYFKLG4MBlvSBZ9BeHlqCEtEN33y6
 cciwjUoFQlwkLD55RCbShtCUuwgRRy3UjgiDaVjKwsuun7rChimC1vuGN63mwzvQ9mHj
 1XIVzN1eEvlY8e4mPQi4Wdp9AAMvb4zvpiS6InFOnAHx2GIBgBcu1Dq5fP6wnmTYLZTH
 D7lXR8EAyXHGkYXYw4GIMKXVN+IcFOVQkp+UlqGjTvng8Wi3zYzdL7dnYNY45ctN61Tg
 oOLDOOsFGzNJM+CGAT0mVgCbOMqnvXKm5nV/wSrmGEFGtIWoxnGXiVeWf5d397l61QSI
 xIbw==
X-Gm-Message-State: AOAM532AiM27sql7Ut4DkpV1n/K0tTmelX3KYPtBZlznW9T+7pkSnJ7T
 uTl0GCDTVJLBuCZ3vOflpPC9O9z0fd7eCjSOZadvNw==
X-Google-Smtp-Source: ABdhPJzBItlY43uGQ1di/pvyiuI5cG2uV8pK8/a3MYLK073piDHgVWBSg8bsrQX2VghdcQWs8SvYrgrhAjczS+pKxbA=
X-Received: by 2002:a05:6402:d51:b0:42a:b2cc:33b2 with SMTP id
 ec17-20020a0564020d5100b0042ab2cc33b2mr27392564edb.248.1653373687924; Mon, 23
 May 2022 23:28:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220523102339.21927-1-matthias.bgg@kernel.org>
In-Reply-To: <20220523102339.21927-1-matthias.bgg@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 24 May 2022 14:27:56 +0800
Message-ID: <CAGXv+5Gx6oGvvL1aSWfZC8cpE7mFyr5g66c=AHm3jkNCuXzakg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Delete MT8192 msdc gate (was "clk: mediatek:
 Delete MT8192 msdc gate")
To: matthias.bgg@kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, allen-kh.cheng@mediatek.com, 
 weiyi.lu@mediatek.com, chun-jie.chen@mediatek.com, 
 linux-kernel@vger.kernel.org, ikjn@chromium.org, miles.chen@mediatek.com, 
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, 
 krzysztof.kozlowski+dt@linaro.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_232810_637478_644338DC 
X-CRM114-Status: GOOD (  12.00  )
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

On Mon, May 23, 2022 at 7:19 PM <matthias.bgg@kernel.org> wrote:
>
> From: Matthias Brugger <matthias.bgg@gmail.com>
>
>
> The mt8192-msdc clock is only a single clock gate. This gate is accessed
> from the mmc driver directly. With
> 4a1d1379ebf6 ("arm64: dts: mt8192: Add mmc device nodes")
> the only consumer of this binding was deleted. Delete the binding
> decription and the clock driver bound to it.
>
> Changes in v3:
> - Update commit message to explain better why we do ABI breakage here
> - add Reviewed-by tag
>
> Changes in v2:
> - Delete compatible in binding descprition as well
> - Add RvB tags
> - add Reviewed-by tag
>
> Matthias Brugger (2):
>   dt-bindings: ARM: Mediatek: Remove msdc binding of MT8192 clock
>   clk: mediatek: Delete MT8192 msdc gate

Whole series is

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

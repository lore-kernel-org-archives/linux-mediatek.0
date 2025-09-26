Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27C4CAC5B0
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Sep 2025 00:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZH91ndxG1GVWd5J5DxGYGsSekv8Ug8LCXf3PTvg1inQ=; b=Gap/3inA/BtoAZIaA+uucsQZgz
	WrKUceqk4WNugh9NmZ26ynzZ0gmdxV3g/pCxwZM+FSMiJo9BZMKPjktz0+HqaTbMb6buJedoJk/PA
	lc9ApAuPxxpTQ9SFaaUYyj8QZ3BrfixiY5KoYDo+r1uijnqBOt/h3MCAgswksAwM2xcTiiCkIt8zm
	NdEFbBb0SRg527MCcnLZ78X4DihJhCZ8Nmg+uI9jrssXlFfXY0nABV/KgM9AOc17GueKZjoEFfCR0
	QTa2tR/CargFR7JRqL1eFx5m6DreBjZNVaFAYF0DtI0qp9SQGVkDBLq8RWfZA5Aeyfr/CXv5Jp5f7
	rgXvnEFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1wYc-0000000EQW6-0nMM;
	Fri, 26 Sep 2025 00:43:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1wYa-0000000EQUo-3MHD
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Sep 2025 00:43:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D3DCD61364
	for <linux-mediatek@lists.infradead.org>; Fri, 26 Sep 2025 00:43:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 722B6C19421
	for <linux-mediatek@lists.infradead.org>; Fri, 26 Sep 2025 00:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758847407;
	bh=R5AwY6reMT+hkszq0jHIk6/O1YZCgIsgfU6+UQvCVWk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Gl57E7fhZ8DqIgvwM0nMRP/DXf1FSjFCABVk7knk87AQP8l5wVjJ1OrEhIXLbFCjO
	 oKbYphKQ23LWUvnDBos4CsbqDejomkbQu4/Wl8KRPmzUibjkav8/bdVkDfxLMZjCPO
	 qLuEne61x6zG9UGnULFtGGci6PcmmfegCInhv46MHyhGShywlwavRJx/yAYJiymgdH
	 jiSr/51tjrCBdduQHEQWshMruCiNpjt9n9HpnA4KZVcRpRus79SpqfI9QrOx5FPfoK
	 z4A2gHO2pcOLwA8ptAGFJMrceRlxGM+tO0ipFDTC18jW5wq279TRrLF6ujsVEkUsqX
	 zJ9AmG5YKLY7w==
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-26a0a694ea8so14878135ad.3
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Sep 2025 17:43:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXuPMnG+M6jAV3ysGOH6BzpvG49C4Tiyr+FyigXeIYHpvUGDuacU9ep5mbqNbDxEJYuC/S/VRV+u2/zgr+GFQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxzHxQTQRbeg00LEI1eSi8pWlErFVAho3LODCAy8ar9XnM+CnI3
	9hpQ22ei/HDlXk8jsshndV4qNoCNqNheMQn2stmJ6cwyGlI1Fdsc8fu3eWr0CphAUZ352n3Q1El
	ZEeES6sX6PhfeXdGEeNQnjGNzSK/44U8=
X-Google-Smtp-Source: AGHT+IHuE7lUJTM5NjBq9XyNywbeXtrU6kRpDRkGAl4f2osXROh+FGe/vjUXxkTy+Xyl1QFb2qNvoBguF7HigB6yATM=
X-Received: by 2002:a17:902:c94f:b0:24c:7b94:2f87 with SMTP id
 d9443c01a7336-27ed49d0885mr59873295ad.14.1758847406872; Thu, 25 Sep 2025
 17:43:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250925092058.16648-1-ot_zhangchao.zhang@mediatek.com>
In-Reply-To: <20250925092058.16648-1-ot_zhangchao.zhang@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 26 Sep 2025 09:43:14 +0900
X-Gmail-Original-Message-ID: <CAJKOXPeLRZR9VkB3XHtCPDxT6-6xt6GkwJ-mLkw9hQNV2piJZQ@mail.gmail.com>
X-Gm-Features: AS18NWDL9JQ94XF1lGikABrmZ_SQTpxybLBch9JyjPz9vNsiAWV_NCfTqCxYNZA
Message-ID: <CAJKOXPeLRZR9VkB3XHtCPDxT6-6xt6GkwJ-mLkw9hQNV2piJZQ@mail.gmail.com>
Subject: Re: [PATCH v8] Bluetooth: mediatek: add gpio pin to reset bt
To: Zhangchao Zhang <ot_zhangchao.zhang@mediatek.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Luiz Von Dentz <luiz.dentz@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sean Wang <sean.wang@mediatek.com>, Deren Wu <deren.Wu@mediatek.com>, 
	Chris Lu <chris.lu@mediatek.com>, Hao Qin <Hao.qin@mediatek.com>, 
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 25 Sept 2025 at 18:21, Zhangchao Zhang
<ot_zhangchao.zhang@mediatek.com> wrote:
>
> Support the platform Bluetooth to be reset by hardware pin,
> when a Bluetooth exception occurs, attempt to reset the
> Bluetooth module using the hardware reset pin, as this
> method is generally more stable and reliable than a
> software reset. If the hardware reset pin is not specified
> in the device tree, fall back to the existing software
> reset mechanism to ensure backward compatibility.
>
> Co-developed: Sean Wang <Sean.Wang@mediatek.com>
> Co-developed: Hao Qin <hao.qin@mediatek.com>
> Co-developed: Chris Lu <chris.lu@mediatek.com>

Wrong chain. Follow submitting patches.

> Signed-off-by: Zhangchao Zhang <ot_zhangchao.zhang@mediatek.com>
>
> V7-->V8 modifications:
> -Currently, the universal reset GPIO can be found by configuring DTS.
>    USB bus can get the device node and reset GPIO in the probe phase.
>    It is fully compatible with other vendors' methods of getting reset
>    GPIO. Therefore, the previous complex methods of adding the compatible
>    string in btmtk.c to get GPIO is discarded. Abi files and yaml files
>    are no longer needed. When a Bluetooth exception occurs, the existence
>    of GPIO will be determined first. This change improves the robustness
>    of Bluetooth recovery on platforms that support hardware reset, while
>    maintaining support for platforms that do not.


You didn't even bother to compile this code, which is obvious from the diff.

I think you don't understand how patches and Git work, but these are
prerequisites for submitting your work here.

Please share how this passed your internal review - four people had to
write this code which doesn't even compile.


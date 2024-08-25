Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CABC5321E
	for <linux-mediatek@archiver.kernel.org>; Sun, 25 Aug 2024 12:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cFoPAQjrzOMHn/Chb7158dVJFp9Fif0r+ZRIhtuLxDk=; b=BZejNCK6TURGopI8gSwZZC3W1X
	doSihPaFthYZ7ruhlYBfjwqeyj3WBGxszwBXARUNNSXCIx4yb0hnE0PCYvzzpI3uR/uOgUGt7HYDX
	pzWdlrk+M8doFXg4wlBUfUr3H7qUfPBGGDsOnaq8qnKRN9ogDah7U6p2RO5QT/GTPjeEJWwefeLLn
	uP5fKJxHwA6h0PKHGO4Zx/j94z1RQOXXvlO2wt3Sb0wKJBObLv+RzcjiSlct9MaNllzm5mNRm4deB
	pdmgSfcYvHWZAtqWXZ0REF6llwssCMLnjhOHF83BebV27bzhlbKi6bIfZEKkBw+Zza4WQ9X9MIGyG
	4gGS52kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siCHd-00000004HbE-1Qw3;
	Sun, 25 Aug 2024 12:23:49 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siCG6-00000004HIa-3gzg
	for linux-mediatek@lists.infradead.org;
	Sun, 25 Aug 2024 12:22:17 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-42808a69a93so5306325e9.3
        for <linux-mediatek@lists.infradead.org>; Sun, 25 Aug 2024 05:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724588533; x=1725193333; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cFoPAQjrzOMHn/Chb7158dVJFp9Fif0r+ZRIhtuLxDk=;
        b=eVTgnkRrVDalFo+y/y29F+Bx6rpRKu1p8+lujwB4NqeMuK78MyrT7VBNvWo7UvT3ON
         SF9BG3qsXLBm9fXGkHQ2k5ImEjJu/pVR+Yns5La93XUfZOfOj3rurJZQ4zemh266Xc/a
         1wFhG1N6h9RWzYw3xygfL5P+YiFLVfvEq3gOSY5NvBdqf1dvy/aaiffl/oqU/qOoeHOV
         tyo9ctdZ5hGk682sXKj7sWGfGRz554xuYgXK4BrfUmLG0dFpmyzlxvAjTlEIrITtEbwl
         uF1V9xc2bHx3xt7ZOrgCS6mBmOwLwYBGWqur2aXB6IqDDY93mwQlRQ4ik0gT/94DMdJR
         DFiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724588533; x=1725193333;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cFoPAQjrzOMHn/Chb7158dVJFp9Fif0r+ZRIhtuLxDk=;
        b=CvwFPCQHvDdm+jLWFYNaGOr1LLI/1Nqbmsi74ZgvIfgJ1FzqsMUY9QEpinjmZwVSsX
         a1/n1Fglnc6w7A9cEgGrS7wGQWXzJmCKMBmFx2rE4T42h+f8dIeqnlMBSlpD+LkQ5DWI
         L4jP+Hs23y2bKjS022tnxt9bg4+XvViz6PrlO0Ipkt3ZbdiueC9bRfcJ9eNfonnyu6OR
         pK6Tnj5TKA3oyOjrPtFHk9vFfSbQ4WGU9H3VrzBFwK2VaRNZgX1UFDgyC7psYesgouk8
         d3FQSWHGhE7PRwJ9sbP6cQvbzRr1GoRbVdKqzp094zP4mf2VAGmoBaZhTPephEznYoUs
         nz0w==
X-Forwarded-Encrypted: i=1; AJvYcCUmX5QQJF4/zqmQSTHbTyqts8swYZPS9j/a8jeQjkXgk7GWO4ZiaB9VZUriLQZ02a6AIOVdIMfi00bpTtVr/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxfnlnOyIfO14b1/C2EdMD/p0WoEJo08qAgk2wx7TCQN+9+kQyX
	k1Kn7kU+WgXOcUv0aB5nGe/eBGJxBjegPn1ZpYF49uRfvAftJMPdiFbAsnkakoo=
X-Google-Smtp-Source: AGHT+IGV83472j5wbPbeYQa0Bq1nt9bPfZuAyeTcQtQzRN7MOaxKqzcgHhY7/Gdx06UxUhgezQu+2w==
X-Received: by 2002:a05:600c:46d4:b0:424:8b08:26aa with SMTP id 5b1f17b1804b1-42acca01063mr33206985e9.3.1724588533010;
        Sun, 25 Aug 2024 05:22:13 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abef81777sm156774065e9.27.2024.08.25.05.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 05:22:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Honghui Zhang <honghui.zhang@mediatek.com>, Joerg Roedel <jroedel@suse.de>, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Rong Qianfeng <rongqianfeng@vivo.com>
Cc: opensource.kernel@vivo.com
In-Reply-To: <20240821032558.43052-1-rongqianfeng@vivo.com>
References: <20240821032558.43052-1-rongqianfeng@vivo.com>
Subject: Re: [PATCH v2] memory: mtk-smi: Use devm_clk_get_enabled()
Message-Id: <172458853088.37697.14987421828670080421.b4-ty@linaro.org>
Date: Sun, 25 Aug 2024 14:22:10 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240825_052214_961204_58996B09 
X-CRM114-Status: UNSURE (   8.23  )
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


On Wed, 21 Aug 2024 11:25:57 +0800, Rong Qianfeng wrote:
> Replace devm_clk_get() and clk_prepare_enable() with
> devm_clk_get_enabled() in .probe().
> 
> Fix the bug of missing clk_disable_unprepare() in .remove() by
> using devm_clk_get_enabled() that can disables and unprepares
> it automatically on driver detach.
> 
> [...]

Applied, thanks!

[1/1] memory: mtk-smi: Use devm_clk_get_enabled()
      https://git.kernel.org/krzk/linux-mem-ctrl/c/ff390189b7f2cfa20c644bc58b4462b5e2621838

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>



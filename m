Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58215C3DA5D
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jul 2024 07:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6pHwcq8Z5PavF+Ent0ZqrtzxFZOHNSpY7+0qdU5c68U=; b=c2Ss8v0J9mlJ7XYSLEMeIXALyQ
	xkDuBPpDL2kWQjHIRcuoRwhlpaBAYrBYwi0mD5Zf7R0HMH48Im84P/UgLx+3r9lBZXu0sIu+IwhMh
	uh1SuBwSI73VGg+056A1oRGC8wNmRNARLvkyp8x6E4I2XBA8j8bmpm4h9JZcMdhlpLA/VkLfRrJns
	ObgxRLVzR+pukouuEN0+9Qjld5oLnMSqc3jzuZLIXca9pVnasN4pQzkbXI4ez6jS9jYBYiWjGgpJS
	5jaDml/2wkp6wN8ndPx164lEiOWhqpvxqsaLmmCgSFL6lEftBJjvZjOg+kNPgc5EIA9Z9zksuGh9+
	7ZRMVDfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWtG7-00000000ERK-0BMk;
	Thu, 25 Jul 2024 07:51:31 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWtFN-00000000ECw-3lbR;
	Thu, 25 Jul 2024 07:50:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0193ECE12E2;
	Thu, 25 Jul 2024 07:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDAE7C32786;
	Thu, 25 Jul 2024 07:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721893843;
	bh=3AHuXOduCNHiVYwcs87eHPsuIAXODhLFLXa6d1iqs9M=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=mD8HBntNl/x9wqfEhpqvpmnPC3U8r7rRRnmX8JK77/eIiTJAo3Kc/iJ/L5DfFZ7/a
	 GOf2NJKUKRJSEMMkbDbavxuVPZoyR87fuzAluHShT5jmFvaWnfNwPMhc2RyR0kIF0M
	 /d66Puri4UcznayccZLyyyIw6h3tb1wtu8cxipGcNwzh72dGu5kc/iPYKjctuE4vb2
	 deil01zw0l/DuiDViA+TFB+X7zH2/8nwjErKc4ahGMinbso1ZYQXyo/L/ns92xKFMf
	 tCX6AFeaQU6HfY9zv9F7+k5YmkDREYu8szKIm/XzoO5K7xBPjHwypYwT/xk/7glHsp
	 1bsho4UVL98fQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240707114823.9175-1-krzysztof.kozlowski@linaro.org>
References: <20240707114823.9175-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] mfd: mt6360: Simplify with cleanup.h
Message-Id: <172189384152.837660.3590109373140262352.b4-ty@kernel.org>
Date: Thu, 25 Jul 2024 08:50:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_005046_126939_B6F08357 
X-CRM114-Status: UNSURE (   7.12  )
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

On Sun, 07 Jul 2024 13:48:22 +0200, Krzysztof Kozlowski wrote:
> Allocate the memory with scoped/cleanup.h to reduce error handling and
> make the code a bit simpler.
> 
> 

Applied, thanks!

[1/2] mfd: mt6360: Simplify with cleanup.h
      commit: 05dd1b4a8d71b5c422bff8bf6ad22baf5722c2a2
[2/2] mfd: syscon: Simplify with cleanup.h
      commit: c80c7dfec9d8514f1fcc34402124026e59d2e2cb

--
Lee Jones [李琼斯]



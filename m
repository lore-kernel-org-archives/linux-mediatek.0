Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41122CD98F2
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jun 2026 14:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tj/U0Y54eAKclejjEBVwWZyUPwiS6WzmvFTi1kYoa60=; b=fIHVGkfNAjb6qxfEqeM8hhf6Ej
	9BF0E4w0FBfN8m6KCY4MFGBA6eiZPUEPri8RGKHf5o/INiXUQ21wqdB1vri6eY0RoZwqzNG+iZDOn
	ee+rgBL9ZUFukJNYOpBKkK0Amekkbv3dc1+7E4sMxuBmV1lkQtSuTZwz3sJjYrcSTcz0VKch1Bd7i
	IEXn1qxHCI+0mMcGrG9w/JPsy4r1W44kksXyQ82+gJzfwiP821XdF6FLN01hMbtiKBS+nB84f8B9I
	CYs6QX5mWAXD7EiXbATycqnMvD7DTQmOufa7fRwrQ5lkSoHp8gIsr8U4KILzleQZxLsq8qvUALrey
	flM7vu9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc1ny-00000006P2b-20h1;
	Tue, 23 Jun 2026 14:08:46 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc1nu-00000006P1K-3GJL
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Jun 2026 14:08:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C24491A088E;
	Tue, 23 Jun 2026 14:08:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 910EB601C2;
	Tue, 23 Jun 2026 14:08:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8709C106C8382;
	Tue, 23 Jun 2026 16:08:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782223718; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Tj/U0Y54eAKclejjEBVwWZyUPwiS6WzmvFTi1kYoa60=;
	b=IZuJTS4Gaj7zpjzOxVenDZXvDPqCUWMOEpXcEhfV25BRkcLbwZBK5o8Md0Sp0vUMh3/lI2
	uNLYIaZKGKBzSO/ZwJzR858RhBjQKDKQEPaWRbsmXflsTjoZAiVlg6+AC3pkHQvzzhQc0U
	rL1fR+RYTXNHmNYaRzuu9sH5jtyXIP7egW5NXeTxl3/MnJgTsQbAWxlAFFxotrgYvz67jU
	411GO7jLeSEFDZ/KCW6wJSRJLR0pgWW3cAhnC8rh9Jcag4K9lL5hQ9HsnYXiHFEhpiANYe
	slL4Wku8V2rEdhkYnNYIfWvqbhiYUzn/Wr/453FOhGPqOrsfXNsYNAGo7UFPqA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Matthias Brugger <matthias.bgg@gmail.com>,
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
  Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,  Boris Brezillon
 <bbrezillon@kernel.org>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: mtk-ecc: stop on ECC idle timeouts
In-Reply-To: <20260623135729.52304-1-pengpeng@iscas.ac.cn> (Pengpeng Hou's
	message of "Tue, 23 Jun 2026 21:57:29 +0800")
References: <20260623135729.52304-1-pengpeng@iscas.ac.cn>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 23 Jun 2026 16:08:34 +0200
Message-ID: <87se6dmjrx.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_070842_950233_FCC6CF90 
X-CRM114-Status: UNSURE (   9.15  )
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

Hello,

> diff --git a/drivers/mtd/nand/ecc-mtk.c b/drivers/mtd/nand/ecc-mtk.c
> index c75bb8b80..96703f0a4 100644
> --- a/drivers/mtd/nand/ecc-mtk.c
> +++ b/drivers/mtd/nand/ecc-mtk.c
> @@ -123,8 +123,8 @@ static int mt7622_ecc_regs[] = {
>  	[ECC_DECIRQ_STA] =      0x144,
>  };
>  
> -static inline void mtk_ecc_wait_idle(struct mtk_ecc *ecc,
> -				     enum mtk_ecc_operation op)
> +static inline int mtk_ecc_wait_idle(struct mtk_ecc *ecc,
> +				    enum mtk_ecc_operation op)

Looks good, but could you follow up with a patch which removes the
inline keyword as well? It does not seem to serve any purpose there.


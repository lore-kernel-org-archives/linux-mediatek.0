Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E93C636D7
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 07:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TJdiwgaF82AikcCe8o8gDMDNve0naqYe+aiTa4OGZRM=; b=YyGAyHYSFvmts1WiCBu5952Uqa
	pVenOb7ak6GHeY9YG2xA0F3W2FSgbm0nXOg5TAbf+WSyR0mC89jAnktA9ZWe5QlQtBRjHJY14lmLG
	1lbnZRYHBCO4aT44BaDR4n0f+REeJzOFeh9TDU8x2YswKdPdlsJudgVcFZ/BtDZ90SxUjla5xfqME
	vvxU/9olwNbZtN7SExAQjyul6MkmEkwjOYSxi8aduv8pz2z2ydN8UaUzC+cixvk/AWPtMf4b7E6Ge
	Yw3hA0YHAQ18/ZR/2025DgqTDf24+i2ET7+SUdHVls1fyA0ZGc6ohyUnno6lhstfh1JSRAqwEX4yU
	hEARWEjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUMeI-006nmC-QT; Tue, 21 Feb 2023 07:01:14 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUMeC-006nlG-H0
	for linux-mediatek@lists.infradead.org; Tue, 21 Feb 2023 07:01:13 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id y8so2527630vsn.2
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Feb 2023 23:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1676962865;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TJdiwgaF82AikcCe8o8gDMDNve0naqYe+aiTa4OGZRM=;
        b=gZozwqMiPJDjbtQSwH/RrRv0YxmcQhOXRES3bOqlibCjcjqPsKBRgWjOMFcDp4b+4k
         YKj7fJ9fl6vSdWp/ldDkr/zZx6AmqBwFOu3/IE5tw3pXYrczuS3qrdNNGECa0NY9uLx7
         6LkKloSDf6VgcTP4gaVnVX26lBO1+xqo0V84g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676962865;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TJdiwgaF82AikcCe8o8gDMDNve0naqYe+aiTa4OGZRM=;
        b=bHxDsu7FFD1KkoKBsK1p3tE0EHfT8G9Rz2MywzyGsgkR9gNJ+CBAcMOw6iWNihwwN3
         yVx2+kjfhqfS58g5lFTjMJ/q4vpr5UZDJLN0Uw1IOxvKE0VCd1nY3kxAIMFWzHvuuRxA
         QbsgXbuihx7P+1/idHlnJlxIvouygsb26ZmW2W7acD8I0dP23whW5RebMiLwFFH6bsYw
         10JfbFR7SzdTmfZ6OCnu29L72WV762LxGyF9UxqHxD4NIEA4TP9t5c5CvGC8yfWm5FOK
         jiKKmxidiIYaJ2h+0LOsNRrCPIhm/RBJPdI/pCjkS0Owh/SDewGf6yRS+PgjOB7spaG9
         VVrA==
X-Gm-Message-State: AO0yUKXJ864V5G2NfyMnKC7glRTYqSVQhpyxnnmL4211vExs1wUlJJ41
	NLcXlvTIKXXJKPAlE7W5ybTDutkc8cGoyFr+umaJkw==
X-Google-Smtp-Source: AK7set/8CPnCI4JSwyWqN8h/mvV1xPpLxwdFymcUj/Geob+v+D6QXat6Ldrd7grAl3iBEA+9RPLiv5w8yRhIL+9zhXE=
X-Received: by 2002:a67:f6c1:0:b0:411:a14d:6bac with SMTP id
 v1-20020a67f6c1000000b00411a14d6bacmr903285vso.44.1676962865254; Mon, 20 Feb
 2023 23:01:05 -0800 (PST)
MIME-Version: 1.0
References: <20230216130021.64875-1-angelogioacchino.delregno@collabora.com> <20230216130021.64875-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230216130021.64875-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 21 Feb 2023 15:00:54 +0800
Message-ID: <CAGXv+5GgdwySYoMEPXB1TxUnu_G_vM6G9uK2WF_fm29oabNNvA@mail.gmail.com>
Subject: Re: [PATCH v1 2/9] soc: mediatek: mtk-mmsys: Use module_platform_driver()
 macro
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, jason-jh.lin@mediatek.com, chunkuang.hu@kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_230108_632890_820DD74E 
X-CRM114-Status: UNSURE (   6.44  )
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

On Thu, Feb 16, 2023 at 9:00 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Instead of open-coding init/exit calls, switch to using the
> module_platform_driver() macro instead, doing the exact same.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>


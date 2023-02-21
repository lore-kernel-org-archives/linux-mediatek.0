Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4BAAC64ED9
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 03:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ULibvphzro1D/98vWvfLMdiA81XUXKtqF+j4eYxfmic=; b=lbQ2nIStXJsVcF6CNCL0NFhndI
	sple+pH4dHAL3LJdlkNwzaKHYkn4GhZfk7nv5qGXjA3lw+AoLtJOB500l8FOR3S0Venr9dV5WhjOf
	mmg/4pFiwKMzhBFoqVe3QiePAZHYROq/R9lmN1Xy4DHqfUWRQPrwHcP9lMh64Eo7Jp06Y3afGLUuB
	kDeB7Yhxjtf3FM2UQ59VXMxLjD9qLHzqhcOdDp+LrI1q+W1vJJp2LaG0izQPIgQKlAlDKMeosfEjQ
	X90r2seRXKkuOPQciCD7ti8keARWXon6BvIyKwRYDHIM/HKnk0gloGlThmhrRzh3mMeh1kFvfIHdJ
	10nVp82g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUJXy-006SuD-DZ; Tue, 21 Feb 2023 03:42:30 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUJXw-006StD-4w
	for linux-mediatek@lists.infradead.org; Tue, 21 Feb 2023 03:42:29 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id e5so3438141vsl.11
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Feb 2023 19:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1676950947;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ULibvphzro1D/98vWvfLMdiA81XUXKtqF+j4eYxfmic=;
        b=CaOM5YB4iZnIvNmgu7WWEY1Axx37zudaWsr7ZFhe+E8rAJJY88Qgu42VCYNZnzG8eA
         FNv4LTyy2b3xusy/T3zF7ByXkY34hW/V7gfny6LgnSuTFVgKa2XcgcCXXdfsAggJB3d1
         LlFaSlzwjAoXIHImNkWEFyR5zHnl0rP8dIsA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676950947;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ULibvphzro1D/98vWvfLMdiA81XUXKtqF+j4eYxfmic=;
        b=bNQpfPJ+/9hiBHQa0/2jVqPnmPg4ZltvzhFH1TxSvPAwoVfK8SRo2e8BFrF0U1Ys4F
         E61GaoTHE5AAIPS8IknDuna0jMrwWdhlSHWBNMbBN9IQO2OWuAORX8oR8oETHt8S2Prq
         q+RjtnslGYEM+lp17YjfH1baqLVF4+A97F4J3dBA2pEJVPRRnvzBBJpe+7o/t3Y3iiUz
         AAvCkt2TKBefJ/sqDzbp6H9dIqiQTlImm3J/6W1FBpkIgmhHGCHR5Gd9qf/xpwYt/Ek1
         QH/2okCQ6+728xMthu0d6sj2roKiy/0eXb6Vvvfbdt716+abJB2t45EPPupmi2Teu7pj
         TXGA==
X-Gm-Message-State: AO0yUKU70x1JS3tEOljGWQzk98Z9w2pNLSpZvSkugBEKRG13yXIm+IZ4
	T5CWF6KUHvUznwOGxq7gMOOX8a9+KxPJ7eUgyHAjPQ==
X-Google-Smtp-Source: AK7set9Q3lgwHVzF0syYp34gQZFO/Wte245q8zd/k4th0GEwW7W3ggn8c4BEtNK75Xiff4H41OKOyL6E6Myn9WzQCZU=
X-Received: by 2002:a67:f6c1:0:b0:411:a14d:6bac with SMTP id
 v1-20020a67f6c1000000b00411a14d6bacmr829329vso.44.1676950947315; Mon, 20 Feb
 2023 19:42:27 -0800 (PST)
MIME-Version: 1.0
References: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com> <20230220150111.77897-26-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230220150111.77897-26-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 21 Feb 2023 11:42:16 +0800
Message-ID: <CAGXv+5Gt+05x4ZnuW0Bda=eEbqSyG+3fArpvq6-Qi41FO4wH9w@mail.gmail.com>
Subject: Re: [PATCH v3 25/55] clk: mediatek: mt7622-apmixedsys: Add .remove()
 callback for module build
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, 
	msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, 
	yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, 
	sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_194228_195189_D549DE1F 
X-CRM114-Status: UNSURE (   8.16  )
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

On Mon, Feb 20, 2023 at 11:01 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add a .remove() callback to the apmixedsys driver to allow full module
> build; while at it, also change the usage of builtin_platform_driver()
> to module_platform_driver() to actually make use of the new callback.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>


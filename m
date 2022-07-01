Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A63C43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 07:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9hYBXBZKXmmUGaFdb6SuCfbxwhU6X3Dq6jMueRsGhJU=; b=CesqUjgx42ijJnOOZ20UD4Sdla
	rgQc8nE+XjC60vcHlAI1AdtiEof6a/nDQcIhQrS5to0l5QoKj8OK1aYwUxGDpuw4mjyxgEfIr5b3w
	F2b4XkeN++HMQue+mVahXyf7kXmlCWppqEWIklnU2TWPCxhkJp9G1YL4sq5IboquFn+zeNEH9SE7B
	ODxOVKRV/UGqH0okEiAvbx6/UU1Z7uJLZ3/IwzjTEZ0vk+BDXKa8JUEtKg+piEudOYMqLIFl6bg0n
	h/xfxGwy/fvoLPlu6Dt+iCg5aXjZRRkfSr7CBUcr0jHU0UqERsw2wkUITPVVtdKVxba0cepvKTy5T
	dovKV5XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7BC2-003Qps-K2; Fri, 01 Jul 2022 07:35:58 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7BBz-003Qlz-Bt
	for linux-mediatek@lists.infradead.org; Fri, 01 Jul 2022 07:35:57 +0000
Received: by mail-wm1-x334.google.com with SMTP id h14-20020a1ccc0e000000b0039eff745c53so1017225wmb.5
        for <linux-mediatek@lists.infradead.org>; Fri, 01 Jul 2022 00:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9hYBXBZKXmmUGaFdb6SuCfbxwhU6X3Dq6jMueRsGhJU=;
        b=SJ9YxmFNKg1Lqc7z5zv9LZYEzlBIfAiykJ0BG0dhD9UCkBmIErU+dRW+S6DJ/1IsWW
         kt12NVjo14J1sZ+7eJ3FAor6w29QZTCZFpHLfz2hI15QtwapGIcGxmiV0jTRAytru/kv
         5Kl3da6FrgykEhQSqZgfY59fjTplkidAIOihnSBOvCU4/gvFo9xBONBH+wnV3HNwfiJP
         Kzxo21s4G+wHZxmEK4Q9VnqWk6CBqoFrFiovxZp1V4lsA0Rrbpu1GC68MBvWmcocpKL5
         Snt29CDAa5E6Jyg4KXAlnBCIARdZqrBNKGn6rjukKO+aQQ0IDFVCZS4om0ARLNYuRzPU
         lqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9hYBXBZKXmmUGaFdb6SuCfbxwhU6X3Dq6jMueRsGhJU=;
        b=cEHSJph540wUhphsv+qItQQF2Y5yhio7Hn7UXOlf3dc+BbcPhToqiMFlKDbI3C02QF
         ZR72zYYgRMIOEqf7Nu9VroW3ElkJmmXop1hs/4pbrDQr9tpdp+dHs6hMnG2KT8NbaAQ8
         5eqpveO3z+ELpIS40/YV2gDFBZQROyTZVWQAO06krLePol8py+Jtthm2PUnYYjUCUysp
         z9AnXOGJ3AujWryRooUR5NaQpSmEPQBvC5iqCiZz4T1ihGe5CAT5dJqcRIzH/L7i1Oom
         6RzmDeC6NYTaOcPKo59YMC48BC3rWYVDe7QasuI4RPZD0PCPuIe93oFzbZtxpATsxihH
         EFTg==
X-Gm-Message-State: AJIora/I2rjFdMnACys/dZEtCal9LM1oxt7qskmPPuGwAsVa5IBHyc9Q
	OmJSAKdaN9b1SHjCygX8Es4jIA==
X-Google-Smtp-Source: AGRyM1ug790AHM/HNC91OhZDPg3Y37LVnczLuJtQjzCb66sHR2Tt66T3JoFCH8BhqFqSEA6NG+i4LQ==
X-Received: by 2002:a05:600c:4fd1:b0:3a0:5416:2fd0 with SMTP id o17-20020a05600c4fd100b003a054162fd0mr16729105wmq.197.1656660950074;
        Fri, 01 Jul 2022 00:35:50 -0700 (PDT)
Received: from blmsp ([2001:4090:a247:8068:1e6a:750b:72a7:72d5])
        by smtp.gmail.com with ESMTPSA id j6-20020adff546000000b0021b862ad439sm25816160wrp.9.2022.07.01.00.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 00:35:49 -0700 (PDT)
Date: Fri, 1 Jul 2022 09:35:48 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Fabien Parent <fparent@baylibre.com>, Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: mediatek: common: add quirk for broken
 set/clr modes
Message-ID: <20220701073548.4za7fl2jodhpdaqe@blmsp>
References: <20220530123425.689459-1-fparent@baylibre.com>
 <CACRpkdYZJUWb4TBJiZVK4SNeA2Njn6341FuDjdYsn-0_yCeRKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACRpkdYZJUWb4TBJiZVK4SNeA2Njn6341FuDjdYsn-0_yCeRKg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_003555_430187_DDEFC8A1 
X-CRM114-Status: GOOD (  15.97  )
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

Hi Linus,

On Wed, Jun 15, 2022 at 03:23:57PM +0200, Linus Walleij wrote:
> On Mon, May 30, 2022 at 2:35 PM Fabien Parent <fparent@baylibre.com> wrote:
> 
> > On MT8365, the SET/CLR of the mode is broken and some pin modes won't
> > be set correctly. Add a quirk for such SoCs, so that instead of using
> > the SET/CLR register use the main R/W register
> > to read/update/write the modes.
> >
> > Signed-off-by: Fabien Parent <fparent@baylibre.com>
> 
> What is the state of this patch set? I see changes are requested by
> Angelo, are they being addressed?

I will probably pick up these patches and work on the comments, but I am
currently a bit busy on another project as well so it takes some time,
sorry.

Best,
Markus


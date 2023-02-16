Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A77C636CC
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 08:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HwDQyziQcnL3/qYobk2rERtbLb6UKPgXAiYWHCJ3ci0=; b=Ii6cggtRHjsnqcpi6aUgOwbhrc
	ElL7FHiiVS3xMgXBXY7j94qZJ0JxNfve+vpXi45eijlRxohDtTwPRfrx/C7cUYlW2mtIEPBxokxY4
	l2U5aY9EYtkcqB7bdmd7fhpk1CoBvze1KcnkXkSMgH5VynXnhq1FXZSttaZIgG/s7+ROgMsM11nNv
	aSWT7dQ+DOnhFPWA/VFc4JR8uLQnPz2BPbtVEL2bZIqxFo61t3upSvSrjgrJLlB5CYbObH+rAoOpg
	EtJheRUuQg54cAR4sTXDjkruOc86mffsAKM5sAQo380Yp9NEtdbUsz60IVTEoiyVPdZUF8k78QGUp
	B6UxyWfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSZBu-008u60-8N; Thu, 16 Feb 2023 08:00:30 +0000
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSZBi-008u2Y-Ed
	for linux-mediatek@lists.infradead.org; Thu, 16 Feb 2023 08:00:19 +0000
Received: by mail-ua1-x933.google.com with SMTP id 30so246654uab.8
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Feb 2023 00:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HwDQyziQcnL3/qYobk2rERtbLb6UKPgXAiYWHCJ3ci0=;
        b=nIRE8j59PqoJX7PnFaxwLXJvnpib/xw1mMdiCqZXNqoyJ4kCmBlKo72Y8fDay0MHP6
         /dPlbBTBI7i9OTV+q26ngG0OlG2vv0nTzUQJ5c55Xob85LG9DRKP/pgLdeZPYzrP34LJ
         1GT1+Tuy6HtrXbhUi5nN3KhOapekzucC/V988=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HwDQyziQcnL3/qYobk2rERtbLb6UKPgXAiYWHCJ3ci0=;
        b=Bou7JxaIA+M3cGAsnfb+fRCtHcOfd9CotD69Xap+BzgniS9s/CZyxnOCqUznH6R3hj
         Fr6njasg/RnYQ9heUlGz5FsL+OoRBSCs5udZY6HVTmloua+0UHXqvqZvvAh+1o+yGUkA
         ETOdKw/GHNowmVMKBPsWdLI97CsZLhikfdhNcZfAmdmehQiEkXwtenOAB29kNQm4QQRi
         OtPsFLwLWgZTGPN+XTGGRfqr6/3jLrMnTWhYfhfv3B8jRS/wYYzS2V0v4LZsiV7FcRmj
         fFai7wJ3eU8WwbpwD9qB606hfsxuvnZ7h4HsAJH2iSce24Ran5IDRgTRexujIsJzv0O7
         U6bg==
X-Gm-Message-State: AO0yUKVApdapQsA97a559T2Bcn2UGtbf2T1j2YoIwK0KCOIoX8y00LIm
	b9ipzeaefFTQHG1nYJAH+xNK6FOZURpq+m11D4Y+dMJesS0Mn+HH
X-Google-Smtp-Source: AK7set/WvM64Q5fol97RcKyUBZadppjKf6uZsIOu4uAc5MszrxY6orAb3miq/PyxHEIgF7hbx7+7gJfDgZu4bM62Fio=
X-Received: by 2002:ab0:1045:0:b0:68b:728c:cf35 with SMTP id
 g5-20020ab01045000000b0068b728ccf35mr144924uab.1.1676534416768; Thu, 16 Feb
 2023 00:00:16 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-17-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-17-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Feb 2023 16:00:05 +0800
Message-ID: <CAGXv+5F+v=Sh+NaqKKcrzABS96fRqc97gq2YVWabjH7Amo0AVA@mail.gmail.com>
Subject: Re: [PATCH v2 16/47] clk: mediatek: mt8167: Remove __initconst
 annotation from arrays
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, 
	msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, 
	yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, 
	sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_000018_535479_A92D933F 
X-CRM114-Status: UNSURE (   7.82  )
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

On Tue, Feb 14, 2023 at 9:42 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> In preparation for converting the MT8167 clock drivers to be proper
> platform_driver(s), drop the __initconst annotation from all of the
> clock arrays since they will be used not only during init but also
> during runtime.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>


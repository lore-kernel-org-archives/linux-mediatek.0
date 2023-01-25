Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42AB0C54E94
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jan 2023 15:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wapkp7jQNP7w6mlbVx+sKZqdo7KAYoZ0tdxTdIM62U8=; b=seIezbGKr5048Dea+k7GxHvcXG
	7fFmJZm9MChhE3q6o69K3F5GSsQH7ULN1zklTsjFLMSlqT8RV3Gspb6yNgTNSCGFNXOq6x/FfY7+B
	LcItNK54jFc6Qur2TxWPWAYgFqzrB/vP34CUMx/BK26pk4xclxwwj4HsBhCrpKTrKo3/gRJ++3xkv
	Efb5++7ZTBDn6bjKVbPZztqkxa0UZ1m3SOoEeORAC6rjo1ssyWfjMzlI8rkK+8CCFhxBEtOJgUtjV
	gHW0r8pdU2/VeI/8Csqz2cTINH+M7krBlfb29UbdpK/Kyjsj792YLWOfi6JfMqjGVmAkNynj3TfF0
	tIdpqA9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKhIv-007h8E-Am; Wed, 25 Jan 2023 15:03:13 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKhIS-007gwK-Gr
	for linux-mediatek@lists.infradead.org; Wed, 25 Jan 2023 15:02:48 +0000
Received: by mail-ej1-x62f.google.com with SMTP id rl14so45072729ejb.2
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Jan 2023 07:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wapkp7jQNP7w6mlbVx+sKZqdo7KAYoZ0tdxTdIM62U8=;
        b=KbVn7SnwqKkdU0hL+9SxfPG2WxS+0BbpGxfl3RWlHmlfbNdf941qxSilRdh6RnKCUg
         Xs5/nLQzVApVZw6Zl/6Jk5IrpXtUXDk3BvzfGJuTMWFNFMCJFstg2aRWHINkjY5C85TG
         YYgCL4WvvksBn7jr57XAED/uOGUpUUo2Deqjz2NKnYfj8btdEl7shc0BQnJ23AP0O27Y
         6oXjZSMKLcSgPkH+vzw8h12sNj4PtVTma2MQxGf/XOS9L8RVh1QKx4IHRPsxxuuAruw2
         bCXNioSELe6CTXRFM9gNNfLJTg8k9cxIT2G74qfmnVSm2teFg+lREseplhfZMBK/Y1Hr
         Bmyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wapkp7jQNP7w6mlbVx+sKZqdo7KAYoZ0tdxTdIM62U8=;
        b=t0poklg3Bkj/onCy69ueIZzoV2zwGyJvgKC3GJ8DhVpGp1Av5V3e5Bdj3DwY3vSbKO
         GR2rgjktxHDq4R5R6EL7M6b1FgxSkDoAqUgXOds0Y5UHlVos0DKI/I5MnzvS3VLEPLH2
         PCAt0IqIZM8C12p9yE1+9DGFVNeRZ0P2fbLklL2arahnZTR76E9h7smrXiXZ93kKnITe
         tMBcGd6b1ONzGeIsP9kNxjjAomgGldgr26XTZJZIZKw37xil7ktA2Sy9e3/e3qdfnDdP
         u6dLGFzqVJwA8q+8ZHq3h+ang7QWiyCrpjVMAWV4ofal1gvctkqIfjid1FaW+mWhLlCZ
         XHCQ==
X-Gm-Message-State: AFqh2kpdUhR3WVQQ72B1Z2KYVylyqn13x0kh7yFAB+iwttJgJNsxOyYQ
	DBmRszw/qsP7XSQZCkxnhpNacQXDStILuRfTW4zZyA==
X-Google-Smtp-Source: AMrXdXs2eqPlIq51Dl1jYiUSg01kC0cn8kaqWKVFw9WGWQZwi/uHjvKD6XF5gIiXDW/HAlyKlCaek/h/NMBZaQfBM6s=
X-Received: by 2002:a17:906:71d0:b0:86e:40e4:9d8e with SMTP id
 i16-20020a17090671d000b0086e40e49d8emr2871902ejk.352.1674658962151; Wed, 25
 Jan 2023 07:02:42 -0800 (PST)
MIME-Version: 1.0
References: <20230124131717.128660-1-bchihi@baylibre.com> <20230124131717.128660-2-bchihi@baylibre.com>
 <976628a6-58c8-3298-3777-97aaddf53bc1@collabora.com>
In-Reply-To: <976628a6-58c8-3298-3777-97aaddf53bc1@collabora.com>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Wed, 25 Jan 2023 16:02:06 +0100
Message-ID: <CAGuA+orL4QPFic0vaKSqm5mQNkCT6=CuNxCfRuUutarP0sCJog@mail.gmail.com>
Subject: Re: [PATCH v11 1/6] thermal/drivers/mediatek: Relocate driver to
 mediatek folder
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: daniel.lezcano@linaro.org, rafael@kernel.org, amitk@kernel.org, 
	rui.zhang@intel.com, matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org, 
	ye.xingchen@zte.com.cn, p.zabel@pengutronix.de, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	khilman@baylibre.com, james.lo@mediatek.com, rex-bc.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_070244_583792_DE6AA727 
X-CRM114-Status: UNSURE (   9.28  )
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

On Tue, Jan 24, 2023 at 4:37 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 24/01/23 14:17, bchihi@baylibre.com ha scritto:
> > From: Balsam CHIHI <bchihi@baylibre.com>
> >
> > Add MediaTek proprietary folder to upstream more thermal zone and cooler
> > drivers, relocate the original thermal controller driver to it, and rename it
> > as "auxadc_thermal.c" to show its purpose more clearly.
> >
> > Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
>

Hi Angelo,

Thank you.

Best regards,
Balsam

> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>
>


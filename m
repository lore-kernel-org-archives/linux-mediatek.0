Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464AEC636CD
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 13:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L2WcUKHhKYf5KPZ91tTZraIDIh2DjwbXsYCtx5pIpUg=; b=JvafxhcF5MnQPEBAw+l9P+iK+E
	4YYe/twjB+PIyj2IX2ZjkZrZt59FdrA3VMdaY1arcdf8xu1TBeM8A4qvaTFw5vcmSRUZ5a5T9PLlm
	8aEsJ86npAx5KfWFNie+WmfiQ51yLqrLrk9/uYGYrWKji4Hu1ssuwYzWjHxGDaipJcWEhOLhrKxMJ
	tWZLaqNZ+9+/6/1WspghYzVzuomR2ULgG10R/fMUIpov18HpmnufmfEg5slDf11s52NaLxoR6CsmA
	QavOU8f6NoVjEySD7shvo9DUbHU49jgn4N6Jw08nBgaHfUVNchUtgHtbBF3++3nMqTdcSuTLTDAQn
	aUeZqhRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNDIj-00C6fZ-CV; Wed, 01 Feb 2023 13:37:25 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNDIg-00C6e9-E9
	for linux-mediatek@lists.infradead.org; Wed, 01 Feb 2023 13:37:23 +0000
Received: by mail-wm1-x32e.google.com with SMTP id l8so12693717wms.3
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Feb 2023 05:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L2WcUKHhKYf5KPZ91tTZraIDIh2DjwbXsYCtx5pIpUg=;
        b=SXlQ4L+XhRAzV1V3OEbm01m6LX8m+4lc2U3zdNH/QKP4CjSvyqv4iU8i66JsLBoelU
         Zk7RDxuBAEOXzWpRGH6b/B2fqlZYbHu3EEePj/tAHOMw128QQk/7CGqJYqPwe3wFvzDJ
         MicLyy9mf67ZLVk87krdA8eTAp9l+WhaPTizlx1+aih+tFfZfjvteoTFiylLqmwBjh1G
         OCaNMiq4bqo8/EhIuPdTFCBusRlsfaInD5mNE8PKKv6WMUjXkodacDG85usfWfCgHSzX
         ti22HT63KvAfe1rb2VCWZ4gkDIQptROZ/i1mc21sspxbPJGzbYihe924n4sgxzETY3x/
         H5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L2WcUKHhKYf5KPZ91tTZraIDIh2DjwbXsYCtx5pIpUg=;
        b=7oWj6t3RiIpNbI9WLs6m/jQFYAZatLgjlKt+HReENL5VgzFB1izDIOXF4lS/5PKWk6
         wW/GOKJPHoArDWj2KhMmrXVWM22RWqk/N5rMqh73JVJTQb8Thlwn+7o820kzPgccKzvR
         FllJomdCM1qSpTwtjC2Cwz0D4DeU0n7LlAUUVgOQIkGV/Pzus6Xwo+3VO4beoRSDyjO2
         KnSHF80kxleGIBfn/tOiV8ZHlyqWqp19yDEV/VXlQkQYmJ6Aqfe0mYall1TSHXS7oGy4
         Md0biuP9KYyvMcpZi6vqqlY86UTLe6fwGoeTJ4jgREkfEJNeB1mvarsG99ipw3syPtw2
         swnw==
X-Gm-Message-State: AO0yUKW9u3NBIsnn+6pOsvkjYysrixh6qx/eAiE+XPQ4JFAdVcN+53CF
	YLQqrTr7RhwX5l1Ai9bcYIM=
X-Google-Smtp-Source: AK7set+SAkcIs5rfXITrkT0pTHpCFfl3mQN1WwmkzEiYXYibM5ijVYFwVLVml2c6/95foDLxaGYsBQ==
X-Received: by 2002:a05:600c:4fd1:b0:3dd:1ac2:989 with SMTP id o17-20020a05600c4fd100b003dd1ac20989mr7509937wmq.39.1675258639350;
        Wed, 01 Feb 2023 05:37:19 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h18-20020a05600c2cb200b003dd1bd66e0dsm2008961wmc.3.2023.02.01.05.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 05:37:18 -0800 (PST)
Date: Wed, 1 Feb 2023 16:37:14 +0300
From: Dan Carpenter <error27@gmail.com>
To: sujuan.chen@mediatek.com
Cc: linux-mediatek@lists.infradead.org,
	Masami Ichikawa <masami.ichikawa@miraclelinux.com>,
	cip-dev <cip-dev@lists.cip-project.org>
Subject: [bug report] net: ethernet: mtk_wed: introduce wed mcu support
Message-ID: <Y9prChfI3ExTpK2o@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_053722_522174_5D286F2D 
X-CRM114-Status: UNSURE (   6.73  )
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

Hello Sujuan Chen,

The patch cc514101a97e: "net: ethernet: mtk_wed: introduce wed mcu
support" from Nov 5, 2022, leads to the following Smatch static
checker warning:

	drivers/net/ethernet/mediatek/mtk_wed_mcu.c:82 mtk_wed_update_rx_stats()
	warn: uncapped user loop index 'i'

drivers/net/ethernet/mediatek/mtk_wed_mcu.c
    64 static void
    65 mtk_wed_update_rx_stats(struct mtk_wed_device *wed, struct sk_buff *skb)
    66 {
    67         u32 count = get_unaligned_le32(skb->data);
    68         struct mtk_wed_wo_rx_stats *stats;
    69         int i;
    70 
    71         if (count * sizeof(*stats) > skb->len - sizeof(u32))
    72                 return;

There are two issues.

Bug 1: There is no check that skb->len >= sizeof(u32) so the
get_unaligned_le32(skb->data); can result in an out of bounds read and
the bounds check on count is not effective.

Bug 2: On a 32bit system the "count * sizeof(*stats)" multiplication can
have an integer overflow bug.  Suggestion:

	if (size_mul(count, sizeof(*stats)) > skb->len - sizeof(u32))
		return;

    73 
    74         stats = (struct mtk_wed_wo_rx_stats *)(skb->data + sizeof(u32));
    75         for (i = 0 ; i < count ; i++)
--> 76                 wed->wlan.update_wo_rx_stats(wed, &stats[i]);
    77 }

regards,
dan carpenter


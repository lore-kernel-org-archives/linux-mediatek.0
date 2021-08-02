Return-Path: <SRS0=Q+Xe=MZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FSL_HELO_FAKE,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CDB7C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 03:27:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BD7460F6E
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 03:27:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5BD7460F6E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VT/EWNT06aqbmy6v12WvriZ52W0Btx7h2Gwg3FrX+MU=; b=w3L3AN6KU3yMgO
	s+cC1w8Yrt6EkPOyVNpE3NfkNZw8uw2BfchxWp6DrBBMIrz8hd+v1Ujxn4Kep6RkQHNXwuyr4OuTy
	s60WSYb3DoDUsy0TLCzFVS1/ensavL4M7J85reDO2aobUhyqS+0gypsCnnUDucl2L0El9YYJjIu9C
	CyHlzVSQvb2InHS01SBBVjraDqB7DNiMEp2Dc3SdV8a3wj6u/oMs3j3IY3XouvGMexcp0TwLUJVWl
	MbZ88MEmBHZG74gSrsQ8OhLv0P+uUapswO2qKcuE9VKDx4/imqq7Sy1rZqCjAGolHKLM7umJMYslu
	ATlKmy/JAm+0YWotkjPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAOc0-00EpHh-Lm; Mon, 02 Aug 2021 03:27:32 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAObn-00Ep7l-FJ
 for linux-mediatek@lists.infradead.org; Mon, 02 Aug 2021 03:27:20 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 u13-20020a17090abb0db0290177e1d9b3f7so492534pjr.1
 for <linux-mediatek@lists.infradead.org>; Sun, 01 Aug 2021 20:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TccySR4d9f6K2bAZSrfCed+rWi5fYVMvW07bdg4ljSg=;
 b=wA5XdmZs04xMdzfn8U8bqGmZGAXLG9rpdrtGI6xEU9M3gkKAEajXWdDTyBRMB9YfYb
 KPaWosNiKdc1rYyKsQZ+qpyEUGNFTBYn2LfEmWQxmGqC7A4q+/d34+uJzmYKryDop33p
 0g1Hb9R2ZCh9rHKAM9wlcRAwn3MJRszFv7VDRVLR4iHeEgjpOI3heVWUD49RO9lYq5Az
 cP5+0ICKtJehdimAQsbm4xuMxLHlcBiaS+pKhJmIsBVlsuIEhJkK2jTR4i6w5VmLW6ON
 rNyn/DlC7ja3csj05f1WbMSZaVQ7+NQr3b7e18XtAbG98QdRJZDdln8+keTvtFGEtiPY
 Rsnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TccySR4d9f6K2bAZSrfCed+rWi5fYVMvW07bdg4ljSg=;
 b=FBWGkr1xESdD93O33ZIC4JJnN1LiirteYobBWKAM7sEE8eQR/Z8s7WA0GU6TUwC7ve
 GFpxLAJUhmUO/MO36uNdlC33WPPdmyLFQkMJ5kwuD/pLdaJewnZkjYL09uqdNnTzw4Qd
 748pfjYBK3wm7PI0s3vEC12hSclNfAsqDS8kY/ybPkh6Q2rZeuoQvq4NYEbFqtN8iYvo
 w9ccDsphlYPigyKPa5uWqhLklVeRbhvODPofm+lC1rLXw5nSQ327gcBL5mp8v4X/FgwA
 1lqIANVLFk0IAjPKyadiTChztwprKBkbTfDxthCOqvF5xglj0f3WgacrA1BFCTk3fCw9
 K7aQ==
X-Gm-Message-State: AOAM532xIfu/IhaTaj253+7q2ytWU4zeeDyZGZEdO06aQuBRSTknlBd+
 k7Mn+vNoB7BgBWgBp32SAou1vA==
X-Google-Smtp-Source: ABdhPJxuUMNiBNw7iVAnGTeUxFYDuL3xz++58ek1lZ6xPw5MR9NriVo4l+8Jn6Tf0aqwz0SNLCfyeA==
X-Received: by 2002:a05:6a00:aca:b029:392:9c79:3a39 with SMTP id
 c10-20020a056a000acab02903929c793a39mr14779697pfl.57.1627874828655; 
 Sun, 01 Aug 2021 20:27:08 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:4e86:5558:a761:961])
 by smtp.gmail.com with ESMTPSA id a22sm9091534pfv.113.2021.08.01.20.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 20:27:08 -0700 (PDT)
Date: Mon, 2 Aug 2021 11:27:05 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Peter Hess <peter.hess@ph-home.de>,
 Frank Wunderlich <frank-w@public-files.de>,
 Hsin-Yi Wang <hsinyi@google.com>
Subject: Re: [PATCH] spi: mediatek: Fix fifo transfer
Message-ID: <YQdmCaySpW4Dpz0t@google.com>
References: <20210802030023.1748777-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210802030023.1748777-1-linux@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210801_202719_582437_4688D9C8 
X-CRM114-Status: UNSURE (   7.35  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Aug 01, 2021 at 08:00:23PM -0700, Guenter Roeck wrote:
> Fixes: 3a70dd2d0503 ("spi: mediatek: fix fifo rx mode")
> Cc: Peter Hess <peter.hess@ph-home.de>
> Cc: Frank Wunderlich <frank-w@public-files.de>
> Cc: Tzung-Bi Shih <tzungbi@google.com>
> Cc: Hsin-Yi Wang <hsinyi@google.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Tested-by: Tzung-Bi Shih <tzungbi@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

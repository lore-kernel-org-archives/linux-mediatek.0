Return-Path: <SRS0=mmGE=QF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47C82C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 05:55:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C85E61265
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 05:55:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0C85E61265
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R1/hnAdjNPyJA+/FvvPCwg4ZWUyVWo4lyFGQraDNab8=; b=DxU/qpLqzYpzqS
	MTQQPSmQA9X4Nc187Cu8oRBDWpQfUo3iKRAKRHGuvFa9ERMOsQ/b6rRFdhdk3TqTIE9VGKJqdav0/
	WV7dd2DO/foy6aHG+Aaq3AayUW+pZzF/f8JGo5HWBdF1HwqlfY4I7YgYwlPyt2fTLbnQueZxAYAJz
	/h3FigEvl5Gvj/l6RCxici6NQRkvB00/PN52ysIdZQRWLajct/rNkywY5kCak5zKEKqAbBSa+eQtm
	kAhD7WAviwD1JbaOPCuWTTyvMxeX4WHhjsBEOZ2QNTdhh02Fps9MvgvdfMksRfu2wrqKyjl6cjf+O
	b5NzcxC2fh/fUUjBZpcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnaOC-006w4r-PV; Thu, 18 Nov 2021 05:55:16 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnaO0-006w1z-HV
 for linux-mediatek@lists.infradead.org; Thu, 18 Nov 2021 05:55:05 +0000
Received: by mail-pl1-x632.google.com with SMTP id p18so4271939plf.13
 for <linux-mediatek@lists.infradead.org>; Wed, 17 Nov 2021 21:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bOAzmattOkvcfruVl5Z67av2Rvch+fLPuFTukNGwe3A=;
 b=o8h2sWYLd5XWa+md7lQ/hE89BFxTwwUy4XtrHQu9S0JIDZGO8ox3+0eJbDE04t1IVI
 QfGKFkKmdZf33E1TfOUEvlI1zqG3UEkM6Az6oMMJvLP7hbpHQ0tP6owlxHjzYt6SuXbD
 nSUe71E8Ju++ko9hxCNARkyZhSyf6qCV17RGI70zGHMmPXR9H1EApZCGjeecZbgjLoh8
 lssQ/sVQgHVde0xAD3zZiGN4bjLbEIlv5cTYMnMoJ703XVPoBh6eTu+OgctxMnsIJRtp
 wH0p1+OyiuB1CmqRxlzDR/MiIZh6EfsyY00chfU1D5cT1M+mTRRpEdVj7ona4+VTilrZ
 Nc7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bOAzmattOkvcfruVl5Z67av2Rvch+fLPuFTukNGwe3A=;
 b=WuFsDmTuIos4pT0cMLagRr5PlAqyvjDP6gHIjhCT6wd9XKhfzclDs4GxWCEo8O9rI3
 0xujP1xwmn+UgBubZCs/LN5DFCZMVNXjGb7gt6auEvz5JxT7pHsUy0HXAx7EHtBla7eY
 GytcYe8Rlu6R5wx9WfiRBkjTGbIoEuWS7TatoN8kpTfG9oqrfcY/Rr0EBxAeiy4vEDpU
 RYiF8B/JFMG9gVzEZBbpBEYMxX4OSD9S9OlFyt56tS7bCxmrl6bT3WTVY74GufFle5gQ
 zWUckZFQ5Hea6CU9rm6xAkT4dQ1IZZE/WY6WfLiJ+MwI/YrHa9WEKDQQ2l8K+v+MET49
 Jqzg==
X-Gm-Message-State: AOAM532nTkTefsLBSHTXMtGFWDu8vkQMGCsPto1RatQAVdO0WJ3mYSpC
 Yy2ggVAnezrkNfKDIqk1lwqdrw==
X-Google-Smtp-Source: ABdhPJwUFsDmgl5qVC3k86jpjBVIz7wwm8wMnpc/baXerv1B56NwCz9bhbQbqVjLau27J/nIr7NuBg==
X-Received: by 2002:a17:90b:615:: with SMTP id
 gb21mr7493988pjb.10.1637214899232; 
 Wed, 17 Nov 2021 21:54:59 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:8f8:11d:a96a:74d2])
 by smtp.gmail.com with ESMTPSA id n1sm1504736pfj.193.2021.11.17.21.54.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 21:54:58 -0800 (PST)
Date: Thu, 18 Nov 2021 13:54:55 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 hsinyi@chromium.org, fshao@chromium.org, nancy.lin@mediatek.com,
 singo.chang@mediatek.com
Subject: Re: Fix drm suspend and resume issue
Message-ID: <YZXqrxinyBZkBgfq@google.com>
References: <20211117064158.27451-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211117064158.27451-1-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_215504_628719_E5BFC936 
X-CRM114-Status: UNSURE (   6.70  )
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

On Wed, Nov 17, 2021 at 02:41:55PM +0800, jason-jh.lin wrote:
> Subject: [PATCH 0/3] Fix drm suspend and resume issue

You have 2 Subjects.  The first one takes precedence.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

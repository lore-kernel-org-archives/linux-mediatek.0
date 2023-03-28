Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0783C76195
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 07:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=reWFyQdHA0Txjoyw/asL10WD0B3MGC9C1OYGnj8cjLU=; b=L6D0H925HhTd+XOEl2goF4oPUx
	7lDrjmIF/AIO6lpkcPf96GtTKFIBCFL0GT9pWLlXm9B/PB6pwwc58BabAmeQgAAfvpPvfAkZBUJwL
	5BFLdaEk/Y5h/w6GD/nPsk5wKU+nQWe6KkPRTeO1gzgF2P6NfnAG2L0EqY8KduoC3adWvnQ7nHCPW
	7rdg0ZXrQb0pl1IhKpMnBXpytr8wJt0PfoG9k9kQDft9cNnbTlAomy0dSYLZagnMHMwDGhQHsdBHT
	DDgOIGJAQXnrI4rj3vo2/goDud1wDuXJqsZsEoh5wR9rgOKwIXcFiHSAuoHOAiXyiL7V4QCGjGiqB
	rd418RgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph3yo-00DVkd-2q;
	Tue, 28 Mar 2023 07:42:54 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph3yl-00DViw-04;
	Tue, 28 Mar 2023 07:42:52 +0000
Received: by mail-wr1-x429.google.com with SMTP id r29so11088262wra.13;
        Tue, 28 Mar 2023 00:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679989366;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=reWFyQdHA0Txjoyw/asL10WD0B3MGC9C1OYGnj8cjLU=;
        b=WCqPg7kj6QzLXEOVdoQ1xMWD4fQdgnzUfP73CB10wcAeR2+Rvyv6nLGcAmRfEqAPBN
         uxsVum3wm7djw1PR/wmloQ3SbizDsX/f0KKbyGVdMrIp1eRklDFd+0mUKYHzhJWdy3Ok
         hoK4vhXeeWa7NGRBpfPq9ZeaL9R9E2inGfpoDAD+bZT41NplWgWq2QHxWZWGRX5Pb21M
         yjGyPJV7+LorCR4Qv1Ro9oWOXMjVTMoyQR2HW502gC1l5q/gCpND23aQMEfoLZezPoYG
         NkrPghb3zVtL3KeYo3roJmiQrOEArrxbSVIX7vN/EG+zdE89GSbv5TpVUBTU3imGpeUE
         Ak9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679989366;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=reWFyQdHA0Txjoyw/asL10WD0B3MGC9C1OYGnj8cjLU=;
        b=aXxcZItraCj3ERidc4F3kTlvXVQMiFrOLapFbeD5ccOnwgd4XtBMI1XGIHsaqJ1IL2
         gD8J3De/4vWrsAKZZAYApNsL9ljwzmnXeFQB6p3W/5yHovG1Wk/kBS6RJF2+UP/fKOq3
         hKy1SIW1h9+rDTyUXVpyfpmH9B/Lt89UWs/uFrPlDoLQ9Fmj7qN3McnYXX78B+uZQogt
         ILCWrrnePglmUzkdzwB2qCYA2aL+Yxd9JAY2jQdc3sXhhg9CqZ63xGHRr6M8rukBPlGq
         Xd0zeojqrSNELxQ+dEG8gy4Mbng8/cNazgkMD8ygVQNeKqsj+co8Yt4hG9jFg/WKRMkf
         XhzQ==
X-Gm-Message-State: AAQBX9egCRXVV2xM1f4jA+0rwXcppv+RyGBurYhDcvDNXWnQQrJcXZSb
	I7qwQ0fHeLq6OArDE4C2gVY=
X-Google-Smtp-Source: AKy350ae8pPppl5m9E/fAgObS0u170HobthBF6NK9Qjbn7LyCnoBrzLmAj4S8NpGj1TURzpOwmkCFg==
X-Received: by 2002:a5d:5691:0:b0:2d7:d4b:b33 with SMTP id f17-20020a5d5691000000b002d70d4b0b33mr12209300wrv.21.1679989365793;
        Tue, 28 Mar 2023 00:42:45 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v7-20020a5d4b07000000b002c56af32e8csm26731234wrq.35.2023.03.28.00.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 00:42:45 -0700 (PDT)
Date: Tue, 28 Mar 2023 10:42:42 +0300
From: Dan Carpenter <error27@gmail.com>
To: Yu Zhe <yuzhe@nfschina.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	agross@kernel.org, konrad.dybcio@linaro.org,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	kernel-janitors@vger.kernel.org, liqiong@nfschina.com
Subject: Re: [PATCH v4] remoteproc: remove unnecessary (void*) conversions
Message-ID: <fdcfe2ae-fa49-4758-8b5c-b853cc6a0b80@kili.mountain>
References: <20230328015749.1608-1-yuzhe@nfschina.com>
 <20230328024907.29791-1-yuzhe@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230328024907.29791-1-yuzhe@nfschina.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_004251_062780_D28275BD 
X-CRM114-Status: UNSURE (   8.17  )
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

On Tue, Mar 28, 2023 at 10:49:07AM +0800, Yu Zhe wrote:
> Pointer variables of void * type do not require type cast.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202303272213.jOYrwBZu-lkp@intel.com/
> Signed-off-by: Yu Zhe <yuzhe@nfschina.com>
> ---
> 
> v3->v4:
>  Drop wrong modifies

Seems okay.  (I haven't tried compiling it or anything).

regards,
dan carpenter



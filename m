Return-Path: <SRS0=9yZI=PC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9F25C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 15:55:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9597861040
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 15:55:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9597861040
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TcqqafnZ08qgTyBKFrC5KuVQ4XIIQYcb0fxMQT8r84o=; b=QutyZ130A+KSfP
	5Ezp6aGa8ovVpzImT3T/gY5YogIidd+1n+HEaUiY8jCQT56CURv9XFm9S09EWckGNhTn3l3ka/IKF
	WleVoaG/fynsnr0Dqm4tc1mHc1THzWoCJtk7LfkDoKCt86wqRV6Wv37j9zN8GJw8eBs0wTeHsbKXx
	KBDXMfvNFY6uC4zLM790L1ZXI4lDxLQ04xV5vPPLY+c1JWKPs1f7xbEQPKW/RtrOgCNaJyxMMKH4B
	mzdKWYMISTgkKzWCJHrwjse7NUqxwB7K/A6QZikfCCscmRSGNcy4Yp/QXgjLrwQrR/8z/SHpMZwPq
	hRTS7MOdRZ+euOhr/l5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mb34Y-003lKb-KS; Thu, 14 Oct 2021 15:55:10 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mb34V-003lIb-Ei
 for linux-mediatek@lists.infradead.org; Thu, 14 Oct 2021 15:55:08 +0000
Received: by mail-pl1-x62e.google.com with SMTP id 21so4444417plo.13
 for <linux-mediatek@lists.infradead.org>; Thu, 14 Oct 2021 08:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nCjSrgHZmKOVAdrKCnmUBpdugUK0T0BY++sW/F6Q1jo=;
 b=aK8KU6bwWTdisuYtuFQyuEhM4tDiueBvfPud37Z7IBLRRvNGmoFkSb9IWCBeKGup/S
 S8T6JZ3m8e4c76oFVYz4+wqBfxSg7Esz0qiMhk77BRzNvIZ4E/7KGvS3BvaOMpr+HQeM
 rwu2dy7yl6nkFdM7oU3r9oBb5TOfOF4Nj+P/6mgZlOVm70JnHS1jDYZBqYO1IxjgNcOY
 z/Hlpn5O9FDrc0Yl+IfjCrlETo+ThsRRURqAh/gXuO22p7zjU3JTV8UFvZeT6ZlehHS3
 yU5N+I6Wld6ZgvtXVKrMPIAB2g9DuTbMw+5HlQsQ2AtzVExFO7QjZkKONlJc2uucIVih
 FrRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nCjSrgHZmKOVAdrKCnmUBpdugUK0T0BY++sW/F6Q1jo=;
 b=JnafGn6vg+1GU+mzkEErzIC0JAlNNi07fZJn34gyLzjp7jece/vTB4DQX6k38Xvd3a
 0ZruFzNeLsAg5qDhA05rQRvLOnmwvNlLx80RsS4SBY6ezUBBWkw/pDue80c9M4lT4XfX
 inPqYlFcPK0UQ+rf3KtjIUSZQLm/hXG22IqUpVBHJO42qY40e0bUtIBPesuGASOWA8Ap
 g0pEHcPqM2jceGdBc1n9NWPvGB4s9KeYGObotWBQMwUEEroSOYG7eVY81MV2Zw3YHtQV
 3B7p3QFwyEy8QNWi895foeXuCpS8B5dR8kiZn6Pvuaj/hz8H40ta15WiNNqdDvTq87SA
 ol7A==
X-Gm-Message-State: AOAM531w3+fTHQ929a+zOYJpOd77dywhakU8GRv2zbYyX20BsiSnDrg8
 F+ekInA/lK/Ffs1+I+w5PHkGuA==
X-Google-Smtp-Source: ABdhPJxF4Kv/p5cpUeU23MX/nRu6qLKglUBe8wOxSRaiAWh93w4jg2HGkhUAXoDVOS352Is40q1+7w==
X-Received: by 2002:a17:902:b583:b0:13d:e495:187a with SMTP id
 a3-20020a170902b58300b0013de495187amr5688436pls.9.1634226905538; 
 Thu, 14 Oct 2021 08:55:05 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:1564:8387:11bc:4e82])
 by smtp.gmail.com with ESMTPSA id h1sm3058100pfh.183.2021.10.14.08.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 08:55:05 -0700 (PDT)
Date: Thu, 14 Oct 2021 23:55:02 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Fei Shao <fshao@chromium.org>
Cc: Jassi Brar <jaswinder.singh@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 2/2] mailbox: mtk-cmdq: Fix local clock ID usage
Message-ID: <YWhS1qkwqkmwAyi8@google.com>
References: <20211014120352.1506321-1-fshao@chromium.org>
 <20211014120352.1506321-3-fshao@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211014120352.1506321-3-fshao@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_085507_522276_99B120C3 
X-CRM114-Status: GOOD (  12.95  )
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

On Thu, Oct 14, 2021 at 08:03:52PM +0800, Fei Shao wrote:
> In the probe function, the clock IDs were pointed to local variables
> which should only be used in the same code block, and any access to them
> after the probing stage becomes an use-after-free case.
> 
> Since there are only limited variants of the gce clock names so far, we
> can just declare them as static constants to fix the issue.
> 
> Fixes: 85dfdbfc13ea ("mailbox: cmdq: add multi-gce clocks support for
> mt8195")
> Signed-off-by: Fei Shao <fshao@chromium.org>
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

Return-Path: <SRS0=P26n=GF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B87C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 Jan 2021 22:00:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AA7B207A1
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 Jan 2021 22:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AA7B207A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gondor.apana.org.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tLsk5NWPHrdaQ01WrXMROJ5qbf4wH++/KXFUtZNoazs=; b=geRJCI7jq1KlkqaX7XKRn+Nl8
	tROx1dkgdMhXstTD2IPa6GyZO46eLHsLcpcuqeDQvE3anOpYSqcEDv2vWNK2qqJ888rMsJz0iOOvM
	hT3PItxGB0Z1E57B39CWfm5W9v0uUCL0Y17/XpPvQ/Z74k3cXtWRXSjOUGSGceZ2fDStomoBRgH1x
	uSQGRSQX7ZO3p97Uwwqp27Q5HQf4UWYvfZ2b3ejHu05vgGkefbJ7nW0TaVDEwYnSvQrRDnN5sVvDj
	NMMGy41SWrp0+GvteTdn5K8xIiV3CA6pvcEEyYXKGyRBLFQ/3+pphTJC5Ra2SfJVAi4JOkXMHV5Ix
	8Jur0Iz6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kvowz-0000sc-Re; Sat, 02 Jan 2021 22:00:41 +0000
Received: from helcar.hmeau.com ([216.24.177.18] helo=fornost.hmeau.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kvowt-0000rf-NC; Sat, 02 Jan 2021 22:00:38 +0000
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
 by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
 id 1kvowe-0000Ty-AW; Sun, 03 Jan 2021 09:00:21 +1100
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Sun, 03 Jan 2021 09:00:20 +1100
Date: Sun, 3 Jan 2021 09:00:20 +1100
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Vic Wu <vic.wu@mediatek.com>
Subject: Re: [PATCH] crypto: mediatek - remove obsolete driver
Message-ID: <20210102220020.GA12767@gondor.apana.org.au>
References: <20201207075842.30090-1-vic.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201207075842.30090-1-vic.wu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210102_170035_818169_50AA9339 
X-CRM114-Status: UNSURE (   9.03  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Ryder Lee <ryder.lee@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-crypto@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Dec 07, 2020 at 03:58:42PM +0800, Vic Wu wrote:
> The crypto mediatek driver has been replaced by the inside-secure
> driver now. Remove this driver to avoid having duplicate drivers.
> 
> Signed-off-by: Vic Wu <vic.wu@mediatek.com>
> Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  drivers/crypto/Kconfig                 |   15 -
>  drivers/crypto/Makefile                |    1 -
>  drivers/crypto/mediatek/Makefile       |    3 -
>  drivers/crypto/mediatek/mtk-aes.c      | 1271 ----------------------
>  drivers/crypto/mediatek/mtk-platform.c |  586 ----------
>  drivers/crypto/mediatek/mtk-platform.h |  231 ----
>  drivers/crypto/mediatek/mtk-regs.h     |  190 ----
>  drivers/crypto/mediatek/mtk-sha.c      | 1352 ------------------------
>  8 files changed, 3649 deletions(-)
>  delete mode 100644 drivers/crypto/mediatek/Makefile
>  delete mode 100644 drivers/crypto/mediatek/mtk-aes.c
>  delete mode 100644 drivers/crypto/mediatek/mtk-platform.c
>  delete mode 100644 drivers/crypto/mediatek/mtk-platform.h
>  delete mode 100644 drivers/crypto/mediatek/mtk-regs.h
>  delete mode 100644 drivers/crypto/mediatek/mtk-sha.c

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

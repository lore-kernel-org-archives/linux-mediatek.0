Return-Path: <SRS0=K2BI=IC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D19FC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Mar 2021 06:28:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3CD264EE3
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Mar 2021 06:28:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3CD264EE3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gondor.apana.org.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uM25fuy5q5PWBAsk0j+tQtB3x5piEwFE2T5nfIx5PW4=; b=BqjxzovZqiWi/QL9JdRNa1G9I
	AtNKkHUjccVRKxTGVYrgGjQ/bXE4wOWQ49hB0tNxLygemTbJFkd6RzQRpsB49fGZJTR1mDOFFj70i
	ZR8ckzlLCJYnmVaiSJXbyjEBMHExq/HTfoei/jXqpYs5JlVCe0GCd1WKTjadNZSkp04Xil/bYNup5
	2UcZb9/Ia0arD7dYViIm8LY/TmQEygR5ZwkdTb4SPlYITPiOdWryaldLPJKwyxUbmhVLwqgTpKw94
	4YM0Y/hLnHlqmIVLHgt3SdaWhhWIPJ+WWpysmOvul+MVM6FF4Jd1uY6y0PDTGOJKGIc9Wq/RuYybZ
	JkN5sKzSA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHhSu-007vEB-I4; Thu, 04 Mar 2021 06:28:04 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHhSp-007vDG-DF; Thu, 04 Mar 2021 06:28:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=qY+hpYBOveCI8Pg3WBMYKpJF2n9ALXSLFfXX/pdXvZM=; b=h4YEHEATKotM+sXZqQNteVnQ+q
 ewR5GlWY/uOxUnY7qQSXEN5FnHwOSi2hCYiY9hpogG31zAAAlrW1k3L17AvZNw5JoW/EBHXigIBBj
 8YSQD/K20Wx0co5loJvckfqrPK0lTpxfv66q/IbcOb9BiqCcYDBis+d0Cuff4XJqfFwHpvKkJyXTl
 ULbsysPcnknXmw4I3dtev0THYI0tDOPwwuhbmtUK55Rx+rACm95bUbib/p5g0Rcfm5F9W5s8uZV42
 FgT3hxdOluzkGyIYZnwWBt3ddiSlyRm5Jz9AyL0P7kFBB+rIKThGIe2WXMBt04jNdPk52Yvn++kuG
 tvLI0Jgg==;
Received: from helcar.hmeau.com ([216.24.177.18] helo=fornost.hmeau.com)
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHhSm-005rHq-Af; Thu, 04 Mar 2021 06:27:56 +0000
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
 by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
 id 1lHhRd-0007I3-Am; Thu, 04 Mar 2021 17:26:46 +1100
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Thu, 04 Mar 2021 17:26:44 +1100
Date: Thu, 4 Mar 2021 17:26:44 +1100
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Allen Pais <allen.lkml@gmail.com>
Cc: davem@davemloft.net, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
 jesper.nilsson@axis.com, lars.persson@axis.com,
 horia.geanta@nxp.com, aymen.sghaier@nxp.com, gcherian@marvell.com,
 thomas.lendacky@amd.com, john.allen@amd.com, gilad@benyossef.com,
 bbrezillon@kernel.org, arno@natisbad.org, schalla@marvell.com,
 matthias.bgg@gmail.com, jamie@jamieiles.com,
 giovanni.cabiddu@intel.com, heiko@sntech.de, krzk@kernel.org,
 vz@mleia.com, k.konieczny@samsung.com, linux-crypto@vger.kernel.org,
 linux-mediatek@lists.infradead.org, qat-linux@intel.com,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 Allen Pais <apais@linux.microsoft.com>,
 Romain Perier <romain.perier@gmail.com>
Subject: Re: [PATCH v5 01/19] crypto: amcc: convert tasklets to use new
 tasklet_setup() API
Message-ID: <20210304062644.GA5107@gondor.apana.org.au>
References: <20210208094238.571015-1-allen.lkml@gmail.com>
 <20210208094238.571015-2-allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210208094238.571015-2-allen.lkml@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210304_062756_871822_4D432018 
X-CRM114-Status: GOOD (  10.99  )
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

On Mon, Feb 08, 2021 at 03:12:20PM +0530, Allen Pais wrote:
> From: Allen Pais <apais@linux.microsoft.com>
> 
> In preparation for unconditionally passing the
> struct tasklet_struct pointer to all tasklet
> callbacks, switch to using the new tasklet_setup()
> and from_tasklet() to pass the tasklet pointer explicitly.
> 
> Signed-off-by: Romain Perier <romain.perier@gmail.com>
> Signed-off-by: Allen Pais <apais@linux.microsoft.com>
> ---
>  drivers/crypto/amcc/crypto4xx_core.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

This introduces a compiler warning with C=1 W=1.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

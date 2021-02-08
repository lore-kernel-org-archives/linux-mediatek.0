Return-Path: <SRS0=Odcq=HK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45723C433E9
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 09:47:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB2FC64E92
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 09:47:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB2FC64E92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hrUvUw+9TQhzA6mJtSAS0Frjs/444HJlZSmguWT9yPo=; b=KXJPR3pJMokwS8gsz+kKlWFS6
	usNtWT6k9qHiR95W09iIKjUfe0GdmsZoRJTgQt93mYu9fs6BdeGAWxvO7SfspcVDAtKRd5gpdeP7d
	1YSHo4FF9C5xZclO5Zmg3ilzVxi9oAPLbSnWPGZQzBRohYjhAGcZpy5X9UmqryvwU0akAYYu0Xco/
	pag0DfuONL9oK2aD38o8mZcE2tnu+tsuO1zxQ3wF4DrulhTZyPFax86ipFP4Z/hp8H1asPvhXd2c/
	WD8W0hxL4pFNF4iSu2Q/IP9xW13fPB3BnLScbFpey9cAKYfoPihL/vXeugfyrq/OdiM/nCuyzZN9s
	0ZQKWKgwg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l938L-0007hq-8f; Mon, 08 Feb 2021 09:47:05 +0000
Received: from linux.microsoft.com ([13.77.154.182])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l938J-0007hI-3C; Mon, 08 Feb 2021 09:47:04 +0000
Received: from [192.168.0.114] (unknown [49.207.205.214])
 by linux.microsoft.com (Postfix) with ESMTPSA id D633E20B6C40;
 Mon,  8 Feb 2021 01:46:50 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D633E20B6C40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1612777619;
 bh=R2/ccuzxb5NZv2ZzRkculnBKFeUjJYNG5AB4+Yu0bPg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=i7FLf4yy+QFOBtd9kBrZwl6Reg9zTXFL221Zf9UmnfgsJ1QxJgb+YPXbwmnCK5jBU
 3f4umBqomg54xaCDL6BAnr+RNGBQQKWoPOsJWz6gIupXFeQeBlDDI+KOUSxP3+Dkwc
 yZFpPuu2DsXGMAK45zKF10uQyObDY1+wgEX801pk=
Subject: Re: [PATCH v5 00/19]crypto: convert tasklets to use new tasklet_setup
 API()
To: Allen Pais <allen.lkml@gmail.com>, herbert@gondor.apana.org.au
References: <20210208094238.571015-1-allen.lkml@gmail.com>
From: Allen Pais <apais@linux.microsoft.com>
Message-ID: <9e26b2b1-2bd3-4398-5ed1-981eac87953d@linux.microsoft.com>
Date: Mon, 8 Feb 2021 15:16:42 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210208094238.571015-1-allen.lkml@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_044703_394948_EF027C06 
X-CRM114-Status: GOOD (  14.03  )
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
Cc: giovanni.cabiddu@intel.com, alexandre.belloni@bootlin.com,
 aymen.sghaier@nxp.com, heiko@sntech.de, qat-linux@intel.com,
 jamie@jamieiles.com, jesper.nilsson@axis.com,
 linux-samsung-soc@vger.kernel.org, horia.geanta@nxp.com,
 k.konieczny@samsung.com, schalla@marvell.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, ludovic.desroches@microchip.com,
 thomas.lendacky@amd.com, arno@natisbad.org, vz@mleia.com, gilad@benyossef.com,
 gcherian@marvell.com, linux-mediatek@lists.infradead.org,
 lars.persson@axis.com, matthias.bgg@gmail.com, john.allen@amd.com,
 bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 linux-crypto@vger.kernel.org, davem@davemloft.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


> From: Allen Pais <apais@linux.microsoft.com>
> 
> Commit 12cc923f1ccc ("tasklet: Introduce new initialization API")
> introduced a new tasklet initialization API. This series converts
> all the crypto modules to use the new tasklet_setup() API
> 
> The series is based on v5.11-rc4 (19c329f68089)

  I missed updating this bit. The series is based on
v5.11-rc7 (92bf22614b21).

Thanks.

> v5:
>    - Fix amcc build failure.
> 
> v4:
>    - added acks
>    - fixed checkpatch errors(Giovanni Cabiddu)
> 
> v3:
>    - fixed rockchip driver(Emil Renner Berthing)
> 
> v2:
>    - added acks
>    - addressed comments [Krzysztof and Gilad]
> 
> Allen Pais (19):
>    crypto: amcc: convert tasklets to use new tasklet_setup() API
>    crypto: atmel: convert tasklets to use new tasklet_setup() API
>    crypto: axis: convert tasklets to use new tasklet_setup() API
>    crypto: caam: convert tasklets to use new tasklet_setup() API
>    crypto: cavium: convert tasklets to use new tasklet_setup() API
>    crypto: ccp: convert tasklets to use new tasklet_setup() API
>    crypto: ccree: convert tasklets to use new tasklet_setup() API
>    crypto: hifn_795x: convert tasklets to use new tasklet_setup() API
>    crypto: img-hash: convert tasklets to use new tasklet_setup() API
>    crypto: ixp4xx: convert tasklets to use new tasklet_setup() API
>    crypto: mediatek: convert tasklets to use new tasklet_setup() API
>    crypto: omap: convert tasklets to use new tasklet_setup() API
>    crypto: picoxcell: convert tasklets to use new tasklet_setup() API
>    crypto: qat: convert tasklets to use new tasklet_setup() API
>    crypto: qce: convert tasklets to use new tasklet_setup() API
>    crypto: rockchip: convert tasklets to use new tasklet_setup() API
>    crypto: s5p: convert tasklets to use new tasklet_setup() API
>    crypto: talitos: convert tasklets to use new tasklet_setup() API
>    crypto: octeontx: convert tasklets to use new tasklet_setup() API
> 
>   drivers/crypto/amcc/crypto4xx_core.c          | 10 ++---
>   drivers/crypto/atmel-aes.c                    | 14 +++----
>   drivers/crypto/atmel-sha.c                    | 14 +++----
>   drivers/crypto/atmel-tdes.c                   | 14 +++----
>   drivers/crypto/axis/artpec6_crypto.c          |  7 ++--
>   drivers/crypto/caam/jr.c                      |  9 ++--
>   drivers/crypto/cavium/cpt/cptvf_main.c        |  9 ++--
>   drivers/crypto/cavium/nitrox/nitrox_common.h  |  2 +-
>   drivers/crypto/cavium/nitrox/nitrox_isr.c     | 13 +++---
>   drivers/crypto/cavium/nitrox/nitrox_reqmgr.c  |  4 +-
>   drivers/crypto/ccp/ccp-dev-v3.c               |  9 ++--
>   drivers/crypto/ccp/ccp-dev-v5.c               |  9 ++--
>   drivers/crypto/ccp/ccp-dmaengine.c            |  7 ++--
>   drivers/crypto/ccree/cc_fips.c                |  8 ++--
>   drivers/crypto/ccree/cc_request_mgr.c         | 12 +++---
>   drivers/crypto/hifn_795x.c                    |  6 +--
>   drivers/crypto/img-hash.c                     | 12 +++---
>   drivers/crypto/ixp4xx_crypto.c                |  4 +-
>   .../crypto/marvell/octeontx/otx_cptvf_main.c  | 12 +++---
>   drivers/crypto/mediatek/mtk-aes.c             | 14 +++----
>   drivers/crypto/mediatek/mtk-sha.c             | 14 +++----
>   drivers/crypto/omap-aes.c                     |  6 +--
>   drivers/crypto/omap-des.c                     |  6 +--
>   drivers/crypto/omap-sham.c                    |  6 +--
>   drivers/crypto/picoxcell_crypto.c             |  7 ++--
>   drivers/crypto/qat/qat_common/adf_isr.c       |  5 +--
>   drivers/crypto/qat/qat_common/adf_sriov.c     | 10 ++---
>   drivers/crypto/qat/qat_common/adf_transport.c |  4 +-
>   .../qat/qat_common/adf_transport_internal.h   |  2 +-
>   drivers/crypto/qat/qat_common/adf_vf_isr.c    | 11 +++--
>   drivers/crypto/qce/core.c                     |  7 ++--
>   drivers/crypto/rockchip/rk3288_crypto.c       | 14 +++----
>   drivers/crypto/s5p-sss.c                      | 13 +++---
>   drivers/crypto/talitos.c                      | 42 +++++++++----------
>   34 files changed, 154 insertions(+), 182 deletions(-)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

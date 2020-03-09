Return-Path: <SRS0=iNWv=42=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B27C10DCE
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Mar 2020 01:35:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED4BE2064A
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Mar 2020 01:35:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W8PkAmXX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="TYv063EY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED4BE2064A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C7Vo3BGzCKLI2AHgKiwgZM0KEx6HIZJMXnVCptG9H3Q=; b=W8PkAmXXStfWeI
	fMF+opXBWUjg4+YtcLXcrGp+ClTQ7ayoo08Klu894epFVAjT2E0kYQkuMaRmoaF4pXnBiw/Sm9Cg3
	Et3ygCTCSnTsuAyHrZE89su5wqckJTcZYWS/PL4bsVsYw6eHrQ1tujn3m8qCjoAd4NYur/WQl0TtF
	PMsc69RoyuwuwB7st4D5ED4D3gdfbv0/fidIHKLyc9Ejzoxk+c6XBO615otDzhI094HiRlpZudNBb
	puzg8rvBufJ1MH5di7AzTFAX72wIkB/WRW5/HORSv+UmQE8ZzKWAp7bc5a0FPZZmiUMuZBBUVo50L
	lMnFNvNqT+jCU/EdYwqw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jB7KP-00063i-CS; Mon, 09 Mar 2020 01:35:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jB7KM-00062e-Cv
 for linux-mediatek@lists.infradead.org; Mon, 09 Mar 2020 01:35:31 +0000
X-UUID: bb5055751f584baca27da281ef9b185c-20200308
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=/2+LDngAwdJSa5uqOU8IW5tlL8Vd0+38SPAO9Uher5E=; 
 b=TYv063EYYvqu9mR6l41nHX7r9Prrsp5our8MGMEUy+waJXHuFdCx6BcI0NMSKqa5vvIC+PK2uLK8LM2ZwQofxpql1bdFggfOD5jiAVGQWHAt4hK9vfpSZIKdyI+t7apyb4utbAO+8BuJkGjM/fQbEycSh+NgTg4ax4XxQihX68E=;
X-UUID: bb5055751f584baca27da281ef9b185c-20200308
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2023347553; Sun, 08 Mar 2020 17:35:20 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 8 Mar 2020 18:35:17 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 9 Mar 2020 09:34:23 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 9 Mar 2020 09:35:35 +0800
Message-ID: <1583717717.24810.2.camel@mtksdaap41>
Subject: Re: [PATCH] MAINTAINERS: Update Chun-Kuang Hu's email address
From: CK Hu <ck.hu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 9 Mar 2020 09:35:17 +0800
In-Reply-To: <20200308045201.3163-1-chunkuang.hu@kernel.org>
References: <20200308045201.3163-1-chunkuang.hu@kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200308_183530_449185_ACBC8FDD 
X-CRM114-Status: UNSURE (   8.70  )
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, 2020-03-08 at 12:52 +0800, Chun-Kuang Hu wrote:
> Update my email address to @kernel.org
> 

Applied to mediatek-drm-next-5.7 [1].

[1]
https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-next-5.7

Regards,
CK

> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 38fe2f3f7b6f..dceaeebce52a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5607,7 +5607,7 @@ F:	include/uapi/drm/lima_drm.h
>  T:	git git://anongit.freedesktop.org/drm/drm-misc
>  
>  DRM DRIVERS FOR MEDIATEK
> -M:	CK Hu <ck.hu@mediatek.com>
> +M:	Chun-Kuang Hu <chunkuang.hu@kernel.org>
>  M:	Philipp Zabel <p.zabel@pengutronix.de>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Supported

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

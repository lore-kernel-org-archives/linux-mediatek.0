Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72AA7C43461
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 15:15:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14FE220639
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 15:15:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T/xDa+Rc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G5kLPjlg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14FE220639
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4ZlclEQbRWWiA8st+hnaIBsJd8m+NqCMipDxsO5Hn1E=; b=T/xDa+RccvtVjiMDMLkJ3f6hW
	3oepFcmedm9gMdwuLdz2NrDl7k4ipsuVIKGjPs0mQlYw2eHyk87kl5BKVHzs2qeQm4+jnITMh882O
	490HC7eFue5tpOO5NObm+U/RboPznA6Zn4gEr4VFV3zM9X66f/8Rz9jV6CMrnTAYYScbmn1Wbn1yp
	oML1FsMLGvk2OaE2JUJLeQll1gOyPaaaRlkgOMdQwufusBFhcvhR6A65SLxsniresCYV+i8h1OZY0
	r7GYmIgeG4tH7V5H7IxnEPW0FkiYTuy/HWehbb/MQv0pqPm8eNqWTnoHqEmy1fKWCxSzgnQ+C+Hze
	tTqiAAPzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHqCb-0003Ev-W0; Mon, 14 Sep 2020 15:15:34 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHqCE-00034J-4I; Mon, 14 Sep 2020 15:15:12 +0000
Received: by mail-ot1-x342.google.com with SMTP id o6so270854ota.2;
 Mon, 14 Sep 2020 08:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CfDNK8oDiRlyO66Z8NrDw//xEhow0np5RFaxDAoV1Us=;
 b=G5kLPjlgtm18L1Zrk53vSmHlCuxF2mzzwOEz+DaS+uAQHUccyXn+US0pKfqp2u/5df
 JjsrgjRFnvOA6XNeMxHdljAlqVz6ULDfx57rmDXE9YzMlvovjJ+GJ0sOnAXb+WoippyP
 YZYHBHsl9a7l0BDbK3Q/ppciRwP6a25/v4n92hZrNV2r9DpyhqgCcAXhRAxTmu94bZrj
 CKLSQltJS7+gTaxs3caCIGWfF+MTp+xw6qAxFZNsD24HbgLs7OQc4F8d/zhj9ryJpmjs
 i3rRckQ1slL9PVjIJKMM4y2iPzDU+H9DCvSAZez7kmzHZ2AcKSl4CyihwhlEWRLgmdkf
 OKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=CfDNK8oDiRlyO66Z8NrDw//xEhow0np5RFaxDAoV1Us=;
 b=RnOPJSGiePJoOuMqFn/JPYxzR1vlfNWDkhk+p9cIaoQ0nV32VLNfJgeoH5ZlDdG7nQ
 hs6QT5bK/5xIvXLd1Y/d6hTmfjMb8lzNiRzGPgwQcFCzAd44iHiRaMVy4O/8sWaULMWN
 e70u4XyxJeZuUJS2UXcY9sYcnD6cGioR4u+MTd6xRsqSjBFWwBSRE99NM34ZrvCDPy4j
 0Mm0XrEUCG6Sl1Wm1zPbYk/168PbrtQkQ3zTV1TYyDqIK6Kx7OIvSqftg08i0ZJ1JX2n
 qOi/W/IvQVYCsSPw1IDP4MSVF9qjhMsrt5nVg1hCELu9QQHsmZQArzJDHFKG8MytadKQ
 jW8A==
X-Gm-Message-State: AOAM533od1aLK47Ye8sKPAcycZdOmvprItn5aRqcs0MurJH6Shx54xvC
 b4wR6YjO/6vCty+/fCVJTos=
X-Google-Smtp-Source: ABdhPJyvX8wq/8kbyWJRbVwmSAvlmfbczxKY2iXoDZC9+gtlpV1r/A3oKXBxARKHgJ6JLfUQNyXnIw==
X-Received: by 2002:a9d:7841:: with SMTP id c1mr9943615otm.318.1600096508210; 
 Mon, 14 Sep 2020 08:15:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 v25sm3433869ota.39.2020.09.14.08.15.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2020 08:15:07 -0700 (PDT)
Subject: Re: [v4,4/5] dt-binding: mt8192: add toprgu reset-controller head file
To: Crystal Guo <crystal.guo@mediatek.com>, robh+dt@kernel.org,
 matthias.bgg@gmail.com
References: <20200803071501.30634-1-crystal.guo@mediatek.com>
 <20200803071501.30634-5-crystal.guo@mediatek.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <72032ece-5162-d728-0c29-f25cd35c0c9e@roeck-us.net>
Date: Mon, 14 Sep 2020 08:15:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200803071501.30634-5-crystal.guo@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_111510_222415_53E4B5C4 
X-CRM114-Status: GOOD (  17.64  )
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
Cc: linux-watchdog@vger.kernel.org, srv_heupstream@mediatek.com,
 seiya.wang@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 8/3/20 12:15 AM, Crystal Guo wrote:
> add toprgu reset-controller head file for MT8192 platform
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  .../reset-controller/mt8192-resets.h          | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 include/dt-bindings/reset-controller/mt8192-resets.h
> 
> diff --git a/include/dt-bindings/reset-controller/mt8192-resets.h b/include/dt-bindings/reset-controller/mt8192-resets.h
> new file mode 100644
> index 000000000000..84fee34f1c32
> --- /dev/null
> +++ b/include/dt-bindings/reset-controller/mt8192-resets.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2020 MediaTek Inc.
> + * Author: Yong Liang <yong.liang@mediatek.com>
> + */
> +
> +#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8192
> +#define _DT_BINDINGS_RESET_CONTROLLER_MT8192
> +
> +#define MT8183_TOPRGU_MM_SW_RST					1
> +#define MT8183_TOPRGU_MFG_SW_RST				2
> +#define MT8183_TOPRGU_VENC_SW_RST				3
> +#define MT8183_TOPRGU_VDEC_SW_RST				4
> +#define MT8183_TOPRGU_IMG_SW_RST				5
> +#define MT8183_TOPRGU_MD_SW_RST					7
> +#define MT8183_TOPRGU_CONN_SW_RST				9
> +#define MT8183_TOPRGU_CONN_MCU_SW_RST			12
> +#define MT8183_TOPRGU_IPU0_SW_RST				14
> +#define MT8183_TOPRGU_IPU1_SW_RST				15
> +#define MT8183_TOPRGU_AUDIO_SW_RST				17
> +#define MT8183_TOPRGU_CAMSYS_SW_RST				18
> +#define MT8192_TOPRGU_MJC_SW_RST				19
> +#define MT8192_TOPRGU_C2K_S2_SW_RST				20
> +#define MT8192_TOPRGU_C2K_SW_RST				21
> +#define MT8192_TOPRGU_PERI_SW_RST				22
> +#define MT8192_TOPRGU_PERI_AO_SW_RST			23
> +
> +#define MT8192_TOPRGU_SW_RST_NUM				23
> +
> +#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8192 */
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

Return-Path: <SRS0=1z9j=NJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20669C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 14:13:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E67D9610C9
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 14:13:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E67D9610C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=vanguardiasur.com.ar
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/rnwzwL5JCUMUDzQ1t5kko/oH7ep6aZ1qQu7hh3ETsc=; b=az/fvRutZdj30g
	b8oS+6xAavhcVpflTv8MTnSsxYfBQxLEijB+GiBh9P8lrLRfHU8jZnN2/Q8undSkrkVWFsagPBBdi
	MbItCz3WOmCGgdlAldL6b+ZbfGzOeaKJlw3uVkycSIRQ52UVRD0ov3ckSlZbhnCq77J6XVwzSiG9G
	cAsWDRmAojast5N9FDTLiNWVbGDETysBknZq6XsgFbScVHy5z9aGTrTFuWZbslMNTEsoeWafufc/+
	5qtxSRHRhaxVTR+Dns/wUULJGSlhAOyQcuUT8ft/3xQhRj5awJbpAq+7MukCgBMt88gwnvPAuqGSv
	m8fBDhQKFkcq9DePArhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGMJD-005pgQ-BQ; Wed, 18 Aug 2021 14:12:47 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGMIc-005pRJ-Vv
 for linux-mediatek@lists.infradead.org; Wed, 18 Aug 2021 14:12:12 +0000
Received: by mail-ed1-x52a.google.com with SMTP id r19so3325203eds.13
 for <linux-mediatek@lists.infradead.org>; Wed, 18 Aug 2021 07:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eB91atCKNaWXZ4G9jJEBMaY5XPxe3TqKcsNVpOzbuIg=;
 b=DTpujLDvvVlnCM0pQBx0BGUvqOtWu8KBNz/CCnb7ZL5qIIyj7oaB3Y+4sG+KNhUGLW
 QODJIvfC/DH/QkIFP9RbwFPkJPfBFs6cRwVYwKnmsLfbvPwhM5XuQKyQMvEihdS7/h6a
 OliQ4yemaAPXBuf+QpGJZJSXwNRm2FepmDXyvB0z4o3M3N4/pSvlRBHUwQM4y8TYj31K
 xcA7guBOAdi/pbrejynrby1xf9Bq9kk5S2qRJ1gsLRTlU3LWDAxGLOU+yCb4SY9qZDqC
 H8sTkMkmtdJix9r6CICDC7d34EnN+F4Si5DBumcF8AzLxuik7TCkS+UPlSlqiAZLWKfv
 YiEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eB91atCKNaWXZ4G9jJEBMaY5XPxe3TqKcsNVpOzbuIg=;
 b=PdB9S9TEbAZBKY5tyKWaoRU4m+QWKW8CtoWWV41Abt6AVru7yfJfbnMnkS8/mxJ1cf
 V6c1aZS3QEevuXcPLf+KgIkOVgQ74u74/qyugQ2NlI3Y6vjYWDc7bEXNqmhjeS1PDrHy
 AvEm5Lh3sXH7XhvhnCL0TJI+i9Pk09ORbAVX9CHgaWKl4wJoR0L4h9BV11lR09n0JCwW
 av4JrY7pTgSjOW2l1OMbn4jGCdXr7/gj2JxfhVMi0W7q7YycMBVSM8cNAHc3/AUfsx2k
 gyZ3Sc9az6+VJlORlWiPl0i8dTvSfLjp9q6p/ecA2JMeOzJLIAMoDxaMBW53bpnum0Ia
 hB9A==
X-Gm-Message-State: AOAM530orqF+QAXYQ/JanX+C+Swqs0PgzlCJLJ4RV8wBSAHoF3oS0yOx
 yfU4f1THwE2jVAtrOyn1HZfa7NNvGBzsGnil+6B0Cw==
X-Google-Smtp-Source: ABdhPJyCq8sH0IgDkVaL6YJK/HNWvHaqTzC1UOGz6EehLJOQW2PJ8Uo0EyT8gsWJU0/XrPvHBEQEwKmT97rUZZwiONY=
X-Received: by 2002:aa7:db8b:: with SMTP id u11mr10261665edt.362.1629295928412; 
 Wed, 18 Aug 2021 07:12:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210811025801.21597-1-yunfei.dong@mediatek.com>
In-Reply-To: <20210811025801.21597-1-yunfei.dong@mediatek.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Wed, 18 Aug 2021 11:11:57 -0300
Message-ID: <CAAEAJfDWOzCJxZFNtxeT7Cvr2pWbYrfz-YnA81sVNs-rM=8n4Q@mail.gmail.com>
Subject: Re: [PATCH v5, 00/15] Using component framework to support multi
 hardware decode
To: Yunfei Dong <yunfei.dong@mediatek.com>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Tzung-Bi Shih <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Fritz Koenig <frkoenig@chromium.org>, Irui Wang <irui.wang@mediatek.com>, 
 linux-media <linux-media@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 srv_heupstream <srv_heupstream@mediatek.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 George Sun <george.sun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_071211_090640_5A225C71 
X-CRM114-Status: GOOD (  15.87  )
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

+danvet

Hi,

On Tue, 10 Aug 2021 at 23:58, Yunfei Dong <yunfei.dong@mediatek.com> wrote:
>
> This series adds support for multi hardware decode into mtk-vcodec, by first
> adding component framework to manage each hardware information: interrupt,
> clock, register bases and power. Secondly add core thread to deal with core
> hardware message, at the same time, add msg queue for different hardware
> share messages. Lastly, the architecture of different specs are not the same,
> using specs type to separate them.
>

I don't think it's a good idea to introduce the component API in the
media subsystem. It doesn't seem to be maintained, IRC there's not even
a maintainer for it, and it has some issues that were never addressed.

It would be really important to avoid it. Is it really needed in the
first place?

Thanks,
Ezequiel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

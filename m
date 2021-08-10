Return-Path: <SRS0=C/QR=NB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B62C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 08:48:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99F7D60F25
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 08:48:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 99F7D60F25
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=szQMiJUfYCBXKIkwvnQye4XkysP8rTTO+8GBpalQ9Ug=; b=N+26rO269X6Ije1hMKLSxf6ZrM
	SteCwItS1rNDiQmBEb44SZDe58Xmw5PtCaWA1o6mxanE7GYJajqhlaHs7XirAeNma/fkML5eV9KcK
	4Um547QJhX+GZ7DkkgfnxAeydc9giM1KyO3MdPMc4Y7ctggU8E2OtVLQETzzB12jsnyQUZAF2FLZP
	D0AqB9TqaJ0dH7B752pmdeYK/XtNW0NFrf90HeKExsl3MTUAw/5QalVkHLXD9KONT4Yx0Qf7LBhRM
	d2CBVWwDZnXc7sPo7LaiwBLFafG06l5vDwSuuHs1OQcaQ8evBBX6+FJGWCL6K1grWn4ntOLGzBUnJ
	bCvUdf/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDNQT-0038LS-Sz; Tue, 10 Aug 2021 08:47:57 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDNOw-0037hp-E6; Tue, 10 Aug 2021 08:46:23 +0000
Received: by mail-wr1-x42f.google.com with SMTP id b13so25204062wrs.3;
 Tue, 10 Aug 2021 01:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OB6UtG4zFPtQqAnDfNSTJxFcLRUWyCnisk7BYFNOzqE=;
 b=MerkW78o00SexssjoYMursF3joCceU4hD/5+wHLYpy7d/PfUX8ryPbMCCupegOkeHB
 HGd71w077wojxCfKiNmEuEbmFnSB4py22cDyeGkMMiRuAG0g/cRNUrlzUUqYAnpzHMfJ
 6DmexI6xrZ+TyEwj9kq8PKP25/kJSuE4uaeB4dzTinACNPKTXLziqiAmQnyPji0U4bCn
 X1BYBwXyEdBkbSYHqnW9AEx6ILBMH5lAJdWPocfstxodvSdKy1MVghgpAB91WXrRjZzF
 zdLbFsJC7Z/Vi+nMWAhOcM5D5r1vLwdIXHCbMvMri7Bvy6F0FUaWLXnTaoLD7IkMJSqs
 xuEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OB6UtG4zFPtQqAnDfNSTJxFcLRUWyCnisk7BYFNOzqE=;
 b=hntrC5jxHO8rZrrUjfVxAnJDAoqpVQG9v+4slJFWVX4jaYYNieB3ghoB0kpkBtFHqV
 oZZ8S0bvcKsDsYC9a12ksEJSwKB/yCdMQ0Znu9NRo7xpWrRwS15jFWZPn+DVJ6fPNTlR
 IcBuNU+njrVNn3j09FMEdF2Aml3huefvAyeZLN6awR4XhYF66GZ8pXG/4KmStQzfRTZm
 /O12aaK/a/9/5JU5B3aBNSSuJd+fqAHWbIJ/mbxhJwM3hRA3wg83l8VNIXkUpFHRv1Og
 HKfkh3hiZpZYHptJ6d76EYs6F2ZUinWQTfLNF9wSun5DiK3N9y6ABsbjMLzHyr0EG49f
 H4QQ==
X-Gm-Message-State: AOAM531TUNLPFm31LIxUBnpe5rlQzGmgH/bCIgnmHA/DRgF90KoUyaMk
 yw+xfHVHRxAIC0VGaNQwPgA=
X-Google-Smtp-Source: ABdhPJz97nyY/SNStvhPEdEAKxnpS8lnpteyvnRLKrJfZ8hjlqRCL9wOivECar5o2rREqAcCv2P3eg==
X-Received: by 2002:adf:80e8:: with SMTP id 95mr29812738wrl.388.1628585181037; 
 Tue, 10 Aug 2021 01:46:21 -0700 (PDT)
Received: from ziggy.stardust ([207.188.163.204])
 by smtp.gmail.com with ESMTPSA id j6sm7920180wms.44.2021.08.10.01.46.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 01:46:20 -0700 (PDT)
Subject: Re: [PATCH v8, 0/2] soc: mediatek: mmsys: add mt8192 mmsys support
To: Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jassi Brar <jassisinghbrar@gmail.com>, Fabien Parent <fparent@baylibre.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Hsin-Yi Wang <hsinyi@chromium.org>
References: <1627894773-23872-1-git-send-email-yongqiang.niu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <e4afa712-9936-15fc-ad43-576948758f6c@gmail.com>
Date: Tue, 10 Aug 2021 10:46:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1627894773-23872-1-git-send-email-yongqiang.niu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_014622_548092_A0E3201D 
X-CRM114-Status: GOOD (  11.09  )
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



On 02/08/2021 10:59, Yongqiang Niu wrote:
> base v5.14-rc1
> 
> Yongqiang Niu (2):
>   soc: mediatek: mmsys: add comp OVL_2L2/POSTMASK/RDMA4
>   soc: mediatek: mmsys: Add mt8192 mmsys routing table
> 

Series queued in v5.15-tmp/soc

Thanks

>  drivers/soc/mediatek/mt8192-mmsys.h    | 67 ++++++++++++++++++++++++++++++++++
>  drivers/soc/mediatek/mtk-mmsys.c       | 11 ++++++
>  include/linux/soc/mediatek/mtk-mmsys.h |  3 ++
>  3 files changed, 81 insertions(+)
>  create mode 100644 drivers/soc/mediatek/mt8192-mmsys.h
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

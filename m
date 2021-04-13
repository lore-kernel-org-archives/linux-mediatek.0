Return-Path: <SRS0=dZqu=JK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61FE5C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 16:34:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29F0A60720
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 16:34:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29F0A60720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JlzFO/7bq6DAfztlZwrSAU2Wh++NkmZ7NXpwpU1tsVg=; b=rPD9yhJRvS7UbFlmkuLCAWDve
	5V8W+WAH1WUTXfMJ9ivgFlK08DOVONRt/F1LYWlliCC+zZfmJORVuyLLQhtzrZHfOzOrSMtV8m4Ql
	e9AtIwh2unRMdvSK9eImXks2ofjqiSPIefHy/C+LQXJJ5+7ic4to4ac4bnWMjBnrzUzAX6IO+3O+8
	2aWbky5t/ZzhEujBjL0+3SR6MjLsZ7FONwckoZEdduWrn9DiEiUsAtWHadG9fiopuqQDB5UdyrJao
	oT5wtx/tP9CsfykPDzFcNUnhBxOW9GIvOEWaK1bqd6Me1q+QncXJgb2B8EWFLWSfw02xAgpmoumPz
	pYI76pPpA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWLz3-009obs-7K; Tue, 13 Apr 2021 16:33:49 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWLtj-009nVo-PT; Tue, 13 Apr 2021 16:28:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=kTyqwHKevP2lNEtSd5dIRQCfq7ju4vpN7xE34QdHfaQ=; b=eryhA18lKYcb0fqHl12dmYe/Fr
 zGNk/+Sg1KJB73T/2qagbaPRzk9jluU2gCVG/17TsVju0twJi8x3xfVXIfA77/6QQLr9WE5dgg/53
 G2vbYK09w9gxe8a6FfBakMFNYQzhK+z2lfeMY0FrIxhfe95rEMyYdWs7YH9ztbORD1uvegW57ZAat
 XV6m9bnpQEGIdBjxxJxBPovu/+GFsgHiWELH48VipNggr8yKNE85I/0UPjKwwmxBpM2V0Aol0A+Qz
 mpMvTczvGAE5T3lyMClinNPsgv7+vP/tlsNqyLYBmr7fc3RqYBfXp73oIm1aT+riuEvYNz5RJ+fvS
 FL4EfuZQ==;
Received: from mail-ot1-f51.google.com ([209.85.210.51])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWLth-007BEc-46; Tue, 13 Apr 2021 16:28:18 +0000
Received: by mail-ot1-f51.google.com with SMTP id
 w21-20020a9d63950000b02901ce7b8c45b4so16617138otk.5; 
 Tue, 13 Apr 2021 09:28:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kTyqwHKevP2lNEtSd5dIRQCfq7ju4vpN7xE34QdHfaQ=;
 b=kxt+SFwrIbu6ZFJWtJyRRMKmaXzMd010zW14soKVaEpDIoq9n7EzPdWm1zPm262C/g
 Zs0Mt/5W+HoLW69F+/EQts8DkZU8g5Y7a2Bpi72F4zHL+108pfU2RxNonbxg0Kv/poZ9
 y3URnTcOHfFNXMCmiEKZ87rV8BPzuJA7xcac0W5Mmm8Hs2hTNe094ihjLedbZa3pG3gw
 TmLEgDKLWX5w99wiSjGmHhCjqc0mWU6UiauLefY6acBqHhkbi/yNzUpCVEl0xuCcsqz8
 KbghncljFNQqCN7cT4z2LTzJxKWywDoBKGw8jcetd4yvnKjvQ3HdP6bkDps0dQVi7rpq
 nxFA==
X-Gm-Message-State: AOAM531OMmAMMaFd2lErhynwnIr1dSTnWz1ozWn+Ui/fA3j+cPLIrCg8
 QgA/dlJZmN6CCT8lXY/vBg==
X-Google-Smtp-Source: ABdhPJyuhSbIJv4mUx+VH8jFty9shbSGOZfCO+oWHjTzq9L1UnUytrV0gle+6BF73Pu8io7WqR9vsg==
X-Received: by 2002:a05:6830:309d:: with SMTP id
 f29mr28655901ots.225.1618331295206; 
 Tue, 13 Apr 2021 09:28:15 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y10sm3469681oto.18.2021.04.13.09.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 09:28:13 -0700 (PDT)
Received: (nullmailer pid 1785793 invoked by uid 1000);
 Tue, 13 Apr 2021 16:28:12 -0000
Date: Tue, 13 Apr 2021 11:28:12 -0500
From: Rob Herring <robh@kernel.org>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: sean.wang@mediatek.com, sean.wang@kernel.org, hui.liu@mediatek.com,
 mark.rutland@arm.com, eddie.huang@mediatek.com,
 linux-mediatek@lists.infradead.org, linus.walleij@linaro.org,
 biao.huang@mediatek.com, hongzhou.yang@mediatek.com,
 devicetree@vger.kernel.org, robh+dt@kernel.org, seiya.wang@mediatek.com,
 linux-kernel@vger.kernel.org, srv_heupstream@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 jg_poxu@mediatek.com, matthias.bgg@gmail.com
Subject: Re: [PATCH v4 1/4] dt-bindings: pinctrl: mt8195: add pinctrl file
 and binding document
Message-ID: <20210413162812.GA1785746@robh.at.kernel.org>
References: <20210413055702.27535-1-zhiyong.tao@mediatek.com>
 <20210413055702.27535-2-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210413055702.27535-2-zhiyong.tao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_092817_186729_2ED4DC1B 
X-CRM114-Status: GOOD (  10.61  )
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

On Tue, 13 Apr 2021 13:56:59 +0800, Zhiyong Tao wrote:
> 1. This patch adds pinctrl file for mt8195.
> 2. This patch adds mt8195 compatible node in binding document.
> 
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> ---
>  .../bindings/pinctrl/pinctrl-mt8195.yaml      | 151 +++
>  include/dt-bindings/pinctrl/mt8195-pinfunc.h  | 962 ++++++++++++++++++
>  2 files changed, 1113 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
>  create mode 100644 include/dt-bindings/pinctrl/mt8195-pinfunc.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

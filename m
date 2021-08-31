Return-Path: <SRS0=bg5C=NW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C818C432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 20:22:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EA2F6056B
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 20:22:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2EA2F6056B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EPbBO+VsZN05ynVLDKEDsHbUbhLuxSne30tclpGyMnU=; b=sXC8R8RBTMuITi
	3yIWMq7EaB7X5pfJ+iGz8hclDVleQFIK5yqFa+ymxocBuQv9wi3WWsR9Vqp3RmnYIJQ/4FIOH2MK9
	VaqxiQ2g3qPMGEGulfA9tquLbB6H+vOakHvUCNb8dwsK8MNlD2Qr/NkCbI7tW25vrUJRhwuTQsA+T
	owKBy1EKqsumpxfK1gDOXLF23hjL+KNt6GtjcJu3OcTAWqiOslDdO8Yi/58ztDj6XjhJFPtnf1cgT
	+sfyXg0XddE01x07/S49xg6288qDWYXdvP8TyOi0hRyol13OD/KFh9wmhN6pVQCYIDGqk2Edz20mN
	kPD2mn4PuoaoWFurqJZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLAGp-0036sn-Uj; Tue, 31 Aug 2021 20:22:11 +0000
Received: from mail-oo1-f46.google.com ([209.85.161.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLAGn-0036qs-Gd; Tue, 31 Aug 2021 20:22:10 +0000
Received: by mail-oo1-f46.google.com with SMTP id
 b5-20020a4ac285000000b0029038344c3dso124973ooq.8; 
 Tue, 31 Aug 2021 13:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4SF/gjz3ryW3XgAL+26S9/LDHdM8zEpUjI5UG3UHGQg=;
 b=uMzXdFAjuXf7/0RIa9AnH2bVgU3v8nl+jfmsHHnlsAL0kkKirYEda3pMYACyWt0d6W
 mlG2zk16sq5zoLWKTBXkQ9TPMNp39ffI0Ws8wgp0xHqgvzI3aAIXOwSgqITz4rtMllqx
 y31pffeAmWYjPHvNL5ENFV339fHsvIQjYR09pfE2YWHuysTrG01VsJc1xMlxckC/Luzf
 2jLic69jX+ocd1C5jk4TsaEBhLJ/WhesYy2TKP3EjzoC/58aQUssLePf8KWedX5UirYe
 YsdPO2kbbmopkipbI9xZIq6DewFU6mVFAlpnmnWqMQG3McqdvA4hRvgQmKpKjccfasrG
 LA9g==
X-Gm-Message-State: AOAM531PnrKLYkSvS6OSuxqysSUERL0C22ourO5CsRccIJTv8658N3OB
 VTbaxVbGRSv12+hpPmmXFg==
X-Google-Smtp-Source: ABdhPJxD0mW53nIn3ShPl3hu4xOaQP0bjv3KNsWQaD3rF/HgEfZvYrr/wZJnxy/xPtWr40T6SszGMQ==
X-Received: by 2002:a4a:a509:: with SMTP id v9mr15987260ook.73.1630441328317; 
 Tue, 31 Aug 2021 13:22:08 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id s10sm4105457otq.61.2021.08.31.13.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 13:22:07 -0700 (PDT)
Received: (nullmailer pid 589602 invoked by uid 1000);
 Tue, 31 Aug 2021 20:22:06 -0000
Date: Tue, 31 Aug 2021 15:22:06 -0500
From: Rob Herring <robh@kernel.org>
To: Wenbin Mei <wenbin.mei@mediatek.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>, linux-mediatek@lists.infradead.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, Avri Altman <avri.altman@wdc.com>,
 Yue Hu <huyue2@yulong.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Bean Huo <beanhuo@micron.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: mmc: mtk-sd: add hs400 dly3 setting
Message-ID: <YS6PbrCTIZJwe1cX@robh.at.kernel.org>
References: <1630065205-7618-1-git-send-email-wenbin.mei@mediatek.com>
 <1630065205-7618-2-git-send-email-wenbin.mei@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1630065205-7618-2-git-send-email-wenbin.mei@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_132209_618701_E244D416 
X-CRM114-Status: GOOD (  10.47  )
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

On Fri, 27 Aug 2021 19:53:24 +0800, Wenbin Mei wrote:
> Add hs400 dly3 setting for mtk-sd yaml
> 
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

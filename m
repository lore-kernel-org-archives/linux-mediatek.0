Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12568C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 00:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RBl9LCWCqwRTdr+LNLxUKTm0jFpQsB6sAILa1XWsmsM=; b=bn1bV7RHORFHEZ
	AILpl+VWeG9BVpfBnb2rh4elv0RbjG4YeGTW4U5gzrI20BCDDdOjsMjY1B0vCUfW/KaTzsnrKafxT
	G69QWFGD3rN4p4B7zbS1OO1qD8DvaM/OcsuKH7zskpYi2+S25iWr9vJaUOqnuyXvba+re1QeQM5n4
	/OBH3obfgcq5jLSsQ774yv1Gqnalx6mY8fMWSly9gZbUgRQ54XpkB24iT2LKpJ2s+8qcwPeCqRp9o
	SV/VZp/AkoYjU6Um4IUztb0befuzas7/BvchxpV3bUp2wjOV0vnuD1olWKueuvSpUlAWcOqR79TpA
	WozlV2YG9Xu9oJPsvx3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nr7Z7-00GNEW-Iz; Wed, 18 May 2022 00:29:25 +0000
Received: from mail-oa1-f45.google.com ([209.85.160.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nr7Z4-00GNDE-Q5
 for linux-mediatek@lists.infradead.org; Wed, 18 May 2022 00:29:23 +0000
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-f189b07f57so762714fac.1
 for <linux-mediatek@lists.infradead.org>; Tue, 17 May 2022 17:29:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9TKojzwNIl5X+kje0PBkzlv5STasDpTP+imoZvsmhsU=;
 b=RSVXBX8LbYdpj6MjF+OilV8Nqwd3eQWQS/dudYxYPRh1z/UWUftCDZeCRBbFrqlTuC
 7fNMK6y2vv1mQMcAJwp/SBIYEiOZqTJoIz80tMOnuv49xpxuYjVQLctEXJo+MK/YLrds
 knd3KcDiDV1Cs7LUBKZwvtRHV+aHen8exvijlNrDNDM8SdzcgE0lYkPXrY4iciDXuQ8E
 5+jBrAvktGhl29SKqW2wZjjenG3/hU7t0+nIhLJeD/VIQbrovv0Sa4fCRM66uOkeoK1O
 bvAJnc9nfSANtAgp3RQ8KSvt3lpgq0lfGF0GmA3pxK8JiL8019oCC5SjzqLR5O7WBGOJ
 yK5w==
X-Gm-Message-State: AOAM533HVYbZ0nYh6pfBjo3B9E2WqPJpjx+b7VefGZUBagb7x6ZPYEhX
 TfVPIkhXsrUVDGi2lyXnRg==
X-Google-Smtp-Source: ABdhPJw0Bh/BWJ55dEGhve1trL4okx867sRjI5p9REaX9Ukyz4WwvXnocm5Eu0uHWgDBTYJ5+CGv4Q==
X-Received: by 2002:a05:6870:4201:b0:e6:47c4:e104 with SMTP id
 u1-20020a056870420100b000e647c4e104mr20277606oac.257.1652833758611; 
 Tue, 17 May 2022 17:29:18 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 a3-20020a056830008300b006060322126esm306653oto.62.2022.05.17.17.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 17:29:17 -0700 (PDT)
Received: (nullmailer pid 1939467 invoked by uid 1000);
 Wed, 18 May 2022 00:29:16 -0000
Date: Tue, 17 May 2022 19:29:16 -0500
From: Rob Herring <robh@kernel.org>
To: Peter Chiu <chui-hao.chiu@mediatek.com>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 linux-wireless@vger.kernel.org, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 Ryder Lee <ryder.Lee@mediatek.com>, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
 Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: net: wireless: mt76: add clock description
 for MT7986.
Message-ID: <20220518002916.GA1939404-robh@kernel.org>
References: <20220512043859.406-1-chui-hao.chiu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220512043859.406-1-chui-hao.chiu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_172922_879352_48E1420F 
X-CRM114-Status: UNSURE (   8.47  )
X-CRM114-Notice: Please train this message.
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

On Thu, 12 May 2022 12:38:59 +0800, Peter Chiu wrote:
> Add clocks and clock-names for MT7986.
> 
> Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
> Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
> ---
>  .../bindings/net/wireless/mediatek,mt76.yaml        | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

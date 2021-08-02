Return-Path: <SRS0=Q+Xe=MZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2017FC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 21:34:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFA0460EB2
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 21:34:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DFA0460EB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/miY1JFOEnbGD79eaPQbredhiSwH1w8TN9WKK/aHkOA=; b=KWqn1sXkePgv+q
	BKYJMDBGieuitudcWrs3myx3N8jQ/6T2QH11ymkElaDLOi4lbvHANB8GPym3y0+I7vgp3PDLN2iHo
	huNstASk/HD33BxFSdtvFCvoZnEe7Fz0NHBPdtdKOaLl3iOoysOgnGbd52gnIRp7b3eUzuU3hACDl
	irzaMKRu0i3BwX2RYl7fanAf4KlwxoCC98e7lR4+Rg7OhvCG47Snp23nbfSewTtYQMAzK1pk7jxj7
	ALXFW4dzqaaw6X1wzAgg6RN6HY9VEbSSAT17wNonfMjtwGNgCqrpiwm71PdSFfcXEcod5FhLaSf2s
	SY8TKCnJrECNjtp3f47w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAfZN-000IGt-4f; Mon, 02 Aug 2021 21:33:57 +0000
Received: from mail-il1-f173.google.com ([209.85.166.173])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAfZ9-000IDA-4s; Mon, 02 Aug 2021 21:33:44 +0000
Received: by mail-il1-f173.google.com with SMTP id f8so14521262ilr.4;
 Mon, 02 Aug 2021 14:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wLC52aVmhVqOoSJPVdgHBVvoFp1F65OwU5dq/ORkoP8=;
 b=jNfWqA7Vv0Gk76CdJNoLR3CzMi4HqViKG0JootOjQfjYCfjmLbbaS/+rexBxEXVoJc
 Rjz/jBgyZbqf0X4pdzJ8bH/XBxO1pnDLIZmnaOJWX8haRH5lrr7nxZEh5tbBN1K/ebQC
 tLafV2V8xUEDIEBjcMwcZ+teeOZl01iVbPNfPpQOKcSpfhJBv7mLCs6cxDHL/0tyNtjN
 sJpx+aHS+4uDZio9XRqV1NTNYp1RSQBEGYR53Pe7tfzpsmnr1tFMVWTt+NAbvvcDSJE9
 h6E73Z6LFnmf/7mHIUXi/KjhTbM6FvYbhKBu69G7H0cMNcAfYiPvGyWLeFlR3X9OlPxB
 QwPw==
X-Gm-Message-State: AOAM531psGmdT+O/DV7xXuq2r2O9HKamYJCEFsWy+74JMv2t7uR2BfTN
 7QQT00t04pEFuTbXC62K0w==
X-Google-Smtp-Source: ABdhPJygm1FsYa2OLberNAFdX6BFy+261rfNgtOBH/qYn8FKixCDRx1Jt1immveovcKjithPmbWfnQ==
X-Received: by 2002:a05:6e02:1bc7:: with SMTP id
 x7mr1130854ilv.116.1627940021943; 
 Mon, 02 Aug 2021 14:33:41 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id v1sm1142730ilm.57.2021.08.02.14.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 14:33:41 -0700 (PDT)
Received: (nullmailer pid 1653417 invoked by uid 1000);
 Mon, 02 Aug 2021 21:33:39 -0000
Date: Mon, 2 Aug 2021 15:33:39 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-phy@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Eddie Hung <eddie.hung@mediatek.com>,
 linux-mediatek@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH 1/9] dt-bindings: phy: mediatek: tphy: support type
 switch by pericfg
Message-ID: <YQhks7ca6Gr5gAPC@robh.at.kernel.org>
References: <1627459111-2907-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1627459111-2907-1-git-send-email-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_143343_226343_3884FED3 
X-CRM114-Status: UNSURE (   9.48  )
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

On Wed, 28 Jul 2021 15:58:23 +0800, Chunfeng Yun wrote:
> Add support type switch by pericfg register between USB3, PCIe,
> SATA, SGMII, this is used to replace the way through efuse or
> jumper.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  .../devicetree/bindings/phy/mediatek,tphy.yaml   | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

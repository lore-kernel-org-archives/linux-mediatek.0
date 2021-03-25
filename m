Return-Path: <SRS0=z/aX=IX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B7DAC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 07:21:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DED8361A1E
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 07:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DED8361A1E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rQQ7gprdg/Uaah7mOBCKvlxgXln4lUdaiQClLnk9dfg=; b=AUpnLL+ZkeztU4PenzJls4v0+
	PiO6Ekf5ZN/M7t8MTP3CHyT8CfN2bc29FaSOTO+paVDyxE8YBK5G5zPM/1DLckzgdIa+AqqAwgLSP
	KYVkELc/bkHna06nm0avB2FcjXtmk4b8fe5Uym+2RO5e2WRYX/2RkaoKQEqRJVAKVDEtVkwEhbQDh
	2NKLMnnET/MOtYv3wBcM+vg5gdP5V3p/hnqBC0ObII3myYJsaFOSR1Mwktd5FZ4wS+mlz8dKdozLk
	mk32yEPURxEp8qcz64V1hZVx8vQOrsRP75Ac8cv9SuO+u92Zif3IoVO3hy9I9xlEu6I+FLlDODPJ1
	3TFUj+WfQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPKIh-000mL0-QI; Thu, 25 Mar 2021 07:21:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPKI0-000mDO-Dp; Thu, 25 Mar 2021 07:20:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4478061A1E;
 Thu, 25 Mar 2021 07:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616656819;
 bh=apXDG/9jYfIBFrCfWedmF8k03GKxmM8e1bEmTBDzhMA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YiDtu63mMVWwzbw+IO5YbcSvTfT276ecd8++ADpbG+YRw8V0tMTr7bRT49tJb8PhS
 +FuyCTESxPzQrQpS8m3zsk0XIdxAwPfXQF0ABheLSC5qHjym7axk8L6xIz1BA1Jvwo
 ha3S7W4lz3I/6aSKjeU2YfNrE61VMr/9UYWokqBzvDVXpai210o47qZfUh+Oa4Cdv5
 IBYRIT7VcNFUqAEXD6gLrdqoASttXKJmOtnoANYwKe/vnrINuua+Gbuw/vPcPdZ1R0
 jgHCamwIGTVxd7+0Fp1LSwYDgqdRJdjkrC2ZmyGeo1nn6cajURlFbrgKnQAiZvMgs3
 HMkyOp1hp9YzA==
Date: Thu, 25 Mar 2021 12:50:15 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Jie Qiu <jie.qiu@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Cawa Cheng <cawa.cheng@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v5 04/13] dt-bindings: phy: mediatek: tphy: change
 patternProperties
Message-ID: <YFw5rx7KLDU2bVu5@vkoul-mobl.Dlink>
References: <20210316092232.9806-1-chunfeng.yun@mediatek.com>
 <20210316092232.9806-4-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210316092232.9806-4-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_072025_529403_8A71BB36 
X-CRM114-Status: UNSURE (   6.54  )
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

On 16-03-21, 17:22, Chunfeng Yun wrote:
> The phy may be named as pcie-phy when the T-PHY only supports
> PCIe mode, it's also the similar case for SATA, named as
> sata-phy.

Applied, thanks

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

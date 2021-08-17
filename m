Return-Path: <SRS0=tEpm=NI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41863C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 10:22:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E01960F14
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 10:22:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0E01960F14
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BB6SfTDDYMBOfZJoOs8br32x3qlJHwhpAqrTcuH7o9M=; b=lEFOXacJqDkhdZ
	lhwd2tlxaQbcNjsjB9TratpYxJ4D2juGbZvl2wVI+Ih01E304dPq7egWgHpHxz586gA1OHmtX54Fv
	b5AN5a21vfwoXhdXI8Iuk5JRoIEevrrOKG0X4AGgwwnljUxXyEkV2OVg3WWicpn1u7/NTWNMMnHl5
	swemF6XF6xSjp+P/9wiQCBzJGh4NmABBvB1rEMQvIp0KUB7Og+iHIE7KK8cJ/V6Pt+Gh2m1GNs9gT
	cAXiYjjZ+YvndXD8UMAy1LBk5kQTp9hR2oYi6A/FB0Ij1EttyjAeTfiEWpBWh9nSyEsjzVBcRc4UQ
	gv8eitOhx0GyOrKLKDXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFwEz-0026NY-3n; Tue, 17 Aug 2021 10:22:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFwEh-0026Gq-IU; Tue, 17 Aug 2021 10:22:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 571F060F14;
 Tue, 17 Aug 2021 10:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629195743;
 bh=ZFAq4tNzIQzTRviQ8r6LSwQW3bkr+2nmdMRbQ7RZRsg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Go0Bezt4k+PVI8Qj0upYozJ00NOmTbzPu4M0awDHqDcsgWJdndB7ISgtdfZtLeaYG
 Dt9d7RxnVcyOrXoGBSHtYJr9o+y+nXSEXaEKexgxEWYGa+ZH76KIv2sY2VHfmE8q5r
 1SpEt34BkbGag+m6/yS+DwxaaVFiuSXKf+sZMdfujmWgXRHtoezgHH3f5STy6hl0to
 OGbx8Yt1h0u8LdYH+oXiCJywSnX9Ps942ktu6kpWVIR3+MQocxZVIAzX+t5YV1Vfef
 rNTPgDPsj3BIb0KopXt1U+xVS/1cVsfXAWdlGHMd3n6eSZRUZtnkvwd0UYUVjDJdTg
 3vMg5Cku7rj2A==
Date: Tue, 17 Aug 2021 15:52:18 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v3 1/9] dt-bindings: phy: mediatek: tphy: support type
 switch by pericfg
Message-ID: <YRuN2tvQtO294+sE@matsya>
References: <1629191987-20774-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1629191987-20774-1-git-send-email-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_032223_699268_8BF1C3DB 
X-CRM114-Status: UNSURE (   5.22  )
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

On 17-08-21, 17:19, Chunfeng Yun wrote:
> Add support type switch by pericfg register between USB3, PCIe,
> SATA, SGMII, this is used to replace the way through efuse or
> jumper.

Applied all, thanks

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

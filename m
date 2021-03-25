Return-Path: <SRS0=z/aX=IX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB78EC433E5
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 07:21:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A003661A1A
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 07:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A003661A1A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=igRcyUfyAshYWNLD1XKUpH6wJ4+cXsWdMIIvpDtJfYM=; b=dBhnwxo9d6ZZt4zRchFKD5nWS
	iWLRaMfIhrNfgqWBiqmuwI4ZbKKskl16A3nyiZurwy5WL5zf/y9WepRe7+PKsun+Q6bpUa+/xvy9q
	pivHLvDgLawTmF+JAYiE/U91NQEtVG+6qvQRjz3BKv9uWZEKn0W4CpPiousvd9X8OnHcA4sFmxvd5
	PXvKARaJVyIzAx8MfJ5E/B8CNPjfPHCGwS32gFj8MmOWdnx5knEnA3WdaT73DvwHP6UQ5rOg1XH8b
	OcRH0R2TthIJtUy5OpFBBmtHbBYk91ejrc/z7N8ctnON9ag8doc4PNeC0o2L6vzA2qQUdFgGiLv4Z
	m9RnmWQCA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPKIV-000mIC-Pg; Thu, 25 Mar 2021 07:20:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPKHo-000mC1-4G; Thu, 25 Mar 2021 07:20:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C7EA661A17;
 Thu, 25 Mar 2021 07:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616656806;
 bh=KRphrLadXZdI9BDmHT6N1Pw/Szyl1lgk6OeGqFuzH38=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VFaaIpWCI73SZU9FE2Es4jmtZso4WsNaf0FAsUzk52iF52YjipZWYBjD3wigNjsfg
 zehgj/ji5TIcO5pT0AVd37mxbJbTAg3CcT/T/QtelPGFbvIV5+Qw6hZDmGxnNdNGvx
 iEapAiiWk2p5SdfWfszL93oUis5l4mprwzsvYFZB/N+MUY6QJA3y5EodmX9KWYS7Uc
 NEaLJvfpLxY2W54nYL8ce88k0nsmlR4vvRcD9RxHtye2JSjuQt/bHsp0QF5fuMk8rk
 XV9P4m1IPqc9ll7Ket07T6DpwFFkX+YvjWsJxo9rglzJuUJtILjeO8S03UZPfpXCpc
 uvymEcaP18NOQ==
Date: Thu, 25 Mar 2021 12:50:03 +0530
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
Subject: Re: [PATCH v5 03/13] dt-bindings: phy: mediatek: hdmi-phy: modify
 compatible items
Message-ID: <YFw5oyqo+dLHKclH@vkoul-mobl.Dlink>
References: <20210316092232.9806-1-chunfeng.yun@mediatek.com>
 <20210316092232.9806-3-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210316092232.9806-3-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_072008_437965_3A934008 
X-CRM114-Status: UNSURE (   7.32  )
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
> mt7623-hdmi-tx is compatible to mt2701-hdmi-tx, and the compatible
> "mediatek,mt7623-hdmi-tx" is not supported in driver, in fact uses
> "mediatek,mt2701-hdmi-tx" instead on MT7623, so changes the
> compatible items to make dependence clear.

Applied, thanks

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

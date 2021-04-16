Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B8DC433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 19:21:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21F37611AF
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 19:21:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21F37611AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=HoR4Xt9wP2IaVC0RT1moWTnqpjTN1/ujBCUlbFwHLU4=; b=KsRGH6LIKkwmoCWAFsKhihsqB
	xgBK7UQ51UEfVZe5KelLJKqAQi47AQA4w856dYN9xuD71fl8szTjajJROZvcguKGbFzWpr7pNd/6u
	WxryE4qcxofKJQYnUu+bch0s1rby2XZTjwX3n+T1GaCdq0zNNXghsHqDwJhNVuMMmbq60uo/6OkZZ
	j1RJeiLnZaURV6VNCyKq8qgLHJF1aNhIR++B9wZ5SzCu4bfiHr1Logi2dO5m8A5Y0JKtzapVp7SSX
	rZY1hwyxWIvxQbZWrhHZSXONrU/0ZxIx9zjRzRIwnuYTY3+YCIeSnhJ3ZEwlBjrhCrPYzqhHazE9j
	Itjku0MLg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXU1k-003ChF-VA; Fri, 16 Apr 2021 19:21:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXU1Z-003CeK-Ew; Fri, 16 Apr 2021 19:21:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:References;
 bh=v4oagmEjB0vcIcBz17n7GmTDdzlvIYr9ss1XgRGOynk=; b=Rxww+xxUbATvsRa5nqlD8FHz/u
 T34OlRrewHK/FAYoLS9teYp7aSAEF25Zqy8zOV1j1qljB3JINScEzyTJ+2JZCDu3Zw9zgV+e6H3Ha
 1SbLMSlrxDRi1H3SDkOD2rV6WKGbBUsF+kckQcYhTsi8jnSQo0htb9mPOvtYqH6f2VLA7pNj/aVtS
 W1rhbEtjK8xBSKZ34rqLq8eE29/wqzd+mymagRa1Wtcf0tdMNKUK8xoxL4U808mOHnym0l5QIgw4l
 SmcUdXHq0mtkqn7Mytbg8eCNASyGgjfQWoad6hO3hfzSqG1c7dlP0kYpsIdHJrJnRmnjAsfA6c4Cu
 nFmKJUjw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXU1W-009eX6-OV; Fri, 16 Apr 2021 19:21:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5E6BD613B4;
 Fri, 16 Apr 2021 19:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618600861;
 bh=Mb8WXSaI6EQEdDBcj/7Sx7GoSOZzNFRqwbZ1cijvPu0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=A6JRsw0Na4PjV2z20RN2EJfOyGhbsRQmXbpAx3dSrY1370mvl+suHWBCeU/AFeXyB
 zjdlnjTNSjyg4S8R39c01y+sfQ5dNTAOVwTAvA9dcVVJC40Mv79PcuHCkXPqc8h8Or
 koVpyJlD9krHGu6WNIg8IbXsUkWNrcxQBrSb5jIneWCOKHrZl+I78yQs/JgYxFvLar
 XMXpZHG5TD2TxgNIYfEFa9JuUG0L5mu+huHASe3guq1luIS1w/HlQcc8l5Lv0ty7RX
 RAe1rPITv5IGiy/5TPEIiMmG4RqZd0IXgI0/Fu95eeOVKKeff8ilU4yFtDAAkzoUIL
 GWuy8b5E6Ke7A==
Date: Fri, 16 Apr 2021 14:21:00 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Marc Zyngier <maz@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, youlin.pei@mediatek.com,
 chuanjia.liu@mediatek.com, qizhong.cheng@mediatek.com,
 sin_jieyang@mediatek.com, drinkcat@chromium.org,
 Rex-BC.Chen@mediatek.com, anson.chuang@mediatek.com,
 Krzysztof Wilczyski <kw@linux.com>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [v9,0/7] PCI: mediatek: Add new generation controller support
Message-ID: <20210416192100.GA2745484@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210324030510.29177-1-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_122102_864311_B430121A 
X-CRM114-Status: UNSURE (   7.11  )
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

On Wed, Mar 24, 2021 at 11:05:03AM +0800, Jianjun Wang wrote:
> These series patches add pcie-mediatek-gen3.c and dt-bindings file to
> support new generation PCIe controller.

Incidental: b4 doesn't work on this thread, I suspect because the
usual subject line format is:

  [PATCH v9 9/7]

instead of:

  [v9,0/7]

For b4 info, see https://git.kernel.org/pub/scm/utils/b4/b4.git/tree/README.rst

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

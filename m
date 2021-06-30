Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11C41C11F68
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 03:40:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D740461D07
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 03:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D740461D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HEWqhd1Agwnj6ayMFXRYD81PTaiKZPgG4YkwZXwGPHQ=; b=eRoxrzuLIxDRIL
	bWLisdfHkhCt741HmwBHgE+9zWKkVl32MPzsx5sCkhPFm7dOwDMDjzAHFF/n1TbH96Zz4wDlXPGOz
	e0tnWzjxTQC0gYqp0hzd7PmjzCaf+JiQnngcf7bCqN8zQO1fGY5+Hj96T2/oQlKBqaeRe3jaWXdHi
	+rK89leOfGdx4Nw6Y/cDPFv+ur0cddS8XgHoEcBd+l/6r8JY60jAW99PkKf27sAnZ4LrnNCRl/WY9
	vU0yCD9RygS8vBSN3Dj928FiZX838ul7CabLz7Oyxr4IJxp9Ku6Dm5jPROOz9EhAy07WURwF6JyAp
	qG4ozSHDrLBFhjs9nubQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyR5Y-00CiHl-PI; Wed, 30 Jun 2021 03:40:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyR5V-00CiGv-JB; Wed, 30 Jun 2021 03:40:35 +0000
X-UUID: 7424ce5247b04d078c6871a6577f65c8-20210629
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=/nGVkr6rIatMfAOPxcJiFy+Lah+mHvqzDrJW7I9oyG4=; 
 b=Y7YKCtteZjkYo1Lj0Wo3T4lSsiDYx1H2+6VjGl/hjDsPnooxsvImfEYZLtKdLiPG95o7Xu56NGx/3ELnmq7Cn1c1VXPNVNVUvzzYZsoZBapXyh/2iN8Ams/3YH8ky7fKV3dHQGQ8KxBzQGb52Ur8KY6SfK6djiURmUGQP3S5Xvc=;
X-UUID: 7424ce5247b04d078c6871a6577f65c8-20210629
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <qizhong.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 919727025; Tue, 29 Jun 2021 20:40:28 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Jun 2021 20:40:27 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 11:40:25 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Jun 2021 11:40:23 +0800
Message-ID: <1625024423.20084.12.camel@mhfsdcap03>
Subject: Re: [PATCH v3 1/2] dt-bindings: PCI: mediatek-gen3: Add property to
 disable dvfsrc voltage request
From: Qizhong Cheng <qizhong.cheng@mediatek.com>
To: Jianjun Wang <jianjun.wang@mediatek.com>
CC: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Ryder Lee
 <ryder.lee@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <youlin.pei@mediatek.com>,
 <chuanjia.liu@mediatek.com>, <ot_jiey.yang@mediatek.com>,
 <drinkcat@chromium.org>, <Rex-BC.Chen@mediatek.com>, Krzysztof Wilczyski
 <kw@linux.com>, <Ryan-JH.Yu@mediatek.com>
Date: Wed, 30 Jun 2021 11:40:23 +0800
In-Reply-To: <20210630024934.18903-2-jianjun.wang@mediatek.com>
References: <20210630024934.18903-1-jianjun.wang@mediatek.com>
 <20210630024934.18903-2-jianjun.wang@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_204033_681279_E84C04B6 
X-CRM114-Status: GOOD (  15.90  )
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

Reviewed-by: Qizhong Cheng <qizhong.cheng@mediatek.com>
Tested-by: Qizhong Cheng <qizhong.cheng@mediatek.com>

On Wed, 2021-06-30 at 10:49 +0800, Jianjun Wang wrote:
> Add property to disable dvfsrc voltage request, if this property
> is presented, we assume that the requested voltage is always
> higher enough to keep the PCIe controller active.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> ---
>  .../devicetree/bindings/pci/mediatek-pcie-gen3.yaml       | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> index e7b1f9892da4..3e26c032cea9 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> @@ -96,6 +96,12 @@ properties:
>    phys:
>      maxItems: 1
>  
> +  disable-dvfsrc-vlt-req:
> +    description: Disable dvfsrc voltage request, if this property is presented,
> +      we assume that the requested voltage is always higher enough to keep
> +      the PCIe controller active.
> +    type: boolean
> +
>    '#interrupt-cells':
>      const: 1
>  
> @@ -166,6 +172,8 @@ examples:
>                       <&infracfg_rst 3>;
>              reset-names = "phy", "mac";
>  
> +            disable-dvfsrc-vlt-req;
> +
>              #interrupt-cells = <1>;
>              interrupt-map-mask = <0 0 0 0x7>;
>              interrupt-map = <0 0 0 1 &pcie_intc 0>,

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

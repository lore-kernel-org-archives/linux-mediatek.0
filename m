Return-Path: <SRS0=qDs2=CS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E21FC43461
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 03:20:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 319DB20708
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 03:20:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dyVgS0Qv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="YaIU9tUt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 319DB20708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mIECWYNq8xzLVCftKAE7cQclzJwVCUHKGktV15ZPpSY=; b=dyVgS0Qv8mi/0N333QHuCJhTC
	V7sPn1mxxiaVpGtBxWC+T1N+e2GxdCn3t5G0YbQ5MH0mUEBESjBeD5SIkq2mjWwI9QMGpW2v8XnVc
	XkqtVVPs7A1TfOaG5QHzv6sSU63qF9ZYvpyGOn3oMainlYgRT1t4UNqmyxkORQAzDOeFufh2anoUD
	FnsFiIk015dewXIzGA10ZMLOWT6P8BUVQX9J3k6xtSxxlzKDw/U/L81l2EFS8jws4iPXAdk5qBSI+
	2fAoT88t7TYk49A5AX5ngl5mo+hwZQ0QSFXibDPQ1IRvjchxUkB2ggP7MvdCS7HmhQRMqTHP/Ay06
	35kNJv4qw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFqf7-0002ei-5V; Wed, 09 Sep 2020 03:20:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFqf3-0002dr-HT; Wed, 09 Sep 2020 03:20:42 +0000
X-UUID: 38e51b4408824a80b488f096b6af8eab-20200908
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=aAEAwDECFXixyNhBd49ROmx+esoPcCLIkxRXsqfgM/k=; 
 b=YaIU9tUtTcBJXB3kmzOnruqzpv66F86/fWgAAdAOnnopr4kx2MU5uT66fILQMt14EtNEMHNkeKx9SVf3xzoY9cMwweWtMqK/36oMFZadpv2FNwJOXcMVVy51o4r9nT2y25/4F7+LLrJwLLBX0vsWxNDgvtUmLbTi6N+o8zB1xl8=;
X-UUID: 38e51b4408824a80b488f096b6af8eab-20200908
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 969392423; Tue, 08 Sep 2020 19:20:34 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Sep 2020 20:10:31 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs08n1.mediatek.inc
 (172.21.101.55) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 9 Sep 2020 11:10:29 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 9 Sep 2020 11:10:28 +0800
Message-ID: <1599620917.2521.9.camel@mhfsdcap03>
Subject: Re: [v1,1/3] dt-bindings: Add YAML schemas for Gen3 PCIe controller
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Wed, 9 Sep 2020 11:08:37 +0800
In-Reply-To: <20200908195050.GA795070@bogus>
References: <20200907120852.12090-1-jianjun.wang@mediatek.com>
 <20200907120852.12090-2-jianjun.wang@mediatek.com>
 <20200908195050.GA795070@bogus>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_232041_719043_257F7A4B 
X-CRM114-Status: GOOD (  18.96  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Sj Huang <sj.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-09-08 at 13:50 -0600, Rob Herring wrote:
> On Mon, 07 Sep 2020 20:08:50 +0800, Jianjun Wang wrote:
> > Add YAML schemas documentation for Gen3 PCIe controller on
> > MediaTek SoCs.
> > 
> > Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> > Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> > ---
> >  .../bindings/pci/mediatek-pcie-gen3.yaml      | 158 ++++++++++++++++++
> >  1 file changed, 158 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > 
> 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.example.dts:55.56-59.19: Warning (pci_device_reg): /example-0/bus/pcie@11230000/legacy-interrupt-controller: missing PCI reg property
> 
> 
> See https://patchwork.ozlabs.org/patch/1359119
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure dt-schema is up to date:
> 
> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> 
> Please check and re-submit.
> 

Yes, I have already found this warning message, but I'm confused with
how to add this reg property, since the interrupt-controller has inherit
the pci device type but does not have its own registers.

Could you please tell me how to fix this error, or which docs can I
refer to?

Thanks.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

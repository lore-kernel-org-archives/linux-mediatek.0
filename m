Return-Path: <SRS0=V4X5=CW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16B90C433E2
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Sep 2020 02:53:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF95E206C3
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Sep 2020 02:53:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HfJalp+4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Xr4nBJaV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF95E206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=siY+JxgfS4mnrMItlxzuQaRWaZpr/Q45Xhmvs2IB1qQ=; b=HfJalp+4hmrqerGBqBZgRehyQ
	jrlRN1WwuMiwtLtTxQHtDv/zCcwXluLrZP0YS8qPNlnh+ewuOv8oBKK0/dpQwYUyR/31MtHploW2S
	etF5mgZEScynGc7SOWdkE15dxtLzJx5yG3buj/KWbvLEbm9GkOKnyIpqtWtTWvfzITHlmShH7TSQg
	mkPNVmGkuDz6W95i504cC6myMvt17cATfrj7XGCst5xuiRsvUoUcfgSsmfyySy8ckRk+GADVB+FDx
	1moW61mqeGP6E+FI2q5WzqXcqbzAa409t4FF7sK+Sf59O+RUdgcvFFlZbx5iWEiIOLeqkQ+w2nZaX
	1+fA/K58Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHI8f-0005Zh-Se; Sun, 13 Sep 2020 02:53:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHI8d-0005Yz-0h; Sun, 13 Sep 2020 02:53:12 +0000
X-UUID: e8d6dc4e743a49d4a1395f79714ec390-20200912
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=sHr/3SgqkGgC0cmR+vYMugDYlp4UjJix+vEWHOHpO8Q=; 
 b=Xr4nBJaVRF0yXg5XcgzF8tMYB4lqLQmEByZCEUkKnAllH99qHEssVevHaY50x/DmXxmZBNS4eh7cCl2CYGMnwzPbXtr0Ejvr6LuCWa7BYG4wRXymht+6/RBsfYzDk1ILRSmhwBhKRP57k/fpt251jaECtH8vlYIUPqOIwkEfzqk=;
X-UUID: e8d6dc4e743a49d4a1395f79714ec390-20200912
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1283753022; Sat, 12 Sep 2020 18:52:58 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 12 Sep 2020 19:52:55 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sun, 13 Sep 2020 10:52:32 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 13 Sep 2020 10:52:31 +0800
Message-ID: <1599965431.7466.32.camel@mhfsdcap03>
Subject: Re: [PATCH v5 1/4] dt-bindings: pci: mediatek: Modified the Device
 tree bindings
From: Chuanjia Liu <chuanjia.liu@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Sun, 13 Sep 2020 10:50:31 +0800
In-Reply-To: <20200911224709.GA2960430@bogus>
References: <20200910061115.909-1-chuanjia.liu@mediatek.com>
 <20200910061115.909-2-chuanjia.liu@mediatek.com>
 <20200911224709.GA2960430@bogus>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 12547BB23CCC94C1400331408C8C42EC0E0AF5263CE508083E8DD47762F0BBDA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200912_225311_210569_247F39D9 
X-CRM114-Status: GOOD (  14.80  )
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
 Frank Wunderlich <frank-w@public-files.de>, linux-pci@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 yong.wu@mediatek.com, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-09-11 at 16:47 -0600, Rob Herring wrote:
> On Thu, 10 Sep 2020 14:11:12 +0800, Chuanjia Liu wrote:
> > Split the PCIe node and add pciecfg node to fix MSI issue.
> > 
> > Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> > Signed-off-by: Chuanjia Liu <chuanjia.liu@mediatek.com>
> > ---
> >  .../bindings/pci/mediatek-pcie-cfg.yaml       |  38 +++++
> >  .../devicetree/bindings/pci/mediatek-pcie.txt | 144 +++++++++++-------
> >  2 files changed, 129 insertions(+), 53 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-cfg.yaml
> > 
> 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pci/mediatek-pcie-cfg.example.dt.yaml: example-0: pciecfg@1a140000:reg:0: [0, 437518336, 0, 4096] is too long
> 	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
> 
> 
> See https://patchwork.ozlabs.org/patch/1361249
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure dt-schema is up to date:
> 
> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> 
> Please check and re-submit.
> 
Thanks for your review, I will update my dt-schema and fix it in next
version.

regards,
Chuanjia

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

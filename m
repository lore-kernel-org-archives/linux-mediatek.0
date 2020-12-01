Return-Path: <SRS0=+qQs=FF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32AF7C64E90
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 00:17:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1FD820706
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 00:17:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JOZaZejc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1FD820706
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Q+LlIkc8hUxxaoGZ2AVKGuycUOyBf5lvHWB1O4C2DAI=; b=JOZaZejcGVsFoH3i9QkQApWRy
	OoaueswsrwQGiEAiCJnywpdqARCj06tQiDEUlRsCypMlCgLXBU8JSBrJC4rPSi05F5WiKCLzy5/iL
	UHfjVD1xPkoK55irQhhg2I7FKEkoKCXG1vPuC63rZ9n9zGYbzek8t4Two7+MvbIXP7wiZSnupOPQO
	C93NQYx/DAB0RpZhQGVplt7DLLLfd3F6teLCHDWlS2+aZ5MTBDBloJWQ/E1mHsA8raxUGjwjj1BQf
	U6emISc+N+Nkwq4ePLqSQ3xij8dEa9YWn/02E/1UBRGu4ih050L0o561yKdFgFurHSm1A7Hh/MtJY
	i+ezRcQ5A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjtMN-00068U-2t; Tue, 01 Dec 2020 00:17:35 +0000
Received: from mail-io1-f51.google.com ([209.85.166.51])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjtMK-000686-7K; Tue, 01 Dec 2020 00:17:32 +0000
Received: by mail-io1-f51.google.com with SMTP id j23so13767905iog.6;
 Mon, 30 Nov 2020 16:17:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3y5lHxw9L2sp4pKlDXYUK3THtSMZV6/5JS02mefxQ1I=;
 b=t8OjMmmNVcO2Nyj8kqV5Gan9l35q6dV9kFeQi2fRak7tYsny3D8dBHI5k6aP/O0BqD
 QNp0mTCkmbEDWMcoL1Z9H2PmOM1oVo3RXs5QK0vOo1Vr7EecLDxjIvISW7yBCkkShTn8
 JyE/Ip/f8QaESg5h+3gl3NcMfL3xQND2Ay+tDFK1SAdmAfB2Hyc7jVFVLjeA/aX4J1Sf
 DhmPsF+OWoRLwXd6hblg35NOUGFFGOZ55ppB/JydoRNDYWADFCapwgr2nRQ91XasYCMX
 s677AC8yFaDNlGG/A6QPH4IKYYQ+mPiZA1+1qE/cgx8HMi8u1KY5npbtilGwq9sNX5mm
 VI8g==
X-Gm-Message-State: AOAM53165jeEz7ZuGXm46sdrcvOCFBjLVJJmeg0jN7BjQMrN64lDcPdX
 gzU4VjBG8E4r36M/iN658g==
X-Google-Smtp-Source: ABdhPJzKuOpKkwZB80o5iMvuqLTVkadj8zW3lC1ulA9iHs8BZ0C9xSZEJ5zuRHbphCw/whh4wyplBw==
X-Received: by 2002:a02:90c6:: with SMTP id c6mr321139jag.3.1606781851455;
 Mon, 30 Nov 2020 16:17:31 -0800 (PST)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id f29sm116491ilg.3.2020.11.30.16.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 16:17:30 -0800 (PST)
Received: (nullmailer pid 3321016 invoked by uid 1000);
 Tue, 01 Dec 2020 00:17:26 -0000
Date: Mon, 30 Nov 2020 17:17:26 -0700
From: Rob Herring <robh@kernel.org>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Subject: Re: [v4,1/3] dt-bindings: PCI: mediatek: Add YAML schema
Message-ID: <20201201001726.GA3320955@robh.at.kernel.org>
References: <20201118082935.26828-1-jianjun.wang@mediatek.com>
 <20201118082935.26828-2-jianjun.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201118082935.26828-2-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_191732_294922_0251815A 
X-CRM114-Status: GOOD (  12.22  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Ryder Lee <ryder.lee@mediatek.com>, qizhong.cheng@mediatek.com,
 chuanjia.liu@mediatek.com, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 sin_jieyang@mediatek.com, Sj Huang <sj.huang@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Bjorn Helgaas <bhelgaas@google.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 18 Nov 2020 16:29:33 +0800, Jianjun Wang wrote:
> Add YAML schemas documentation for Gen3 PCIe controller on
> MediaTek SoCs.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  .../bindings/pci/mediatek-pcie-gen3.yaml      | 135 ++++++++++++++++++
>  1 file changed, 135 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

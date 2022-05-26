Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80899C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 May 2022 18:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bhD+ZtAaJ6YvRBlmWIcH8DHQqjSgp/QcYj8FCCHiGEo=; b=NSqKxyRdtwXY9x
	1h1hG3AnZLnzqJyus02FpKYDa3yxhIG1KJ4yOWPTnwnE6axBWtFzoWU5V43BxAHcgW5IB5XZWM7kw
	AFu+xYIT+zAeq5Cm+dytt2oIW6Uca/ke9TaFjRwkewaW7tZgGyaWMXTy3eoNXjJm7gEId8c1RH5Ib
	jk9XzfOnFjgvvHjmyr6Q77EvBpaCFjFsZsq9sM9/uaJN4gA2Geok9CHjOFW707B7LEpTAdI99OtB4
	7LBiQO/vGRiCKaHOoSyX2zFwB8n7/LV48zZ8CWOfXZ0hawSNFR3rQfCixnlItFBYAD2yxVJdpexpv
	sz60Wpps6iXTxpSUtyZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuISw-00FdZH-T9; Thu, 26 May 2022 18:44:10 +0000
Received: from mail-oa1-f52.google.com ([209.85.160.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuISu-00FdWt-Ql; Thu, 26 May 2022 18:44:10 +0000
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-d39f741ba0so3167689fac.13;
        Thu, 26 May 2022 11:44:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wKj6c5x0G9h14gAgRjlnIg1V0UzbG9yv5fvPYLIplQo=;
        b=7IfPjg5yP0qnxttsfXxgs4afoSYsNgC1ZlTVgVVZcjsP3ia9kMucgc8SaGKNZeObPS
         2VwGuBktPwo86lVv68CfxOb8b7fWEA0LU6bPYuX0Cc6022m7IOuYddjNzcRW11t9ZGST
         fc87GS59qQzLnsQM+4KzjJtHFtqnTjaV+EWhRLftQmutOb341wT2CpA5aaOY71pAk56g
         QpMVkFFGcWeKw9ktlQpZO+0B/QRXcvstaU+Tn0Z/8qka5nqx39ABJ7QSVBVgLRi+VxUt
         rYzRUhpqfYzsNRYuXu43miYtwb/XDUBbOsxJFqQI87kYt+wZAsHqxopyYAB0Qmz2NXBB
         sS4Q==
X-Gm-Message-State: AOAM5333YJuY7L3nocJXcej80RQmVPxJMTIiR02YlGBEHJAy+qVczWaT
	ZBaJXnS4sKOq+jrkk6TnBQ==
X-Google-Smtp-Source: ABdhPJzho6DAQtfhK29KwkbvdvgM75vBci2yXDAGyEUMQN/OE+K8Nq9EEeEbXUewJq8apWsKJGzRMw==
X-Received: by 2002:a05:6870:e409:b0:f2:4cf4:f187 with SMTP id n9-20020a056870e40900b000f24cf4f187mr2025157oag.154.1653590643624;
        Thu, 26 May 2022 11:44:03 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z10-20020a9d468a000000b0060603221235sm926121ote.5.2022.05.26.11.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 11:44:02 -0700 (PDT)
Received: (nullmailer pid 125873 invoked by uid 1000);
	Thu, 26 May 2022 18:44:01 -0000
Date: Thu, 26 May 2022 13:44:01 -0500
From: Rob Herring <robh@kernel.org>
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Bjorn Helgaas <bhelgaas@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, Marc Zyngier <maz@kernel.org>, linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] PCI: mediatek-gen3: Fix refcount leak in
 mtk_pcie_init_irq_domains
Message-ID: <20220526184401.GG54904-robh@kernel.org>
References: <20220526110246.53502-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220526110246.53502-1-linmq006@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_114408_886444_A7CBBC1F 
X-CRM114-Status: GOOD (  11.80  )
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

On Thu, May 26, 2022 at 03:02:46PM +0400, Miaoqian Lin wrote:
> of_get_child_by_name() returns a node pointer with refcount
> incremented, we should use of_node_put() on it when not need anymore.
> Add missing of_node_put() to avoid refcount leak.
> 
> Fixes: 814cceebba9b ("PCI: mediatek-gen3: Add INTx support")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E5CC5CFDB
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2026 19:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ULbcTDnO0AMWuu67LZdQx8/Vu46a5smfVMMhgY9gY0k=; b=zz2X0aFWOmYVrjZ5r2BP0s9NrN
	i24NZBfefU8lgkvZ9yJJbCGhnmPDW13/aHtOlYXtlD3X72PwBQTWIR2d1451a5ygD8ST0p3jB/Xgt
	ktF/XExTJIUU8iPfdCsLny2bZVqXi1364ipdEGNCmRsa/x4Eoh1Q3ebDtf6MtYk/9HHImxAj/0t8O
	mlHOyUQdVPF9iNpB0dPdhslvbhbYB50tnJZKMDNY7Y/c2or7tfgk7Tvh//MFrG9OYYV/uq/FcjYdF
	oODlOVDUu6yYMst9qNROOrrY3vBRGPAWyCKoCR37FqJADVs8ohX/fdeRDv5BF0bECig0L3Jk+B2AN
	q854aDzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wub8s-00000001SD1-16je;
	Thu, 13 Aug 2026 19:31:06 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wub8p-00000001SC4-1p4l
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Aug 2026 19:31:05 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-47f6609c657so96508f8f.2
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Aug 2026 12:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786649461; x=1787254261; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ULbcTDnO0AMWuu67LZdQx8/Vu46a5smfVMMhgY9gY0k=;
        b=SK8g8czU4ukq1Zus1Nr3OBHfaNMh+tuadTT86NTIuPhj1apq5iCXrAxlG6G3e2MQS/
         1iBjjXI2X/c5YOt9eTy89np1CROeZHnfnUv6hPQWwsrrXSxzuXoLUfmq9+N8DbXMu42D
         7l3c5yamGV5H3rgUKRoFQHyUaU1aoT2s7N1vB1Mxw6uW1jitLaCMVAtkxVviQULBwRfW
         lBs9ixbwakwLs5jZHCYbawl6wEB9y7whyaNP+eOWtLAjyZtRIek9av2MarXhz0PFw0Z/
         h8NpGPu0LGm9V7hHp1TIz83triFm3Z8Xb5NhZSk6BpCLQwoTrUBVa2ytju3RFZNd3A77
         tFpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786649461; x=1787254261;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ULbcTDnO0AMWuu67LZdQx8/Vu46a5smfVMMhgY9gY0k=;
        b=dTl8gEk29cB8FwocPXlw+vGpVge1snVfBoJD/b/E3/zAags4abQCYKyzOPN7Yp8ywK
         qe5Bv5g9+7oeCCDvht4H78vnvwG6PpbsKnfqXdVOOewS5P90f+fs20OVxhQOgV0jEYby
         0/ucyRJv/06Qm3AfzBEfGLXbsbvrPTTT3sem/b9yeGtuHT9PqynkHUi/NCgHGZLMhDIT
         NQu7YbWqC4grlauPSnr65VP5NwyAXDdrchyGRWpjeXvURuQIZcuJQk1SxKrrZMFrJJCQ
         XlMwIQOzPkFsUF+SZDQ2hJf2ikA7eQ30A5UzDFEvxeyApI7RUuIzUVFwywSirzEVXwrf
         cVNQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro71Abz6r+k1Bz9/PSW72jcZc2bu6ZKmgxpZM3CjiU490oEYHxHG9m+3kZMJnDnOtwXN34rOzjqOqLsaP0z+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YykN8r8U6uwGi2H6acLr5Gb783VehY9ZaUNbRPfzuBL8CsUUaDa
	ojclF/BfjiZnDT1zoRd99b90RqeIngVHekO3wf2mzII251HzEJtJRtSl
X-Gm-Gg: AR+sD13aWrTmcZqZaSYoKPR2LOcV0VWlCotCBrGQ+PlYVcsf2f8aVL8ylBsm5Hnivv4
	VR2Ay2ajjELWhG6cFHr1mugAqF9lPF+CtcstD8tvn6l0iRKzIomRmClifocSHu3jBnlD3/ggAjc
	2A0YNA5wvYLPTKfmXzvSkFBYLUrecmgnRKQYLHOTtLDQuLBLh1xjyDVB8o8Wy+o+0cCIt6XNxBD
	bRRNgInhLtXQQ2ruINNXPJV8RBNCF1gWy4m1yU0vh1oH8m4JIaL75gBOgrkwaZpqchkoFGoPkfW
	f+ycyPnxj1560ZrJN1pkwWGI6n2emiYpcIzWRQUdxmXZKq9Kqee7gB537kwlLndE1OHAOB1Six0
	FJcdrwREZ972/D8009CV5L+o0zGJObNsnvKYGeX+GIIOwRG5AJwORwm6exZTvHR/whF+aU17Biu
	KvOocwOF+8nmHwJf5AhpDqK3Z40JG91B9nOxBsnGtBeM5A+TEokWsBirGO7nfTMAcvFw0I5XNTc
	AZXJ7T7RFFG1C9yDLDIA4LP/ReNd9dMctwO5tU44A==
X-Received: by 2002:a05:600c:3496:b0:493:f318:3bc6 with SMTP id 5b1f17b1804b1-4998796e478mr11165245e9.13.1786649459483;
        Thu, 13 Aug 2026 12:30:59 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49981b1bd61sm81000835e9.8.2026.08.13.12.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 12:30:59 -0700 (PDT)
Message-ID: <6a7e1b73.e11288f4.1351ae.5625@mx.google.com>
X-Google-Original-Message-ID: <an4bbqdaa2jS3A7L@Ansuel-XPS.>
Date: Thu, 13 Aug 2026 21:30:54 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/2] PCI: mediatek-gen3: Add 2-lanes mode support for
 Airoha AN7581
References: <20260806165334.7328-3-ansuelsmth@gmail.com>
 <20260813170820.GA1143871@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813170820.GA1143871@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_123103_492580_7B5723EC 
X-CRM114-Status: GOOD (  20.33  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Aug 13, 2026 at 12:08:20PM -0500, Bjorn Helgaas wrote:
> On Thu, Aug 06, 2026 at 06:53:32PM +0200, Christian Marangi wrote:
> > The Airoha AN7581 SoC supports configuring the first PCIe0 lane to 2-lanes
> > mode (x2 link) by bonding it with the second PCIe lane (PCIe1). This is
> > done by configuring the PCIe MUX in the SCU register.
> > 
> > To correctly configure PCIe0 in x2 link, define in DT the following
> > additional properties:
> > 
> >   - additional reg, 'sec-pcie-mac' for the secondary PCIe.
> >   - PERSTOUT reset for both main and secondary PCIE0, called 'perstout' and
> >     'sec-perstout'
> >   - 'airoha,scu' property to correctly configure the SCU register for the
> >     PCIe MUX
> >   - 'num-lanes' set to '2' to enable PCIe0 in x2 link
> > 
> > In such configuration the EQ preset are configured to the same values.
> > 
> > To permit correct configuration of the PCIe link, additional logic is added
> > to assert and deassert the PERSTOUT resets. Support of these additional
> > reset was introduced in Airoha clk driver with commit
> > 6712f48eb3a1 ("clk: en7523: add support for dedicated PCIe PERSTOUT reset")
> > and on backporting of this commit also the clk driver change will be
> > needed.
> 
> I don't see 6712f48eb3a1 in upstream or linux-next.  Is this SHA1
> going to valid if we merge this for v7.3?

I picked that sha1 from the git pull for the staging clk tree.

-- 
	Ansuel


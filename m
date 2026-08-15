Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61431C5AD5A
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Aug 2026 11:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GrwB5zfsW4lC1jK6YCZThBFVhJVN5/++tlnL9AR3ZH4=; b=NlOdOsXZZBH7BT5n5eYpgrTbYi
	TyVdDOSC1+TFm0Y5ocsOwBkZdveY99dMM4tvmXp2wGFAgWW/mLhjwCHvh+UUisyGwmI22sY20/ICh
	LqiZ/q/pdOas7VrnUGBbIC/ZgSmhjprAOUxwIMCgyMJTDf23k+O7jMvaHblMcxuYGrgcIiAW/mCaM
	8d3uu6pk7KwOCWbP14sQndK607rb3kTYPBdLqbSvHA2SGai17C+UTsFiSvcgWx79YRNc5VHbJfyVC
	MeEGC8I6dFa8n14t6cquAykPoH+RBjmkzSHfoIviILNiWaAJS7/VrZcf1qNMYIVc9bbVZ1V3ouVuC
	KVZAm4OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvCC8-00000003lnJ-47sH;
	Sat, 15 Aug 2026 11:04:56 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvCC6-00000003lmX-147i
	for linux-mediatek@lists.infradead.org;
	Sat, 15 Aug 2026 11:04:56 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso22947585e9.1
        for <linux-mediatek@lists.infradead.org>; Sat, 15 Aug 2026 04:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786791891; x=1787396691; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GrwB5zfsW4lC1jK6YCZThBFVhJVN5/++tlnL9AR3ZH4=;
        b=K+5vLfpEMZlF+bvE0FH0as+MlvTH0TwFksVRY+4oXJ82BDzlMKB9T7xIBFudK8HfiS
         lcAnY9RORhPvI1asQQPjAxXBdp86FHGvOIgjMkab4W07xZ8Uf4RddUwMsghFaR1TVGdn
         BVthsQ/pQCuXwBGCBtXHHFIvqIZWG7Fux5I+8EeHGJTKc/4kRXAwEcfERFKeH5tH+yt1
         BUMA/dy6QRndFT9wNrOGAtodidyN4GhgOx4trZ+GoL01CzYIdm+WawEqoUvkcbxMzjRe
         XtNmOw+EveOmeM91rb/Q5dCjAraCMWqgyChWUuevjoOKUzVYSYoHwv2zT4nQpzkLpk4a
         1wvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786791891; x=1787396691;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GrwB5zfsW4lC1jK6YCZThBFVhJVN5/++tlnL9AR3ZH4=;
        b=VJUomzcs8dN9tz4s5TVyjwordly1fOiYTjVWU4vndl0nIaZ0QbgYHOrD1cTLX61ywJ
         EQJkEDmnS4nSWHepka8pxg08mTWlQvT0RBbhE0Btfz67ZbyJIz40ccFcijuk/+3Q7rvc
         skqobc5M5IdzQ+JIB003XhxZ4EoH3UYfD4LuqMp5bM0gKKZx0/Wsm/k3N/km10iSVuys
         p+nTWSTddb/xqQsSZ3tc1HsWOguUCAr5BKEu6L+6SkVACsHHAU8WmVOjW3vlEoh24SNT
         px8bYSOZTjwUKjrzY/a7SvOL4KEYbWEE8eRZlBGse5hkmZ8hSsgIZp1SLcW6CybiOo4H
         ESUA==
X-Forwarded-Encrypted: i=1; AHgh+Rpbzk2JHmB0BqqHbomjHkMu9cw0IL/DMCqI1ccl/TYLg1M76vk85ghJezrdZz/Avkg6bIRAXWbk5j+c8ws5Cw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzjpHZ1LarbUQPB3wb+JYvk8xTbaAMgBPBmcKPvmGqaxIZe63VT
	exTd/eZWI3GCLPdgwjezysJrfweWQKNXUxdeuKfGNVmMXwAFRHVkjqE7
X-Gm-Gg: AR+sD10Nt08tzPKHJ4xFeQWi4NnhlITdWwLHm9F44cSLXiLQ8h5G26Qej4znGa25Da3
	XafLi2BOFNnO+ngBWjZeJrYwgCTfQrdLGtv5QsYODv/02svNfp1g3g2zuLLlTrh3CkRbnsYPKNk
	kFPfjdmg077dimSW8RvLMywdOp+Ll9Y0SLiJPYGIKeO9fkbKuCXE1N0WoGE/dVyaLz7ElF/IFOM
	cATeWV40vgZo9vIEHaYw4WzdSIdN7Fo9VPK56+jNiMm36/SHblGTOtcapmF4RjgvE+7ALhXfjEK
	SA6HTrnJyLHT78f3JdPIkvWLQKcJra/np/Rs1pauSBpyZWhyTcsKfAFsdO89nlGueeQombx8xmr
	mKjvV+GomVKKecUvhLIQdoZx2x/FxdfVp/QhqP5xIGmBOj43uL9UY6fZbatwpdi5OpGvb26zWIk
	1egkKZUMjwWtE+OdiQrs8jpm0DVY5+Pbel+d70cp8VMTQuGUrjz3tNaOgnA4sqQKJWqVi2kxE6w
	70fChvHVH/WVnuxJiJHPGGl7ClAu1k=
X-Received: by 2002:a05:600c:1f91:b0:492:4e09:9fc1 with SMTP id 5b1f17b1804b1-4998797d111mr154059175e9.15.1786791890869;
        Sat, 15 Aug 2026 04:04:50 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499899afae3sm98004825e9.3.2026.08.15.04.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 04:04:49 -0700 (PDT)
Message-ID: <6a8047d1.3527643f.2d620e.3236@mx.google.com>
X-Google-Original-Message-ID: <aoBHzVNCc-TOnCaP@Ansuel-XPS.>
Date: Sat, 15 Aug 2026 13:04:45 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
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
 <6a7e1b73.e11288f4.1351ae.5625@mx.google.com>
 <5qulrgfnwzuo556hxsyg3iweqv6i57ll3chhhb3nxe7lgr6fff@4l3s5rotnpab>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5qulrgfnwzuo556hxsyg3iweqv6i57ll3chhhb3nxe7lgr6fff@4l3s5rotnpab>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_040454_314198_57B9D531 
X-CRM114-Status: GOOD (  24.95  )
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

On Sat, Aug 15, 2026 at 08:16:56AM +0200, Manivannan Sadhasivam wrote:
> On Thu, Aug 13, 2026 at 09:30:54PM +0200, Christian Marangi wrote:
> > On Thu, Aug 13, 2026 at 12:08:20PM -0500, Bjorn Helgaas wrote:
> > > On Thu, Aug 06, 2026 at 06:53:32PM +0200, Christian Marangi wrote:
> > > > The Airoha AN7581 SoC supports configuring the first PCIe0 lane to 2-lanes
> > > > mode (x2 link) by bonding it with the second PCIe lane (PCIe1). This is
> > > > done by configuring the PCIe MUX in the SCU register.
> > > > 
> > > > To correctly configure PCIe0 in x2 link, define in DT the following
> > > > additional properties:
> > > > 
> > > >   - additional reg, 'sec-pcie-mac' for the secondary PCIe.
> > > >   - PERSTOUT reset for both main and secondary PCIE0, called 'perstout' and
> > > >     'sec-perstout'
> > > >   - 'airoha,scu' property to correctly configure the SCU register for the
> > > >     PCIe MUX
> > > >   - 'num-lanes' set to '2' to enable PCIe0 in x2 link
> > > > 
> > > > In such configuration the EQ preset are configured to the same values.
> > > > 
> > > > To permit correct configuration of the PCIe link, additional logic is added
> > > > to assert and deassert the PERSTOUT resets. Support of these additional
> > > > reset was introduced in Airoha clk driver with commit
> > > > 6712f48eb3a1 ("clk: en7523: add support for dedicated PCIe PERSTOUT reset")
> > > > and on backporting of this commit also the clk driver change will be
> > > > needed.
> > > 
> > > I don't see 6712f48eb3a1 in upstream or linux-next.  Is this SHA1
> > > going to valid if we merge this for v7.3?
> > 
> > I picked that sha1 from the git pull for the staging clk tree.
> > 
> 
> Ah, I missed it. In this case the SHA should be dropped and maybe we can refer
> the lore link of the patch?
> 

Just yesterday it was picked and it's present in clk-next [1].

The commit didn't change as merge commit are used so the sha1 is valid.

I think we can keep it?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/commit/drivers/clk/clk-en7523.c?h=clk-next&id=6712f48eb3a15842925171441505fa2e7699c57e

-- 
	Ansuel


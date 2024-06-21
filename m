Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B374C2BB85
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jun 2024 17:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=9QlhM+I6Bet0atR55nrRibRgsZ2zUvMMbEK5lDuyPEw=; b=Djv4HpDvwXCXhM
	IJKuXTvwiokOrOBHluIson1N4o/rpTqrICX4k5ZwxuxzMAlm7iyHcd6Orkq+gZGgR8vJovaqbr5UR
	a5ORV/bwAWcxzJx0e1NK+09ToUoq1sNhswCPDM203gdDS851My5EdHg1JJU3lFDJvuVisR/Sdks1z
	A/snukN18CJ+j7dNvvP3ZJiV6HRjAqARgeDH5+n7d6E5Q/U8J6HepRD2a6Exxawmn2Ixn9ASeILRd
	rXz5JxIsQy/84TBl8AZi9l33KmYig88/sPVJB0PLu9Wep2Y6Uu6Zd1NORlkzVU6wnE7DxvBVTW9Mv
	M9SVIsuT58MpHR2u3NRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKiQQ-0000000A99V-108K;
	Fri, 21 Jun 2024 17:51:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKiQL-0000000A97y-0Jvr;
	Fri, 21 Jun 2024 17:51:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BD3FD62B8C;
	Fri, 21 Jun 2024 17:51:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D8F6C2BBFC;
	Fri, 21 Jun 2024 17:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718992302;
	bh=5FA0PHgGT1Ni8hsFhtjGXWNPUyoxyBny5Xgs7qU/nNY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Qp5qZIa6zS9YWjKPVc74FtqGF9bVl/gLyxpAYeSDFT/N7nTww+JZa0BH0LU1HRiBv
	 zb+5OqETVcf/jxy7Jx51EieTIqReHPrAGobkRuH4TYUFt1tZt+bcDi4gu1HzMIAygu
	 ZZ1U8i+obUElaypu5fUyEEFC7pxXRtWMWC8sFMQKERrPth/q6tJ4Rt4G9b/hutR6Wp
	 KXtQQ/YLGgKKdPe4gLGlGknRgVdqDcywOQLWz6q0u03Htws/KADVEJjKlIFK9d0tb3
	 LV/9UgnW43LI+Af6QV+jXPC/qk5yOSxWHXALd5dq7nHSTzJ8VryQwtPaObM7NP6RIn
	 pbQRTTtSeRU6Q==
Date: Fri, 21 Jun 2024 12:51:38 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-pci@vger.kernel.org, ryder.lee@mediatek.com,
	lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, linux-mediatek@lists.infradead.org,
	lorenzo.bianconi83@gmail.com, linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
	nbd@nbd.name, dd@embedd.com, upstream@airoha.com,
	angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH 3/4] PCI: mediatek-gen3: rely on reset_bulk APIs for phy
 reset lines
Message-ID: <20240621175138.GA1395691@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8ab615a56759a4832833211257d83f56bf64303.1718980864.git.lorenzo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_105145_200255_0970D982 
X-CRM114-Status: GOOD (  13.68  )
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

On Fri, Jun 21, 2024 at 04:48:49PM +0200, Lorenzo Bianconi wrote:
> Use reset_bulk APIs to manage phy reset lines. This is a preliminary
> patch in order to add Airoha EN7581 pcie support.

If you have occasion to revise this:

  s/rely/Rely/ in subject
  s/phy/PHY/ in subject and commit log
  s/pcie/PCIe/ in commit log

> @@ -912,7 +927,13 @@ static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
>  	 * The controller may have been left out of reset by the bootloader
>  	 * so make sure that we get a clean start by asserting resets here.
>  	 */
> -	reset_control_assert(pcie->phy_reset);
> +	reset_control_bulk_deassert(pcie->soc->phy_resets.num_rsts,
> +				    pcie->phy_resets);
> +	usleep_range(5000, 10000);
> +	reset_control_bulk_assert(pcie->soc->phy_resets.num_rsts,
> +				  pcie->phy_resets);
> +	msleep(100);

Where did these usleep and msleep numbers come from?  They should use
a #define that we can connect back to a spec.

These delays should also be mentioned in the commit log because it
appears unrelated to the conversion to the reset_bulk API.  Actually,
it would be even better if they were in a separate patch, since it
looks like a logically separate change.

>  	reset_control_assert(pcie->mac_reset);
>  	usleep_range(10, 20);

Unrelated to this patch, but it would be nice to have an explanation
of this existing delay, too.

Bjorn


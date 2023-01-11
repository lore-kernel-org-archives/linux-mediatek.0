Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4B9C5479D
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jan 2023 22:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=hi3XB0zlsg6R1JuCZB44u/f32HwritsWiDcNXVbnAd4=; b=hiFhT5zI9tZXqr
	IhlOLJJzkf76ULe87aUVpv8igPjHj6zOOXw2btxNv5WmqHIm3YvTZ7ljBQFgVKQCZM7kcNHCoXgq4
	Re9C/w1DLJ4OtwwGAhKKYgbaX7ez3Bh3ieuKCjNkFKcNr8zCGU/SSqBdBtz+y62XBGR9tdB77Fwwn
	rIqc1a7Z/1f316E5dLA4/2YMkX8fWNOXmkvkQ5FtTO/rwM9/1k+lT514oBqjr+/BWEqM+xzxwfkhn
	OCa9OfBcF6OzFTI7xsnLYFBtyOtB/m+GQ5B6RkdTkouay2tqnQD05N7/qDcTsbSMr66XnkKKGfF1g
	OXhvcrv7PT00J6gQVIfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFjMg-00D4Lj-34; Wed, 11 Jan 2023 22:14:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFjMV-00D4Kh-2N; Wed, 11 Jan 2023 22:14:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CA52361EDC;
	Wed, 11 Jan 2023 22:14:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC377C433EF;
	Wed, 11 Jan 2023 22:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673475261;
	bh=brVowBD7+XLa5K8t/DrjPINuNXrFSej5bIzDIj+mIFI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=dG3fOAFX0pDPm9wB7aarisELFuK5eWKPQ1eHhaEiS5CXGgVo8fswI+q6JmaGaJzQq
	 4PW7BjrZHQnZIwDnxBabdJCo/XstfAqNrQWO9z7s3YRYf2NkTXayVJHhc9KSnR42+M
	 RlRxsc9oqJFIe3aPzKNaxDrHTJan9pHD70nkp8j3ReR8MgKkDjsJrkoqw9NcilnO5f
	 iO+hkJA2t7+aJOXa6/XUOo58D4nFucoDM3DMRV9pNFlfbRS6gSe/g9F825KmhJuCQo
	 Up33XjlCLgLtu+/RJRoxWjvJj+m4Xu8KlOpx0wekWfREKUGu83AUKlP6ZLi+wVrRJZ
	 koV0YRz1S7q8A==
Date: Wed, 11 Jan 2023 16:14:19 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jian Yang <jian.yang@mediatek.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	chuanjia.liu@mediatek.com, jieyy.yang@mediatek.com,
	qizhong.cheng@mediatek.com, rex-bc.chen@mediatek.com,
	david-yh.chiu@mediatek.com
Subject: Re: [PATCH 1/2] PCI: mediatek-gen3: Add power and reset control
 feature for downstream component
Message-ID: <20230111221419.GA1710905@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230111032542.20306-2-jian.yang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_141423_171338_FCEE96FA 
X-CRM114-Status: GOOD (  14.71  )
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

Hi,

On Wed, Jan 11, 2023 at 11:25:41AM +0800, Jian Yang wrote:
> From: "jian.yang" <jian.yang@mediatek.com>
> 
> Make MediaTek's controller driver capable of controlling power
> supplies and reset pin of a downstream component in power-on and
> power-off flow.
> 
> Some downstream components (e.g., a WIFI chip) may need an extra
> reset other than of PERST# and their power supplies, depending on
> the requirements of platform, may need to controlled by their
> parent's driver. To meet the requirements described above, I add this
> feature to MediaTek's PCIe controller driver as a optional feature.

Is this delay (dsc-reset-msleep) specific to a device downstream from
the MediaTek controller, not to the MediaTek controller itself?  If
so, it sounds like it should be a generic value that could be used by
other drivers, too.

How do you determine the value?  If there's some PCIe spec that
determines this, please include a citation to it.  

Bjorn


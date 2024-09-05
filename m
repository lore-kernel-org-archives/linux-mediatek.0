Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16EC3CD5BA2
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Sep 2024 09:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dYxgkAANBViVPNy8ClXjafqQATE1JazRDJbttnPzMRI=; b=GTZ4bd5eHJxesiZhHklbvDHkdb
	iT71WC/YWRvBRq1SUg0cTfQZ2GurNNLOJzmWefwtE/APxRcccJldUSj0E/Xsj5P7X2GQs/ddpphWm
	UGBjDC75lPz1OYE7cPV1cluJmxXxJasLcyeH0UDtiZEPKnVNt5p+JxVRIWyYPdBLh6pbFN5aJ+rJZ
	7kH8pZjrKT2pe48PRxLIkpBBA6QdDXe/ShuPEQ2w/2xU9sWRzJxuPW372qdD9PNBCmSIFnO87fEmO
	SvqfyHujU6z4DhgFEAqTRnQjR+os3t24+f5ED9eALGJQ+x6ZSRZZrNi2gm7Ro1gmyLjKN36nfAA9p
	HAY1VfMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm91F-00000007ojQ-3HoV;
	Thu, 05 Sep 2024 09:43:13 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm8zZ-00000007oLm-0nnd;
	Thu, 05 Sep 2024 09:41:29 +0000
Date: Thu, 5 Sep 2024 02:41:29 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Chunhui Li <chunhui.li@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
	kernel test robot <lkp@intel.com>,
	Xion Wang <xion.wang@mediatek.com>
Subject: Re: [PATCH v2] module: abort module loading when sysfs setup suffer
 errors
Message-ID: <Ztl8yWZMhjSExF4L@bombadil.infradead.org>
References: <20240904124108.20444-1-chunhui.li@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904124108.20444-1-chunhui.li@mediatek.com>
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

On Wed, Sep 04, 2024 at 08:41:07PM +0800, Chunhui Li wrote:
> When insmod a kernel module, if fails in add_notes_attrs or
> add_sysfs_attrs such as memory allocation fail, mod_sysfs_setup
> will still return success, but we can't access user interface
> on android device.
> 
> Patch for make mod_sysfs_setup can check the error of
> add_notes_attrs and add_sysfs_attrs.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202409010016.3XIFSmRA-lkp@intel.com/
> Signed-off-by: Xion Wang <xion.wang@mediatek.com>
> Signed-off-by: Chunhui Li <chunhui.li@mediatek.com>

Please use Fixes tag and resend.
 
  Luis


Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3F0C28D13
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Aug 2022 23:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PrL0R3/CzGMdgG7hnYexz8KRQvfcVOfWXA4xjyieg5o=; b=e8xAY0XTBvRcV03oN2BpiWffMT
	VWPRpDzH1Qu1lDaMZPwpnu5HJQY+FfNxCaZCg0SHgTqIoz+12Jn+LQYp/SKbJPJd0+PLQdTD0MeD7
	Rp+haAtN3NaoESJR7u3J+N7vBeA+uaFYDMMeyNF1Zlcz2hKxeI7Rv0DrtUiwnJ2kJsCnJvPJljYDZ
	fCOd2TElup8oCXOUZm8+JxhnzO8vdFczEZGgf3zsitS8soSiBVz76VGMqScdMAXshLqwsqu8gHtoH
	zU6MWGvpA4emqF7VbAS5+y+X/hJr5O7QwzcgO3duZ3rys382VhUxH/fVk1781ZqkfcH9S2AV8jfj8
	Qqu8mCmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQH7Q-00G7M7-Hv; Mon, 22 Aug 2022 23:46:08 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQH6d-00G6qW-Ah; Mon, 22 Aug 2022 23:45:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661211919; x=1692747919;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JEtffjsv/UU5sWGCyM3iXEbl5ZR5P6LGzBjiHq53Suo=;
  b=bXTD87iGNmGGx/V4T2TF7w1qiNeZPx5ditoBH0dVM/Pc9HZ9UAhmQEV5
   f2mSvNhJorpo5kgTnazJ++5sGfDCmYNlg20B4alw2FJDvdbqm3xodUQ1K
   xn170NmSHJ/BX8/HFVi2Al73EGB1fDebPuZ/8QQULlOhnTFy5ICPqxYdL
   o0jj7pbuM5ry5uXQapILWtCawPqpVN0lIldSMDIrW6hMZ40kt1EVcJuXR
   UelW1/8qz10+g9PkUKHxZeDyBGlrxDT5FbqSI3DyinBO7H/U/wAmGbZRO
   szEjs0Ywvkn+e0vVZyrIqQ0EyP+d9eicmM17AupsJELEpFZJ9wHDRvf0e
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="294831297"
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; 
   d="scan'208";a="294831297"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2022 16:45:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; 
   d="scan'208";a="642225949"
Received: from lkp-server01.sh.intel.com (HELO dd9b29378baa) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 22 Aug 2022 16:45:15 -0700
Received: from kbuild by dd9b29378baa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oQH6Y-0000rl-1P;
	Mon, 22 Aug 2022 23:45:14 +0000
Date: Tue, 23 Aug 2022 07:44:26 +0800
From: kernel test robot <lkp@intel.com>
To: Markus Schneider-Pargmann <msp@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Fabien Parent <parent.f@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kbuild-all@lists.01.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: Re: [PATCH v4 2/4] clk: mediatek: Provide mtk_devm_alloc_clk_data
Message-ID: <202208230714.8DNW6JjZ-lkp@intel.com>
References: <20220822152652.3499972-3-msp@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220822152652.3499972-3-msp@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_164519_482385_8BC12A93 
X-CRM114-Status: GOOD (  11.55  )
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

Hi Markus,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on robh/for-next linus/master v6.0-rc2 next-20220822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Schneider-Pargmann/clk-mediatek-Add-mt8365-support/20220822-233030
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
config: loongarch-randconfig-c004-20220821 (https://download.01.org/0day-ci/archive/20220823/202208230714.8DNW6JjZ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

cocci warnings: (new ones prefixed by >>)
>> drivers/clk/mediatek/clk-mtk.c:64:1-6: WARNING: invalid free of devm_ allocated data

vim +64 drivers/clk/mediatek/clk-mtk.c

9741b1a68035b54 James Liao    2015-04-23  61  
609cc5e1a82394e Chen-Yu Tsai  2022-05-19  62  void mtk_free_clk_data(struct clk_hw_onecell_data *clk_data)
300796cad22153f Chun-Jie Chen 2021-09-14  63  {
300796cad22153f Chun-Jie Chen 2021-09-14 @64  	kfree(clk_data);
300796cad22153f Chun-Jie Chen 2021-09-14  65  }
609cc5e1a82394e Chen-Yu Tsai  2022-05-19  66  EXPORT_SYMBOL_GPL(mtk_free_clk_data);
300796cad22153f Chun-Jie Chen 2021-09-14  67  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp


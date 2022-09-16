Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9224C32771
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Sep 2022 03:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7eWdpkChRc0r8YwNYYnIxHjt2oBpWtyfeq/corPDpK8=; b=lwXqBaNu4OY8Hf4yWMHhk4ablz
	alG/1KIp0XbISt3NCwSjYTmvFk5NU8Unu7mnYHnrC6SCV6SpcKQhf+vSFkEpLi75xaqHDRBcn5ql3
	p/IM2WWbbHgR+kHM9WzxB4lV4REOb9nhnU9IaYC2iay7WItwOwVvrBjsQKKiPLOXHEDSrV794JcUY
	5h+FgoyO/BHTbME3QTW2LWnRPjb43R9yBTJco8e2JZ1LYSKwMM1ZNC2J/rL3ObloWdaNKUMVN4aLa
	5KQmZtE7ij1Dlv/QwwgDFRYYFj7rA5OFzQJeeKvGY4fWcKqbxCnXbbo7mrjrQn38kOMqh2Iykb4jd
	P6e/YZ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ24V-006I1v-Oi; Fri, 16 Sep 2022 03:31:19 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ24I-006HvO-9R; Fri, 16 Sep 2022 03:31:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663299066; x=1694835066;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W0cfxaJO3/1PDzVFBWy7MMV7m4LDSVvZlQ6U4vLGtjI=;
  b=OX3cTCvqjEP567slpKNtxqK3unLXpXQw32Zytd/i10y2tY9tHiACq3df
   kG8P87jm1ljmAEcMaMXzHyMhIVsPTnQ0xdLO2ZJkxnkgjCdbYBzfcSvCB
   s6dh4TU4Sd38Vjis7g58xNxAxCJm2ST5aIaWMlsPJ3PrE8lPlidAiccZI
   p/L76NpR9p/01pbC9sf4wG3BHJ7swBFVmzmJLjMMJwE9fmFMOwcAeaU3k
   +UmesWafs/OsubcxF1I4aSDxB9DvjZeNIF6TNm41SgvxbPKHkQQDzrYEs
   re4gSDZ4o2v1gbtkKbHxNgbttVtM2LGOf7WdT+qZl7ae3McrIexD53476
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="278630048"
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; 
   d="scan'208";a="278630048"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2022 20:30:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; 
   d="scan'208";a="568689707"
Received: from lkp-server02.sh.intel.com (HELO 41300c7200ea) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 15 Sep 2022 20:30:33 -0700
Received: from kbuild by 41300c7200ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oZ23k-0001OI-1a;
	Fri, 16 Sep 2022 03:30:32 +0000
Date: Fri, 16 Sep 2022 11:29:35 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	robh+dt@kernel.org
Cc: kbuild-all@lists.01.org, jassisinghbrar@gmail.com,
	krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
	houlong.wei@mediatek.com, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] dt-bindings: mailbox: Convert mtk-gce to DT schema
Message-ID: <202209161109.lJhgeduV-lkp@intel.com>
References: <20220915101716.70225-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220915101716.70225-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_203106_391378_1BFBC853 
X-CRM114-Status: GOOD (  12.55  )
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

Hi AngeloGioacchino,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.0-rc5 next-20220915]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-mailbox-Convert-mtk-gce-to-DT-schema/20220915-181923
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/2bc0d648f46bb6438cd4c7a140a613090ee9c1b0
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review AngeloGioacchino-Del-Regno/dt-bindings-mailbox-Convert-mtk-gce-to-DT-schema/20220915-181923
        git checkout 2bc0d648f46bb6438cd4c7a140a613090ee9c1b0
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mailbox/mtk-gce.txt

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp


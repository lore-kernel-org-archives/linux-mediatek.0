Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9ABFC4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Oct 2023 21:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=glxxDtJUb1rmlWRXCnJcp7hDgB5WWCtpgPGmB2j511U=; b=nuZlaV6/HK3JE/AcnnXJu+Qoqn
	4QeEe5NxRiVG1iwgwZAq/jRJSmbmLXwnbKyUmI9/G2BUNlV9M9zVkYZRu7KWe6RsQicPK48iyIawR
	kood/e1TfZqeU6NXTSHedfNRhjw1Mq/v4Z3D1rJ7DZboyU6/HsszTB7a1Wvpy4WTgrTwbveSCOOQy
	9GqmacOyb0p1leGw8q1Oci9cuHhgefPVt9rUYS9kXi1YMEPjo+DwnQKX1cb6ErqirvmEBKG76Gqjc
	1mrNGrJNFaZxC/EDA++t3p/mpveLL9HW/h4qLS7ihmTTkn8VGceX9LVj18pZr5wZqkptaQgKgrRBx
	rmI8s4HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxwcR-006BjY-17;
	Tue, 31 Oct 2023 21:49:51 +0000
Received: from mgamail.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxwcO-006Bic-33
	for linux-mediatek@lists.infradead.org;
	Tue, 31 Oct 2023 21:49:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698788988; x=1730324988;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=600Nvh60124lsqCSvHFqzYzSMSzi4J7+aWhMqXLTTIM=;
  b=Z/7IZc+2cHfJcqr3csNzobzT2JGCD3h5xWRTjNzlhWDJHiczANBDleAm
   CDljuPiuRFZEvcjV7vO9bhanL6Tu74hYKaVBMmMYVmYcN/flu3c9qyBDE
   55BWJpIwkoHdYQ3lfEcbrFVjrQi8VlSssztpJpRYOFjY50pUnav1FbepQ
   pqbLDeeRO52I3W3XaO92jVnSVXbEf39v66luugeH+ToAqBF7J/nYfDSs8
   vgfRu5HRd0ajeRrfWih9+qPFYO+B0tQgIZh7UWKEnVKEEA78xmQ+JYm/i
   t63tHiSKP9OhtGb3mExoJxyWDl+Ipa9HsbZ3YvAPdWiCe7dO3PECcoMSE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="454850529"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="454850529"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 14:49:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="760748094"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="760748094"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 31 Oct 2023 14:49:42 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxwcG-0000PI-0V;
	Tue, 31 Oct 2023 21:49:40 +0000
Date: Wed, 1 Nov 2023 05:49:33 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-acpi@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-media@vger.kernel.org,
	Paul Elder <paul.elder@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Julien Stephan <jstephan@baylibre.com>, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/1] device property: Add fwnode_name_eq()
Message-ID: <202311010542.1tRHV0in-lkp@intel.com>
References: <20231031135306.1106640-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031135306.1106640-1-sakari.ailus@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_144949_048032_ABAA47ED 
X-CRM114-Status: GOOD (  14.35  )
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

Hi Sakari,

kernel test robot noticed the following build warnings:

[auto build test WARNING on driver-core/driver-core-testing]
[also build test WARNING on driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.6 next-20231031]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/device-property-Add-fwnode_name_eq/20231031-224454
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20231031135306.1106640-1-sakari.ailus%40linux.intel.com
patch subject: [PATCH 1/1] device property: Add fwnode_name_eq()
config: sh-allnoconfig (https://download.01.org/0day-ci/archive/20231101/202311010542.1tRHV0in-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231101/202311010542.1tRHV0in-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311010542.1tRHV0in-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/property.c:611: warning: Function parameter or member 'fwnode' not described in 'fwnode_name_eq'


vim +611 drivers/base/property.c

   596	
   597	/**
   598	 * fwnode_name_eq - Return true if node name is equal
   599	 * @fwnode The firmware node
   600	 * @name: The name to which to compare the node name
   601	 *
   602	 * Compare the name provided as an argument to the name of the node, stopping
   603	 * the comparison to either '\0' or '@' character, whichever comes first. This
   604	 * function is generally used for comparing node names while ignoring the
   605	 * possible unit address of the node.
   606	 *
   607	 * Return: true if the node name matches with the name provided in the @name
   608	 * argument, false otherwise.
   609	 */
   610	bool fwnode_name_eq(const struct fwnode_handle *fwnode, const char *name)
 > 611	{
   612		const char *node_name;
   613		unsigned int len;
   614	
   615		node_name = fwnode_get_name(fwnode);
   616		if (!node_name)
   617			return false;
   618	
   619		len = strchrnul(node_name, '@') - node_name;
   620	
   621		return strlen(name) == len && !strncmp(node_name, name, len);
   622	}
   623	EXPORT_SYMBOL_GPL(fwnode_name_eq);
   624	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


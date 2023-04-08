Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23768C77B61
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Apr 2023 08:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iBqoBBkQH2xs3fROq0A20DMkIbovpzB3A7k6/csjilM=; b=3EAyQsHlvtdlvsKI9a8gICaJea
	zQv5zlnHs7BhDUpHC89SHpRwuyPYiYbVPNTcsC8Iu/nXMCFARp8sVE2x7NzZpPYKHNV78og4wQQoF
	MRT5U7ZpHPe8utB8vA/mKRAz4wHJ9fAD5snz1xQ65UgMTj9SoAsX9hQdcaZyrmroTlG5Y20W5M7Va
	kveKvvMoByx7xSqziiK/TgQi7Sk6yDosoKN8MX2tHaclSn5+3WaAnc2IP+F/VgxcXHksjknqERPBR
	wmqN7zzrhwIhvAydl5I6dkSc5gl0up6vSfvWJG9CTRRYDhW6HRUoblFKkIHH9rM0U9wi7pWJ65rTb
	dwXIIrIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pl437-00BxTf-2A;
	Sat, 08 Apr 2023 08:35:53 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pl433-00BxSg-2h;
	Sat, 08 Apr 2023 08:35:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680942949; x=1712478949;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lxkkBZdI9k/nHA+MzzcXBFUD0IJeMAc31c2hhqC60EQ=;
  b=A5+eqq+XjpN/G+cgBs/9v4xINlzyTmvaSgxCPvEIJfyQFCS3LFruCbcY
   LPGkcDTwZqh+O4NRr4l06PGibHWYoThFvUgBEVAURxoKHf++W1q8VWKll
   dD9rrTDJynSMHK0pBxU0EDwroR8vYTufpWpgGS6LZSFxQufTuo3FSmy6C
   LKmjpcvfIu3ooxj8vn6it4ok69GghlmrRnQZXTX9gz2vB/OAjYamp6TT6
   lUFLSwiLEqJBtSqg86rx9TG3w/1ytb5ub2n5acU7k4uJl/Pgzl58dLmwa
   NYoBqUaBaXDwjUXbaFXjvnnqzPlZyua4fBLm8Il9ou3PIpJeWNo/+ABRH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="331785179"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; 
   d="scan'208";a="331785179"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2023 01:35:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="752249577"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; 
   d="scan'208";a="752249577"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 08 Apr 2023 01:35:40 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pl42t-000TXp-20;
	Sat, 08 Apr 2023 08:35:39 +0000
Date: Sat, 8 Apr 2023 16:35:25 +0800
From: kernel test robot <lkp@intel.com>
To: Tze-nan Wu <Tze-nan.Wu@mediatek.com>, rostedt@goodmis.org,
	mhiramat@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	bobule.chang@mediatek.com, wsd_upstream@mediatek.com,
	Tze-nan.Wu@mediatek.com, stable@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] ring-buffer: Prevent inconsistent operation on
 cpu_buffer->resize_disabled
Message-ID: <202304081615.eiaqpbV8-lkp@intel.com>
References: <20230408052226.25268-1-Tze-nan.Wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230408052226.25268-1-Tze-nan.Wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230408_013549_954989_C61E0527 
X-CRM114-Status: GOOD (  12.86  )
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

Hi Tze-nan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on rostedt-trace/for-next v6.3-rc5 next-20230406]
[cannot apply to rostedt-trace/for-next-urgent]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tze-nan-Wu/ring-buffer-Prevent-inconsistent-operation-on-cpu_buffer-resize_disabled/20230408-132502
patch link:    https://lore.kernel.org/r/20230408052226.25268-1-Tze-nan.Wu%40mediatek.com
patch subject: [PATCH] ring-buffer: Prevent inconsistent operation on cpu_buffer->resize_disabled
config: x86_64-randconfig-a002-20230403 (https://download.01.org/0day-ci/archive/20230408/202304081615.eiaqpbV8-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d404bc0af0a4bde3aa20704642d69a78bdc154f8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Tze-nan-Wu/ring-buffer-Prevent-inconsistent-operation-on-cpu_buffer-resize_disabled/20230408-132502
        git checkout d404bc0af0a4bde3aa20704642d69a78bdc154f8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/trace/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304081615.eiaqpbV8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/ring_buffer.c:5359:15: warning: variable 'reset_online_mask' is uninitialized when used here [-Wuninitialized]
           cpumask_copy(reset_online_mask, cpu_online_mask);
                        ^~~~~~~~~~~~~~~~~
   kernel/trace/ring_buffer.c:5353:33: note: initialize the variable 'reset_online_mask' to silence this warning
           cpumask_var_t reset_online_mask;
                                          ^
                                           = NULL
   1 warning generated.


vim +/reset_online_mask +5359 kernel/trace/ring_buffer.c

  5344	
  5345	/**
  5346	 * ring_buffer_reset_online_cpus - reset a ring buffer per CPU buffer
  5347	 * @buffer: The ring buffer to reset a per cpu buffer of
  5348	 * @cpu: The CPU buffer to be reset
  5349	 */
  5350	void ring_buffer_reset_online_cpus(struct trace_buffer *buffer)
  5351	{
  5352		struct ring_buffer_per_cpu *cpu_buffer;
  5353		cpumask_var_t reset_online_mask;
  5354		int cpu;
  5355	
  5356		/* prevent another thread from changing buffer sizes */
  5357		mutex_lock(&buffer->mutex);
  5358	
> 5359		cpumask_copy(reset_online_mask, cpu_online_mask);
  5360	
  5361		for_each_cpu_and(cpu, buffer->cpumask, reset_online_mask) {
  5362			cpu_buffer = buffer->buffers[cpu];
  5363	
  5364			atomic_inc(&cpu_buffer->resize_disabled);
  5365			atomic_inc(&cpu_buffer->record_disabled);
  5366		}
  5367	
  5368		/* Make sure all commits have finished */
  5369		synchronize_rcu();
  5370	
  5371		for_each_cpu_and(cpu, buffer->cpumask, reset_online_mask) {
  5372			cpu_buffer = buffer->buffers[cpu];
  5373	
  5374			reset_disabled_cpu_buffer(cpu_buffer);
  5375	
  5376			atomic_dec(&cpu_buffer->record_disabled);
  5377			atomic_dec(&cpu_buffer->resize_disabled);
  5378		}
  5379	
  5380		mutex_unlock(&buffer->mutex);
  5381	}
  5382	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests


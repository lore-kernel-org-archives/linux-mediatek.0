Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D18AC7619A
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Apr 2023 12:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6sPb8rZ7ts4buC3eIPeZkEZ+2g6YkApdQzt+vZl0eYc=; b=Qz6HGWLVXjP3EcPwzAlUK/RS5t
	CYKPh6tHWwuXjrUZC1Ox5ZcAS10P/ofbul13ozmGFNI/5RsfZv7QDsG7J+h9vdOsoX7L8um7HFI4P
	E5ZpEJ3iuKkd0ScoU7mQyzTDaCOacceIBYjaYh9mrA+kfA3OBhJsV5dwsWC495uT9MEofqJDNn8Az
	HBbIpaN/EBLHcfJMugyCBx1RYH2V6zCVfc7D4O22HvoHqxbhC2sQRaJ7g2f5oc6lOE8I3+mKoFpFJ
	kOh4W5Thzl+i3YOU2CVDkXgxYcE+Imo7Mr1oS2mPt8QV0RF3pXC2k5MQbECkxQfZbPpChJda7U6s2
	5g80fOEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pl7Zr-00CHyW-1i;
	Sat, 08 Apr 2023 12:21:55 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pl7Zo-00CHxv-0Y;
	Sat, 08 Apr 2023 12:21:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680956512; x=1712492512;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eW13kTIIAfgyJU8/U8MXPKMLhPp5eP1G5Lfen3ZIMtc=;
  b=dswtWocg99xwIXHddJ+KiDfFusaizPq3UC7iqFyH5Qzn9k8AA85QTQvw
   xIi+b0GjQVDTqP9Gp9h3QU8rbxmXU5/GnHj7WR94HgFlZpMnb7jNchJTt
   O+ZylrahtcJUAZK3aEnkLRCF/yDDntzs/9tOw4jhBGFzo/duWPsWW1HJ3
   MB7zWd0ZpNida5Hc7Oqnh5d6kgrXxsG9H5SNwLLiy4d/msWDNRvYfFntT
   83DUcMzsjEgds4mj18LEPWNtJf54JLPJZQB7w7tuM+yB7B9OpGZmjSHUJ
   JaUMh4ZazhzTtl5EdNnZgCpzzxTMVQEFy4+EXgDIYM3qiqlQqB5EhJFSe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="322769828"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; 
   d="scan'208";a="322769828"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2023 05:21:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="681274312"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; 
   d="scan'208";a="681274312"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 08 Apr 2023 05:21:48 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pl7Zj-000TiP-1t;
	Sat, 08 Apr 2023 12:21:47 +0000
Date: Sat, 8 Apr 2023 20:20:52 +0800
From: kernel test robot <lkp@intel.com>
To: Tze-nan Wu <Tze-nan.Wu@mediatek.com>, rostedt@goodmis.org,
	mhiramat@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, bobule.chang@mediatek.com,
	wsd_upstream@mediatek.com, Tze-nan.Wu@mediatek.com,
	stable@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] ring-buffer: Prevent inconsistent operation on
 cpu_buffer->resize_disabled
Message-ID: <202304082051.Dp50upfS-lkp@intel.com>
References: <20230408052226.25268-1-Tze-nan.Wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230408052226.25268-1-Tze-nan.Wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230408_052152_260122_0C742EC1 
X-CRM114-Status: GOOD (  11.64  )
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
[cannot apply to rostedt-trace/for-next-urgent]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tze-nan-Wu/ring-buffer-Prevent-inconsistent-operation-on-cpu_buffer-resize_disabled/20230408-132502
patch link:    https://lore.kernel.org/r/20230408052226.25268-1-Tze-nan.Wu%40mediatek.com
patch subject: [PATCH] ring-buffer: Prevent inconsistent operation on cpu_buffer->resize_disabled
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230408/202304082051.Dp50upfS-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d404bc0af0a4bde3aa20704642d69a78bdc154f8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Tze-nan-Wu/ring-buffer-Prevent-inconsistent-operation-on-cpu_buffer-resize_disabled/20230408-132502
        git checkout d404bc0af0a4bde3aa20704642d69a78bdc154f8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304082051.Dp50upfS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/trace/ring_buffer.c: In function 'ring_buffer_reset_online_cpus':
>> kernel/trace/ring_buffer.c:5359:9: warning: 'reset_online_mask' is used uninitialized [-Wuninitialized]
    5359 |         cpumask_copy(reset_online_mask, cpu_online_mask);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ring_buffer.c:5353:23: note: 'reset_online_mask' was declared here
    5353 |         cpumask_var_t reset_online_mask;
         |                       ^~~~~~~~~~~~~~~~~


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


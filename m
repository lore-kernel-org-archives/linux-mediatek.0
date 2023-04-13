Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFF0C77B61
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 10:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oDCaKmpPM8QDd+P5icae045KzOW4sZZ3mxjypv6U5EU=; b=C8rYfvUWxzN/iBnxDb1CoviqOu
	/MV7DkQALlaW3BL4Lk7E5uGoXoT3Yv/4p7XQnukjAKbvL/afrzgBoMsU9DeSHYapo2crO0Y6JIQ9b
	gjgJ2DX3tl5GUvtuoK5C1fExtFRrSLzx+hA2LKzgDBwuRIz7WyudnZKk7owUFu6KVjeLVImHVqisY
	Y5Fi0pLoBlIVNB5pzsMoKiWq2B/SuudSNY0RIk9RhYscOJah11pFsiLhUJa0jykN4vKvxdpiwNPZM
	o0BWuFrvizuc5P6ZOpVdiq8HE7g+E7eSa1f0YeG9QzKbK038Tya7Y9gm9HazijBqMvNs3I1j6Lvnn
	RsYaZFuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmuL2-005qgF-2l;
	Thu, 13 Apr 2023 10:38:00 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmuKy-005qbM-0C;
	Thu, 13 Apr 2023 10:37:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681382276; x=1712918276;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MPkqE9Gis/VXDA64MyEiDJy2k8EqS4DVEsPb8f7+NNM=;
  b=CMgFlM6qDtsIqPp0HBBertnrx++EXZEnKqKQf3x2dK1wXPzD4RB8x/ra
   bp/5/lyqGW2cjjHkpfd1m3KY6cKO4kBFJpfZMlXjCjPrgyLsYb4eofzy4
   gIDHMRrXBNbWpFw1O8VD24QVAIYpJ91QDP5xqunoCbUSpV8w5Cu0GlgUR
   J2UbQm3WUTURTNgFaSsdYPO23Y/Y05Nm/725q38yqfNlQHzBbQRJ+HW67
   u940DOx3Bwyy9Q9MW8QuN0GJh8yUOcL9Xw0zFH5V5OgM8UcecAprNQrfd
   oaPHMXGorGRPetQ+99jtQ2a7GMhL+oUPamXY9xSz3otJWWeSvvcinRBWe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="409300899"
X-IronPort-AV: E=Sophos;i="5.98,341,1673942400"; 
   d="scan'208";a="409300899"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 03:37:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="833091733"
X-IronPort-AV: E=Sophos;i="5.98,341,1673942400"; 
   d="scan'208";a="833091733"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 13 Apr 2023 03:37:46 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmuKo-000YcT-00;
	Thu, 13 Apr 2023 10:37:46 +0000
Date: Thu, 13 Apr 2023 18:37:13 +0800
From: kernel test robot <lkp@intel.com>
To: Yi-De Wu <yi-de.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yingshiuan Pan <yingshiuan.pan@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Jades Shih <jades.shih@mediatek.com>,
	Miles Chen <miles.chen@mediatek.com>,
	Ivan Tseng <ivan.tseng@mediatek.com>,
	My Chuang <my.chuang@mediatek.com>,
	Shawn Hsiao <shawn.hsiao@mediatek.com>,
	PeiLun Suei <peilun.suei@mediatek.com>,
	Ze-Yu Wang <ze-yu.wang@mediatek.com>,
	Liju Chen <liju-clr.chen@mediatek.com>,
	Yi-De Wu <yi-de.wu@mediatek.com>
Subject: Re: [PATCH v1 3/6] soc: mediatek: virt: geniezone: Introduce
 GenieZone hypervisor support
Message-ID: <202304131836.ijgy8JuB-lkp@intel.com>
References: <20230413090735.4182-4-yi-de.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230413090735.4182-4-yi-de.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_033756_139984_FAC65BB3 
X-CRM114-Status: GOOD (  10.93  )
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

Hi Yi-De,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk-dt/for-next arm64/for-next/core lwn/docs-next linus/master v6.3-rc6 next-20230412]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yi-De-Wu/docs-geniezone-Introduce-GenieZone-hypervisor/20230413-170932
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230413090735.4182-4-yi-de.wu%40mediatek.com
patch subject: [PATCH v1 3/6] soc: mediatek: virt: geniezone: Introduce GenieZone hypervisor support
reproduce:
        make versioncheck

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304131836.ijgy8JuB-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make W=1 --keep-going HOSTCC=gcc-11 CC=gcc-11 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede.h: 10 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede_ethtool.c: 7 linux/version.h not needed.
>> ./drivers/soc/mediatek/virt/geniezone/gzvm_vm.c: 14 linux/version.h not needed.
   ./drivers/soc/tegra/cbb/tegra-cbb.c: 19 linux/version.h not needed.
   ./drivers/soc/tegra/cbb/tegra194-cbb.c: 26 linux/version.h not needed.
   ./drivers/soc/tegra/cbb/tegra234-cbb.c: 27 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./samples/trace_events/trace_custom_sched.c: 11 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 289: need linux/version.h
   ./tools/perf/tests/bpf-script-example.c: 60: need linux/version.h
   ./tools/perf/tests/bpf-script-test-kbuild.c: 21: need linux/version.h
   ./tools/perf/tests/bpf-script-test-prologue.c: 49: need linux/version.h
   ./tools/perf/tests/bpf-script-test-relocation.c: 51: need linux/version.h
   ./tools/testing/selftests/bpf/progs/dev_cgroup.c: 9 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/netcnt_prog.c: 3 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_map_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_send_signal_kern.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_spin_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_tcp_estats.c: 37 linux/version.h not needed.
   ./tools/testing/selftests/wireguard/qemu/init.c: 27 linux/version.h not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests


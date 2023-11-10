Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FAAC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Nov 2023 11:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8c9wtd4t6Mzr9MvF4wVItNlAuelK7fcY8zKFy9V96s=; b=lNKj58+WIZg66xX35hGnGIDMnn
	kJb19Dc4sUiQsNsB9F5rwA6c26kTrW1uOX4eSEK87sGhUAfeqKY9R8N3hvQKtWAe4UhuhS7N0MFlP
	fP8DQ4FVWjgfPlWWspn/CWngt4Uptdq+IuZoLBz1swr/P4z9nqgrK+xOHhhlWp31D9N6cXutEFH33
	vKZ34Gnh6drPFvku4YWYye1DuJMdlHolJZINw6vi8L/sT+A7ru1qZMupL+Cks2lABylbNUY9PL9hJ
	CeaKiwNP0CUoP979nc37zFkFYbV6RV4AGS+Oy2QKt93XxhkZEeloUjigBGI/8Orunq1oY7vbAZZBT
	JE+rT/og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1PFN-008LMB-2h;
	Fri, 10 Nov 2023 11:00:21 +0000
Received: from mgamail.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1PFI-008LKL-2M;
	Fri, 10 Nov 2023 11:00:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699614016; x=1731150016;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MiCyv/x6x7GRWVTPYnX8fRfSIKJ4fUfhhPf+IF7d+s8=;
  b=L4lMvVlHUJtSFv8TjGvDYaJtlY4i1H92y1iEhRRb8rSmF3PFvL7PeNWY
   m1T1ak1gnBgG3b0RM7mUEzNQ51kZ3o7gxGyAu3iFQUA/Vauw6NdsOwF/K
   L839UV2nzcApv/mwXlMBUhunT8jGcW6bD+V6mNQjY819nAYYZ8INFxVFD
   hwl2s9gzKiYjB6z0EpTACbn3OyL7NLpX8FCkqOlpSimbApHpIq5RRZhu5
   QM48BRufwTJifyvAgKxOx03sH6gONEO1im0g2n2ohmZguSnYbg+Pw5LiX
   +45YBgZrVG9EagWuX7tu1vxeg6+rLMUUlNrNLO0WwwnzmTAwEeSflDdsC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="389029014"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="389029014"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 03:00:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="854367833"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="854367833"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Nov 2023 03:00:09 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1PF9-0009YM-36;
	Fri, 10 Nov 2023 11:00:07 +0000
Date: Fri, 10 Nov 2023 18:59:19 +0800
From: kernel test robot <lkp@intel.com>
To: ed.tsai@mediatek.com, ming.lei@redhat.com, hch@lst.de,
	Jens Axboe <axboe@kernel.dk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, wsd_upstream@mediatek.com,
	chun-hung.wu@mediatek.com, casper.li@mediatek.com,
	will.shiu@mediatek.com, light.hsieh@mediatek.com,
	Ed Tsai <ed.tsai@mediatek.com>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] block: limit the extract size to align queue limit
Message-ID: <202311101853.9N398fyj-lkp@intel.com>
References: <20231110051950.21972-1-ed.tsai@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231110051950.21972-1-ed.tsai@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_030017_089526_79DBEAA6 
X-CRM114-Status: GOOD (  19.86  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on hch-configfs/for-next linus/master v6.6 next-20231110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/ed-tsai-mediatek-com/block-limit-the-extract-size-to-align-queue-limit/20231110-142205
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20231110051950.21972-1-ed.tsai%40mediatek.com
patch subject: [PATCH v2] block: limit the extract size to align queue limit
config: arc-randconfig-002-20231110 (https://download.01.org/0day-ci/archive/20231110/202311101853.9N398fyj-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311101853.9N398fyj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311101853.9N398fyj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   block/bio.c: In function '__bio_iov_iter_get_pages':
>> block/bio.c:1261:29: warning: suggest parentheses around '-' in operand of '&' [-Wparentheses]
    1261 |                         max - bio->bi_iter.bi_size & (max - 1) : max;
         |                         ~~~~^~~~~~~~~~~~~~~~~~~~~~


vim +1261 block/bio.c

  1214	
  1215	/**
  1216	 * __bio_iov_iter_get_pages - pin user or kernel pages and add them to a bio
  1217	 * @bio: bio to add pages to
  1218	 * @iter: iov iterator describing the region to be mapped
  1219	 *
  1220	 * Extracts pages from *iter and appends them to @bio's bvec array.  The pages
  1221	 * will have to be cleaned up in the way indicated by the BIO_PAGE_PINNED flag.
  1222	 * For a multi-segment *iter, this function only adds pages from the next
  1223	 * non-empty segment of the iov iterator.
  1224	 */
  1225	static int __bio_iov_iter_get_pages(struct bio *bio, struct iov_iter *iter)
  1226	{
  1227		iov_iter_extraction_t extraction_flags = 0;
  1228		unsigned short nr_pages = bio->bi_max_vecs - bio->bi_vcnt;
  1229		unsigned short entries_left = bio->bi_max_vecs - bio->bi_vcnt;
  1230		struct block_device *bdev = bio->bi_bdev;
  1231		struct bio_vec *bv = bio->bi_io_vec + bio->bi_vcnt;
  1232		struct page **pages = (struct page **)bv;
  1233		ssize_t max_extract = UINT_MAX - bio->bi_iter.bi_size;
  1234		ssize_t size, left;
  1235		unsigned len, i = 0;
  1236		size_t offset;
  1237		int ret = 0;
  1238	
  1239		/*
  1240		 * Move page array up in the allocated memory for the bio vecs as far as
  1241		 * possible so that we can start filling biovecs from the beginning
  1242		 * without overwriting the temporary page array.
  1243		 */
  1244		BUILD_BUG_ON(PAGE_PTRS_PER_BVEC < 2);
  1245		pages += entries_left * (PAGE_PTRS_PER_BVEC - 1);
  1246	
  1247		if (bdev && blk_queue_pci_p2pdma(bdev->bd_disk->queue))
  1248			extraction_flags |= ITER_ALLOW_P2PDMA;
  1249	
  1250		/*
  1251		 * Each segment in the iov is required to be a block size multiple.
  1252		 * However, we may not be able to get the entire segment if it spans
  1253		 * more pages than bi_max_vecs allows, so we have to ALIGN_DOWN the
  1254		 * result to ensure the bio's total size is correct. The remainder of
  1255		 * the iov data will be picked up in the next bio iteration.
  1256		 */
  1257		if (bdev && bio_op(bio) != REQ_OP_ZONE_APPEND) {
  1258			unsigned int max = queue_max_bytes(bdev_get_queue(bdev));
  1259	
  1260			max_extract = bio->bi_iter.bi_size ?
> 1261				max - bio->bi_iter.bi_size & (max - 1) : max;
  1262		}
  1263		size = iov_iter_extract_pages(iter, &pages, max_extract,
  1264					      nr_pages, extraction_flags, &offset);
  1265		if (unlikely(size <= 0))
  1266			return size ? size : -EFAULT;
  1267	
  1268		nr_pages = DIV_ROUND_UP(offset + size, PAGE_SIZE);
  1269	
  1270		if (bdev) {
  1271			size_t trim = size & (bdev_logical_block_size(bdev) - 1);
  1272			iov_iter_revert(iter, trim);
  1273			size -= trim;
  1274		}
  1275	
  1276		if (unlikely(!size)) {
  1277			ret = -EFAULT;
  1278			goto out;
  1279		}
  1280	
  1281		for (left = size, i = 0; left > 0; left -= len, i++) {
  1282			struct page *page = pages[i];
  1283	
  1284			len = min_t(size_t, PAGE_SIZE - offset, left);
  1285			if (bio_op(bio) == REQ_OP_ZONE_APPEND) {
  1286				ret = bio_iov_add_zone_append_page(bio, page, len,
  1287						offset);
  1288				if (ret)
  1289					break;
  1290			} else
  1291				bio_iov_add_page(bio, page, len, offset);
  1292	
  1293			offset = 0;
  1294		}
  1295	
  1296		iov_iter_revert(iter, left);
  1297	out:
  1298		while (i < nr_pages)
  1299			bio_release_page(bio, pages[i++]);
  1300	
  1301		return ret;
  1302	}
  1303	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


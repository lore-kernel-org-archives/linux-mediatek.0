Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18450C3DA6F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 12:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CIjMmn0FJetfquButKgtVb/+1/jn1er/+7ZLlV/zTRA=; b=4L+31Z/NEuOsDgtIR8/zsIsehD
	vVCJgCY/+uxjysopOStYeAkO0OzLRtzYwdFrhY45fFTX9X3zpterKxBRWelZCsogeRybhBEy2LdAM
	3LX9mT+ZAeJe+mRwyS6QsTXAIN9/2f7azHDrX+b1W2HhaWbw09fvOrRVV7VI1xqotVTYe8wG/l/+1
	sdKEUm9CT6A9S41KErh4VLRdVYgeAqO/RaYDSL2/sExe29bJdwuY9idhh267eoxYWaMt8MNTghnh/
	N8ioQ42ePbT9z+Pvi/IULWcqvvNwpS4sXqcIp476kyZiIs4txYVMwfX+XmN8WvFxyJ9XZ5gZiKSPj
	pKIJ/HJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZVu5-005OBG-2y;
	Fri, 25 Aug 2023 12:27:05 +0000
Received: from mgamail.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZVu2-005O8a-0d;
	Fri, 25 Aug 2023 12:27:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692966422; x=1724502422;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=psOCa7KDDmybtBbFrOreIdagf4PFHIM8yxTia2JKqqs=;
  b=GhMky/kXU44KpeZ4r7JJ2QnoLIMyMgTLrCkz1UiSUjhmqNZssuFv77qt
   mEZmyzrOL6UAZOPYHnTElT0zYPkOdkfOLVCD9885hxdT2fNGBSaYj+B3s
   X3g8EBPHtIC87XpStPnBHWDJRA/3fbpYFyw2/mEoDhpDQoeED5kKGMAGU
   cgDXwx+a8DuZ2nh6Ufgxozv+oWpDFyJ5YUoTZ4MhTuy4NBKL2cefUL5ME
   amcrEgwnSwN1fjvboz2x1prBv+Hc0yJ4wlSdlggDmY60Upn2UrgX/toCe
   +e/tSSZQS3NojRDZ10Bf0btax8W9k+oJpjpfW4BgiZFjblDh8NLK0kDOO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="355030437"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="355030437"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 05:26:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="1068223843"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="1068223843"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 25 Aug 2023 05:26:47 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZVtn-0003Z4-0l;
	Fri, 25 Aug 2023 12:26:47 +0000
Date: Fri, 25 Aug 2023 20:26:10 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
	tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
	ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH v5 10/10] media: v4l2: Add mem2mem helpers for
 DELETE_BUFS ioctl
Message-ID: <202308252057.jcyaKKOJ-lkp@intel.com>
References: <20230824092133.39510-11-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824092133.39510-11-benjamin.gaignard@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_052702_245477_6597CD4B 
X-CRM114-Status: GOOD (  11.67  )
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

Hi Benjamin,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20230824]
[also build test ERROR on v6.5-rc7]
[cannot apply to linus/master v6.5-rc7 v6.5-rc6 v6.5-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Gaignard/media-videobuf2-Rework-offset-cookie-encoding-pattern/20230824-172416
base:   next-20230824
patch link:    https://lore.kernel.org/r/20230824092133.39510-11-benjamin.gaignard%40collabora.com
patch subject: [PATCH v5 10/10] media: v4l2: Add mem2mem helpers for DELETE_BUFS ioctl
config: i386-randconfig-r033-20230825 (https://download.01.org/0day-ci/archive/20230825/202308252057.jcyaKKOJ-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308252057.jcyaKKOJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308252057.jcyaKKOJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/test-drivers/vim2m.c:963:23: error: use of undeclared identifier 'v4l2_m2m_ioctl_delete_buf'; did you mean 'v4l2_m2m_ioctl_delete_bufs'?
           .vidioc_delete_buf      = v4l2_m2m_ioctl_delete_buf,
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~
                                     v4l2_m2m_ioctl_delete_bufs
   include/media/v4l2-mem2mem.h:873:5: note: 'v4l2_m2m_ioctl_delete_bufs' declared here
   int v4l2_m2m_ioctl_delete_bufs(struct file *file, void *priv,
       ^
>> drivers/media/test-drivers/vim2m.c:963:3: error: field designator 'vidioc_delete_buf' does not refer to any field in type 'const struct v4l2_ioctl_ops'; did you mean 'vidioc_delete_bufs'?
           .vidioc_delete_buf      = v4l2_m2m_ioctl_delete_buf,
            ^~~~~~~~~~~~~~~~~
            vidioc_delete_bufs
   include/media/v4l2-ioctl.h:427:8: note: 'vidioc_delete_bufs' declared here
           int (*vidioc_delete_bufs)(struct file *file, void *fh,
                 ^
   2 errors generated.


vim +963 drivers/media/test-drivers/vim2m.c

   942	
   943	static const struct v4l2_ioctl_ops vim2m_ioctl_ops = {
   944		.vidioc_querycap	= vidioc_querycap,
   945	
   946		.vidioc_enum_fmt_vid_cap = vidioc_enum_fmt_vid_cap,
   947		.vidioc_enum_framesizes = vidioc_enum_framesizes,
   948		.vidioc_g_fmt_vid_cap	= vidioc_g_fmt_vid_cap,
   949		.vidioc_try_fmt_vid_cap	= vidioc_try_fmt_vid_cap,
   950		.vidioc_s_fmt_vid_cap	= vidioc_s_fmt_vid_cap,
   951	
   952		.vidioc_enum_fmt_vid_out = vidioc_enum_fmt_vid_out,
   953		.vidioc_g_fmt_vid_out	= vidioc_g_fmt_vid_out,
   954		.vidioc_try_fmt_vid_out	= vidioc_try_fmt_vid_out,
   955		.vidioc_s_fmt_vid_out	= vidioc_s_fmt_vid_out,
   956	
   957		.vidioc_reqbufs		= v4l2_m2m_ioctl_reqbufs,
   958		.vidioc_querybuf	= v4l2_m2m_ioctl_querybuf,
   959		.vidioc_qbuf		= v4l2_m2m_ioctl_qbuf,
   960		.vidioc_dqbuf		= v4l2_m2m_ioctl_dqbuf,
   961		.vidioc_prepare_buf	= v4l2_m2m_ioctl_prepare_buf,
   962		.vidioc_create_bufs	= v4l2_m2m_ioctl_create_bufs,
 > 963		.vidioc_delete_buf	= v4l2_m2m_ioctl_delete_buf,
   964		.vidioc_expbuf		= v4l2_m2m_ioctl_expbuf,
   965	
   966		.vidioc_streamon	= v4l2_m2m_ioctl_streamon,
   967		.vidioc_streamoff	= v4l2_m2m_ioctl_streamoff,
   968	
   969		.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
   970		.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
   971	};
   972	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


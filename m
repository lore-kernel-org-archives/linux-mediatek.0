Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45DE9C25B50
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Jan 2023 12:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ESwYDlOk4VI3Uh3zZbfqfpaN5CmsYqTFhzxRLByYvmQ=; b=ZiIKyXM0iuPa6qEbdee4Xydj2m
	KbCa6E9NKEMLUCW0sK25a6iPNAdZbg9l/fXY9o3VoM1F4m0RvQ1My5ahKa4nBqJrw5wmOeaw3bGUd
	tezSsrKTeaazJ1jS79l3+cuaKjSImz37+3NXBht3U/hiLKfne1Q+gQMLHc4EThUzigSkBdjpFsLIB
	5PIwCF6dgns+hS3M3M5tDzRUPUVg08ksd+YH4LtBxrUpO19kyLp/T0mWMW08ryc8IAcwPvj3Osv2g
	jmKnWfe9KXZiXE7AM73R86KRLO/OQxnz6Ow+W1H9V+sC9ZQMfbg8QheCnp6ypqmbN6+6xj957dw0M
	QELtDFlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKIOM-003jdi-66; Tue, 24 Jan 2023 12:27:10 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKIOI-003jbQ-B0
	for linux-mediatek@lists.infradead.org; Tue, 24 Jan 2023 12:27:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674563226; x=1706099226;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z3Dx3gBnEObZB0hnHZv+e1Wl3zLmeyqgQt9ooQNjwho=;
  b=RlP+r4iM09DCnXL7uRDMB02K3tTD/cyMlm5/KhMkznLNoyRJVl0LJAnq
   kSsLC7KuTg0QNhBezooWmw1ET5eZ9Jhg3vYT7ZvFFWqbGIe/kdNa8QK8K
   bl4ZRd31Rdndxl9pyz7JqCeGhJ9rKuZ8a4ghrX3lCN6Def8QfrcQKldDQ
   K/rpEMHojrYuDI7/WRw08Sck/PfvvFV/lX3HjXNcq0Cv+PjqBcaFwm+mn
   QhvMk57BJv+xt3zxvaPTLMpS3meSZjvtUfUNWN31z8tTGQZcPp1pSUPTS
   CYhrXqBBjdyHLG3oUDlDz37w7RK7JB0BBW/hUkLwikg6IhHKvcMY1z5PY
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="388628914"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="388628914"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 04:27:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="655403204"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="655403204"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 24 Jan 2023 04:26:55 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKIO6-0006S8-32;
	Tue, 24 Jan 2023 12:26:54 +0000
Date: Tue, 24 Jan 2023 20:26:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Emma Anholt <emma@anholt.net>,
	amd-gfx@lists.freedesktop.org,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Alain Volmat <alain.volmat@foss.st.com>, Pan@freedesktop.org,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>, jani.nikula@intel.com,
	linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Maxime Ripard <mripard@kernel.org>, Inki Dae <inki.dae@samsung.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	linux-mediatek@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Xinhui <Xinhui.Pan@amd.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
	Robert Foss <robert.foss@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	freedreno@lists.freedesktop.org,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/connector: move ELD and video/audio
 latencies to display info
Message-ID: <202301242049.eKzx7RzZ-lkp@intel.com>
References: <20230124094154.2282778-3-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230124094154.2282778-3-jani.nikula@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_042706_607878_ADE78F32 
X-CRM114-Status: GOOD (  12.78  )
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

Hi Jani,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-connector-move-HDR-sink-metadata-to-display-info/20230124-174322
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230124094154.2282778-3-jani.nikula%40intel.com
patch subject: [Intel-gfx] [PATCH 3/3] drm/connector: move ELD and video/audio latencies to display info
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230124/202301242049.eKzx7RzZ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/1e92b5478cfc1b0df66153652111117e9548b0d5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jani-Nikula/drm-connector-move-HDR-sink-metadata-to-display-info/20230124-174322
        git checkout 1e92b5478cfc1b0df66153652111117e9548b0d5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpu/drm/tegra/hdmi.c: In function 'tegra_hdmi_write_eld':
>> drivers/gpu/drm/tegra/hdmi.c:620:60: error: 'struct drm_connector' has no member named 'eld'
     620 |         size_t length = drm_eld_size(hdmi->output.connector.eld), i;
         |                                                            ^
   drivers/gpu/drm/tegra/hdmi.c:624:72: error: 'struct drm_connector' has no member named 'eld'
     624 |                 tegra_hdmi_writel(hdmi, i << 8 | hdmi->output.connector.eld[i],
         |                                                                        ^
--
   drivers/gpu/drm/tegra/sor.c: In function 'tegra_sor_write_eld':
>> drivers/gpu/drm/tegra/sor.c:1951:59: error: 'struct drm_connector' has no member named 'eld'
    1951 |         size_t length = drm_eld_size(sor->output.connector.eld), i;
         |                                                           ^
   drivers/gpu/drm/tegra/sor.c:1954:69: error: 'struct drm_connector' has no member named 'eld'
    1954 |                 tegra_sor_writel(sor, i << 8 | sor->output.connector.eld[i],
         |                                                                     ^


vim +620 drivers/gpu/drm/tegra/hdmi.c

edec4af4c3d6d2 Thierry Reding 2012-11-15  617  
5234549b93aa2a Thierry Reding 2015-08-07  618  static void tegra_hdmi_write_eld(struct tegra_hdmi *hdmi)
5234549b93aa2a Thierry Reding 2015-08-07  619  {
5234549b93aa2a Thierry Reding 2015-08-07 @620  	size_t length = drm_eld_size(hdmi->output.connector.eld), i;
5234549b93aa2a Thierry Reding 2015-08-07  621  	u32 value;
edec4af4c3d6d2 Thierry Reding 2012-11-15  622  
5234549b93aa2a Thierry Reding 2015-08-07  623  	for (i = 0; i < length; i++)
5234549b93aa2a Thierry Reding 2015-08-07  624  		tegra_hdmi_writel(hdmi, i << 8 | hdmi->output.connector.eld[i],
5234549b93aa2a Thierry Reding 2015-08-07  625  				  HDMI_NV_PDISP_SOR_AUDIO_HDA_ELD_BUFWR);
edec4af4c3d6d2 Thierry Reding 2012-11-15  626  
5234549b93aa2a Thierry Reding 2015-08-07  627  	/*
5234549b93aa2a Thierry Reding 2015-08-07  628  	 * The HDA codec will always report an ELD buffer size of 96 bytes and
5234549b93aa2a Thierry Reding 2015-08-07  629  	 * the HDA codec driver will check that each byte read from the buffer
5234549b93aa2a Thierry Reding 2015-08-07  630  	 * is valid. Therefore every byte must be written, even if no 96 bytes
5234549b93aa2a Thierry Reding 2015-08-07  631  	 * were parsed from EDID.
5234549b93aa2a Thierry Reding 2015-08-07  632  	 */
5234549b93aa2a Thierry Reding 2015-08-07  633  	for (i = length; i < HDMI_ELD_BUFFER_SIZE; i++)
5234549b93aa2a Thierry Reding 2015-08-07  634  		tegra_hdmi_writel(hdmi, i << 8 | 0,
5234549b93aa2a Thierry Reding 2015-08-07  635  				  HDMI_NV_PDISP_SOR_AUDIO_HDA_ELD_BUFWR);
5234549b93aa2a Thierry Reding 2015-08-07  636  
5234549b93aa2a Thierry Reding 2015-08-07  637  	value = SOR_AUDIO_HDA_PRESENSE_VALID | SOR_AUDIO_HDA_PRESENSE_PRESENT;
5234549b93aa2a Thierry Reding 2015-08-07  638  	tegra_hdmi_writel(hdmi, value, HDMI_NV_PDISP_SOR_AUDIO_HDA_PRESENSE);
edec4af4c3d6d2 Thierry Reding 2012-11-15  639  }
edec4af4c3d6d2 Thierry Reding 2012-11-15  640  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests


Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B5EC27C77
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Jun 2024 21:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YYapbQdbbhs2KCdfHRUsnOJW69H2p0sAphJeIJR4F0c=; b=Ut01nm7B8QUJAADy7wJ9/BaD6t
	6pjsSpaFU3FS0cyk5+3dZsrjRd/i9kz66chQ0vkweBGIprjRW9jspkGOKEgHjtNamocTyGI/P7h+q
	/Oujs1oPeps0Te3PlSHmSXh6Icv7BZJ2XPnatyiegpvJCPgI4AIpSg2hkXI6AcW0rS95EZjOkhBeD
	6xAisTW6+JrhS4eLp5BhpoUvjlmr3BGxblXH5tjED/QtQqrL4UryHq2kdrC2zbpExeFSzQPEVb8y+
	3JDtzfMU0gQbibeYdgINxoXfzg7MRYXxWZC9MurmnTxQ9Y+OfN7EdD1UrDAsesGkAW9HIWcVAjkjo
	Xw6TJGcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIarO-000000068FJ-2laC;
	Sat, 15 Jun 2024 21:22:54 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIarL-000000068ED-0jrx;
	Sat, 15 Jun 2024 21:22:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718486571; x=1750022571;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UfERiNOX/+UQZkbWaRkYayw3suJxBxDKwYPfqdrImYY=;
  b=KhoKFzq4+6OhPkaR/NEeIKZhub4T3cretjNzrtIGqnsl1SdnPqYaGJ1n
   nlE3nIx/6zKtNveBbmY0xpbxP6EG6Nko2lvD/2WNxOHGtACBVIBR3RgI2
   Pjug4HyOZWNHGt/j79Nw8E4w9pzJte7g/9rsPdyhdUVmeVoyY6mFV28e2
   bNAWj/IxxqJW0t30lWyWZejoPaeYo0G/PFVbgTevH52CFtq+eXWX//fsf
   juxXc4MBXRGjKT/whrIz4arcXXMjHJ6P+5DtJ3H/s7jDknU6VYFqvOr98
   63mgUBAsfhUAKau3CPIhrPML3Hw+pQU5JlQoCZP8n7Ybd+vBMpZ7SoLvC
   A==;
X-CSE-ConnectionGUID: wwiefgH4QPOkEfVr6lQVjw==
X-CSE-MsgGUID: XWqeZM9bSYqPbMOCgkYQCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="15505539"
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="15505539"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 14:22:43 -0700
X-CSE-ConnectionGUID: GFH+1WhZQjS5FX1JiXXyVA==
X-CSE-MsgGUID: 8U6KGGlsRxqAZz3vLZfNsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="45940383"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 Jun 2024 14:22:40 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIar7-0000WH-2R;
	Sat, 15 Jun 2024 21:22:37 +0000
Date: Sun, 16 Jun 2024 05:21:40 +0800
From: kernel test robot <lkp@intel.com>
To: Shawn Sung <shawn.sung@mediatek.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v8 14/16] drm/mediatek: Support CRC in display driver
Message-ID: <202406160407.yfZ2cNh2-lkp@intel.com>
References: <20240606092635.27981-15-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606092635.27981-15-shawn.sung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240615_142251_323436_9767F2CD 
X-CRM114-Status: GOOD (  18.10  )
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
Cc: Hsiao Chien Sung <shawn.sung@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Sean Paul <sean@poorly.run>, Jason Chen <jason-ch.chen@mediatek.corp-partner.google.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, CK Hu <ck.hu@mediatek.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, oe-kbuild-all@lists.linux.dev, Matthias Brugger <matthias.bgg@gmail.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Shawn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.10-rc2]
[also build test WARNING on linus/master next-20240613]
[cannot apply to chrome-os/chromeos-6.1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shawn-Sung/soc-mediatek-Disable-9-bit-alpha-in-ETHDR/20240606-172904
base:   v6.10-rc2
patch link:    https://lore.kernel.org/r/20240606092635.27981-15-shawn.sung%40mediatek.com
patch subject: [PATCH v8 14/16] drm/mediatek: Support CRC in display driver
config: arm64-randconfig-r113-20240615 (https://download.01.org/0day-ci/archive/20240616/202406160407.yfZ2cNh2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240616/202406160407.yfZ2cNh2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406160407.yfZ2cNh2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/mediatek/mtk_crtc.c:1373:66: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/mediatek/mtk_crtc.c:1377:65: sparse: sparse: Using plain integer as NULL pointer

vim +1373 drivers/gpu/drm/mediatek/mtk_crtc.c

  1286	
  1287	#if IS_REACHABLE(CONFIG_MTK_CMDQ)
  1288	/**
  1289	 * mtk_crtc_create_crc_cmdq - Create a CMDQ thread for syncing the CRCs
  1290	 * @dev: Kernel device node of the CRC provider
  1291	 * @crc: Pointer of the CRC to init
  1292	 *
  1293	 * This function will create a looping thread on GCE (Global Command Engine) to
  1294	 * keep the CRC up to date by monitoring the assigned event (usually the frame
  1295	 * done event) of the CRC provider, and read the CRCs from the registers to a
  1296	 * shared memory for the workqueue to read. To start/stop the looping thread,
  1297	 * please call `mtk_crtc_start_crc_cmdq()` and `mtk_crtc_stop_crc_cmdq()`
  1298	 * defined blow.
  1299	 *
  1300	 * The reason why we don't update the CRCs with CPU is that the front porch of
  1301	 * 4K60 timing in CEA-861 is less than 60us, and register read/write speed is
  1302	 * relatively unreliable comparing to GCE due to the bus design.
  1303	 *
  1304	 * We must create a new thread instead of using the original one for plane
  1305	 * update is because:
  1306	 * 1. We cannot add another wait-for-event command at the end of cmdq packet, or
  1307	 *    the cmdq callback will delay for too long
  1308	 * 2. Will get the CRC of the previous frame if using the existed wait-for-event
  1309	 *    command which is at the beginning of the packet
  1310	 */
  1311	void mtk_crtc_create_crc_cmdq(struct device *dev, struct mtk_crtc_crc *crc)
  1312	{
  1313		int i;
  1314	
  1315		if (!crc->cnt) {
  1316			dev_warn(dev, "%s: not support\n", __func__);
  1317			goto cleanup;
  1318		}
  1319	
  1320		if (!crc->ofs) {
  1321			dev_warn(dev, "%s: not defined\n", __func__);
  1322			goto cleanup;
  1323		}
  1324	
  1325		crc->cmdq_client.client.dev = dev;
  1326		crc->cmdq_client.client.tx_block = false;
  1327		crc->cmdq_client.client.knows_txdone = true;
  1328		crc->cmdq_client.client.rx_callback = NULL;
  1329		crc->cmdq_client.chan = mbox_request_channel(&crc->cmdq_client.client, 0);
  1330		if (IS_ERR(crc->cmdq_client.chan)) {
  1331			dev_warn(dev, "%s: failed to create mailbox client\n", __func__);
  1332			crc->cmdq_client.chan = NULL;
  1333			goto cleanup;
  1334		}
  1335	
  1336		if (mtk_drm_cmdq_pkt_create(&crc->cmdq_client, &crc->cmdq_handle, PAGE_SIZE)) {
  1337			dev_warn(dev, "%s: failed to create cmdq packet\n", __func__);
  1338			goto cleanup;
  1339		}
  1340	
  1341		if (!crc->va) {
  1342			dev_warn(dev, "%s: no memory\n", __func__);
  1343			goto cleanup;
  1344		}
  1345	
  1346		/* map the entry to get a dma address for cmdq to store the crc */
  1347		crc->pa = dma_map_single(crc->cmdq_client.chan->mbox->dev,
  1348					 crc->va, crc->cnt * sizeof(*crc->va),
  1349					 DMA_FROM_DEVICE);
  1350	
  1351		if (dma_mapping_error(crc->cmdq_client.chan->mbox->dev, crc->pa)) {
  1352			dev_err(dev, "%s: failed to map dma\n", __func__);
  1353			goto cleanup;
  1354		}
  1355	
  1356		if (crc->cmdq_event)
  1357			cmdq_pkt_wfe(&crc->cmdq_handle, crc->cmdq_event, true);
  1358	
  1359		for (i = 0; i < crc->cnt; i++) {
  1360			/* put crc to spr1 register */
  1361			cmdq_pkt_read_s(&crc->cmdq_handle, crc->cmdq_reg->subsys,
  1362					crc->cmdq_reg->offset + crc->ofs[i],
  1363					CMDQ_THR_SPR_IDX1);
  1364	
  1365			/* copy spr1 register to physical address of the crc */
  1366			cmdq_pkt_assign(&crc->cmdq_handle, CMDQ_THR_SPR_IDX0,
  1367					CMDQ_ADDR_HIGH(crc->pa + i * sizeof(*crc->va)));
  1368			cmdq_pkt_write_s(&crc->cmdq_handle, CMDQ_THR_SPR_IDX0,
  1369					 CMDQ_ADDR_LOW(crc->pa + i * sizeof(*crc->va)),
  1370					 CMDQ_THR_SPR_IDX1);
  1371		}
  1372		/* reset crc */
> 1373		mtk_ddp_write_mask(&crc->cmdq_handle, ~0, crc->cmdq_reg, 0,
  1374				   crc->rst_ofs, crc->rst_msk);
  1375	
  1376		/* clear reset bit */
  1377		mtk_ddp_write_mask(&crc->cmdq_handle, 0, crc->cmdq_reg, 0,
  1378				   crc->rst_ofs, crc->rst_msk);
  1379	
  1380		/* jump to head of the cmdq packet */
  1381		cmdq_pkt_jump_abs(&crc->cmdq_handle, crc->cmdq_handle.pa_base,
  1382				  cmdq_get_shift_pa(crc->cmdq_client.chan));
  1383	
  1384		return;
  1385	cleanup:
  1386		mtk_crtc_destroy_crc(crc);
  1387	}
  1388	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


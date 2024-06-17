Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A330C2BA15
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jun 2024 12:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=5+HRYUPCMJcQBkT1cpfHbyTOHaJe2a6elgfsZtQuCyQ=; b=Oz+k6c//ARRi3T
	x8Eigig9zSlSG7WT2CGWzM474IxlnfuXgUei+CBnCMtywXgD3Ds+7xW55a90TSLiloQ1Qp8+Sc/vD
	dOfncWQaTb/FySTc2HIWgmvtSTwpVF2hoM9yUiRtT3aVGgPX7cy89hYWn8syCoiHqPhS6twjf+J6p
	cSNEnKFQfdnrVm4g1Xd2z3A/pLI/ZMnXUTc78M6GfX8fHGNJWPm+HNxSpBOGww0lWcXKdCkp6fflZ
	GEef9a0Px+KkHMupbJ/zJw78/Sj8JmbZU6/abyi3qrNOnkVIRV+U3VQZz14ih7SD9A+tHfMD+sOoR
	07Ay9HI2j36drO7g6QQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJBeb-0000000AgLU-2X7l;
	Mon, 17 Jun 2024 12:40:09 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJBeX-0000000AgJh-3jFb
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Jun 2024 12:40:08 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-52bc035a7ccso4604082e87.2
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Jun 2024 05:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718628004; x=1719232804; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5+HRYUPCMJcQBkT1cpfHbyTOHaJe2a6elgfsZtQuCyQ=;
        b=TH1c9Guyhch4ykn3XaH/2Vg1v5KQJozRLFOpRyMS/zZF8t1Pj2k2+BSq+VrIXZkxq2
         QeVyUuq7XBGmVe1dS7B1FAavbmmctZHlKYHgY1sM+a86K18d/2HGvwkC4Zhz3ZrZ5PzP
         N/EQkBoB+IcCYpXaEY7EvpUqiMu7P+kOwCoup1MF5AisqAw7dEIpPqCTXM5g6ewR0F8h
         n6LYp28IIBlE+g7lYp9NFlmaEFbI8T7iLDRT/rnQg5q6P0QC1CO3wy3J0D65fbpzEC5X
         u4us7FMhuW5qVXMruW/0F2cpcv2ukNiq8cUEycR7d99vZ6kvLMusiGd0Wvj7VEB0dKJX
         uaAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718628004; x=1719232804;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5+HRYUPCMJcQBkT1cpfHbyTOHaJe2a6elgfsZtQuCyQ=;
        b=KCmsfxGIh+VOMrPgAObrVrv2xCaV9Ql9VvsUJGxOxXT/my22sRZ9D3OrEhljv0Vydx
         SxuB26nTW7pELoeDTntLj0Ge04hCZKa93cEuKQuXhgjKtkWWGUPMe8LKYVy+/tgnePp1
         FYplGcJbpgWfAlRTV7Cy75xYI94UwWOzfPV3OXMNlCo7rCiWwHoTGlAGecYoW+DGAYb1
         77zzAA/fzJ+gTI2bVLPfzWxVCTpgNP385BNl2Ki66q1fVMLY3Crje3tgkJRO2PUTQwPq
         Cxryb/bhngGrtTduZoX/qPqjzMuqcG0Ufc4+ko2izS19Gua6I66xMFvX2unV/vNILYty
         cT3A==
X-Forwarded-Encrypted: i=1; AJvYcCU7id1H9vjeuOQm0oq2XGKmRYCfmZZN5S/M/XyK0waNEBGsVfSVRg4q2sTQPevw/xfpPSHSSIPeinsiVBMbtLypSXQtBNVGIufo2535kZSPvthy
X-Gm-Message-State: AOJu0YxJ4wyHj6XKqE06BGokdnEoKdwOL3fxuVqNHQ2MUmliT4gT0nhs
	VoJjctmaQte+4fS+49sta03ruedw36apc4QsQV3Q8k1CzpisLgHPKQBa/DHP0Xs=
X-Google-Smtp-Source: AGHT+IEKA7l6WX6SW03YB8EoOZxMGnJYTWom862f2gBPbXByGN/uJeOvL1EIFy31l26ZxHY1P1j1gQ==
X-Received: by 2002:a19:f809:0:b0:52c:89ff:10bf with SMTP id 2adb3069b0e04-52ca6e999e7mr5401497e87.67.1718628003665;
        Mon, 17 Jun 2024 05:40:03 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4246b67f0aesm27013865e9.45.2024.06.17.05.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 05:40:03 -0700 (PDT)
Date: Mon, 17 Jun 2024 15:39:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>,
	Nancy Lin <nancy.lin@mediatek.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 1/2] mailbox: Add power_get/power_put API to mbox_chan_ops
Message-ID: <71bb6f07-39b8-41b4-a743-66c7c5a6524d@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614040133.24967-2-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_054006_122881_D64E9FB3 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
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

Hi Jason-JH.Lin,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-JH-Lin/mailbox-Add-power_get-power_put-API-to-mbox_chan_ops/20240614-120412
base:   linus/master
patch link:    https://lore.kernel.org/r/20240614040133.24967-2-jason-jh.lin%40mediatek.com
patch subject: [PATCH 1/2] mailbox: Add power_get/power_put API to mbox_chan_ops
config: x86_64-randconfig-161-20240615 (https://download.01.org/0day-ci/archive/20240615/202406151520.TDnOFFbV-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406151520.TDnOFFbV-lkp@intel.com/

smatch warnings:
drivers/mailbox/mailbox.c:485 mbox_request_channel() error: 'chan' dereferencing possible ERR_PTR()

vim +/chan +485 drivers/mailbox/mailbox.c

2b6d83e2b8b7de Jassi Brar      2014-06-12  444  struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index)
2b6d83e2b8b7de Jassi Brar      2014-06-12  445  {
2b6d83e2b8b7de Jassi Brar      2014-06-12  446  	struct device *dev = cl->dev;
2b6d83e2b8b7de Jassi Brar      2014-06-12  447  	struct mbox_controller *mbox;
2b6d83e2b8b7de Jassi Brar      2014-06-12  448  	struct of_phandle_args spec;
2b6d83e2b8b7de Jassi Brar      2014-06-12  449  	struct mbox_chan *chan;
2b6d83e2b8b7de Jassi Brar      2014-06-12  450  	int ret;
2b6d83e2b8b7de Jassi Brar      2014-06-12  451  
2b6d83e2b8b7de Jassi Brar      2014-06-12  452  	if (!dev || !dev->of_node) {
2b6d83e2b8b7de Jassi Brar      2014-06-12  453  		pr_debug("%s: No owner device node\n", __func__);
2b6d83e2b8b7de Jassi Brar      2014-06-12  454  		return ERR_PTR(-ENODEV);
2b6d83e2b8b7de Jassi Brar      2014-06-12  455  	}
2b6d83e2b8b7de Jassi Brar      2014-06-12  456  
2b6d83e2b8b7de Jassi Brar      2014-06-12  457  	mutex_lock(&con_mutex);
2b6d83e2b8b7de Jassi Brar      2014-06-12  458  
2b6d83e2b8b7de Jassi Brar      2014-06-12  459  	if (of_parse_phandle_with_args(dev->of_node, "mboxes",
2b6d83e2b8b7de Jassi Brar      2014-06-12  460  				       "#mbox-cells", index, &spec)) {
b6d83e2b8b7de Jassi Brar      2014-06-12  461  		dev_dbg(dev, "%s: can't parse \"mboxes\" property\n", __func__);
2b6d83e2b8b7de Jassi Brar      2014-06-12  462  		mutex_unlock(&con_mutex);
2b6d83e2b8b7de Jassi Brar      2014-06-12  463  		return ERR_PTR(-ENODEV);
2b6d83e2b8b7de Jassi Brar      2014-06-12  464  	}
2b6d83e2b8b7de Jassi Brar      2014-06-12  465  
2d805fc1c6b2ec Benson Leung    2015-05-04  466  	chan = ERR_PTR(-EPROBE_DEFER);
2b6d83e2b8b7de Jassi Brar      2014-06-12  467  	list_for_each_entry(mbox, &mbox_cons, node)
2b6d83e2b8b7de Jassi Brar      2014-06-12  468  		if (mbox->dev->of_node == spec.np) {
2b6d83e2b8b7de Jassi Brar      2014-06-12  469  			chan = mbox->of_xlate(mbox, &spec);
8ed82e23875e60 Mikko Perttunen 2018-11-28  470  			if (!IS_ERR(chan))
2b6d83e2b8b7de Jassi Brar      2014-06-12  471  				break;
2b6d83e2b8b7de Jassi Brar      2014-06-12  472  		}
2b6d83e2b8b7de Jassi Brar      2014-06-12  473  
2b6d83e2b8b7de Jassi Brar      2014-06-12  474  	of_node_put(spec.np);
2b6d83e2b8b7de Jassi Brar      2014-06-12  475  
2d805fc1c6b2ec Benson Leung    2015-05-04  476  	if (IS_ERR(chan)) {
2d805fc1c6b2ec Benson Leung    2015-05-04  477  		mutex_unlock(&con_mutex);
2d805fc1c6b2ec Benson Leung    2015-05-04  478  		return chan;
2d805fc1c6b2ec Benson Leung    2015-05-04  479  	}
2d805fc1c6b2ec Benson Leung    2015-05-04  480  
85a953806557db Elliot Berman   2023-04-10  481  	ret = __mbox_bind_client(chan, cl);
85a953806557db Elliot Berman   2023-04-10  482  	if (ret)
2b6d83e2b8b7de Jassi Brar      2014-06-12  483  		chan = ERR_PTR(ret);

change is set to error pointer

2b6d83e2b8b7de Jassi Brar      2014-06-12  484  
9c57f48cd805b1 Jason-JH.Lin    2024-06-14 @485  	if (chan->mbox->ops->power_put)
                                                            ^^^^^^
Dereferenced on the next line

9c57f48cd805b1 Jason-JH.Lin    2024-06-14  486  		chan->mbox->ops->power_put(chan);
9c57f48cd805b1 Jason-JH.Lin    2024-06-14  487  
2b6d83e2b8b7de Jassi Brar      2014-06-12  488  	mutex_unlock(&con_mutex);
9c57f48cd805b1 Jason-JH.Lin    2024-06-14  489  
2b6d83e2b8b7de Jassi Brar      2014-06-12  490  	return chan;
2b6d83e2b8b7de Jassi Brar      2014-06-12  491  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



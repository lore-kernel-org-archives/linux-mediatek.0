Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC80C761A6
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 04:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=v++hfWryTr4oGjGOfz4huDJo0FNuSMUw7ZZdhA+elBM=; b=A2yVSQvzscx7Ev
	goZmMO66RsPbSn/Vupk3kbbpaRB3zVrDGxYhiYpyUMxxxbUnuKwJyMIAZ5Zc2SLOnaTZxA92stw34
	jb6L/Ssj5OcxwL+3+Nl8mEgUVH4TbuLg2Cpoj9v4Ih9ybpMaT5typQNTnZE/2z1D/3aDmvHqJyl1k
	/c/BRwSnDVgJE8OEe77wQU1Mt0y/hQtBa3+zlCLnx9VUvlgANYBSW0k5DDQnRb6UBlcuV2j5LKlUP
	SPrIB6Tff47DnNDympgzVv+2KYQs7bU6K21/VQrczhO9/cVtqdwONElUtglMO7SHZOfsUfxFm60Qg
	LSxoetZdBLQhvLZCjcSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjC0Z-00E8SZ-1T;
	Mon, 03 Apr 2023 04:41:31 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjC0V-00E8Rk-1D;
	Mon, 03 Apr 2023 04:41:29 +0000
Received: by mail-ed1-x529.google.com with SMTP id b20so112146749edd.1;
        Sun, 02 Apr 2023 21:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680496883;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v++hfWryTr4oGjGOfz4huDJo0FNuSMUw7ZZdhA+elBM=;
        b=mKLXgQWXGu27rDKMPbp8/1EM+a28h7wkx1Y5rVwPJwd5AqRhYjs/dkIW/xCuwD1I+z
         h4qKbV2CadeJ+BH35J/O5KQNnuSK5lIxy2+qEEloEyeVKqda5KbH6uIszITTmfZV5gqE
         g4plvjfgBVjp9NMHxpSr3qcakwkNnQOU/avbZ6grPf2kAzTTnA/ubABD06CzOAgGlT/n
         ULjUxiAIRia9QIHJvhQ3T2G9LsP0BscpFQXViwp2XUMm8JTXAm1Qs0Xrd1nrCEUoazGO
         MxZlhxLzLzpJyrudHvLDXfrPetxzHZT/GdyiwszUxPRSAzIQVIstzq6ovDcvhBe+VEV4
         pqgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680496883;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v++hfWryTr4oGjGOfz4huDJo0FNuSMUw7ZZdhA+elBM=;
        b=j0BqDufPYV7BKQS5tgAS5twoRiDwZihLTA2qcOMGJJ6IOBQikhbUJ2G2Iaw7pSsoQg
         Q2PpF7ugDiX0cZo1RWbO4XgrInZyWaOW1o1/wO1YukmfXjMUuIrRLiZdmr7sz5xajFHo
         Hq14wI9XCFo3+fku9Izqwh1W7AbW5oF0PEMHcYBbTlZog56h5W67u/ZHHU+BNFjfHTlS
         vk62+FhSlyYXFEtNe7F9bvuAM/mhO2ntbtk8OtlpD7aNVqynT6IjVxmfuLaRFTBLnn7T
         LAWWBMa4UbnpyBGpZlzkX3hENXxl2c1bIuKosW32DMDclGYTQNif545zlWfj4+i0vSOd
         XwDQ==
X-Gm-Message-State: AAQBX9f2XNhasPtDx5SaqWwbXIvpCcco2w5p3b+hkJzNfY4bmZwYIGVN
	7Dm8d/k9iMH4Gai6R+X9190=
X-Google-Smtp-Source: AKy350Y5L7wIeSJO056Wm7y7gnLJ/If2CjlZeCyWbLi+OGlz0K+jIWx221uL//p96EsRTXO+tnm6VQ==
X-Received: by 2002:a17:907:724b:b0:93f:2256:fc05 with SMTP id ds11-20020a170907724b00b0093f2256fc05mr35126641ejc.55.1680496883042;
        Sun, 02 Apr 2023 21:41:23 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id ae14-20020a17090725ce00b00947a939f6e0sm3685313ejc.77.2023.04.02.21.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 21:41:22 -0700 (PDT)
Date: Mon, 3 Apr 2023 07:41:19 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, ye.xingchen@zte.com.cn,
	sergio.paracuellos@gmail.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, lpieralisi@kernel.org,
	kw@linux.com, robh@kernel.org, bhelgaas@google.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] PCI: mt7621: Use dev_err_probe()
Message-ID: <22081108-565d-4608-97f7-6e40ca3df2b6@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202303231145121987818@zte.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_214127_441503_6EE07327 
X-CRM114-Status: UNSURE (   7.09  )
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

Hi,

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/ye-xingchen-zte-com-cn/PCI-mt7621-Use-dev_err_probe/20230323-114623
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/202303231145121987818%40zte.com.cn
patch subject: [PATCH] PCI: mt7621: Use dev_err_probe()
config: s390-randconfig-m031-20230329 (https://download.01.org/0day-ci/archive/20230401/202304010325.2OPFvIm3-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304010325.2OPFvIm3-lkp@intel.com/

smatch warnings:
drivers/pci/controller/pcie-mt7621.c:224 mt7621_pcie_parse_port() warn: passing zero to 'PTR_ERR'
drivers/pci/controller/pcie-mt7621.c:227 mt7621_pcie_parse_port() warn: ignoring unreachable code.

vim +/PTR_ERR +224 drivers/pci/controller/pcie-mt7621.c

ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  198  static int mt7621_pcie_parse_port(struct mt7621_pcie *pcie,
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  199  				  struct device_node *node,
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  200  				  int slot)
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  201  {
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  202  	struct mt7621_pcie_port *port;
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  203  	struct device *dev = pcie->dev;
fab6710e4c51f4 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2020-04-13  204  	struct platform_device *pdev = to_platform_device(dev);
61f9bde6ea578f drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2019-01-04  205  	char name[10];
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  206  	int err;
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  207  
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  208  	port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  209  	if (!port)
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  210  		return -ENOMEM;
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  211  
108b2f2a972454 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2020-11-23  212  	port->base = devm_platform_ioremap_resource(pdev, slot + 1);
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  213  	if (IS_ERR(port->base))
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  214  		return PTR_ERR(port->base);
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  215  
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  216  	port->clk = devm_get_clk_from_child(dev, node, NULL);
cc4e864a5ce4c1 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-05-05  217  	if (IS_ERR(port->clk)) {
cc4e864a5ce4c1 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-05-05  218  		dev_err(dev, "failed to get pcie%d clock\n", slot);
cc4e864a5ce4c1 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-05-05  219  		return PTR_ERR(port->clk);
cc4e864a5ce4c1 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-05-05  220  	}
cc4e864a5ce4c1 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-05-05  221  
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  222  	port->pcie_rst = of_reset_control_get_exclusive(node, NULL);
9873bac812f262 drivers/pci/controller/pcie-mt7621.c    Ye Xingchen        2023-03-23  223  
9873bac812f262 drivers/pci/controller/pcie-mt7621.c    Ye Xingchen        2023-03-23 @224  	return dev_err_probe(dev, PTR_ERR(port->pcie_rst),
                                                                                                                          ^^^^^^^^^^^^^^^^^^^^^^^

9873bac812f262 drivers/pci/controller/pcie-mt7621.c    Ye Xingchen        2023-03-23  225  			     "failed to get pcie%d reset control\n", slot);
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  226  
61f9bde6ea578f drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2019-01-04 @227  	snprintf(name, sizeof(name), "pcie-phy%d", slot);
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  228  	port->phy = devm_of_phy_get(dev, node, name);
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  229  	if (IS_ERR(port->phy)) {
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  230  		dev_err(dev, "failed to get pcie-phy%d\n", slot);
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  231  		err = PTR_ERR(port->phy);
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  232  		goto remove_reset;
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  233  	}
61f9bde6ea578f drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2019-01-04  234  
b27e35f91c75cf drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2020-03-13  235  	port->gpio_rst = devm_gpiod_get_index_optional(dev, "reset", slot,
b27e35f91c75cf drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2020-03-13  236  						       GPIOD_OUT_LOW);
825c6f470c62da drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2020-03-20  237  	if (IS_ERR(port->gpio_rst)) {
2bdd5238e756aa drivers/pci/controller/pcie-mt7621.c    Sergio Paracuellos 2021-09-22  238  		dev_err(dev, "failed to get GPIO for PCIe%d\n", slot);
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  239  		err = PTR_ERR(port->gpio_rst);
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  240  		goto remove_reset;
825c6f470c62da drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2020-03-20  241  	}
b27e35f91c75cf drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2020-03-13  242  
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  243  	port->slot = slot;
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  244  	port->pcie = pcie;
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  245  
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  246  	INIT_LIST_HEAD(&port->list);
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  247  	list_add_tail(&port->list, &pcie->ports);
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  248  
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  249  	return 0;
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  250  
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  251  remove_reset:
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  252  	reset_control_put(port->pcie_rst);
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  253  	return err;
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  254  }
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  255  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FDCE77188
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jan 2025 09:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=drQE5mfG6UfY6qmLY59TYj//IZAj9bk+9THlcgSH/G4=; b=DIItEOe/aPE/Ja
	+6Z3fd1/5N1elfnlIQd7jjtCjo9zdnRbphJpWUXHOcE9x6pu+PWUKna8jlNR7XYrkeiowl+yCE1bq
	DAzZz5CjuJf0xrbvIy4WsH0B5L/ql66AgPms8vFvjJ2Rzi7CxHNeeZEC8V3Q2KpUjLjGk02edKVQK
	2Oj8yz8IMcC9oHWZk24bilrveHiXS8NhbocICjvtOt9KnZz/kIEvVffH0m5Wt/4mScRx9Ou7PcSu4
	oqaHF3ERm0Uey9mNpbtMK3uQFZRzutqYYFLJJXKV1oVRS/2txTA62T0z93McVYfDWnbpYzgvM/mLK
	xT/BS8Kbqqxe8fumzpLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUjhg-00000000jmN-3aIN;
	Mon, 06 Jan 2025 09:47:20 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUjhe-00000000jlb-0IZN
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Jan 2025 09:47:19 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-38637614567so6395650f8f.3
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jan 2025 01:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736156836; x=1736761636; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=drQE5mfG6UfY6qmLY59TYj//IZAj9bk+9THlcgSH/G4=;
        b=LQGn/6qYEsH5jaz07zwnbu5mJTWX+JJ341RV0k0ohcMwcc/l39vnppcOpaC2d7fMPB
         8YtEpvAfJs0XMAs9Ek1bTyOYfz1mvADiKTcO4OBwD5XagWi+1gSAeKRhXTQ/xDXo9p7T
         uuHeJdjiBBsuL+xMxSzuJGp6iEmBFTr60jZFC23/50mng0j5XsMGmtpB/v0YarUyVExV
         9c1qdulT01+ECJ89P0KCphaL8nYEl175kyMzXBY9hEVQt7gAN+sKyHYvCiNWv2ZmCvPj
         ayb16f2Q0QSA/6zF9hWwTJUAMh724RkaWMc0WMrBxht+efLVmdaE44rvhuROxvTyuKVv
         X6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736156836; x=1736761636;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=drQE5mfG6UfY6qmLY59TYj//IZAj9bk+9THlcgSH/G4=;
        b=YRDaCwyYQ2SZqytGoTRWWRuJ7VTmKXXA9+5jQ7S7orEOARN6A4qGsT1Of/o/w+Ba5Q
         OMIQWaqOkBxJyJBRu9VwsCwHQ5FTRp35/UrXXX+0GLpzA4waK6IhYSJFCH1zlgldg83S
         9+4z+apbplv+GGUbxCalWldZJsJjeJ72LzWPVMohHsyVpdwx9HxfJt+ZAoVPze+eMbfh
         FcKj+TCwW+rxBXTyUllYDFwO2yTPQopT1Zl3UOp8+1okZqc+8s6ovOC5YyGLWXJ8rVQ8
         bZ8cnVgumRHJkoQtoDXB31UJlmW6l/rzTOuewaYa5N4N86JQqBAGTeutu9w6FPXkI8pk
         cu7w==
X-Forwarded-Encrypted: i=1; AJvYcCU7V1aSBpA8rNCGIt6TSlt9IsPQuKhYu4R/j40M77s3f8DTW88O1iLIo51Ot88d7gDIbcCMODecOvgjv9yu0A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyA2oabTnstcyn6+gp+LgWlkfzXHABIrbjJHDEwOCJHfi8wk2l2
	AiC+nxC09kjSEMQRn6ENCPdka3X/ZyzrptdvIchOHKnQIOYf1Bz/1i/x5U/1+R0=
X-Gm-Gg: ASbGncsZdbT6IMDB4g9IZczhygxYdgk2cjLHGSRfQFXvRHDSsSwL4NOnMpFhsFEmdlZ
	zWY2hjZASC+2DO26cdfDHMtGlKKRZs23bxc9Ecbf7TTv1hdXdoI5sitcPK3wZlktlEs9v/1Hvw+
	1X0nW4CWgIYjA54AA0N9R3j/i1sRGj7EVRck1LeMvP2PjBDQZFiJREFLfHS31/rZgJFR3TsfoaZ
	9zw4zTBNS9u3RzZZ9kWVK7y259P3bHtmlMZ17EuGvFzjbUzSq/TT/mZuObW3g==
X-Google-Smtp-Source: AGHT+IE1QA9GPbRGZrUYTaXeGGbTxlnKdAg52i/b75L7wR5SaTyuDJ7JMDNCeaS8O+uXqqVvObeBRQ==
X-Received: by 2002:a05:6000:156b:b0:385:e30a:e0f7 with SMTP id ffacd0b85a97d-38a221fab38mr48263786f8f.22.1736156835874;
        Mon, 06 Jan 2025 01:47:15 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8ace0esm46740074f8f.106.2025.01.06.01.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 01:47:15 -0800 (PST)
Date: Mon, 6 Jan 2025 12:47:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, mtk22730 <Cloud.Zhang@mediatek.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Cloud Zhang <cloud.zhang@mediatek.com>
Subject: Re: [PATCH] [v1] spi: spi-mtk-nor: Modify the clock architecture of
 nor controller
Message-ID: <63ddb297-822c-47bd-a33b-e2203fe1fad1@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212092206.14071-1-Cloud.Zhang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_014718_127484_00A77E00 
X-CRM114-Status: GOOD (  10.65  )
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

Hi mtk22730,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/mtk22730/spi-spi-mtk-nor-Modify-the-clock-architecture-of-nor-controller/20241212-172704
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20241212092206.14071-1-Cloud.Zhang%40mediatek.com
patch subject: [PATCH] [v1] spi: spi-mtk-nor: Modify the clock architecture of nor controller
config: parisc-randconfig-r073-20241223 (https://download.01.org/0day-ci/archive/20241223/202412232136.cWvRuwoD-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412232136.cWvRuwoD-lkp@intel.com/

smatch warnings:
drivers/spi/spi-mtk-nor.c:746 mtk_nor_parse_clk() warn: impossible condition '(cnt == -22) => (1-255 == (-22))'

vim +746 drivers/spi/spi-mtk-nor.c

87d65a23444841 Cloud Zhang   2024-12-12  738  static int mtk_nor_parse_clk(struct device *dev, struct mtk_nor *sp)
87d65a23444841 Cloud Zhang   2024-12-12  739  {
87d65a23444841 Cloud Zhang   2024-12-12  740  	struct device_node *np = dev->of_node;
87d65a23444841 Cloud Zhang   2024-12-12  741  	int ret;
87d65a23444841 Cloud Zhang   2024-12-12  742  	const char *name;
87d65a23444841 Cloud Zhang   2024-12-12  743  	u8 cnt, i;
                                                ^^^^^^

87d65a23444841 Cloud Zhang   2024-12-12  744  
87d65a23444841 Cloud Zhang   2024-12-12  745  	cnt = of_property_count_strings(np, "clock-names");
87d65a23444841 Cloud Zhang   2024-12-12 @746  	if (!cnt || (cnt == -EINVAL)) {
                                                             ^^^^^^^^^^^^^^
cnt needs to be declared as an int.

87d65a23444841 Cloud Zhang   2024-12-12  747  		dev_err(dev, "Unable to find clocks\n");
87d65a23444841 Cloud Zhang   2024-12-12  748  		ret = -EINVAL;
87d65a23444841 Cloud Zhang   2024-12-12  749  		goto out;
87d65a23444841 Cloud Zhang   2024-12-12  750  	} else if (cnt < 0) {
                                                           ^^^^^^^
It's weird that this doesn't trigger a warning.

87d65a23444841 Cloud Zhang   2024-12-12  751  		dev_err(dev, "Count clock strings failed, err %d\n", cnt);
87d65a23444841 Cloud Zhang   2024-12-12  752  		ret = cnt;
87d65a23444841 Cloud Zhang   2024-12-12  753  		goto out;
87d65a23444841 Cloud Zhang   2024-12-12  754  	} else if (cnt > MAX_CLOCK_CNT) {
87d65a23444841 Cloud Zhang   2024-12-12  755  		ret = -EINVAL;
87d65a23444841 Cloud Zhang   2024-12-12  756  		goto out;
87d65a23444841 Cloud Zhang   2024-12-12  757  	}
87d65a23444841 Cloud Zhang   2024-12-12  758  
87d65a23444841 Cloud Zhang   2024-12-12  759  	sp->clock_cnt = cnt;
87d65a23444841 Cloud Zhang   2024-12-12  760  
87d65a23444841 Cloud Zhang   2024-12-12  761  	for (i = 0; i < cnt; i++) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



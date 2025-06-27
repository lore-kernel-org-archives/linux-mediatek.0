Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0336C7EE2A
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jun 2025 19:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=ZHw+WJ64dHACnc7Bud37Nl/T15dKpBv+JiMjM+lyrgA=; b=GATEdT+8rhvi4O
	qNqe07Z+OdRPeixT9j9NpZv0C6yYBcaMW25pXWsKu2LyWbwgv16VUiMTE9dHfi9g8hFc/pjsgoINM
	c8alLbGe2csjN55HCgjXoyQCw7O/ToLiLdV+CCVvFeTKqOkMKJ87F2/7/nSJbcVL2rLHUv55i1Vos
	M7pJOc8EytNga4Y1/P8Ejjy0/sHqqZyWtsbDcwlaloIPC0nP79xqUXbM4+5U0ChndEfta6hC1q4Gq
	7SNAiMisImB7W7dhsQkn69+qtE1atXCSGvrjJZ6zKH1IdF3bST9kckrfJdFttt/tJQOzJCk8tblKp
	DXurjBnJxCrK0clVuQFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVF9V-0000000FhQi-0Ajh;
	Fri, 27 Jun 2025 19:54:25 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVEyJ-0000000Fflt-33pH
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Jun 2025 19:42:53 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-40791b696a2so825326b6e.2
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Jun 2025 12:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751053371; x=1751658171; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZHw+WJ64dHACnc7Bud37Nl/T15dKpBv+JiMjM+lyrgA=;
        b=dBwUoyQxAEivHrLkQbl8fcXXqO9MAhp7SOZEIXhNeds2a6sQ9kteLyWFF6tJqFJszF
         sN3Idn9jlYj9Kdo6PsLZLFjhpfDVePIbcKQCjkfPILTfZ6jBXGRZ35/lvVzeHBbli3NS
         5hPzSpfdfisFHrsI/0BqWXKCTb83yWjbWC2w0+pIdFHNIN9F7UOz5muKErAAmFJc6QWr
         FZrbjxzYoAGgd1NUmfNl2TK3HtjC2GEKBe20oV1Yhgh8sTLOKfVr57F8fhJkgP5KAaLu
         9iAaf7WyHwiKJ5jk1ITSNdB2BaUTJI8WzOfT2SrKh67DMQ3lyDH1Z8Ij6DKbn9R4uPN9
         EwAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751053371; x=1751658171;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZHw+WJ64dHACnc7Bud37Nl/T15dKpBv+JiMjM+lyrgA=;
        b=Ix8wGpo9camL+xqgpBKIpd9q5C36Uqk2kF8JNinC2T9rANl+ceS/samz99K9jN1WqI
         EEQFaZjLM3G7DXSb7XGtoDd2PIUwSzWcllKzL+/Ahda60boOofARrokleTmCKFCanWYV
         IsmhO5u2sHpCEpuMS354dubO64ARXlI7P94JXrLltJYgLUgTNti+Y5Czdd/Vclu2uHCh
         UFxi9pNoWBh+uLTBKhw5YJdy+BjMNTvG/q11+Ac6N9xndwyA7OgmLFXmqDelrr0pkGoP
         qYRg48JemOJEnyUXic9QqJMBxAxwZVNImJ4bKpVug1/XrRj77tAxWODgk/+aMIGZNLMs
         hi5w==
X-Forwarded-Encrypted: i=1; AJvYcCXsH/mzIKEkSwSq0vVK6YY1MENWMUZmmg2Zkq5GsHVPDmB5ldFNZM4OaEYq/7aCEy2p0Oe07dFYQ7By1bBabg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyCuh52aM4jd6b4rh9XOoRoiBKMUJISvGfGa0MgZ5uRFQ1EO5dP
	WsSZnlXZaqO42fEQz2mUUHkVi8INfX5XCngSqGvaKTKoJL66A3jEW9VA6Odg0vMgUkU=
X-Gm-Gg: ASbGncsDTRdHEc5gKEE7VjdJRGxQ1f9JCczmXKiKxMRUsod1oVe62P1buAzRSblVr4f
	NFAmRd/Q4Z7XNpR1+SwnR84haMBuy2qwkPuBoXbW5JJbugLKykw7Bu9AKHZv/u6yp2Thp6azU7k
	yRjumj9iQghssyz2erzSqmLs13nwJKBa/bqd1NSwfeTQRnyZvR8oEwSJu/Hu3awW5fee/0D/Njm
	1zMbJjUEBDm3EKuRQV+wFrVtEH64XIp+vS+yZQKj2xUeo0jOMpNPcZ9GsCrIWO/ZwPdcoIvr+fe
	YKuHhg3JOY8P4ZGKcF3BpTwS2cTPFjzE0U4P31/JC1kbWjAVv5txWKY0nGwYowa7/2ejzQ==
X-Google-Smtp-Source: AGHT+IH5uoBFw2Udb6ovo2SD8dpCsBqIYrHL9XKo8HZbUvvBBEOdNkQdnf9VE5Fth+7RjBV02SNJVQ==
X-Received: by 2002:a05:6808:6a85:b0:40a:a8ad:bc11 with SMTP id 5614622812f47-40b33da6484mr2866471b6e.17.1751053370665;
        Fri, 27 Jun 2025 12:42:50 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:f3a4:7b11:3bf4:5d7b])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b3241e38csm483938b6e.34.2025.06.27.12.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 12:42:50 -0700 (PDT)
Date: Fri, 27 Jun 2025 22:42:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	broonie@kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, lgirdwood@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 4/6] regulator: Add support for MediaTek MT6363 SPMI
 PMIC Regulators
Message-ID: <f4ec5c4b-78e6-423b-8b19-97171c9d93ec@suswa.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624073548.29732-5-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_124251_782063_9F962096 
X-CRM114-Status: UNSURE (   8.88  )
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

Hi AngeloGioacchino,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-regulator-Document-MediaTek-MT6316-PMIC-Regulators/20250624-154048
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20250624073548.29732-5-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v2 4/6] regulator: Add support for MediaTek MT6363 SPMI PMIC Regulators
config: x86_64-randconfig-161-20250627 (https://download.01.org/0day-ci/archive/20250628/202506280258.somyWWgp-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506280258.somyWWgp-lkp@intel.com/

New smatch warnings:
drivers/regulator/mt6363-regulator.c:351 mt6363_regulator_set_mode() error: uninitialized symbol 'regmap'.
drivers/regulator/mt6363-regulator.c:388 mt6363_regulator_set_mode() error: uninitialized symbol 'ret'.

vim +/regmap +351 drivers/regulator/mt6363-regulator.c

5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  342  static int mt6363_regulator_set_mode(struct regulator_dev *rdev,
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  343  				     unsigned int mode)
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  344  {
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  345  	struct mt6363_regulator_info *info = rdev_get_drvdata(rdev);
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  346  	struct regmap *regmap;
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  347  	int cur_mode, ret;
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  348  
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  349  	switch (mode) {
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  350  	case REGULATOR_MODE_FAST:
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24 @351  		ret = mt6363_buck_unlock(regmap, true);
                                                                                                 ^^^^^
Uninitialized.

5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  352  		if (ret)
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  353  			break;
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  354  
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  355  		ret = regmap_set_bits(regmap, info->modeset_reg, info->modeset_mask);
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  356  
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  357  		mt6363_buck_unlock(regmap, false);
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  358  		break;
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  359  	case REGULATOR_MODE_NORMAL:
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  360  		cur_mode = mt6363_regulator_get_mode(rdev);
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  361  		if (cur_mode < 0) {
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  362  			ret = cur_mode;
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  363  			break;
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  364  		}
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  365  
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  366  		if (cur_mode == REGULATOR_MODE_FAST) {
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  367  			ret = mt6363_buck_unlock(regmap, true);
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  368  			if (ret)
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  369  				break;
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  370  
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  371  			ret = regmap_clear_bits(regmap, info->modeset_reg, info->modeset_mask);
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  372  
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  373  			mt6363_buck_unlock(regmap, false);
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  374  			break;
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  375  		} else if (cur_mode == REGULATOR_MODE_IDLE) {
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  376  			ret = regmap_clear_bits(regmap, info->lp_mode_reg, info->lp_mode_mask);
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  377  			if (ret == 0)
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  378  				usleep_range(100, 200);
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  379  		}

ret not initialized on else path.

5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  380  		break;
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  381  	case REGULATOR_MODE_IDLE:
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  382  		ret = regmap_set_bits(regmap, info->lp_mode_reg, info->lp_mode_mask);
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  383  		break;
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  384  	default:
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  385  		ret = -EINVAL;
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  386  	}
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  387  
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24 @388  	if (ret) {
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  389  		dev_err(&rdev->dev, "Failed to set mode %u: %d\n", mode, ret);
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  390  		return ret;
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  391  	}
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  392  
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  393  	return 0;
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  394  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



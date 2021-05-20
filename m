Return-Path: <SRS0=cSMM=KP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05FCCC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 06:58:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F76161184
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 06:58:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F76161184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eyh2l2Uejhfv0WVldlq26rE8tsRR+vqsQMzy6XxDqZk=; b=fKM+Q1lHJcF66YZYyVFVH/6V7
	NYRsktiXep24oBVAZQ96GxmZQkB/nX3xsmpX+Ynwu3SdT/z23DrBT02FUbb4zcHzEpSg8vZclvpU2
	ehqKGgjVsw/CEwbhWS1VHRmcKEliUWy1/+gIdOKhPUKW3ejpeDPPeFwgr1E4BnpnPTsLukSkBId0j
	beJFBODy3nAvqhWvoOebjI1ZT1upmIZVS9pzPC2StP9u+/xiFwgsP+yq64EISsMo/duqWo3X5Aano
	cWXtoYXYLycNYHRXdT4x5z3/KGimq8DOjRr4r+q2QIWeykvBZhLoXvl1UdgrMcioFvmY4rfJ6wmnT
	79JsMIugA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljccv-0065G4-O0; Thu, 20 May 2021 06:57:50 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljccs-0065Fc-Ur
 for linux-mediatek@desiato.infradead.org; Thu, 20 May 2021 06:57:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=h0fXYIN2E5J54+ZmwB3JHOzFpG3abb+viSfy+a5rRgw=; b=avEdDMdxTQ4MS5HgyRfwwlJxEj
 Xx1oSgnvGox036vmpaebIhpJBYcPeDpMYvqtWLQWZdeXo0KrumPdY4bYS7nWA0bah6jV2NRRZ5PUK
 uMei/ktVsg3xbAMeyB/ei/MktRsZq9ht/jIHshO7GXdSfRfN/bd51O+amLB0tm3lSPQ7O8CTOcjTS
 xYSuvQh/rpRtiYCBa4SuJEVLyckSPqlCCYaP8ecd0ps3Wcl6elHrnfI8SsXSIbCpd568HT9o9Dk33
 lRvAZPzml2UnUaw0X9evhIbnelRhrXbGXTzF3/76pSGMqvStRFk+xefTArOOkIR3mJw++bMtEwUXD
 Zi7T2sLg==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljcco-00G0iB-HY
 for linux-mediatek@lists.infradead.org; Thu, 20 May 2021 06:57:45 +0000
Received: by mail-wm1-x330.google.com with SMTP id
 z85-20020a1c7e580000b029017a76f3afbaso1997798wmc.2
 for <linux-mediatek@lists.infradead.org>; Wed, 19 May 2021 23:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=h0fXYIN2E5J54+ZmwB3JHOzFpG3abb+viSfy+a5rRgw=;
 b=kYsHClz4ZtHy58wi/PZc8Bs4XDjVdchu3qYDz74eF+jeJ1IcvezLu7xBX3SUAex/Fr
 WRUwd9s2agikUezDuM7gyKY2QxMlrLnZTlsDcy1M4boya7xjTOK59F46hBC+jvIwWu0d
 DFOLKIjh5BIRKyLLbT3RC4x+k/ZXWrPBdTtqfwz1EhkqD0TTzux7YHxOCCWkc6zKwQHo
 gc8B8Yq5nFGgMo+tad28yqUrL4ZTghKDfSsJrZxgEALJ6dXRavaUnUTCWklWorJuFaga
 ocs1ZtX9yll7uVmZyp6noJWyThvG6AQmR8evtXzzvXuPzyxSjT6YhKwQsjXcrv0cFjY9
 /FjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=h0fXYIN2E5J54+ZmwB3JHOzFpG3abb+viSfy+a5rRgw=;
 b=IVkSfFiQ9RleQ5hI/gYhiCT+cXgIs2O0H80bsaOAmqyDAvVfiVETqv0h1KgcYm19Gr
 wmCS2IITfwlPK2hTFxDt07N1+PSWSJS9iXPdjDFS3AtBf60bMjTk2+sgDt4wrLpVCDHm
 L7Fot9IaVRnIRNSvsim4E08tAL5RCsr0nSkb9ZDCyl/aBgVsqhuERuPizIq7GhOAAChe
 cQX8TQZIZ2VX4kxmSWehm0SmhL8C1gV0gmi7d3VLwPwRmDd8MKyJqVeb4rJDCXQ3jXkF
 SsxFcA6OYJIOm+8tMJ9TLfmaAZ+fqd4NZ8hBLzSm+yfwqnH7t8dW45yfBJW40s3gutZU
 Euyw==
X-Gm-Message-State: AOAM532n8Rmd9XgPxVJ85iojo9fCAT9tp/tTJgb2CixHxp0faZVZtJop
 sMgcphIFDgQGekaLcTzvhN46hg==
X-Google-Smtp-Source: ABdhPJwfHhX3Uc2t1nICQjEObP1SNmCR/vpanAyfFKJX+C5RLOD3pJjV/DqCSibv78lHl+kI5oJEjA==
X-Received: by 2002:a1c:9dc3:: with SMTP id g186mr2053326wme.47.1621493860351; 
 Wed, 19 May 2021 23:57:40 -0700 (PDT)
Received: from localhost ([2a01:cb19:826e:8e00:a45f:260c:febd:73ce])
 by smtp.gmail.com with ESMTPSA id w12sm1928423wrt.16.2021.05.19.23.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 23:57:39 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: kernel test robot <lkp@intel.com>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: kbuild-all@lists.01.org, Fabien Parent <fparent@baylibre.com>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] Input: mtk-pmic-keys - add support for MT6358
In-Reply-To: <202105200248.VC2Rdk6B-lkp@intel.com>
References: <20210512152648.39961-4-mkorpershoek@baylibre.com>
 <202105200248.VC2Rdk6B-lkp@intel.com>
Date: Thu, 20 May 2021 08:57:38 +0200
Message-ID: <87sg2h28pp.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_235742_676349_4695A6CD 
X-CRM114-Status: GOOD (  19.31  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

kernel test robot <lkp@intel.com> writes:

> Hi Mattijs,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on input/next]
> [also build test ERROR on v5.13-rc2 next-20210519]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Mattijs-Korpershoek/input-MT6358-PMIC-button-support/20210513-001558
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
> config: s390-randconfig-r014-20210519 (attached as .config)
> compiler: s390-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/74aae2763d0c259046aa7079a46ba0dfe1995e37
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Mattijs-Korpershoek/input-MT6358-PMIC-button-support/20210513-001558
>         git checkout 74aae2763d0c259046aa7079a46ba0dfe1995e37
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=s390 
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>>> drivers/input/keyboard/mtk-pmic-keys.c:80:22: error: 'MT6358_TOPSTATUS' undeclared here (not in a function); did you mean 'MT6397_OCSTATUS0'?
>       80 |   MTK_PMIC_KEYS_REGS(MT6358_TOPSTATUS,
>          |                      ^~~~~~~~~~~~~~~~
>    drivers/input/keyboard/mtk-pmic-keys.c:47:14: note: in definition of macro 'MTK_PMIC_KEYS_REGS'
>       47 |  .deb_reg  = _deb_reg,  \
>          |              ^~~~~~~~
>>> drivers/input/keyboard/mtk-pmic-keys.c:85:18: error: 'MT6358_TOP_RST_MISC' undeclared here (not in a function); did you mean 'MT6397_TOP_RST_MISC'?
>       85 |  .pmic_rst_reg = MT6358_TOP_RST_MISC,
>          |                  ^~~~~~~~~~~~~~~~~~~
>          |                  MT6397_TOP_RST_MISC
This build failure is expected.
As written in the cover letter, this depends on [1]

[1] has been applied to the mfd tree but it's not part of v5.13-rc2

[1] https://lore.kernel.org/r/20210506094116.638527-1-mkorpershoek@baylibre.com

>
>
> vim +80 drivers/input/keyboard/mtk-pmic-keys.c
>
>     77	
>     78	static const struct mtk_pmic_regs mt6358_regs = {
>     79		.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
>   > 80			MTK_PMIC_KEYS_REGS(MT6358_TOPSTATUS,
>     81			0x2, MT6358_PSC_TOP_INT_CON0, 0x5),
>     82		.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
>     83			MTK_PMIC_KEYS_REGS(MT6358_TOPSTATUS,
>     84			0x8, MT6358_PSC_TOP_INT_CON0, 0xa),
>   > 85		.pmic_rst_reg = MT6358_TOP_RST_MISC,
>     86	};
>     87	
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

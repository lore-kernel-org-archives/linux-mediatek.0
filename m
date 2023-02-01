Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06BB5C38142
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 07:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BOAVtoDyGjZY+SIS62M9gmEfmVp9hRVMK35KqE9GNqU=; b=r4shuoK4KOaWCNL0PlbjWr9sCG
	gU4aHQQq3pYhpy3+ED2uR3QDBwAooRZxfaZgiaFnGkCMtnjI0vr0DIL6encvtJLeB0X+MPgxdl9HV
	r4NETrA8OiTPPbevY112VF3IhaYLUXb1H20rD4nuXyTiMdusiJ9pH5rntrIP3xBwuuT4jT6vg7TCX
	oXa/Ml5M8VrYxG1y6IzSO1vLimJMqkFZmkBemyY+FsY54QK+HK6mWdlgzSSPfG+NWY597bhgZmojr
	kST1FOn5nULtEm14xELtvtyZ57412gOK51KDJSNVH3BuVJeF1hJIHSmbhv/ELtBFm+aAMDSlISz55
	Ir17ebzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN7qf-00AggX-9D; Wed, 01 Feb 2023 07:48:05 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN7qQ-00AgZY-Ou
	for linux-mediatek@lists.infradead.org; Wed, 01 Feb 2023 07:47:52 +0000
Received: by mail-wr1-x430.google.com with SMTP id t18so16431766wro.1
        for <linux-mediatek@lists.infradead.org>; Tue, 31 Jan 2023 23:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BOAVtoDyGjZY+SIS62M9gmEfmVp9hRVMK35KqE9GNqU=;
        b=yC6P8rtKjMfxlizxYDpk/d0n8PxtFwRcGFMaE/6ViJqIJOj/ZHYf3WLGPgGl8ysq4a
         9swcZrxrknGTH151pyA9IrCK7HPQUL0v0KNlojJl1fnTWRqqGmesLejCsdamaiiPCpux
         rlXTfZD5lOwZA9WXaPe+CBBfaee1rr8mbsNM4aup2KO2LFd8HWOAkYXMfzOMcFMQax/t
         XZvdqqYRtnJLyRn5D7q/4qDlIdJEj1KzoM4jjFFhwNje9X7+w+TKN0oCQaYWMdG1m1nb
         BumzLKtdCVc66ch0kTVrWTCH5pedCpmkwU+/IeLIRtSMeHGWUu7dq79p/j+AKnOsbqcX
         r/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BOAVtoDyGjZY+SIS62M9gmEfmVp9hRVMK35KqE9GNqU=;
        b=WwijBn6BCuYVz+gj6by+c3g6GkOi0SQjcqz1CdxYa+NphQVXEJ279SE/4MSs0EdwmZ
         dcPu7DpB6moDC1SUP1K7zGs0Xk4Rd57xOkUC/ujoeOxT1cW3RNwEcWLNI4sO8+F49zBB
         9c1TWHrs/lzmxQc/PVyuB/BxHP/9DIQPR9FFZ8IVJcXY9BNFG7L5WBkxDiRQqvBI3VwE
         jbM72U33TXCZDdYqqp0wjSZkQ6V61fFyBET55p6+PSst6L/65Ar+ro/9FjCUIQ7zOTyO
         PkzMMGYl4wQgX/YCggFMCAD/nQ7py1areo63aatZpGmWEdgNdfsb5YFoI4CrLwj6w84C
         IyXA==
X-Gm-Message-State: AO0yUKUlQ+2hRpdNI1xXztll3Niy8C4v4QiWDClsHLbeI8q5ZexS82bX
	Bfs/e4/Rrl3nNGON2kzzh6QCXg==
X-Google-Smtp-Source: AK7set8nqFHJYo7a4eebozO/03eyo/4ffYBLaond3yaQAHgnPDfYSecbma2ZGvil1SD9M2ZBXsqNJQ==
X-Received: by 2002:a5d:6906:0:b0:2bf:b7e3:7c82 with SMTP id t6-20020a5d6906000000b002bfb7e37c82mr1277533wru.57.1675237666253;
        Tue, 31 Jan 2023 23:47:46 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id e10-20020a5d500a000000b002be0b1e556esm16331729wrt.59.2023.01.31.23.47.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 23:47:45 -0800 (PST)
Message-ID: <17072296-c1fb-1e82-65fd-26b448167087@linaro.org>
Date: Wed, 1 Feb 2023 08:47:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v12] thermal: drivers: mediatek: Add the Low Voltage
 Thermal Sensor driver
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, bchihi@baylibre.com,
 daniel.lezcano@linaro.org, angelogioacchino.delregno@collabora.com,
 rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com,
 matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org,
 ye.xingchen@zte.com.cn, p.zabel@pengutronix.de
Cc: oe-kbuild-all@lists.linux.dev, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 khilman@baylibre.com, james.lo@mediatek.com, rex-bc.chen@mediatek.com
References: <20230131153816.21709-1-bchihi@baylibre.com>
 <202302011058.17Vvc1pN-lkp@intel.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <202302011058.17Vvc1pN-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_234750_828307_8B9D25D0 
X-CRM114-Status: GOOD (  13.77  )
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

On 01/02/2023 04:09, kernel test robot wrote:
> Hi Balsam,
> 
> Thank you for the patch! Yet something to improve:
> 
> 
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/UPDATE-20230131-234122/bchihi-baylibre-com/thermal-drivers-mediatek-Relocate-driver-to-mediatek-folder/20230124-211910
> base:   the 4th patch of https://lore.kernel.org/r/20230124131717.128660-5-bchihi%40baylibre.com
> patch link:    https://lore.kernel.org/r/20230131153816.21709-1-bchihi%40baylibre.com
> patch subject: [PATCH v12] thermal: drivers: mediatek: Add the Low Voltage Thermal Sensor driver
> config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230201/202302011058.17Vvc1pN-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/5646ebf6f10ff0fc60c04d8c57523f7c44526b41
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review UPDATE-20230131-234122/bchihi-baylibre-com/thermal-drivers-mediatek-Relocate-driver-to-mediatek-folder/20230124-211910
>         git checkout 5646ebf6f10ff0fc60c04d8c57523f7c44526b41
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>>> drivers/thermal/mediatek/lvts_thermal.c:20:10: fatal error: dt-bindings/thermal/mediatek,lvts-thermal.h: No such file or directory
>       20 | #include <dt-bindings/thermal/mediatek,lvts-thermal.h>
>          |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

So here is your driver... and you decided not only to make reviewers
life more difficult, but also to fail all automated tools.

No, that's not how patchsets should be sent. You have here clear
dependency, you cannot send them separately.

Best regards,
Krzysztof



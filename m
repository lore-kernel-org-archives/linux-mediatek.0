Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E901C05027
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 15:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WKcD/zDARR0ET8GDXucrQ586p1EZyc/trnwGgWqi5oM=; b=fIgj8QbmDwko61Pju1xLmulJHk
	fsspWMW8HQ63XwWXV7uWlN40lZ0JQhQC+n1hBVFZhoNOdvinrjWfgigyGnNU8Bj82iZKB88/Frpmg
	RlW0UbWxKh3kP3Q4sdzEy1jlSkjtkwlRqw3aLN67aGLTaF5zTNC99HJeW5ApCF6V9DZqfh0PGwsvx
	oL9F1OItxnHmN7WuwsjOwr4HW5mo+do6tbXt+NCsPOCou1Qj6cdlSXkyi6w6JcwQ6j/2Y651CUXYF
	cw+dBDcYzgxNBx9JE5OVW+q2AwOQC+DZ9zJ2mSGbMbOQRuRPcYZsKDHcBZKoHos6xWU/4fbV2OMk7
	XwbodQLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNEpb-00CbjV-LC; Wed, 01 Feb 2023 15:15:27 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNEpQ-00Cbfg-EG
	for linux-mediatek@lists.infradead.org; Wed, 01 Feb 2023 15:15:19 +0000
Received: by mail-ed1-x530.google.com with SMTP id fi26so18003257edb.7
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Feb 2023 07:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WKcD/zDARR0ET8GDXucrQ586p1EZyc/trnwGgWqi5oM=;
        b=UNvI8KAlb1PeQQTsF/6w1pZ0C36wdH+yiGj8bP1bem/hCAcaJOM/nE7ucQiIIsRBwY
         rqtp2QIG/OrrPjr2NX7bTvR2H6DfxHFwlGVO2g/FdDLws8yAfsNiFQpcmQzYByIu32Ed
         p1wCa4CSnyD3nw6sDu+pewrKZa+8JX184CH99a75W0nzWEHCaau6Ak++1zVUdiqyK3f+
         t+OxDVJvT6Nb0Ot7ANLlt084gp9wEov6ZGd6D7K37LFWKDmBV4j0hMR2TNmbhhoQsQJP
         74Vcj6qNZEUT7CDXuBJ9+c521drz49X7juopPmmR9kUeIiOTtqmxFjRoS6jYhnTT1TuS
         5GwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WKcD/zDARR0ET8GDXucrQ586p1EZyc/trnwGgWqi5oM=;
        b=WMNrlnVo4mYVQrxmN6ZA4qIEjOvK6QXRob/N7+WLUMIBZbvyrNm3TW153pfX1gZksQ
         KQXLeg/75SBNscVsm+BZTGxXkDV1OEZs4m+QPiPPDDebFIYGzxEuVgZ6kXFKmKpehcgi
         zt9eEQqGLULZIBspmkDJxE2hsyODTh+kgZyH5qh0kBN3hut0O8dvg2/i2UdVPO7GysTO
         bBWLvZcJWMiSKpTuIWIDJ0rcDlEXC3J1LOKoMAy9Fz/38wnei+AH/Sq9xZ2wq49FwOXc
         MuGB5x5GjFPWWOQjEWENrhLe/wvimiSwkad7GT6Frlfqtg1PTMbtl4ESFrnzv3E+rCrf
         CvMA==
X-Gm-Message-State: AO0yUKUuTlq6vosmooLAE3ayOtXbkwW/OhqkbPL7vqdWhxmilf/3pYef
	wAeIz9ih46rcgXyaThodVQLt2KocR8FKQyNfDgnFiA==
X-Google-Smtp-Source: AK7set8Sqpf7IQKI8pCxzgiefm4DEzyA6FF6UcZXLNTZNnDOHduTVAL3Dj7gPRjuCIZZHhxAewq7V1amgnQUE4iiCRY=
X-Received: by 2002:a50:f60f:0:b0:4a2:27c2:aa9a with SMTP id
 c15-20020a50f60f000000b004a227c2aa9amr741605edn.61.1675264512617; Wed, 01 Feb
 2023 07:15:12 -0800 (PST)
MIME-Version: 1.0
References: <20230131153816.21709-1-bchihi@baylibre.com> <202302011058.17Vvc1pN-lkp@intel.com>
 <17072296-c1fb-1e82-65fd-26b448167087@linaro.org>
In-Reply-To: <17072296-c1fb-1e82-65fd-26b448167087@linaro.org>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Wed, 1 Feb 2023 16:14:36 +0100
Message-ID: <CAGuA+opm_oM-BdHgcnj09C_6oT4WSbu8-v2QnzmERUiNQD4rUQ@mail.gmail.com>
Subject: Re: [PATCH v12] thermal: drivers: mediatek: Add the Low Voltage
 Thermal Sensor driver
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: kernel test robot <lkp@intel.com>, daniel.lezcano@linaro.org, 
	angelogioacchino.delregno@collabora.com, rafael@kernel.org, amitk@kernel.org, 
	rui.zhang@intel.com, matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org, 
	ye.xingchen@zte.com.cn, p.zabel@pengutronix.de, oe-kbuild-all@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com, 
	rex-bc.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_071516_731162_9DA81047 
X-CRM114-Status: GOOD (  19.69  )
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

Hi Krzysztof,

On Wed, Feb 1, 2023 at 8:47 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 01/02/2023 04:09, kernel test robot wrote:
> > Hi Balsam,
> >
> > Thank you for the patch! Yet something to improve:
> >
> >
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/UPDATE-20230131-234122/bchihi-baylibre-com/thermal-drivers-mediatek-Relocate-driver-to-mediatek-folder/20230124-211910
> > base:   the 4th patch of https://lore.kernel.org/r/20230124131717.128660-5-bchihi%40baylibre.com
> > patch link:    https://lore.kernel.org/r/20230131153816.21709-1-bchihi%40baylibre.com
> > patch subject: [PATCH v12] thermal: drivers: mediatek: Add the Low Voltage Thermal Sensor driver
> > config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230201/202302011058.17Vvc1pN-lkp@intel.com/config)
> > compiler: s390-linux-gcc (GCC) 12.1.0
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://github.com/intel-lab-lkp/linux/commit/5646ebf6f10ff0fc60c04d8c57523f7c44526b41
> >         git remote add linux-review https://github.com/intel-lab-lkp/linux
> >         git fetch --no-tags linux-review UPDATE-20230131-234122/bchihi-baylibre-com/thermal-drivers-mediatek-Relocate-driver-to-mediatek-folder/20230124-211910
> >         git checkout 5646ebf6f10ff0fc60c04d8c57523f7c44526b41
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash
> >
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>):
> >
> >>> drivers/thermal/mediatek/lvts_thermal.c:20:10: fatal error: dt-bindings/thermal/mediatek,lvts-thermal.h: No such file or directory
> >       20 | #include <dt-bindings/thermal/mediatek,lvts-thermal.h>
> >          |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> So here is your driver... and you decided not only to make reviewers
> life more difficult, but also to fail all automated tools.
>
> No, that's not how patchsets should be sent. You have here clear
> dependency, you cannot send them separately.

I'm sorry, I'll be careful next time.
I apologize for breaking the series.
I will take into account the new change requests in the next full
v13 the series.

>
> Best regards,
> Krzysztof
>

Best regards,
Balsam


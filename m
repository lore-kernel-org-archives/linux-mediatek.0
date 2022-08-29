Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EB9ECAAD4
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 09:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OEZrBCxaknFTMFU0NAWFE13w/K2RkxzEBhZ3jp9e+Ls=; b=49TrPRqR8zR3ddxrEt3SKW3C+M
	YIaXrmoCGPfTfLIBtjB7X0xpv+IOEct7tii65LcpqMLl+t17KzxPdXCbqSqpwwOhJQRgKRcUpGRVL
	+4m/A709PKvwq1fjH7RO5mpG7nV7v3s9ltlkqNu2Do3xaqVZ/3IBhBmj/+l4W9PVmz+hokw4D5+sA
	vT1gcTWXGLDuopb9Bu5Gg6npYmjp49veXE7BnIQBn4To3b8ZgFEAPt4Cz+YkuwCr/EsooWOmafxcY
	cHNzcUDQw8b64TWeJNbR/ukslsXnPju98ciBgLkh5hGG5K5HZzLz2DER+Slt5M2c6RPPtet+ywnoY
	1L0jdNJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSbBR-006nQD-2k; Mon, 29 Aug 2022 09:35:53 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSb9c-006m5l-0g
	for linux-mediatek@lists.infradead.org; Mon, 29 Aug 2022 09:34:03 +0000
Received: by mail-wr1-x42d.google.com with SMTP id bu22so9067147wrb.3
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Aug 2022 02:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=OEZrBCxaknFTMFU0NAWFE13w/K2RkxzEBhZ3jp9e+Ls=;
        b=pIODGRliqHXZnrdnQCZpc577YsSQf1pmtPwDBw2p1RblWUvM89Z+wHH8JKumg6AmQF
         LDXiE5oW1keWpwNtNpxX+Pzeyti49A3pLMqsn0sjh36QShhkaCeuJETtf05GYkft0Ibt
         l1ZFIwjuefh+Kgm24w3i1rRSLtzW9mcUOTYZJkPK8L0fJqRvwIRUSI4ia42GBGQON5pp
         PgbygzZOLbJFVCjoqQ8rBG5LxLyX1XcHbm+QPYC4Gyg+ahhw0rRRgnyeeig4EIPais6C
         eWbQuS7hwARfTuxJ20JVLrlZJmyUSxBRPRGCeGCBqckC39j7ZfH8TnVBvgD6PKSS71Io
         y9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=OEZrBCxaknFTMFU0NAWFE13w/K2RkxzEBhZ3jp9e+Ls=;
        b=vq6m5SbM8Mtuvbl+gXM8U6waYTybe0efQAqyVJ2n4utlw6rYuSpLh/Ze7sqEoMw1aJ
         bXX3xz3ij2fAqJfh869zqdaRYKOX2JZ7NaFl+ACljSbWh2jH1Cx8C4mgmTJk0o/CG82T
         A0DgajIAxkeFVfurUDD94rCGSwLSGzfu54sX1UogC5gmHKKBm0CnXDQgA1y+Odj08eHg
         aR63FQhnWWfxHRYCx63BG8MwXUU7oJ9plGM+lOMvNeuFIiPOznnRHqydhjLAZUiURH1f
         7wGNhqxw/WCRwdR7KEJl3oGD+od/zNrsQid8UTUzumZhzu8zCKtl2tIhhGWHtpQV7FuI
         4DfQ==
X-Gm-Message-State: ACgBeo2owMB8xmhlG332Xv9JuGtJ5zvxTgepi9zm16y1jU3UGen4ZI9k
	BfK9eQnW7IsOmZOiBGW2KTS6Qg==
X-Google-Smtp-Source: AA6agR6QclHHYEVnw1P0Cr+37FE6FRGUPU98yhw/yhAKKU3clEvU36m+ceZUyLz0SsDl4UgIVE4pDQ==
X-Received: by 2002:a5d:47cd:0:b0:220:70a2:5383 with SMTP id o13-20020a5d47cd000000b0022070a25383mr5900505wrc.258.1661765632312;
        Mon, 29 Aug 2022 02:33:52 -0700 (PDT)
Received: from blmsp ([2001:4090:a245:8020:2658:1f7c:362:3e99])
        by smtp.gmail.com with ESMTPSA id l5-20020a1c2505000000b003a5ffec0b91sm8342437wml.30.2022.08.29.02.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 02:33:51 -0700 (PDT)
Date: Mon, 29 Aug 2022 11:33:50 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: kernel test robot <lkp@intel.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Fabien Parent <parent.f@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kbuild-all@lists.01.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] clk: mediatek: Provide mtk_devm_alloc_clk_data
Message-ID: <20220829093350.hu734rofg7luwvkp@blmsp>
References: <20220822152652.3499972-3-msp@baylibre.com>
 <202208230714.8DNW6JjZ-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202208230714.8DNW6JjZ-lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_023400_148839_0CD18D9F 
X-CRM114-Status: GOOD (  15.42  )
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

On Tue, Aug 23, 2022 at 07:44:26AM +0800, kernel test robot wrote:
> Hi Markus,
> 
> Thank you for the patch! Perhaps something to improve:
> 
> [auto build test WARNING on clk/clk-next]
> [also build test WARNING on robh/for-next linus/master v6.0-rc2 next-20220822]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Schneider-Pargmann/clk-mediatek-Add-mt8365-support/20220822-233030
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
> config: loongarch-randconfig-c004-20220821 (https://download.01.org/0day-ci/archive/20220823/202208230714.8DNW6JjZ-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 12.1.0
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> 
> cocci warnings: (new ones prefixed by >>)
> >> drivers/clk/mediatek/clk-mtk.c:64:1-6: WARNING: invalid free of devm_ allocated data
> 
> vim +64 drivers/clk/mediatek/clk-mtk.c
> 
> 9741b1a68035b54 James Liao    2015-04-23  61  
> 609cc5e1a82394e Chen-Yu Tsai  2022-05-19  62  void mtk_free_clk_data(struct clk_hw_onecell_data *clk_data)
> 300796cad22153f Chun-Jie Chen 2021-09-14  63  {
> 300796cad22153f Chun-Jie Chen 2021-09-14 @64  	kfree(clk_data);
> 300796cad22153f Chun-Jie Chen 2021-09-14  65  }
> 609cc5e1a82394e Chen-Yu Tsai  2022-05-19  66  EXPORT_SYMBOL_GPL(mtk_free_clk_data);

I don't see how this should be called with clk_data being initialized by
devm_*. Maybe I am bit code blind.

Do you have an actual call stack how this is supposed to happen? Also I
wasn't able to get the same warning with coccinelle (different
compiler).

Best,
Markus


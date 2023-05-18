Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC3CC77B7A
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 May 2023 11:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=4GbFMPjUFF9uuaXdP1MBvbLG15PgOtEOYz2afufGOGY=; b=QXx4pCbvIK792P
	B5+2IObq1VEAhRqYE+iFCtKoUti6gUZPEN5U2GMp30l73HYtqaNXKG7Kzol1ngmd6Nbq5CuHBlk4l
	NK25JcrMsb+cJsMpJJmvCv9EWiis+jf2LmxKfE9rlhHURXpGNV2NjeYsgm3oiOhZfKOHw1TV+9Ab6
	qf6ifkeZdHFXr4R3DsjoAWZXpaOXGurb+DEG42NzSWNZSOB8I/PDwsQ9jk1Ht5Rgm6duLmU2rmvCM
	Zynh4Y7XZQLYU1JEqLAU9+OA2ndLM4maNjn7wz1s8mXUtoIDUmGCh84obKAGyyBzkvZJY+jFQIaTf
	Pdys5Y5c8g36vsPk19DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzc9m-00CtF5-0v;
	Thu, 18 May 2023 11:50:54 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzc9i-00CtDl-2H
	for linux-mediatek@lists.infradead.org;
	Thu, 18 May 2023 11:50:52 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f417ea5252so13594475e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 18 May 2023 04:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684410643; x=1687002643;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4GbFMPjUFF9uuaXdP1MBvbLG15PgOtEOYz2afufGOGY=;
        b=ZyycZsK+W7vqKI/wajkBrmb/IKov5NEyGA5ouG/8DGclQF038y5DfFqsrTMB+s4fkr
         eUGu+Ty4MdnljIQAFZHjHlNj5slsxBed0cCB2uYNy+OMtI6nCu9EW6DI1l5AikSkH83j
         TFtIKlbT4Ngy4x1gS3WQ4N72Pf+MZUIEmW29/lCRvFkn6rUUjaKXF0hV+hXaT/JGoCzz
         nDOwhQrTzZwqw0r09ybNpIqPF5gzKuwopKPShlBduTJtb02FvXh0PizifEpErC/5pnHt
         Ney4bxUFVy45qSHTUHoHiQY0XE+FMUjrlyCjmTiXDsnXsq0o/gcleEFBM5B1FlyfZi1x
         qe9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684410643; x=1687002643;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4GbFMPjUFF9uuaXdP1MBvbLG15PgOtEOYz2afufGOGY=;
        b=PWTkcVj08SIUcHHwPAnhtEb7DHkdjUjMpsTpcwCqQismTBOoQAL5jMhrvncmqltpGa
         x3HqW49suUR+MtMf22644kHl82Sqr/XBsjSJkhXcVVg3HhcAdj35Z70nH5472P0ATLH7
         sz9xOJ3hWYO1Ngz6wHmjUwhfwUTAWRV1VsyikhtFIM9FnYEhCQcXlSvwf/1sSfSpD2uw
         xnbpNsmaYdbF+mssLfZxe5tQZxSF8ScoPmohO0xO+sjbQNpQd3DbE1CyWFP2JK+FDoq/
         UB3bnnF09bavVwuie1UYYnuppDQLrYWXmaNIVHme0XxkHEEAGsHgl2btba6wgrampC2N
         e4HQ==
X-Gm-Message-State: AC+VfDwRX2S9Gl/acQyHp5a6QoR8N9AY6RB7XRRANpYw90/Y3NHbEsH+
	sGWpl6CXBHK3jd179MpLi2502A==
X-Google-Smtp-Source: ACHHUZ4qI1udVkiV6/Ew6tml0v++zojqe1Evt5p7G+qZ1+mBqq0DfzHz64PbkWrAGEdbtJ+FKGlc6Q==
X-Received: by 2002:a7b:c847:0:b0:3f5:42e:7229 with SMTP id c7-20020a7bc847000000b003f5042e7229mr1035527wml.41.1684410643102;
        Thu, 18 May 2023 04:50:43 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v14-20020a1cf70e000000b003f1751016desm1822077wmh.28.2023.05.18.04.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 04:50:41 -0700 (PDT)
Date: Thu, 18 May 2023 14:50:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Tinghan Shen <tinghan.shen@mediatek.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v12 07/11] remoteproc: mediatek: Control SCP core 1 by
 rproc subdevice
Message-ID: <11b3ab8d-1264-4143-8eec-b2ef9f691814@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230517043449.26352-8-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_045050_751374_30A93D62 
X-CRM114-Status: UNSURE (   7.48  )
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

Hi Tinghan,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tinghan-Shen/dt-bindings-remoteproc-mediatek-Improve-the-rpmsg-subnode-definition/20230517-123659
base:   git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rproc-next
patch link:    https://lore.kernel.org/r/20230517043449.26352-8-tinghan.shen%40mediatek.com
patch subject: [PATCH v12 07/11] remoteproc: mediatek: Control SCP core 1 by rproc subdevice
config: csky-randconfig-m041-20230517
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305181957.ZMXChgJV-lkp@intel.com/

smatch warnings:
drivers/remoteproc/mtk_scp.c:891 scp_core_subdev_register() warn: can 'scp_c0' even be NULL?

vim +/scp_c0 +891 drivers/remoteproc/mtk_scp.c

69e1791d92cfa0 Tinghan Shen 2023-05-17  884  static int scp_core_subdev_register(struct mtk_scp *scp)
69e1791d92cfa0 Tinghan Shen 2023-05-17  885  {
69e1791d92cfa0 Tinghan Shen 2023-05-17  886  	struct device *dev = scp->dev;
69e1791d92cfa0 Tinghan Shen 2023-05-17  887  	struct mtk_scp_core_subdev *core_subdev;
69e1791d92cfa0 Tinghan Shen 2023-05-17  888  	struct mtk_scp *scp_c0;
69e1791d92cfa0 Tinghan Shen 2023-05-17  889  
69e1791d92cfa0 Tinghan Shen 2023-05-17  890  	scp_c0 = list_first_entry(scp->cluster, struct mtk_scp, elem);
69e1791d92cfa0 Tinghan Shen 2023-05-17 @891  	if (!scp_c0)
69e1791d92cfa0 Tinghan Shen 2023-05-17  892  		return -ENODATA;

This NULL check isn't right.  Use list_first_entry_or_null() if the list
can be empty.

69e1791d92cfa0 Tinghan Shen 2023-05-17  893  
69e1791d92cfa0 Tinghan Shen 2023-05-17  894  	core_subdev = devm_kzalloc(dev, sizeof(*core_subdev), GFP_KERNEL);
69e1791d92cfa0 Tinghan Shen 2023-05-17  895  	if (!core_subdev)
69e1791d92cfa0 Tinghan Shen 2023-05-17  896  		return -ENOMEM;
69e1791d92cfa0 Tinghan Shen 2023-05-17  897  
69e1791d92cfa0 Tinghan Shen 2023-05-17  898  	core_subdev->scp = scp;
69e1791d92cfa0 Tinghan Shen 2023-05-17  899  	core_subdev->subdev.start = scp_core_subdev_start;
69e1791d92cfa0 Tinghan Shen 2023-05-17  900  	core_subdev->subdev.stop = scp_core_subdev_stop;
69e1791d92cfa0 Tinghan Shen 2023-05-17  901  
69e1791d92cfa0 Tinghan Shen 2023-05-17  902  	scp->core_subdev = core_subdev;
69e1791d92cfa0 Tinghan Shen 2023-05-17  903  	rproc_add_subdev(scp_c0->rproc, &scp->core_subdev->subdev);
69e1791d92cfa0 Tinghan Shen 2023-05-17  904  
69e1791d92cfa0 Tinghan Shen 2023-05-17  905  	return 0;
69e1791d92cfa0 Tinghan Shen 2023-05-17  906  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



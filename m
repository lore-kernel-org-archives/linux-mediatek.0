Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F14E3C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Mar 2023 05:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=qjRWCU/VLQErX2z0uvL/aL2jDlqWYNpnjGy6qbEOGGE=; b=yf3QB8esk1nE49
	e15YGUnqkw7W6qLstj7hnA5Z70yK1y7qxUoDT0BY2lwK0bMHN31OdEEC5JXd0bP3oq3dnbuMoVG1S
	2fI409XELyn9YiNEcBI2e4P/EZcN1rXq0JxEEb8BinTDwMPPjHzEdmFHVCYeapNphrQ0xvkL0kbFk
	n/WAjWaArYZHFcrnGNH/HQX0kg251Y758Z0e15qJ88NtBTzNCrdUkjca5UFwa/ZX4zjcXCOiGIkqV
	zjgGMKH9HCFNvWSFHaDTMLOzILyaIF6aefJXtR5h6XGSus3772Sz6Dd/JpyZK8U4ZJg+4btESFCKD
	jFFNmAaYp2MPUhlcHX5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfZYI-003Xim-1U;
	Fri, 24 Mar 2023 05:01:22 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfZYE-003XhC-0y;
	Fri, 24 Mar 2023 05:01:19 +0000
Received: by mail-ed1-x536.google.com with SMTP id i5so3490552eda.0;
        Thu, 23 Mar 2023 22:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679634074;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qjRWCU/VLQErX2z0uvL/aL2jDlqWYNpnjGy6qbEOGGE=;
        b=AV4afuHsts3hAqNjn+9LdAhIgZ+Zdmq1EJCCmlG/TdZACcSB8wehdUwVsHhv/Dopjp
         RTph8NS7MUsrtZ+Ev++hdhIOfeWehOCfOIUWSVtYW+uK0vaIPqUYPxuffx6LMoIXSNOz
         5SaDg2awjB3Bdo2P0vjaJHPPrMIRZIaUZnRD1Vfpb69yaq96zT/2rXIpk2EvucvO+aNV
         HBT40USzBCx+QgLCahLeo9aFpJ+igenZMfPloCpeBZK3bUsAfR+2LFmLSJ/EuHxaBLDk
         bGbsEr6dFrTrDeMWRxE69GUfgXTX4AJXn6YIuA7BWne11xTaWAPULAXH/wzrufLxu+i0
         dxgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679634074;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qjRWCU/VLQErX2z0uvL/aL2jDlqWYNpnjGy6qbEOGGE=;
        b=i9ocaYn9X51UTOngu5MdKUvUNcvGWrB2rXBjYEN3oQ6Is5PEPZJKmYH1GZr0T6vitp
         NhjCf9fqBdTeNdyhkhMFkiwQe3cLFanLV/rhQ0EX5nLI5gLsLX9gwktNqjyU/fNkr1uz
         5Pg1diJdwB91+HcFI8ZgfIUJfciGQ7UIEKm3sTlB21RZU6aw/2K/CY7wK9NjkznG0uvz
         yt3dvARgqE7WyalwqMLuHsEG6LdvpghnwvmQ750z/PQSv/ZD1gRZcmFoqaWweeuprLU3
         hu42VAxypO+FJt5AcDZSE6tCAYXNygXiFEsZuuEE1MhOnyFukU+2WhXnZXwQ3ouIwteK
         Zl6w==
X-Gm-Message-State: AAQBX9f/jlWeNss8mrkv2IyuopljDiVE+UnxRq6yt2WoMVay/wC8oI4L
	wkbx+NVWaaWCbz6IrobkIXE=
X-Google-Smtp-Source: AKy350Z6AhniQxuCsI+BdYd/geEC5/fUia7TructKG3W3ffPTO5hgdA9jsSFB3KZs+E/YxUvVP/DzA==
X-Received: by 2002:a05:6402:1503:b0:4fd:2b0e:ce87 with SMTP id f3-20020a056402150300b004fd2b0ece87mr1438213edw.24.1679634073874;
        Thu, 23 Mar 2023 22:01:13 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c24-20020a50d658000000b00501d5432f2fsm5249889edj.60.2023.03.23.22.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 22:01:13 -0700 (PDT)
Date: Fri, 24 Mar 2023 08:01:09 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	tfiga@chromium.org, m.szyprowski@samsung.com, mchehab@kernel.org,
	ming.qian@nxp.com, shijie.qin@nxp.com, eagle.zhou@nxp.com,
	bin.liu@mediatek.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com,
	stanimir.k.varbanov@gmail.com, quic_vgarodia@quicinc.com,
	agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
	ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
	daniel.almeida@collabora.com, hverkuil-cisco@xs4all.nl,
	laurent.pinchart@ideasonboard.com, jernel@kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 2/8] media: videobuf2: Make bufs array dynamic
 allocated
Message-ID: <4e2cb832-de83-4ba6-bd8a-119a19038cfe@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230321102855.346732-3-benjamin.gaignard@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_220118_381035_A9E3F0A9 
X-CRM114-Status: UNSURE (   6.63  )
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

Hi Benjamin,

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Gaignard/media-videobuf2-Access-vb2_queue-bufs-array-through-helper-functions/20230321-183154
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230321102855.346732-3-benjamin.gaignard%40collabora.com
patch subject: [PATCH v2 2/8] media: videobuf2: Make bufs array dynamic allocated
config: arm64-randconfig-m041-20230319 (https://download.01.org/0day-ci/archive/20230324/202303240148.lKRnUqW9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303240148.lKRnUqW9-lkp@intel.com/

smatch warnings:
include/media/videobuf2-core.h:1272 vb2_queue_add_buffer() warn: sleeping in atomic context
drivers/media/common/videobuf2/videobuf2-core.c:2456 vb2_core_queue_init() warn: Please consider using kcalloc instead of kmalloc_array

vim +1272 include/media/videobuf2-core.h

625d46c1c1fe8e Benjamin Gaignard 2023-03-21  1263  static inline bool vb2_queue_add_buffer(struct vb2_queue *q, struct vb2_buffer *vb)
625d46c1c1fe8e Benjamin Gaignard 2023-03-21  1264  {
487d3f14d12ecf Benjamin Gaignard 2023-03-21  1265  	bool ret = false;
487d3f14d12ecf Benjamin Gaignard 2023-03-21  1266  
487d3f14d12ecf Benjamin Gaignard 2023-03-21  1267  	spin_lock(&q->bufs_lock);
                                                        ^^^^^^^^^^^^^^^^^^^^^^^
Holding a spin lock.

487d3f14d12ecf Benjamin Gaignard 2023-03-21  1268  
487d3f14d12ecf Benjamin Gaignard 2023-03-21  1269  	if (vb->index >= q->max_num_bufs) {
487d3f14d12ecf Benjamin Gaignard 2023-03-21  1270  		struct vb2_buffer **tmp;
487d3f14d12ecf Benjamin Gaignard 2023-03-21  1271  
487d3f14d12ecf Benjamin Gaignard 2023-03-21 @1272  		tmp = krealloc_array(q->bufs, q->max_num_bufs * 2, sizeof(*q->bufs), GFP_KERNEL);
                                                                                                                                     ^^^^^^^^^^
Sleeping allocation.  GFP_ATOMIC?  Or is there a way to move the
allocation outside the lock?

487d3f14d12ecf Benjamin Gaignard 2023-03-21  1273  		if (!tmp)
487d3f14d12ecf Benjamin Gaignard 2023-03-21  1274  			goto realloc_failed;
487d3f14d12ecf Benjamin Gaignard 2023-03-21  1275  
487d3f14d12ecf Benjamin Gaignard 2023-03-21  1276  		q->max_num_bufs *= 2;
487d3f14d12ecf Benjamin Gaignard 2023-03-21  1277  		q->bufs = tmp;
487d3f14d12ecf Benjamin Gaignard 2023-03-21  1278  	}
487d3f14d12ecf Benjamin Gaignard 2023-03-21  1279  
487d3f14d12ecf Benjamin Gaignard 2023-03-21  1280  	if (vb->index < q->max_num_bufs) {
625d46c1c1fe8e Benjamin Gaignard 2023-03-21  1281  		q->bufs[vb->index] = vb;
487d3f14d12ecf Benjamin Gaignard 2023-03-21  1282  		ret = true;
625d46c1c1fe8e Benjamin Gaignard 2023-03-21  1283  	}
625d46c1c1fe8e Benjamin Gaignard 2023-03-21  1284  
487d3f14d12ecf Benjamin Gaignard 2023-03-21  1285  realloc_failed:
487d3f14d12ecf Benjamin Gaignard 2023-03-21  1286  	spin_unlock(&q->bufs_lock);
487d3f14d12ecf Benjamin Gaignard 2023-03-21  1287  
487d3f14d12ecf Benjamin Gaignard 2023-03-21  1288  	return ret;
625d46c1c1fe8e Benjamin Gaignard 2023-03-21  1289  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



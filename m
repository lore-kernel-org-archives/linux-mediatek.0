Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579B0C76196
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Mar 2023 08:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I9FxIEFEjjKggwADdtbp8jB7pqB5st2w90KjJE8/HgI=; b=GjTnu6wDS6y7NjXemly9SOtULj
	SGgxwmK8+xzXNTM/TRTf2X70qAQzC3m6F6hHP0ghpDe9CsoxIGcm6LaA4jIRj0hicCarz+ewFRl93
	dMPRe0pMY51pJpc2naOT6WbFaxhXzkxeYmYXCsxaU8glzrxzOfE1YUNtXsuILacJebVBTcjzdGWib
	U6p+oE1jSeZdqyRLdSyfb2WBJkew64A/3yd97YDpr/LWUT71ysJusoDdsIg8vJTidB5piQVo5BZPR
	C1DYzl334JP4pvge3fAPjI9QQJ/MLqVCC7p5xdi3PS8N32j/9CPAPuRphU33ELGfBG5Itk/t62Ufe
	eVHGUIgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfd6A-003uea-0O;
	Fri, 24 Mar 2023 08:48:34 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfd66-003uc8-0h;
	Fri, 24 Mar 2023 08:48:32 +0000
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BAC52A49;
	Fri, 24 Mar 2023 09:48:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1679647704;
	bh=KpuY1QKzLkIZDE6DG/yJcKDnShie1EM321tYfP0rhXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R8TKt9vrHRV/y+xJrZr+g4iNHQY7dmDSsDecMVTDKWwscC1PvSrj9PCVpiTl5FY+I
	 7CHi2zqvrmgCQ02UYWCqQkKhktUkCmPjXeRSremEKWI7KPXKvw1kVhgx/wWh74varV
	 ZVR0QAz+Mg+nrPfmaPXYNx9Zh8VJyI1TyvRP0oRM=
Date: Fri, 24 Mar 2023 10:48:30 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Dan Carpenter <error27@gmail.com>, oe-kbuild@lists.linux.dev,
	tfiga@chromium.org, m.szyprowski@samsung.com, mchehab@kernel.org,
	ming.qian@nxp.com, shijie.qin@nxp.com, eagle.zhou@nxp.com,
	bin.liu@mediatek.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com,
	stanimir.k.varbanov@gmail.com, quic_vgarodia@quicinc.com,
	agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
	ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
	daniel.almeida@collabora.com, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 2/8] media: videobuf2: Make bufs array dynamic
 allocated
Message-ID: <20230324084830.GA18895@pendragon.ideasonboard.com>
References: <4e2cb832-de83-4ba6-bd8a-119a19038cfe@kili.mountain>
 <a88b93cc-a81f-6186-09fc-02223867e677@collabora.com>
 <b0018f7b-0556-0ac1-d2fa-89787a27fba1@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b0018f7b-0556-0ac1-d2fa-89787a27fba1@xs4all.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_014830_420308_83BAE543 
X-CRM114-Status: GOOD (  15.33  )
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

On Fri, Mar 24, 2023 at 09:31:35AM +0100, Hans Verkuil wrote:
> On 24/03/2023 09:11, Benjamin Gaignard wrote:
> > 
> > Le 24/03/2023 à 06:01, Dan Carpenter a écrit :
> >> Hi Benjamin,
> >>
> >> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >>
> >> url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Gaignard/media-videobuf2-Access-vb2_queue-bufs-array-through-helper-functions/20230321-183154
> >> base:   git://linuxtv.org/media_tree.git master
> >> patch link:    https://lore.kernel.org/r/20230321102855.346732-3-benjamin.gaignard%40collabora.com
> >> patch subject: [PATCH v2 2/8] media: videobuf2: Make bufs array dynamic allocated
> >> config: arm64-randconfig-m041-20230319 (https://download.01.org/0day-ci/archive/20230324/202303240148.lKRnUqW9-lkp@intel.com/config)
> >> compiler: aarch64-linux-gcc (GCC) 12.1.0
> >>
> >> If you fix the issue, kindly add following tag where applicable
> >> | Reported-by: kernel test robot <lkp@intel.com>
> >> | Reported-by: Dan Carpenter <error27@gmail.com>
> >> | Link: https://lore.kernel.org/r/202303240148.lKRnUqW9-lkp@intel.com/
> >>
> >> smatch warnings:
> >> include/media/videobuf2-core.h:1272 vb2_queue_add_buffer() warn: sleeping in atomic context
> >> drivers/media/common/videobuf2/videobuf2-core.c:2456 vb2_core_queue_init() warn: Please consider using kcalloc instead of kmalloc_array
> >>
> >> vim +1272 include/media/videobuf2-core.h
> >>
> >> 625d46c1c1fe8e Benjamin Gaignard 2023-03-21  1263  static inline bool vb2_queue_add_buffer(struct vb2_queue *q, struct vb2_buffer *vb)
> >> 625d46c1c1fe8e Benjamin Gaignard 2023-03-21  1264  {
> >> 487d3f14d12ecf Benjamin Gaignard 2023-03-21  1265      bool ret = false;
> >> 487d3f14d12ecf Benjamin Gaignard 2023-03-21  1266
> >> 487d3f14d12ecf Benjamin Gaignard 2023-03-21  1267      spin_lock(&q->bufs_lock);
> >>                                                          ^^^^^^^^^^^^^^^^^^^^^^^
> >> Holding a spin lock.
> >>
> >> 487d3f14d12ecf Benjamin Gaignard 2023-03-21  1268
> >> 487d3f14d12ecf Benjamin Gaignard 2023-03-21  1269      if (vb->index >= q->max_num_bufs) {
> >> 487d3f14d12ecf Benjamin Gaignard 2023-03-21  1270          struct vb2_buffer **tmp;
> >> 487d3f14d12ecf Benjamin Gaignard 2023-03-21  1271
> >> 487d3f14d12ecf Benjamin Gaignard 2023-03-21 @1272          tmp = krealloc_array(q->bufs, q->max_num_bufs * 2, sizeof(*q->bufs), GFP_KERNEL);
> >>                                                                                                                                       ^^^^^^^^^^
> >> Sleeping allocation.  GFP_ATOMIC?  Or is there a way to move the
> >> allocation outside the lock?
> > 
> > I will add GFP_ATOMIC flag in next version.
> 
> No need. Instead, don't use realloc here, just allocate a new array, copy over all
> the data from the old, and then switch q->bufs with the spinlock held. Then you
> can free the old one.
> 
> It's only when you update q->bufs that you need the lock.

The copy also needs to be protected by the lock.

> >> 487d3f14d12ecf Benjamin Gaignard 2023-03-21  1273          if (!tmp)
> >> 487d3f14d12ecf Benjamin Gaignard 2023-03-21  1274              goto realloc_failed;
> >> 487d3f14d12ecf Benjamin Gaignard 2023-03-21  1275
> >> 487d3f14d12ecf Benjamin Gaignard 2023-03-21  1276          q->max_num_bufs *= 2;
> >> 487d3f14d12ecf Benjamin Gaignard 2023-03-21  1277          q->bufs = tmp;
> >> 487d3f14d12ecf Benjamin Gaignard 2023-03-21  1278      }
> >> 487d3f14d12ecf Benjamin Gaignard 2023-03-21  1279
> >> 487d3f14d12ecf Benjamin Gaignard 2023-03-21  1280      if (vb->index < q->max_num_bufs) {
> >> 625d46c1c1fe8e Benjamin Gaignard 2023-03-21  1281          q->bufs[vb->index] = vb;
> >> 487d3f14d12ecf Benjamin Gaignard 2023-03-21  1282          ret = true;
> >> 625d46c1c1fe8e Benjamin Gaignard 2023-03-21  1283      }
> >> 625d46c1c1fe8e Benjamin Gaignard 2023-03-21  1284
> >> 487d3f14d12ecf Benjamin Gaignard 2023-03-21  1285  realloc_failed:
> >> 487d3f14d12ecf Benjamin Gaignard 2023-03-21  1286      spin_unlock(&q->bufs_lock);
> >> 487d3f14d12ecf Benjamin Gaignard 2023-03-21  1287
> >> 487d3f14d12ecf Benjamin Gaignard 2023-03-21  1288      return ret;
> >> 625d46c1c1fe8e Benjamin Gaignard 2023-03-21  1289  }

-- 
Regards,

Laurent Pinchart


Return-Path: <SRS0=2GrF=5Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DA89C2D0EA
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Apr 2020 06:05:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 449BD20757
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Apr 2020 06:05:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PZ/Mgz2D";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="u+ys5QFl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 449BD20757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aarft5fLugwDkiwrb0ZUho5RGHjfM+tTBCgkZBV9u3A=; b=PZ/Mgz2DTI+88L
	D0BtqqjAxHky0J3w3e8a31DmJ+AtA13hTf/FTNMF3vxt6GHPdjvSz6WMwn0H9AT2hpYADp5ItA3Jy
	3P1dtsyYwJIWdxRFA4eKm/G/vvrGwWBN8Wvp4Pz17C16E9SwShY6ipinAn1ujdvx5jsMPMsbdb1H1
	l8fa5KzU8l77hkroTwapOGZJ1ajUtMNxYCeuiWfDVOl/Rqtzof7UsNL0xuGvLtM/ttiz19rAJ6maI
	ehgt0AO1uGHjvzTClcXWQl+5lUnZMEkoL0E96tec2d1oGHwoc8tSCmimlIZrc+ohKIpLicltsIEu/
	F9TKtb015vWCXK0ECE9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMQJK-00070u-TM; Thu, 09 Apr 2020 06:05:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMQJH-00064n-55; Thu, 09 Apr 2020 06:05:09 +0000
X-UUID: 72407f7231164b65aa2ce659b98dc9f6-20200408
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=QjC6+5aZUfxTDsvCSyH7TSX3u8Y6oTeri4n9IkqY/8M=; 
 b=u+ys5QFl9aDfhLTVUVZZQaXLaZ/eF0tOTjcLD+T0ycDvr6GMR5UauIFp5BxYwAZ4jEbf+EmcfDt85GuzApcXMfkW91SXimaSyW/rWDeVpeP2LOrLVwCHPxKhzeqnSLmTqrhJEZI9InfvU+slJ94hf4bC7esTztfkzhwyh5hxJaM=;
X-UUID: 72407f7231164b65aa2ce659b98dc9f6-20200408
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 704950589; Wed, 08 Apr 2020 22:04:56 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Apr 2020 23:04:58 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 9 Apr 2020 14:04:50 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 9 Apr 2020 14:04:50 +0800
Message-ID: <1586412280.8804.38.camel@mhfsdcap03>
Subject: Re: [V6, 2/2] media: i2c: ov02a10: Add OV02A10 image sensor driver
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Thu, 9 Apr 2020 14:04:40 +0800
In-Reply-To: <20200408122037.GG5206@paasikivi.fi.intel.com>
References: <20191211112849.16705-1-dongchun.zhu@mediatek.com>
 <20191211112849.16705-3-dongchun.zhu@mediatek.com>
 <20191211143640.GU32742@smile.fi.intel.com>
 <faf3482d4127464195d04a17cae446b7@mtkmbs05n1.mediatek.inc>
 <1586346824.8804.12.camel@mhfsdcap03>
 <20200408122037.GG5206@paasikivi.fi.intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 513442C1DEC60A504510EEBD8595EB1CADD9A36F2B881A70E081811C03A06B7C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200408_230507_243969_6D83B152 
X-CRM114-Status: GOOD (  23.26  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 andriy.shevchenko@linux.intel.com, srv_heupstream@mediatek.com,
 shengnan.wang@mediatek.com, louis.kuo@mediatek.com, sj.huang@mediatek.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 bingbu.cao@intel.com, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Sakari,

On Wed, 2020-04-08 at 15:20 +0300, Sakari Ailus wrote:
> Hi Dongchun,
> 
> On Wed, Apr 08, 2020 at 07:53:44PM +0800, Dongchun Zhu wrote:
> > Hello Andy,
> > 
> > Thanks for the review. Sorry for the late reply.
> > 
> > On Mon, 2019-12-11 at 16:36 +0200, Andy Shevchenko wrote:
> > > On Wed, Dec 11, 2019 at 07:28:49PM +0800, Dongchun Zhu wrote:
> > > > Add a V4L2 sub-device driver for OV02A10 image sensor. The OV02A10 is
> > > > a 1/5" CMOS sensor from Omnivision, asupporting output format: 10-bit Raw.
> > > >
> > > > This chip has a single MIPI lane interface and use the I2C bus for
> > > > control and the CSI-2 bus for data.
> > > 
> > > ...
> > > 
> > > > +#define OV02A10_MASK_8_BITS                            0xff
> > > 
> > > Besides GENMASK() why do you need a definition here? What's the point?
> > > 
> > 
> > Fixed in next release.
> > 
> > > ...
> > > 
> > > > +static int ov02a10_entity_init_cfg(struct v4l2_subdev *sd,
> > > > +   struct v4l2_subdev_pad_config *cfg) {
> > > > +struct v4l2_subdev_format fmt = {
> > > > +.which = cfg ? V4L2_SUBDEV_FORMAT_TRY
> > > > +     : V4L2_SUBDEV_FORMAT_ACTIVE,
> > > > +.format = {
> > > > +.width = 1600,
> > > 
> > > > +.height = 1200
> > > 
> > > Leave comma here.
> > > 
> > 
> > Fixed in next release.
> > 
> > > > +}
> > > > +};
> > > > +
> > > > +ov02a10_set_fmt(sd, cfg, &fmt);
> > > > +
> > > > +return 0;
> > > > +}
> > > 
> > > ...
> > > 
> > > > +ret = i2c_smbus_write_byte_data(client, OV02A10_REG_GAIN,
> > > > +(val & OV02A10_MASK_8_BITS));
> > > 
> > > Too many parentheses.
> > > 
> > 
> > Fixed in next release.
> > 
> > > > +if (ret < 0)
> > > > +return ret;
> > > 
> > > ...
> > > 
> > > > +static int ov02a10_set_vblank(struct ov02a10 *ov02a10, int val) {
> > > > +struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> > > 
> > > if you do
> > > 
> > > int vts = val + ov02a10->cur_mode->height - OV02A10_BASIC_LINE;
> > > 
> > > you may increase readability below...
> > > 
> > 
> > Thanks for the suggestion.
> > It seems better now.
> > 
> > > > +int ret;
> > > > +
> > > > +ret = i2c_smbus_write_byte_data(client, REG_PAGE_SWITCH, REG_ENABLE);
> > > > +if (ret < 0)
> > > > +return ret;
> > > > +
> > > > +ret = i2c_smbus_write_byte_data(client, OV02A10_REG_VTS_H,
> > > > +(((val + ov02a10->cur_mode->height -
> > > > +OV02A10_BASIC_LINE) >>
> > > > +OV02A10_VTS_SHIFT) &
> > > > +OV02A10_MASK_8_BITS));
> > > 
> > > ret = i2c_smbus_write_byte_data(client, OV02A10_REG_VTS_H,
> > > (vts >> OV02A10_VTS_SHIFT) &
> > > OV02A10_MASK_8_BITS));
> > > 
> > > And actually why do you need this mask here? Isn't enough to call
> > > 
> > > ret = i2c_smbus_write_byte_data(client, OV02A10_REG_VTS_H,
> > > vts >> OV02A10_VTS_SHIFT);
> > > 
> > > here...
> > > 
> > > 
> > 
> > Yes. Now we code like this.
> > 
> > > > +if (ret < 0)
> > > > +return ret;
> > > > +
> > > > +ret = i2c_smbus_write_byte_data(client, OV02A10_REG_VTS_L,
> > > > +((val + ov02a10->cur_mode->height -
> > > > +OV02A10_BASIC_LINE) &
> > > > +OV02A10_MASK_8_BITS));
> > > 
> > > ...and
> > > 
> > > ret = i2c_smbus_write_byte_data(client, OV02A10_REG_VTS_L, vts);
> > > 
> > > here?
> > > 
> > 
> > Yes. Fixed in next release.
> > 
> > > > +if (ret < 0)
> > > > +return ret;
> > > > +
> > > > +return i2c_smbus_write_byte_data(client, REG_GLOBAL_EFFECTIVE,
> > > > + REG_ENABLE);
> > > > +}
> > > 
> > > ...
> > > 
> > > > +static int ov02a10_check_hwcfg(struct device *dev, struct ov02a10
> > > > +*ov02a10) {
> > > > +struct fwnode_handle *ep;
> > > > +struct fwnode_handle *fwnode = dev_fwnode(dev);
> > > > +struct v4l2_fwnode_endpoint bus_cfg = {
> > > 
> > > > +.bus_type = V4L2_MBUS_CSI2_DPHY
> > > 
> > > Leave comma here.
> > > 
> > 
> > Fixed in next release.
> > 
> > > > +};
> > > > +unsigned int i, j;
> > > > +int ret;
> > > 
> > > > +if (!fwnode)
> > > > +return -ENXIO;
> > > 
> > > A bit strange error code here.
> > > 
> > 
> > This should be reported as -EINVAL.
> > Fixed in next release.
> > 
> > > > +
> > > > +ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> > > > +if (!ep)
> > > > +return -ENXIO;
> > > > +
> > > > +ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> > > > +fwnode_handle_put(ep);
> > > > +if (ret)
> > > > +return ret;
> > > 
> > > > +if (!bus_cfg.nr_of_link_frequencies) {
> > > > +dev_err(dev, "no link frequencies defined");
> > > > +ret = -EINVAL;
> > > > +goto check_hwcfg_error;
> > > > +}
> > > 
> > > I still think it's redundant check, though it's up to maintainers.
> > > 
> > 
> > We still wanna keep this check.
> > Keep same as ov2659 and ov8856.
> > 
> > > > +
> > > > +for (i = 0; i < ARRAY_SIZE(link_freq_menu_items); i++) {
> > > > +for (j = 0; j < bus_cfg.nr_of_link_frequencies; j++) {
> > > > +if (link_freq_menu_items[i] ==
> > > > +bus_cfg.link_frequencies[j])
> > > > +break;
> > > > +}
> > > > +
> > > > +if (j == bus_cfg.nr_of_link_frequencies) {
> > > > +dev_err(dev, "no link frequency %lld supported",
> > > > +link_freq_menu_items[i]);
> > > > +ret = -EINVAL;
> > > > +goto check_hwcfg_error;
> > > > +}
> > > > +}
> > > > +
> > > > +check_hwcfg_error:
> > > > +v4l2_fwnode_endpoint_free(&bus_cfg);
> > > > +
> > > > +return ret;
> > > > +}
> > > 
> > > ...
> > > 
> > > > +static int ov02a10_probe(struct i2c_client *client) {
> > > 
> > > > +/* Optional indication of physical rotation of sensor */
> > > > +ret = fwnode_property_read_u32(dev_fwnode(dev), "rotation",
> > > > +&rotation);
> > > 
> > > > +if (!ret) {
> > > 
> > > Why not positive conditional?
> > > 
> > 
> > Okay. Fixed in next release.
> > 
> > > > +ov02a10->upside_down = rotation == 180;
> > > > +if (rotation == 180) {
> > > > +ov02a10->upside_down = true;
> > > > +ov02a10->fmt.code = MEDIA_BUS_FMT_SRGGB10_1X10;
> > > > +}
> > > > +} else {
> > > > +dev_warn(dev, "failed to get rotation\n");
> > > > +}
> > > > +
> > > > +/* Optional indication of mipi TX speed */
> > > > +ret = fwnode_property_read_u32(dev_fwnode(dev), "ovti,mipi-tx-speed",
> > > > +       &clock_lane_tx_speed);
> > > > +
> > > 
> > > > +if (!ret)
> > > 
> > > Ditto.
> > > 
> > 
> > As Sakari mentioned earlier, the property "ovti,mipi-tx-speed" is
> > optional that shouldn't warn it's missing when ret is 0.
> > So we would keep the condition like that, just removing else case.
> 
> I don't remember discussing this, but could be because it was quite some
> time ago.
> 
> It doesn't seem to be documented. What is it for?
> 

Sorry for not addressing this point on v6.
"ovti,mipi-tx-speed" is one private property in DT, which is abstracted
to handle different register settings for different Chrome projects.

More details please see the Google Issue:
https://partnerissuetracker.corp.google.com/issues/143749215

And it would be documented in next release.

> > > *********************MEDIATEK Confidential/Internal Use*********************
> 
> Is this intentional?
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

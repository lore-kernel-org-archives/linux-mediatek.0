Return-Path: <SRS0=h1kY=43=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 069E3C10F27
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2020 10:05:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAB20205F4
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2020 10:05:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RqJsTINZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAB20205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=11MTIS0fxsSmRlhzkdGT0jDWz6TeMHg16sHY19uqDrU=; b=RqJsTINZujCazA
	+/oMH8pEbf1EMizQ+fFEwnHPOpc1KuVV8yOsf7MfMX7czNZ/a7SF/2/MnIopL3X/6xgBfvLXG36Sl
	Ve+/obIpBkVf3E+d27A1GeNtwvdtDUhW59MVG4l/MQFxkAKsBxMEb6fMBE5fcYKYd8IK+GmkKv8Qe
	hMCyrDCD7pXxt/NIAYgWqhX+O4PaH+gYF/SloCMYoKzpwlQccFawFXD/GMy8U0iPMBrvz932Z3hi4
	YU24RKPF3+Y7AogGX/HEBvq5jRuZdVkX3l77+H8+zXmwTHXRh6gDSbEIifuvvNLkwm8F1LIffoaxI
	WQZrrj7YmLYOXkO/3Oag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBblf-0006Zm-52; Tue, 10 Mar 2020 10:05:43 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBblT-0006Pm-QJ; Tue, 10 Mar 2020 10:05:33 +0000
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Mar 2020 03:05:29 -0700
X-IronPort-AV: E=Sophos;i="5.70,536,1574150400"; d="scan'208";a="242269786"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Mar 2020 03:05:25 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
 id 6BF08209DF; Tue, 10 Mar 2020 12:05:23 +0200 (EET)
Date: Tue, 10 Mar 2020 12:05:23 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
Subject: Re: [V3, 2/2] media: i2c: Add DW9768 VCM driver
Message-ID: <20200310100523.GC5379@paasikivi.fi.intel.com>
References: <20200228155958.20657-1-dongchun.zhu@mediatek.com>
 <20200228155958.20657-3-dongchun.zhu@mediatek.com>
 <1583834419.5781.33.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1583834419.5781.33.camel@mhfsdcap03>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_030531_907056_CD2ACE83 
X-CRM114-Status: GOOD (  15.91  )
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
Cc: mark.rutland@arm.com, drinkcat@chromium.org,
 andriy.shevchenko@linux.intel.com, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, shengnan.wang@mediatek.com, tfiga@chromium.org,
 louis.kuo@mediatek.com, sj.huang@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 bingbu.cao@intel.com, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Dongchun,

On Tue, Mar 10, 2020 at 06:00:19PM +0800, Dongchun Zhu wrote:
> Hi Sakari, Rob, Andy, Tomasz,
> 
> On Fri, 2020-02-28 at 23:59 +0800, Dongchun Zhu wrote:
...
> > +static int dw9768_init(struct dw9768 *dw9768)
> > +{
> > +	struct i2c_client *client = v4l2_get_subdevdata(&dw9768->sd);
> > +	int ret, val;
> > +
> > +	/* Reset DW9768_RING_PD_CONTROL_REG to default status 0x00 */
> > +	ret = i2c_smbus_write_byte_data(client, DW9768_RING_PD_CONTROL_REG,
> > +					DW9768_PD_MODE_OFF);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	/*
> > +	 * DW9769 requires waiting delay time of t_OPR
> > +	 * after PD reset takes place.
> > +	 */
> > +	usleep_range(DW9768_T_OPR_US, DW9768_T_OPR_US + 100);
> > +
> > +	ret = dw9768_write_array(dw9768, dw9768_init_regs,
> > +				 ARRAY_SIZE(dw9768_init_regs));
> > +	if (ret)
> > +		return ret;
> > +
> > +	for (val = dw9768->focus->val % DW9768_MOVE_STEPS;
> > +	     val <= dw9768->focus->val;
> > +	     val += DW9768_MOVE_STEPS) {
> > +		ret = dw9768_set_dac(dw9768, val);
> > +		if (ret) {
> > +			dev_err(&client->dev, "%s I2C failure: %d",
> > +				__func__, ret);
> > +			return ret;
> > +		}
> > +		usleep_range(DW9768_MOVE_DELAY_US,
> > +			     DW9768_MOVE_DELAY_US + 1000);
> > +	}
> > +
> 
> What do you think about the approach taken by this patch?
> From the view of VCM hardware, the collision sound of lens should only
> happen when moving position back to zero.
> When opening camera, one should be able to move lens to the position
> directly.
> I tried to replace this code to a single dw9768_set_dac(dw9768,
> dw9768->focus->val),
> there is no collision sound when open camera and it could reduce several
> hundred ms when open lens driver fd.
> Are we okay with this?

I think so. Usually on VCMs with ringing compensation the only problematic
case is when the power is cut. :-)

-- 
Sakari Ailus

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

Return-Path: <SRS0=7QZl=7W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9994C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2020 03:48:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B80BC20775
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2020 03:48:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TNDHTugQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="OMW37jJJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B80BC20775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wPff6xvaPKv6csW38JKnap3QnMD4gmrET65ZKWddRGg=; b=TNDHTugQlyRrA5
	pQz4Lpp1SfSnga9HsXtiW2Io3PJX1yYT8+/Fhdqqd7kZ7vqoLzdP3JL7yEspTSD5G2Hky9vU/LS+F
	o9RFvkXmIFWJn3t0HvNf8dXDU6bEZTFM0zHHJr3npwcNDm6TUw+SaOxQOowyZGjUWZ4hSwKHxUXa7
	vIT/TZ0K3rHcUXQ78gfk72d0BZJ7Hy/L0ZiSbACLm4/xzo8k/YsdidrF7lMsAarhf5lVDJt+liKkH
	VlfG8pVrRWR59bbQgZ7Tuvh3peLVjQurswXfa4SuBnb8mQDIE4YAyi6zNaummx8c6wPzYmpKkeJn+
	lrNLJ765t9cac+88qp2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiVFG-0007r3-KR; Tue, 09 Jun 2020 03:48:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiVFD-0007qP-6F; Tue, 09 Jun 2020 03:48:13 +0000
X-UUID: 11186d23897f4382addd68684bb287fa-20200608
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=40bvsHbdvRwM9Lgi+QQEZZMxTMobgTcPYCKNo+R6gBM=; 
 b=OMW37jJJKadCQAdW+GKVWwY3XoA5m1aWfD9XDMSCmM0zMGrWkvWXD6BJn/G2NT/cKnCGLP+U7DMBHoYC86Gx0iSkMs06roOgoApOOrfIDXvoS41DxA5kMlUVuMgZ0ip6xnwnw+LyuaToGyFWMby8CWkSUZlJnR2Pvf0Sogcq+PU=;
X-UUID: 11186d23897f4382addd68684bb287fa-20200608
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1597433306; Mon, 08 Jun 2020 19:48:04 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Jun 2020 20:48:01 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 9 Jun 2020 11:47:54 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 9 Jun 2020 11:47:52 +0800
Message-ID: <1591674341.8804.628.camel@mhfsdcap03>
Subject: Re: [V7, 2/2] media: i2c: dw9768: Add DW9768 VCM driver
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Tue, 9 Jun 2020 11:45:41 +0800
In-Reply-To: <20200608132720.GS2428291@smile.fi.intel.com>
References: <20200605105412.18813-1-dongchun.zhu@mediatek.com>
 <20200605105412.18813-3-dongchun.zhu@mediatek.com>
 <20200605124643.GG2428291@smile.fi.intel.com>
 <1591424358.8804.599.camel@mhfsdcap03>
 <20200608132720.GS2428291@smile.fi.intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 831D5E9863D577205AEB68EF6132BEFD4D39F2DA95B875E27B49D7640377CC602000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200608_204811_236930_0AC675F7 
X-CRM114-Status: GOOD (  25.81  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, drinkcat@chromium.org,
 louis.kuo@mediatek.com, srv_heupstream@mediatek.com, linus.walleij@linaro.org,
 shengnan.wang@mediatek.com, tfiga@chromium.org, bgolaszewski@baylibre.com,
 sj.huang@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 sakari.ailus@linux.intel.com, matthias.bgg@gmail.com, bingbu.cao@intel.com,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Andy,

On Mon, 2020-06-08 at 16:27 +0300, Andy Shevchenko wrote:
> On Sat, Jun 06, 2020 at 02:19:18PM +0800, Dongchun Zhu wrote:
> > On Fri, 2020-06-05 at 15:46 +0300, Andy Shevchenko wrote:
> > > On Fri, Jun 05, 2020 at 06:54:12PM +0800, Dongchun Zhu wrote:
> 
> ...
> 
> > > > +	depends on I2C && VIDEO_V4L2
> > > 
> > > No compile test?
> > > 
> > 
> > Sorry?
> > Kconfig here is based on the current media tree master branch.
> > It is also what the other similar drivers from Dongwoon do. 
> 
> COMPILE_TEST.
> I dunno if it's established or not practice in media subsystem.
> 
> ...
> 
> > > > +/*
> > > > + * DW9768 requires waiting time (delay time) of t_OPR after power-up,
> > > > + * or in the case of PD reset taking place.
> > > > + */
> > > > +#define DW9768_T_OPR_US				1000
> > > > +#define DW9768_Tvib_MS_BASE10			(64 - 1)
> > > > +#define DW9768_AAC_MODE_DEFAULT			2
> > > 
> > > > +#define DW9768_AAC_TIME_DEFAULT			0x20
> > > 
> > > Hex? Why not decimal?
> > > 
> > 
> > There is one optional property 'dongwoon,aac-timing' defined in DT.
> > I don't know whether you have noticed that.
> > 
> > 'DW9768_AAC_TIME_DEFAULT' is the value set to AACT[5:0] register.
> > I thought the Hex unit should be proper as it is directly written to the
> > Hex register.
> 
> I see. I would rather put it like (BIT(6) / 2) to show explicitly that we
> choose half of the resolution.
> 

I knew your idea.
'(BIT(6) / 2)' may somewhat show the meaning of 'median of the total
range of AACT[5:0]'.

But this value is still very obscure relative to '0x20'.
As I thought that simple is the best, especially for kernel upstream
patch.

> ...
> 
> > > > +	val = ((unsigned char)ret & ~mask) | (val & mask);
> > > 
> > > This cast is weird.
> > > 
> > 
> > Thanks for the review, but this cast is using classical pattern from
> > your suggestion on OV02A10 v5:
> > https://patchwork.linuxtv.org/patch/59788/
> > 
> > So I wonder whether it is still required to be refined currently.
> > Or what would it be supposed to do for the cast?
> 
> Okay, does it produce a warning w/o cast?
> If yes, replace it at least to be the same type as mask and val.
> 

No.

> ...
> 
> > > > +	for ( ; val >= 0; val -= DW9768_MOVE_STEPS) {
> > > > +		ret = dw9768_set_dac(dw9768, val);
> > > > +		if (ret) {
> > > > +			dev_err(&client->dev, "I2C write fail: %d", ret);
> > > > +			return ret;
> > > > +		}
> > > > +		usleep_range(move_delay_us, move_delay_us + 1000);
> > > > +	}
> > > 
> > > 
> > > It will look more naturally in the multiplier kind of value.
> > > 
> > > 	unsigned int steps = DIV_ROUND_UP(...);
> > > 
> > > 	while (steps--) {
> > > 		...(..., steps * ..._MOVE_STEPS);
> > > 		...
> > > 	}
> > > 
> > > but double check arithmetics.
> > 
> > The current coding style is actually updated with reference to your
> > previous comments on DW9768 v3:
> > https://patchwork.linuxtv.org/patch/61856/
> 
> I understand, but can you consider to go further and see if the proposal works?
> 

In fact, your suggestion is something like one another method to set DAC
value to actuator.
It is like there may be several solutions to a question.

Yes. I just tried the new method and it works as expected.
u32 steps = DIV_ROUND_UP(dw9768->focus->val, DW9768_MOVE_STEPS);
while (steps--) {
	ret = dw9768_set_dac(dw9768, steps * DW9768_MOVE_STEPS);
	if (ret)
		return ret;
	usleep_range(move_delay_us, move_delay_us + 1000);
}

But from my perspective, I may prefer to the original method.
As here what we really care is the DAC value,
'dw9768_set_dac(dw9768, val)' seems more simple.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

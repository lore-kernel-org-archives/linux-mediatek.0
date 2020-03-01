Return-Path: <SRS0=FI3N=4S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 785CBC3F2C6
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Mar 2020 03:21:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4918F2192A
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Mar 2020 03:21:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SjPvXcyg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="DBbEYTNV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4918F2192A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dn4Yy7V5ImvkSRY/mTpiAgtWWfTLVlP1g/8Br7nOvUw=; b=SjPvXcygJEI+QV
	Xulhdajr6tEX7+cBZ9pygvwMB4UPOuPTjFuuoqmmGpGswThMutMQ1PN2bH6soZWjyQ7N/+NhCAbT7
	mrQP+9ROliKzeKCWduK7uZX1rGWeEIfCqMj0WJjUcDzmtbBUoFeLaxBUSzE0JQPUtNGE+zEj29/39
	0UJLy6YjegpKT1FGfpRzGajgx7oj0/RMUyL0EE1e+jMUnMQ3iWpou7eCIPBRLIPArK1gyQ23Fjb77
	bYq1LT710Ia5BfTuMQVjwCKKcQMCgtw9e+o7UdlE1nwvSmYSi1Wb2ifLv9htlUW/zq4dRxXdHzp8K
	K3qaGetAnRtOYE5Kn9IA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8FA8-0000FA-T8; Sun, 01 Mar 2020 03:21:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8F9z-00008s-TO; Sun, 01 Mar 2020 03:20:57 +0000
X-UUID: 967e38062d0746219db2a340770e7c90-20200229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=gEuqpc3FvuW2EqLSsfehY0NEfaRH3CHq60ZO1Tz8Ll0=; 
 b=DBbEYTNVuWKolwpjxOOvsL41xfWXB2vWKUedwE1eblZ217SXPMXhDo3Brx5D26nyB4KWZyA4ZLXCuAFixNPCjJije47I28I1oGimaVegueC3TtzJ/hj/wCvo2qwgw821Lz2cY/qNZAi2mDLJnN+pn1p5OdnZ6r1SLc+OgJQ760c=;
X-UUID: 967e38062d0746219db2a340770e7c90-20200229
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 57743514; Sat, 29 Feb 2020 19:20:47 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 29 Feb 2020 19:21:57 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 1 Mar 2020 11:22:18 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sun, 1 Mar 2020 11:20:18 +0800
Message-ID: <1583032843.12083.24.camel@mtkswgap22>
Subject: Re: [PATCH v4] usb: gadget: f_fs: try to fix AIO issue under ARM 64
 bit TAGGED mode
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Date: Sun, 1 Mar 2020 11:20:43 +0800
In-Reply-To: <20200228164848.GH4019108@arrakis.emea.arm.com>
References: <1582627315-21123-1-git-send-email-macpaul.lin@mediatek.com>
 <1582718512-28923-1-git-send-email-macpaul.lin@mediatek.com>
 <20200228164848.GH4019108@arrakis.emea.arm.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200229_192055_975139_CB16F37E 
X-CRM114-Status: GOOD (  15.68  )
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
Cc: Sasha Levin <sashal@kernel.org>, Shen Jing <jingx.shen@intel.com>, CC
 Hwang <cc.hwang@mediatek.com>, Mediatek
 WSD Upstream <wsd_upstream@mediatek.com>, Jerry Zhang <zhangjerry@google.com>,
 andreyknvl@google.com, linux-usb@vger.kernel.org,
 Loda Chou <loda.chou@mediatek.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Andrzej
 Pietrasiewicz <andrzej.p@collabora.com>, Miles Chen <miles.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, Peter Chen <peter.chen@nxp.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Vincent
 Pelletier <plr.vincent@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 John Stultz <john.stultz@linaro.org>, eugenis@google.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-02-28 at 16:48 +0000, Catalin Marinas wrote:
> On Wed, Feb 26, 2020 at 08:01:52PM +0800, Macpaul Lin wrote:
> > diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> > index ce1d023..192935f 100644
> > --- a/drivers/usb/gadget/function/f_fs.c
> > +++ b/drivers/usb/gadget/function/f_fs.c
> > @@ -715,7 +715,20 @@ static void ffs_epfile_io_complete(struct usb_ep *_ep, struct usb_request *req)
> >  
> >  static ssize_t ffs_copy_to_iter(void *data, int data_len, struct iov_iter *iter)
> >  {
> > -	ssize_t ret = copy_to_iter(data, data_len, iter);
> > +	ssize_t ret;
> > +
> > +#if defined(CONFIG_ARM64)
> > +	/*
> > +	 * Replace tagged address passed by user space application before
> > +	 * copying.
> > +	 */
> > +	if (IS_ENABLED(CONFIG_ARM64_TAGGED_ADDR_ABI) &&
> > +		(iter->type == ITER_IOVEC)) {
> > +		*(unsigned long *)&iter->iov->iov_base =
> > +			(unsigned long)untagged_addr(iter->iov->iov_base);
> > +	}
> > +#endif
> > +	ret = copy_to_iter(data, data_len, iter);
> >  	if (likely(ret == data_len))
> >  		return ret;
> 
> I had forgotten that we discussed a similar case already a few months
> ago (thanks to Evgenii for pointing out). Do you have this commit
> applied to your tree: df325e05a682 ("arm64: Validate tagged addresses in
> access_ok() called from kernel threads")?
> 

Yes! We have that patch. I've also got Google's reply about referencing
this patch in android kernel tree.
https://android-review.googlesource.com/c/kernel/common/+/1186615

However, during my debugging process, I've dumped specific length (e.g.,
24 bytes for the first request) AIO request buffer address both in adbd
and in __range_ok(). Then I've found __range_ok() still always return
false on address begin with "0x3c". Since untagged_addr() already called
in __range_ok(), to set "TIF_TAGGED_ADDR" with adbd's user space buffer
should be the possible solution. Hence I've send the v3 patch.

Anyway, I've found that to disable TAGGED address in adbd is possible by
this way and will report to Google and see how they think.

diff --git a/adb/daemon/main.cpp b/adb/daemon/main.cpp
index 9e02e89ab..b2f6f8e3f 100644
--- a/adb/daemon/main.cpp
+++ b/adb/daemon/main.cpp
@@ -317,6 +317,8 @@ int main(int argc, char** argv) {
     mallopt(M_DECAY_TIME, 1);
 #endif

+    prctl(PR_SET_TAGGED_ADDR_CTRL, ~PR_TAGGED_ADDR_ENABLE, 0, 0, 0);
+
     while (true) {
         static struct option opts[] = {
                 {"root_seclabel", required_argument, nullptr, 's'},

Many thanks!
Macpaul Lin
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

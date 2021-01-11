Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E843C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 12:11:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B71422054F
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 12:11:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B71422054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Sev2qsh6IMX5Sb+O+1eL37R55GbCDL1irlD7lwOkFfA=; b=qEXuAO0x3WCJzlxsdyXWs2OaQ
	MaekFSCzcTE/Fa31NcfeX3h9SiKfHsY9uJ+89DreFUAzSlHjXmGOv1/EX1xanokKwOrEklNbWaTjL
	8HE7DNRTutJayHACW6KB2ScM95gC6DM3CVsiTeHr60u4gSslJOcB4rxb/6U9SBKihxsdFi38heE+4
	z4sr2Ejo7otXQRT8jFpKQLvVy/7Bnwj4e+49sLsY10WBKGxGOadF6W1Cq4UR+mpVKo8MJfpLdfVj7
	RAWCjhoxbUHtpwaRwfNEFNViUaOvVd33mjEllPA08UOBPQzEa7+3M9aZUPpOxAQZWVBfcKJezoDfP
	6DZJyY7vg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyw2M-00086c-QC; Mon, 11 Jan 2021 12:11:06 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyw2K-00085t-Nm
 for linux-mediatek@lists.infradead.org; Mon, 11 Jan 2021 12:11:05 +0000
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94) (envelope-from <johannes@sipsolutions.net>)
 id 1kyw1Y-004pA1-6H; Mon, 11 Jan 2021 13:10:55 +0100
Message-ID: <036e334c2a0a2ebaf940d3f7ae03ab0d9f7c45fb.camel@sipsolutions.net>
Subject: Re: [PATCH] mac80211: fix incorrect strlen of .write in debugfs
From: Johannes Berg <johannes@sipsolutions.net>
To: Shayne Chen <shayne.chen@mediatek.com>
Date: Mon, 11 Jan 2021 13:10:39 +0100
In-Reply-To: <1610345954.4985.7.camel@mtksdccf07>
References: <20210108105643.10834-1-shayne.chen@mediatek.com>
 <0efec65815ff9e26b3da69cb35d503a90086760c.camel@sipsolutions.net>
 <1610345954.4985.7.camel@mtksdccf07>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_071104_806510_1F0C1ABA 
X-CRM114-Status: GOOD (  11.04  )
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
Cc: Toke =?ISO-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@toke.dk>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Sujuan Chen <sujuan.chen@mediatek.com>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2021-01-11 at 14:19 +0800, Shayne Chen wrote:
> 
> Regarding the case "10\n\0\0\0\0", both count and strlen() fail to get
> the correct strlen.

Yeah.

I don't think we need to worry about this case.

> # echo "10\n\0\0\0\0" > /sys/kernel/debug/ieee80211/phy0/airtime_flags
> airtime_flags_write: count = 13, strlen = 15 
> > > +	buf[count] = '\0';
> > 
> > But if count == sizeof(buf) then this is an out-of-bounds write.
> > 
> > Same for all the other copied instances.
> > 
> > johannes
> > 
> 
> Should we consider this kind of case here?

Sure, we're at the kernel/userspace trust boundary, we can't just read
out-of-bounds? Or what do you mean?

johannes



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

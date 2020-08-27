Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14821C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 07:00:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBAB42177B
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 07:00:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Og2wHFH9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBAB42177B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IULha6WTnn9RTZOsyyFjEa9yNpijTosrZ0dSgKfvZ/g=; b=Og2wHFH9GFoiClHlDGeimUtZD
	VV8DoojiewooKgaa8G6krdNOUF1UqJkL+v9VMOsbGA6kCB5Zb2wlLGHCkzq/Tn4KOaYOlPOVDSq9d
	3X1Jad91kOqCR7hl+9VrOwOjwwzR1K67vfRMeFtI1icHAKPccfKRZ7aKdUQ6HbcRpiBVsAlrgBogg
	rUrkX5InJDAfI+/1lMxr2pcpfa+cEZaIZsH02Bsy67vnbocJKm+n3gXRe3nDNr++++aMLKVNMkYwj
	c2cobg3/5ziLA08dSrGEZP46mHPoB7toHyN51xGYtQ7NdKYyoCxXaGDd6bt+PWpqKf9pejbwnqaUy
	URjPLHV8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBBtU-0003FX-Pt; Thu, 27 Aug 2020 07:00:20 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBBtR-0003Et-7O; Thu, 27 Aug 2020 07:00:18 +0000
IronPort-SDR: oVdjshR41NBn5ADsIKqCmez9hIw5oRcS3LEtz/7bAZizKzlutY5qJKd9Jo1IoGXz40fyslgzjG
 q+QiPinWEDDQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="174483572"
X-IronPort-AV: E=Sophos;i="5.76,358,1592895600"; d="scan'208";a="174483572"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2020 00:00:14 -0700
IronPort-SDR: kHpcijfD+yR6Tg4r54FzTAXLEmhy/8XXi04TrI7nV+lh6WcRY0fGbWlBxbxpNCtindSrIiQxt7
 RYSzKcJj0aYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,358,1592895600"; d="scan'208";a="403315220"
Received: from kuha.fi.intel.com ([10.237.72.162])
 by fmsmga001.fm.intel.com with SMTP; 27 Aug 2020 00:00:10 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Thu, 27 Aug 2020 10:00:10 +0300
Date: Thu, 27 Aug 2020 10:00:10 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: cy_huang <u0084500@gmail.com>
Subject: Re: [PATCH v2 1/2] usb typec: mt6360: Add support for mt6360 Type-C
 driver
Message-ID: <20200827070010.GD813478@kuha.fi.intel.com>
References: <1598503859-29620-1-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1598503859-29620-1-git-send-email-u0084500@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_030017_435386_A85DEE77 
X-CRM114-Status: GOOD (  14.27  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 matthias.bgg@gmail.com, linux@roeck-us.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Aug 27, 2020 at 12:50:58PM +0800, cy_huang wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Mediatek MT6360 is a multi-functional IC that includes USB Type-C.
> It works with Type-C Port Controller Manager to provide USB PD
> and USB Type-C functionalities.
> 
> Add fix to Prevent the race condition from interrupt and tcpci port unregister
> during module remove.

You merged two patches from v2 together, so that really makes this
v3. Where is the changelog?

thanks,

-- 
heikki

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

Return-Path: <SRS0=PUi9=JC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ACC7C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Apr 2021 07:04:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BACDC61398
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Apr 2021 07:04:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BACDC61398
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HpPsSMgmkVQ/+EfhZYvU4Jp2xTu0MxT4mYB1yQWLmGw=; b=Xv1CBF1UwY0OQ2JmLOtZ+qtKc
	f6KjExo+1n4f1uTV0uNPdhsJ7ZeCUVqEiFKStZEqamQZzb2i0oBUe+L6LRZ1v8edv7LQq3IWmlWpD
	nA1Z9qK/XKi9rvcrP5sIhN1VV+5K217nVndnrvjLZ5h8rRHA2yRzH0XhX48GTQDry8w4yBMjFwxh9
	8og75R62avJDXd2frHO7HuCEPfdUoQ482SkJ9w4W1+ZOTbcsfnyCGGDAx0OLWMi3HTTQTzI6tlHh/
	g3X1sZq2045FhkBcPunA9ykUPWqceMDjrFoTywgVZhXXMpAwOmrpXHYD7yOEmaACmt5kPqrb/2rDc
	+IN/Jl1kg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTJHV-00GrIy-9I; Mon, 05 Apr 2021 07:04:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTJHK-00GrH8-63; Mon, 05 Apr 2021 07:04:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D7A4561398;
 Mon,  5 Apr 2021 07:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1617606244;
 bh=ezlnbhg/LsgwTLJp3Hxyw3QKTpzBOGY8S1cj+nKb3gc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ygYsoHbwuRygjVW1EKRcogwgUih7oFsLilNnNuJEb5yA8vxhPU+JPMCK5BUm7pu6/
 zFrOCGKpaRTyLqoih2xB0SnF1mxdnJkBJRJFSnfC9lWuDJwO3WMDNXZ0aJ72W/je3Y
 UeEiEJ2WMRL2lRoqLd09xkulR791BJEtQ4m1cuoo=
Date: Mon, 5 Apr 2021 09:04:01 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Ikjoon Jang <ikjn@chromium.org>, Yaqii Wu <Yaqii.Wu@mediatek.com>,
 linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] usb: xhci-mtk: remove unnecessary assignments in
 periodic TT scheduler
Message-ID: <YGq2YfURFApdJLxb@kroah.com>
References: <20210330080617.3746932-1-ikjn@chromium.org>
 <20210330160508.1.I797d214790033d0402d19ff6b47a34aff60d3062@changeid>
 <1617179455.2752.1.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1617179455.2752.1.camel@mhfsdcap03>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210405_080406_463368_DD8C0117 
X-CRM114-Status: UNSURE (   5.86  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Mar 31, 2021 at 04:30:55PM +0800, Chunfeng Yun wrote:
> cc Yaqii Wu <Yaqii.Wu@mediatek.com>
> 
> I'll test it , thanks

Did you test this series and find any problems?  If not, I'll go queue
these up...

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DAF9C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 13:30:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA6DA61440
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 13:30:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA6DA61440
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:Cc:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RrAmwzgWLNpeQlhF2isvs8lGEM9s4bm2oTcWsRePCSc=; b=XvPgnmZT3Hdr5EoL+H7Tg+2PY
	epjOoGd/ax+snCxn+oc3GMv3hayKuRQWov8rBTzQOBIYzu32FTe45lMCB9vZGiMu9Rj2a15IEBAkB
	+fZCmNlqyERZowbr17oeUlRzPBHs2OER4XtehqBsLT6ZZaJIpAeSmpvICItqWTLjnALNa1EP1HLw+
	kKErRTcyu5n0Sh92vwx9BVvagfRlZqvUopG+7lCDVy57dfSKwac8P90/M09pn9Cl5tlmanxCDVjH+
	S4GswYOxkd/VldDV2kp1l6Vw1AkeQb4JM2M87t8WadkBYWXQc0jMGQy0aI7B/3d/zDuPdHOctqYlN
	oQPjPvcBg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZCvU-00ESrk-KK; Wed, 21 Apr 2021 13:29:56 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZCvP-00ESqt-1q
 for linux-mediatek@desiato.infradead.org; Wed, 21 Apr 2021 13:29:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=/LvuT/Uc7kKFafMMOlLIcOCn1d3YLRZ/r4C9ys8jHDY=; b=dnJ9ikk7IcIHOTreQcjSFKe8Lc
 uNXx6JReKZni5D4CDm9f3xnBzh8hxrS6ONtyTAqvXAAatamJ7HNORaLBcp8vu5qaKGegc7VQQr7Re
 cNNvH1sxQkhxeVQbhqxtAM6hQwQnf7VHJne8N8yGlW6DKEMgWhgluwq/UCG1OCGUX8WeE/gXKtBVn
 WKghsY0m5851YFtcuElAbOCmyW1ZwewX5fasEzF9ofrtszbNi3MI+Q7VAkh0sGXmbQH4tA0az2oMN
 D9l+b71E4voLj9DdzKO6frRBcoUq+QUqtunlT0UQpJ7tKbcKD3JfRHIQoeN5xF3M49pPLtFY2l9JD
 wm+BGpdA==;
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZCvM-00Cv0u-1q
 for linux-mediatek@lists.infradead.org; Wed, 21 Apr 2021 13:29:49 +0000
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94) (envelope-from <johannes@sipsolutions.net>)
 id 1lZCv7-00Ekoe-FR; Wed, 21 Apr 2021 15:29:33 +0200
Message-ID: <87ecf5b648ea6d42994abbef8d9cde7e15a0a837.camel@sipsolutions.net>
Subject: Re: [PATCH 2/3] mt76: mt7915: fix a precision vs width bug in printk
From: Johannes Berg <johannes@sipsolutions.net>
To: Dan Carpenter <dan.carpenter@oracle.com>, Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Ryder Lee
 <ryder.lee@mediatek.com>, Kalle Valo <kvalo@codeaurora.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Shayne Chen <shayne.chen@mediatek.com>, 
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 kernel-janitors@vger.kernel.org
Date: Wed, 21 Apr 2021 15:29:31 +0200
In-Reply-To: <YIAlYknkd0SoD6SY@mwanda> (sfid-20210421_152704_097013_473EB75F)
References: <YIAlYknkd0SoD6SY@mwanda> (sfid-20210421_152704_097013_473EB75F)
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_062948_117000_D51C2F2F 
X-CRM114-Status: UNSURE (   5.92  )
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

On Wed, 2021-04-21 at 16:15 +0300, Dan Carpenter wrote:
> Precision %.*s was intended instead of width %.*s.
> 

typo there, the second instance should say "width %*s" :-)

johannes


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

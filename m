Return-Path: <SRS0=p+jW=B4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80558C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 07:37:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 357262076E
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 07:37:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B8ZuVyIT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lJ9q1usP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 357262076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:From:To:Subject:MIME-Version:References:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=43sjacKxj6UnPuDDdoDtP9K5iDcXLvRFntuyMR/PGeM=; b=B8ZuVyITijNOXiWT/WbLtDvzI
	AEQfZPkDGfmipVeD8qamoWanf02GnewlREoitgp2806acqhK8Gqp0t5GvSTZPYSbYRlWEoN7NsRJP
	vA6JX9IK9O8VrVKhIOb+LtCOltKarX/7D8DFGlhfte0QFVrt/84WXFUCYtCE2X5XJ6j0iaX3bFw3Y
	rhQ1CKjghg4RXX2XzE6ZhYcVZbwp0hoTtLUnyaVe5JAtlSE0ISKsKWcRAvQUSy0Oog05A6jOFG4OX
	ZRzCYfL0fi81m62MCTIgOKYEA0xyjGbYiFPPyP1U3nBfMph7fnygjqiRLr6hh6NaY1rkAhu4w9t/0
	Axuejb00g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7wB2-0006Mw-UO; Tue, 18 Aug 2020 07:37:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7wB1-0006Md-Mk
 for linux-mediatek@merlin.infradead.org; Tue, 18 Aug 2020 07:36:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-ID:From:CC:To:Subject:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
 Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=Tuui4JKywOGQP//vjZ5uTcHQ/MsFtjm89enFy1ffrY8=; b=lJ9q1usPa0OPMfcT+WTeY3aNOC
 FwNmgE+/6QiX3F85eiFyl8rzB1t9wKlbdvR8NpJbxTpr9F4q8Szv1jB/+UmsJ0zvN4dET/AzXfaZZ
 +Rn/TPzAB3Qz/RcQPxRhBZftG8u1q3SQI6LRT+BSCZYfrIo1/1e9Ng2gioZxmADmknanZKuxTuMNA
 +3zRLTgZPk4jKbT2mj9cnkt2hWPsZly3IvNFjKy3hP0cpnRW8u1gKZqVYOOxhkVs93KdcYYcW8KHE
 NoL6UfkKbdLIqiXo8/Oj37NJl7QcvGrCalv78ps0ZUnjdgEhdPgOVBNrNlNL9bj4C8Pg8jAKTJyfM
 i7b3TZJQ==;
Received: from [51.219.137.136] (helo=[10.0.1.19])
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7wAy-0007EV-HN; Tue, 18 Aug 2020 07:36:57 +0000
Date: Tue, 18 Aug 2020 08:36:55 +0100
User-Agent: K-9 Mail for Android
In-Reply-To: <trinity-bbc9a618-a916-40bb-b144-bffe715646a4-1597734987449@3c-app-gmx-bap75>
References: <20200807082754.6790-1-linux@fw-web.de>
 <20200807082754.6790-2-linux@fw-web.de>
 <trinity-f5a5deb1-c123-44d7-b7ca-1f7a8dbe1c1c-1596889651064@3c-app-gmx-bap69>
 <CAAOTY_9o_hBWxWBdDoeeJ6zuV4rb4R_yEoN5+L0uHBGMw4Kduw@mail.gmail.com>
 <cefc273c226c93c605f4dc76afa9eb5aacceaf26.camel@infradead.org>
 <trinity-bbc9a618-a916-40bb-b144-bffe715646a4-1597734987449@3c-app-gmx-bap75>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] arm: dts: mt7623: move more display-related nodes to
 mt7623n.dtsi
To: linux-mediatek@lists.infradead.org,
 Frank Wunderlich <frank-w@public-files.de>,
 chunkuang Hu <chunkuang.hu@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
From: David Woodhouse <dwmw2@infradead.org>
Message-ID: <5EB39D93-57C0-47AD-B0F3-09AEE643CFBF@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: devicetree@vger.kernel.org, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 18 August 2020 08:16:27 BST, Frank Wunderlich <frank-w@public-files.de> wrote:
>Hi,
>
>i rebased changes to 5.9-rc1 [1] and include parts from Davids Series
>in my one.
>
>David: is it ok to squash your mali-commit with mine moving the other
>display-related nodes and use me as author?
 
Absolutely. Can the U7623 patch go along for the ride too? Was there anything else you weren't including?

-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

Return-Path: <SRS0=yJvo=FI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11188C4361A
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 10:42:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51D972251E
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 10:42:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51D972251E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mclink.it
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rKLRAW+PZJpQ12Tvjvv/SmU1H33vK6TzseAo5LVFZow=; b=IfqhQufsxu9Yr9+hv/L7bSPfBi
	bET2WRb5tTLSUZZJqVMacbt5mRoLBZ1WsvRYiHzavjQ4XmbFaBfFzzeKd0GhK8qPMdOs5EaoRmpfo
	nUsj/hXbls0bkJcg+EaIMUCjq+GgXx2DjGYHlC/akjXzWG3brxxs3JIcBCVBxX+wcjePGc4EebQzx
	p4QFu5gXabS/42aMOdldh9NCWNzDbEgd+g5687xPyg63p2uLjfdbOUV9MPyv0S2LD5bhHwNxBoFxZ
	2fvTGOBJvCuE7f+QGg/qaVZgK1bmPn8ubKNFNAZk7pqakX239ZJwQd7FG+OfeTc+KIZi2GsyngPAD
	j/pzCcXA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kl8Xr-00088W-CN; Fri, 04 Dec 2020 10:42:35 +0000
Received: from relaygw4-21.mclink.it ([195.78.211.247])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kl8Xo-00087f-Hy
 for linux-mediatek@lists.infradead.org; Fri, 04 Dec 2020 10:42:33 +0000
Received: from [172.24.30.46] (HELO cgp-esgout03-rm.mail.irds.it)
 by relaygw4-21.mclink.it (CommuniGate Pro SMTP 6.0.6)
 with ESMTPS id 193380560 for linux-mediatek@lists.infradead.org;
 Fri, 04 Dec 2020 11:42:25 +0100
X-Envelope-From: <mc5686@mclink.it>
Received: from [192.168.7.128] (host-87-10-221-96.retail.telecomitalia.it
 [87.10.221.96]) (Authenticated sender: mc5686)
 by cgp-esgout03-rm.mail.irds.it (Postfix) with ESMTPA id ED0E641B6C
 for <linux-mediatek@lists.infradead.org>; Fri,  4 Dec 2020 11:42:04 +0100 (CET)
To: linux-mediatek@lists.infradead.org
From: Mauro Condarelli <mc5686@mclink.it>
Subject: Status of rt3050-esw driver
Message-ID: <c5625076-7533-86e8-ef5b-7248b62977d7@mclink.it>
Date: Fri, 4 Dec 2020 11:42:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
X-Irideos-Libra-ESVA-Information: Please contact Irideos for more information
X-Irideos-Libra-ESVA-ID: ED0E641B6C.A8FB7
X-Irideos-Libra-ESVA: No virus found
X-Irideos-Libra-ESVA-From: mc5686@mclink.it
X-Irideos-Libra-ESVA-Watermark: 1607683325.70215@I2UvUN7PM0XfNue4SmM2rw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_054232_802203_3AED4E83 
X-CRM114-Status: UNSURE (   7.12  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,
I am very confused about the current status of the driver of internal switch in Subject.
My need is to statically initialize the ESW found in MT7628 SoC.

I have found several references (some rather old) to some work from John Crispin and other developers, but apparently this work did never found its way in the kernel (but socumentation is there in Documentation/devicetree/bindings/net/ralink,rt3050-esw.txt !) because it doesn't seem to conform to kernel guidelines (using DSA infrastructure).

I have been using a derivative of this driver from Stefan Roese, but it "stopped working" some time ago.
I actually use mostly WiFi and thus breakage, happening in some kernel upgrade, went completely unnoticed till recently.
I am fighting to find out exactly where I broke things, but this spawned a search and I'm now wondering if there's a better (and more robust) way to enable MT7628 ESW.

Any hint and/or pointer to relevant documentation would be very welcome.

Thanks in Advance
Mauro Condarelli

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

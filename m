Return-Path: <SRS0=q7ss=LJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D18AC48BE5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 14:41:26 +0000 (UTC)
X-Greylist: delayed 3418 seconds by postgrey-1.34 at mail.kernel.org; Tue, 15 Jun 2021 14:41:25 UTC
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA9FD61493
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
Received: from bombadil.infradead.org (unknown [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA9FD61493
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 14:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DC2j/XYLdipFmsWWUN/r+/xnlZn/bEzfP9m9BvK1Vmw=; b=2PtK3Hd9eNGB38
	smuMIKxJJVC7SLdkMBDF0s6+SeU5zJLlqROpBKf0cv0IMxMV3ObqdGo1T57kl8l9nLNQFoSQbyk/W
	e+Rsgv45Yw2QooqY8Sy4zv06LqfkJzIJWcZV8sdwobdIDFGiuckF9z5CQQPqrKsqS0Pjg0DzzdJ0b
	XsgEmY736WdcKrkdEBNZj7A4TJQrqHZaXK+c6wTkEmvCkYXrBWabwPzs7C1VU9XGVeBv7U5APHeyw
	XcsqixieJOhSQxfUO9ifCP+PmNgfWhCpxiBstdJoehq50sZYbJ9uJKvuIyKBC/E1EFDUg5/ma8oIj
	X+/bXyLKepgdZK5ltSOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltAFP-000f9L-Oa; Tue, 15 Jun 2021 14:40:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt9OK-000I7N-2L; Tue, 15 Jun 2021 13:46:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC13761369;
 Tue, 15 Jun 2021 13:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1623764767;
 bh=/+gmgKcGaUl2w2pHI0RFsnXNGdAV3gE2Fa42rbSgcAY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b2xoiRqX+DJ/Hr27SKsx9hbbHh814udQK1z3qctXfLGvFMsnDN150/opaDqR4JBiU
 ucSKrU3q8epgf14UAW8anxxwHv4F20xYO3bTrWdfjSBZtNWsa6akMaN1tupRLOdhah
 m1fI0L3LdDRQrEmthipACK4K7+ev2Y/hBPuz9lRw=
Date: Tue, 15 Jun 2021 15:46:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yuwen Ng <yuwen.ng@mediatek.com>,
 Eddie Hung <eddie.hung@mediatek.com>
Subject: Re: [PATCH 00/23] Add support gadget (runtime) PM
Message-ID: <YMivHG2hwqFZLj6/@kroah.com>
References: <1623139069-8173-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1623139069-8173-1-git-send-email-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_064608_181524_E5C1D966 
X-CRM114-Status: GOOD (  10.34  )
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

On Tue, Jun 08, 2021 at 03:57:26PM +0800, Chunfeng Yun wrote:
> This series mainly adds support for gadget suspend/resume when the controller
> works at device only mode or dual role mode, and also adds support runtime PM,
> in order to fix the sequence issue about resume and role switch event arised
> by extcon or role-switch, rebuild and unify the flow of dual role switch for
> all three supported ways.

I've applied patches 5-13 here, as they did not mess with the DT stuff.

I will have to wait for the DT developers to review the yaml changes
before I can take the rest.

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

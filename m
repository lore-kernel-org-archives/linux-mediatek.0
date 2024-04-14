Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16BEC4345F
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Apr 2024 13:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9AthGRvLahLk05YFqQxtUWdIfPbPKXB0hmQxe5SXEb8=; b=oX33JMCdn0DAQzDCyPx9ybXEdA
	BnJrmxuw4Z1MY+OlkFHiPrPeIF6SkXQ76opn840dQyoC55uVu7MfHW0sfhkSU0P3IalU6AczZKWcV
	Is8OqyqtzykzKryiVSkwt7l++T4/nlmP3bLS0+IJnw2ARVRWIYWbwt2MuXAFDCoGqp5WfsmmVRy0B
	J3VIxFEWpkN5ik1U2sZc+BG+6vn77lLoGyFE/0MvSH+tj8Z4wwawhMcvtJwbCZyaRm4HWYlPBbuX4
	xYeFyDL/52Lk//H1rdOzZ0e1v+DMRMfZeCml1nitOvPJy1k+uRQzd1NHyNmDTIBRkBpcMXnKheWvD
	eIHOBiBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw06u-00000005YP7-2BKB;
	Sun, 14 Apr 2024 13:41:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw06q-00000005YOU-0h6H
	for linux-mediatek@lists.infradead.org;
	Sun, 14 Apr 2024 13:41:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DB63760A6F;
	Sun, 14 Apr 2024 13:41:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C62DC072AA;
	Sun, 14 Apr 2024 13:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1713102086;
	bh=e0of384HoN9+3TddphB8KHvDz7095Prk8L6S3+MtfzU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QaeLqDAsnVm9xb0ZjsENa8QAmIkyW2xd834Q5J2qDSPFqWD6tkTsaWhhMv5GS2gMn
	 iwh4qF66n9HvMvEcZxoDPeodUmO0Jhq6o2+vIQBwoHZxvsvtQKUYIMSR8b2TT6QXtT
	 jGtWb1OP8jG+bOWsNxuHGm0wm1GLZHDSmuiwsg64=
Date: Sun, 14 Apr 2024 15:41:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Nini Song =?utf-8?B?KOWui+Wum+Wmrik=?= <Nini.Song@mediatek.com>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] media: cec: core: remove length check of Timer Status
 solution applies to 5.4 and 4.19
Message-ID: <2024041448-contour-oblivious-2158@gregkh>
References: <KL1PR03MB6225011CAE293E2DBF6C3B8E90042@KL1PR03MB6225.apcprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <KL1PR03MB6225011CAE293E2DBF6C3B8E90042@KL1PR03MB6225.apcprd03.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240414_064128_275723_1CE8D3AB 
X-CRM114-Status: UNSURE (   9.78  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Apr 12, 2024 at 10:14:41AM +0000, Nini Song (宋宛妮) wrote:
> Hi @stable@vger.kernel.org<mailto:stable@vger.kernel.org>
> 
> This patch has been merged in mainline as commit ce5d241c3ad45.
> [patch diff]
> [cid:image001.png@01DA8D04.BCD8A070]
> 
> Because of our customer used v5.15, v5.4 and 4.19 for MP production, which requires this solution.
> 
> We need your help apply the patch in v5.15, v5.4 and 4.19.

It does not apply to 5.4.y or 4.19.y, can you please provide a working
and tested backported patch so that we can add it there?  I have now
added it to all other branches.

thanks,

greg k-h


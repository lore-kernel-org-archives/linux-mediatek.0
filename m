Return-Path: <SRS0=xJt/=JE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B1FC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 12:32:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78124611EE
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 12:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78124611EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1idEGXCudOvWIm7KRxkEBpH+ZSyoSOb2CW997Fb6O5Q=; b=Q86mPuj5USVkiOwCCwb6GrUcR
	QzSZmXn+fwhRXkiihXHErDQLZLxc3dAdxUxBX4wgV/VHI+3c4PxZan3+D+RLEkpRouoXAZ0PJMC1/
	gG2cCJBSy6kiSni6yD459ZoN5ke/S2KkwNNUOOzgqQICedpFJ74KikcED9uEohp8lP8PQ5A4fWl7u
	wJODSBREKXvSUO96TafSquw01bqro2UtqPsdoxXARy1CFqYKX2vyTK4Rf+Dyu3vsA4PdwgUSdNqbW
	VP3Hp26Sjg87nPRgNMnFzR5OlGfbiengTDDh/+SsbOAQyz0SqDXg5PMhO3/cp8ka6MOAETvpddFQ/
	C36oj57Zw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU7MN-004xlt-FB; Wed, 07 Apr 2021 12:32:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU7M8-004xjn-Vw; Wed, 07 Apr 2021 12:32:30 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8D63B60FEE;
 Wed,  7 Apr 2021 12:32:23 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why.lan) by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1lU7M5-0064QE-Oo; Wed, 07 Apr 2021 13:32:21 +0100
From: Marc Zyngier <maz@kernel.org>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Daniel Palmer <daniel@thingy.jp>,
 Thomas Gleixner <tglx@linutronix.de>, yj.chiang@mediatek.com
Subject: Re: [PATCH v4] irqchip/irq-mst: Support polarity configuration
Date: Wed,  7 Apr 2021 13:32:18 +0100
Message-Id: <161779861853.1095473.5298722515366645691.b4-ty@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210315131848.31840-1-mark-pk.tsai@mediatek.com>
References: <20210315131848.31840-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: mark-pk.tsai@mediatek.com, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, daniel@thingy.jp, tglx@linutronix.de,
 yj.chiang@mediatek.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_133228_699862_0DC78E89 
X-CRM114-Status: UNSURE (   9.30  )
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

On Mon, 15 Mar 2021 21:18:48 +0800, Mark-PK Tsai wrote:
> Support irq polarity configuration and save and restore the config
> when system suspend and resume.

Applied to irq/irqchip-next, thanks!

[1/1] irqchip/irq-mst: Support polarity configuration
      commit: ea4aeaa5c88906eb3ca3d7d3d17a45605d2dd0de

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

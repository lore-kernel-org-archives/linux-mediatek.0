Return-Path: <SRS0=NHOn=6A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8843C2BA2B
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Apr 2020 20:33:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE0B9206A2
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Apr 2020 20:33:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o2CGDZ+o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE0B9206A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CeMlupXFB1iTKuHuhlpVwKqFYIcgc8ntOkRVDYIWpcg=; b=o2CGDZ+oEv2Z1d
	dQtGOl6HuKRknNJ3stivUAdON9m08fs4RNkfOR38zp8prAy1R+5DuV+RMnrsntzSSc0yapZ73b4u4
	nbqgnD9UTmcjJgJ7WKbfJUe2Nf29PvikpXebHFmEF0O11Akm2EJQH4/zK4qGlZ24S3u6l5JRGtlYh
	R0EMQG2h4AKSyezU6d6DJv8aV1z4dd+Pn5u8vs+/0n8pTAdv75BPmS4EuIrIR3ReuP0XleQq0uuuX
	EUzVeARgf7XRyZcgFRZeiTpVJoUNSERsjvYKzJmSMP4Sg8F+BNRQblwRwydRD34zQ3QKsv7dHPj+H
	oX0k5c/MCgSwV2MYij3g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPBC9-0008P0-Oi; Thu, 16 Apr 2020 20:33:09 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPBC7-0008Od-Sk
 for linux-mediatek@lists.infradead.org; Thu, 16 Apr 2020 20:33:09 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id C450712756799;
 Thu, 16 Apr 2020 13:32:56 -0700 (PDT)
Date: Thu, 16 Apr 2020 13:32:53 -0700 (PDT)
Message-Id: <20200416.133253.1036884388591864417.davem@davemloft.net>
To: dqfext@gmail.com
Subject: Re: [PATCH net-next v2] net: dsa: mt7530: fix tagged frames
 pass-through in VLAN-unaware mode
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200414063408.4026-1-dqfext@gmail.com>
References: <20200414063408.4026-1-dqfext@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 16 Apr 2020 13:32:57 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_133307_929262_EBDD9D0A 
X-CRM114-Status: UNSURE (   4.92  )
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
Cc: andrew@lunn.ch, fercerpav@gmail.com, netdev@vger.kernel.org,
 sean.wang@mediatek.com, riddlariddla@hotmail.com, opensource@vdorst.com,
 linux-mediatek@lists.infradead.org, foss@volatilesystems.org, ptpt52@gmail.com,
 john@phrozen.org, szab.hu@gmail.com, gch981213@gmail.com,
 vivien.didelot@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: DENG Qingfang <dqfext@gmail.com>
Date: Tue, 14 Apr 2020 14:34:08 +0800

> In VLAN-unaware mode, the Egress Tag (EG_TAG) field in Port VLAN
> Control register must be set to Consistent to let tagged frames pass
> through as is, otherwise their tags will be stripped.
> 
> Fixes: 83163f7dca56 ("net: dsa: mediatek: add VLAN support for MT7530")
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>

Applied and queued up for -stable, thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

Return-Path: <SRS0=mrrP=63=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EA53C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 May 2020 22:25:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 705C52054F
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 May 2020 22:25:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r0L6GB9b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 705C52054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o71DYEGp/s/MXu3mK12xSdRvcX5FnYczsoIUFp2tPtM=; b=r0L6GB9bWIYD3l
	zveMKYYHhIE6fkMqrLFSgBwDyk75c+OqutzX8tqnCAMIeYKbm8H7+manMF+2Pofgy35DrhpKPzvOZ
	BTA773tX7+BBjzzr4HN4ddI61cE7ASOzad3Fuv2geRalUxdxc6sjVTOUp+Wo3XlAofO7ed81i4CiT
	9f7QzpsUsQ3nP6Qw4n4Q0LlKzSCNuTO1Wj32bS9Hfh3AjtkNst3HNRMBZY44b+QI8oRgbiwVgvN4T
	d5RTZa/eHDRXZJsAGTAszclppPPlEmEUvI1xkI0/bzkaHdMdqd+lQnZhG+IYf88LMVu6efbJeMvL8
	j8q/o3z7ws1dRzgMXaLQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYzoO-0007ja-E9; Wed, 13 May 2020 22:25:12 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYzoL-0006aa-Ej
 for linux-mediatek@lists.infradead.org; Wed, 13 May 2020 22:25:10 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 0403C12118550;
 Wed, 13 May 2020 15:25:01 -0700 (PDT)
Date: Wed, 13 May 2020 15:25:01 -0700 (PDT)
Message-Id: <20200513.152501.2023097002346051384.davem@davemloft.net>
To: dqfext@gmail.com
Subject: Re: [PATCH net-next] net: dsa: mt7530: set CPU port to fallback mode
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200513153717.15599-1-dqfext@gmail.com>
References: <20200513153717.15599-1-dqfext@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Wed, 13 May 2020 15:25:02 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200513_152509_523750_7FC094C9 
X-CRM114-Status: UNSURE (   7.73  )
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com, fercerpav@gmail.com,
 netdev@vger.kernel.org, sean.wang@mediatek.com, linux@armlinux.org.uk,
 riddlariddla@hotmail.com, opensource@vdorst.com,
 linux-mediatek@lists.infradead.org, foss@volatilesystems.org,
 szab.hu@gmail.com, matthias.bgg@gmail.com, vivien.didelot@gmail.com,
 tj17@me.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: DENG Qingfang <dqfext@gmail.com>
Date: Wed, 13 May 2020 23:37:17 +0800

> Currently, setting a bridge's self PVID to other value and deleting
> the default VID 1 renders untagged ports of that VLAN unable to talk to
> the CPU port:
> 
> 	bridge vlan add dev br0 vid 2 pvid untagged self
> 	bridge vlan del dev br0 vid 1 self
> 	bridge vlan add dev sw0p0 vid 2 pvid untagged
> 	bridge vlan del dev sw0p0 vid 1
> 	# br0 cannot send untagged frames out of sw0p0 anymore
> 
> That is because the CPU port is set to security mode and its PVID is
> still 1, and untagged frames are dropped due to VLAN member violation.
> 
> Set the CPU port to fallback mode so untagged frames can pass through.
> 
> Fixes: 83163f7dca56 ("net: dsa: mediatek: add VLAN support for MT7530")
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>

Applied to net-next, thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

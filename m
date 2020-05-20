Return-Path: <SRS0=i2Ig=7C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3079C433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 10:15:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87D07207FB
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 10:15:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sb4S6qKD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="TtB15Z1E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87D07207FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ymxQrmQpttutu5+M1k2UId2gbLh8B8QebkzyPpk4C1Y=; b=sb4S6qKD8O7ioO
	JV5rkDA3uxXvR0K8/LM+fXZzwI8YS93vz8zkudZqdEkFsXwzUvRTgTxIjl+vriuLEpOaZopf3J9LV
	NHslvmiljpblt4WhzebU2ztmRK6jnCBq0qbAEQjtA6CeECHbgn3nQn771P22zbUZtf/X0oQ3VLp4P
	AN5dLp2ZooKWfthE7VbS99TFH7nhp9KhSKbF1I0RS3NY7QRQXTDpiGkyb8aIZodnX1vRyn2Zbfvds
	ktvMyShDKhTp6rS7aFXETH4gg5QXzrh0UhM5SSDDTgQDJXxpwV0KjxpRpBA4vgvMwBSWs598tI6Q0
	dkSIMbKK5OGAbNc19k6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbLlM-0000lL-MB; Wed, 20 May 2020 10:15:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbLki-0007DJ-1k; Wed, 20 May 2020 10:15:09 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7EF73207D3;
 Wed, 20 May 2020 10:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589969707;
 bh=eMxMVy+5ObFSa7X4PkqHTUtOM18qhbQrrWDasUwzbe8=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=TtB15Z1E67LS1rghb8AaDiFb+mibHFgh8j8fXQpXD/dxajYz3JKznf4b1kVD0kQD3
 1MD0NQBcLrOIOEIicoNt6hejb00B+7NBHQ65lIpYagezTmYVye9BeEMl6KOPLnYqZv
 cYUqahgKHhBh3t7K8ftJAkkwDxQpuuG/nYvgPsys=
MIME-Version: 1.0
In-Reply-To: <20200518113156.25009-2-matthias.bgg@kernel.org>
References: <20200518113156.25009-1-matthias.bgg@kernel.org>
 <20200518113156.25009-2-matthias.bgg@kernel.org>
Subject: Re: [PATCH 2/4] clk/soc: mediatek: mt6797: Bind clock driver from
 platform device
From: Stephen Boyd <sboyd@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 matthias.bgg@kernel.org
Date: Wed, 20 May 2020 03:15:06 -0700
Message-ID: <158996970679.215346.601357207492478540@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_031508_225177_E8B89291 
X-CRM114-Status: UNSURE (   9.04  )
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>, devicetree@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Richard Fontana <rfontana@redhat.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, mtk01761 <wendell.lin@mediatek.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-clk@vger.kernel.org,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting matthias.bgg@kernel.org (2020-05-18 04:31:54)
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> The mmsys driver is now the top level entry point for the multimedia
> system (mmsys), we bind the clock driver by creating a platform device.
> We also bind the MediaTek DRM driver which is not yet implement and
> therefor will errror out for now.
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

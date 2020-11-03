Return-Path: <SRS0=lxeM=EJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1A67C00A89
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 01:53:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D6DA21D40
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 01:53:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TXCXq8S6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="mi9OpNle"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D6DA21D40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PlrwoLD7zPY+E2rVnisDHgrE5E7Ms+7lIkCW9ugko5s=; b=TXCXq8S63zJ/N71uRTAzbDWOU
	XGFLky7+dBH/xZiDnQpqJaSER42lm984SdW9G4CaTAfs23bQSjQ6DLAbu1j0KvuUawJ9j9+jJW5Jh
	Gr5zi+mYier+yTmr/cw2ENl+5hRTJBikDt84OiPLPlm3A8MDxfKL5yWVCRoNuMkch4MfwzhkBOwuW
	2UGft9H9+TqVY8zNcU9ae1Mm33TDcnXLQOzlV8zMhiyXOGA/Sj7UJmMsq5MmivUedT/lB9nxjRjbD
	MzS1pqgc5qBOlhfDvdkZvaTKp0t/c+V9jsUOPjWbFkXGl73ZXXmOjTDNxOF18gBOl6kgTFyicm/+R
	OxtLYy56Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZlVt-0008JT-KD; Tue, 03 Nov 2020 01:53:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZlVq-0008IY-1h; Tue, 03 Nov 2020 01:53:30 +0000
Received: from kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net (unknown
 [163.114.132.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4636221D40;
 Tue,  3 Nov 2020 01:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604368409;
 bh=HI70QVqc0qzULRHPZIp0qmywEpCumwNM6jH8p1E51Bc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mi9OpNle2AlPBEPtH6pLJEQdGrcdY27MtUpn3kQbBRiYSRnMeRJ+78VaG1XzZbwOE
 C4816HoBjvxiX8Yk+KzudnnSRT5XQAPzI9IvUm3di0nD8rHy0rCA9wh4D/dkIpOQsw
 9du8I1VafO977AWl66MeTPh7SevZD4y8K1oO5zCY=
Date: Mon, 2 Nov 2020 17:53:27 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: trix@redhat.com
Subject: Re: [PATCH] net: dsa: mt7530: remove unneeded semicolon
Message-ID: <20201102175327.797a79b7@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <20201031153047.2147341-1-trix@redhat.com>
References: <20201031153047.2147341-1-trix@redhat.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_205330_192702_731B312A 
X-CRM114-Status: UNSURE (   8.20  )
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
Cc: andrew@lunn.ch, Landen.Chao@mediatek.com, f.fainelli@gmail.com,
 netdev@vger.kernel.org, sean.wang@mediatek.com, linux-kernel@vger.kernel.org,
 davem@davemloft.net, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, olteanv@gmail.com, vivien.didelot@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 31 Oct 2020 08:30:47 -0700 trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> A semicolon is not needed after a switch statement.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Applied.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

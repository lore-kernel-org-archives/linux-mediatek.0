Return-Path: <SRS0=aCep=CO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64D76C433E2
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Sep 2020 23:37:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5E8720760
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Sep 2020 23:37:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KcLBA9Ya";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fj9AGwiR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5E8720760
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UXAw0hPLGCDXgrXyPSGeWUNLNoChVCKXZLWbtMKfr/c=; b=KcLBA9YaxlGxB4MVAnNifA1xB
	f/JBgc/gR7RrmIU5qVhOipa7Nv0V5g5zvgiVrbjYNQf83a4HHTbKAHl/iKqLPYbA3OAv+flp1Prhy
	S3AIv3esWzGVEFy3qjZxAeM1TQCRTJ3h+W4sytf8ips52zJuOPtXgg6AErdgLSsiBAnKTWYPidIJV
	j7cTYsB8KbcQ2zdg64KJg2WIFt9eU6zDWAXLzJk034t7fdVUbv1C8OtH8wSDcUtNR6vWwG0EKqP8W
	I2ynKh0o3f8RwGawc/vSZwuw5OT5cnHo8PCbKPTVqstcOh3nBIBPbPptmYZECFxQvE34jPCZZXT2d
	hCeNw5RTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEhkC-0004H3-H9; Sat, 05 Sep 2020 23:37:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEhk8-0004GA-Uh; Sat, 05 Sep 2020 23:37:13 +0000
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9DDAF20760;
 Sat,  5 Sep 2020 23:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599349029;
 bh=rpeS5XHUij27LdjfSXTm57hB+BZoxEGDguTEGPPB1XY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fj9AGwiRHUE4yk+KXhFmB7MuGeJ+yfwxEs9krALrdFd4z9ZKrxI0PT0F4w0rslDxS
 gbsrnSN4Ln61IQLrCV54Zb5BjSyKCV4zsvP4YD8x81rLVcdNTit0lornd8uUS2w0+i
 E2AP8cR6ir1bgoY37X/fOh4Kyf/7cfdOP2P+jmDY=
Date: Sat, 5 Sep 2020 16:37:06 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Landen Chao <landen.chao@mediatek.com>
Subject: Re: [PATCH net-next v3 3/6] dt-bindings: net: dsa: add new MT7531
 binding to support MT7531
Message-ID: <20200905163706.60cdceb5@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <4ec3c9e6a219c09fc90d1be8d3d63da587ef6fba.1599228079.git.landen.chao@mediatek.com>
References: <cover.1599228079.git.landen.chao@mediatek.com>
 <4ec3c9e6a219c09fc90d1be8d3d63da587ef6fba.1599228079.git.landen.chao@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200905_193713_071453_C1A5200E 
X-CRM114-Status: GOOD (  11.55  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, frank-w@public-files.de,
 Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, netdev@vger.kernel.org, dqfext@gmail.com,
 Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>, opensource@vdorst.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 4 Sep 2020 22:21:58 +0800 Landen Chao wrote:
> @@ -32,10 +33,13 @@ Required properties for the child nodes within ports container:
>  
>  - reg: Port address described must be 6 for CPU port and from 0 to 5 for
>  	user ports.
> -- phy-mode: String, must be either "trgmii" or "rgmii" for port labeled
> -	 "cpu".
> +- phy-mode: String, the follow value would be acceptable for port labeled "cpu"

... the following values are acceptable for port labeled "cpu":

> +	If compatible mediatek,mt7530 or mediatek,mt7621 is set,
> +	must be either "trgmii" or "rgmii"
> +	If compatible mediatek,mt7531 is set,
> +	must be either "sgmii", "1000base-x" or "2500base-x"

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

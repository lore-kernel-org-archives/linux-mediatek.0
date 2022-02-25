Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BBBC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 10:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CedCbFVRJJH96uUi7Zy3pDdgURfVPh3WUpjF6Uc+bHc=; b=GYCzxY1jqXbd3s
	7xIFFdnHG3ifs4gJWiG4aWiN7zcw6jg63FQz5GHBIguN0VK9BqLNZOrQryYTq/peleEjHl+iSwwBv
	udaAiLHcoMC5S9c1Xl+YSZMck6JJBlSINtidI3MjjwZmkaglz2erLnGGVfFiX3ukbd9FSsZ79FDVt
	dJZJFNv9wDcGqgoi8GDMDqNHaZTEKySE7Ay7uiCq/NMI16UmTlQEjJaPbUY8u1+LH6OGIt2bQFb/o
	LEUdnLCGc5C3acGDX/fGtAponNdeiu3ryiNpTYTnxgL9E6SG+sCq/PGYDyN+P59SWQQZS8lHHudn/
	+hPVzAs0MBE8nae8cOaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNY0i-004Sro-2H; Fri, 25 Feb 2022 10:39:40 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNXzu-004SX1-Qw; Fri, 25 Feb 2022 10:38:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
 Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+Xn6FzCuUazJGXD67KTYniSd2lGAAlj38VcC1aa/bc0=; b=Ro+pJpQZ9JcDZevJIMLxTuad/H
 Sseks3nrleSAy9xs9huspJ4b/Va+W2jw5nIxBRBQJK5CniSMzg4xetI5pqiAmXHKZsDFbgZg8TraO
 jsVL4wsp73Yvo10CQSSyCZuq9xU9EeQkzUDkf3LntOrH8yygtcWk4wDMBbwkklrgtbAM=;
Received: from p200300daa7204f00f847964d075b2b3d.dip0.t-ipconnect.de
 ([2003:da:a720:4f00:f847:964d:75b:2b3d] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nNXzs-00088g-S6; Fri, 25 Feb 2022 11:38:48 +0100
Message-ID: <18408826-3af1-a80a-181d-25f46b4920fb@nbd.name>
Date: Fri, 25 Feb 2022 11:38:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 02/11] arm64: dts: mediatek: mt7622: add support for
 coherent DMA
Content-Language: en-US
From: Felix Fietkau <nbd@nbd.name>
To: netdev@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220225101811.72103-1-nbd@nbd.name>
 <20220225101811.72103-3-nbd@nbd.name>
In-Reply-To: <20220225101811.72103-3-nbd@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_023851_096877_C7198F3E 
X-CRM114-Status: UNSURE (   6.92  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 25.02.22 11:18, Felix Fietkau wrote:
> It improves performance by eliminating the need for a cache flush on rx and tx
> 
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
Sorry, I accidentally left out the dt-bindings patches. They will be 
included in v2.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

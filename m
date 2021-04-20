Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4149DC433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 01:23:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 896AC613AF
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 01:23:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 896AC613AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZntDgfmsten7gCjNH8pkpNmWPZMRBn+0Iu+0MY0BB30=; b=NvB58QkqN7mcdc8gT3MGi3VhF
	ECWf2SSNB0RKRv36y1CF3J9fKIvsmIU/u0g+7aBSO760LJU86OEKUQq+/tULkLH6bpBwaPcI5GTZw
	nk7RBMDKYhK6duioKMdeB5jh1LpXmXXg5j8+BlfYrfW/63sED7/OHJb7QhJUy5NQRmmo+2NgwqHBE
	33dQ5b9Tf0WYa6jCx0ajmuQDdtKlcxDPSeAgOSRLv8Ji1vQwNJ5YFS3PdKQzoOx8XSIxkgGDG9Axg
	vi3SXbYPF/X9iCazi+heHd9K8KovgeQ6Wye0qi5nFRJVV7fVZzKmoDkPM8+YmuAEBCN2B4tPzpE7x
	pnILHqVDA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYf6D-00AvJr-Gl; Tue, 20 Apr 2021 01:22:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYf62-00AvHh-C5; Tue, 20 Apr 2021 01:22:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=IlTxXH6RJP5/DiSvjSve5zS+FqofsxIIojjaWkPWQC4=; b=APH8CA/VHbfGn2B6JxiC90P7P8
 ZiPCBfRdxG3ARGP/UAklzkKlSltF5WtX8CqcAlFrky2x4VgKtnBWu2vi1C+AJ1RwX1w2giESiB3n5
 J9O7r07WWKAN24Av1In/bRjwBi0J7CSfu6X0+dFRRw5S3RgvH/7Ucp6BIwmDnCheGc9VX9Q9Dj106
 xOpVlL6C8rx8aQTTbgJo3M4m6YBJ8YOZcjYj+9/r4b1WTbZCfYXqr55nphWlANY99YjieugDf7zGk
 60uN6aJndPsQE4ZRWDtGcxk+B019/wxu4fWTL5Le7v/BGaeH27/jcqOxZci8ZmJGXY4odt3MQzuA5
 dOW88byw==;
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYf5y-00BkrA-AY; Tue, 20 Apr 2021 01:22:33 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1lYf5h-0001Ss-Cj; Tue, 20 Apr 2021 03:22:13 +0200
Date: Tue, 20 Apr 2021 03:22:13 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>
Subject: Re: [PATCH net-next v2 2/2] net: ethernet: mediatek: support custom
 GMAC label
Message-ID: <YH4sxUQBgzMqLYwk@lunn.ch>
References: <20210419154659.44096-1-ilya.lipnitskiy@gmail.com>
 <20210419154659.44096-3-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210419154659.44096-3-ilya.lipnitskiy@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_182230_381429_C3832F53 
X-CRM114-Status: GOOD (  10.35  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Apr 19, 2021 at 08:46:59AM -0700, Ilya Lipnitskiy wrote:
> The MAC device name can now be set within DTS file instead of always
> being "ethX". This is helpful for DSA to clearly label the DSA master
> device and distinguish it from DSA slave ports.
> =

> For example, some devices, such as the Ubiquiti EdgeRouter X, may have
> ports labeled ethX. Labeling the master GMAC with a different prefix
> than DSA ports helps with clarity.
> =

> Suggested-by: Ren=E9 van Dorst <opensource@vdorst.com>
> Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

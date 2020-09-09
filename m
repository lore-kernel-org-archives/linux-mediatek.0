Return-Path: <SRS0=qDs2=CS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4940C433E2
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 11:00:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DB8B21D7A
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 11:00:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RsW0vahm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DB8B21D7A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=I8fP05gB0cleL2Q8YtL4il9+BngCLd/et7BaYCYClw8=; b=RsW0vahmwI595BK4FIoWfTWpA
	yN1hmlT2dosraHSDW7l3aEUj5hY/Rf9s2Ta0oOkl+f6zcDQQXBagDrfNQZ01+ZOle8ITzH3Z4VzVv
	tT+y+D8L9ulvCOj3K42TpP+Pr3W9OrJEdSVigjD42sP9MQip+aI65uJDhZEXYq857odfDoqibF8jP
	/fj83Qr8HXxA7SGiQ6WAShzic+9a2rVGWXNTfOxcGej5o8tkp3YF00l6yRaLkWD9WBPHyntauPzCV
	XO2WJSZyEweSDEsxGVzbI0G2T92qpB5e/uXU5DSE8AN+EP1pJf9E7Y8ibf93D6AiD5IyQQ2kiV0zL
	IUJo/Exzw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFxpy-0002lL-3z; Wed, 09 Sep 2020 11:00:26 +0000
Received: from smtprelay0147.hostedemail.com ([216.40.44.147]
 helo=smtprelay.hostedemail.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFxpu-0002kQ-9c; Wed, 09 Sep 2020 11:00:23 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id 479AC100E7B45;
 Wed,  9 Sep 2020 11:00:19 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: horn54_50064b2270dc
X-Filterd-Recvd-Size: 1987
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf04.hostedemail.com (Postfix) with ESMTPA;
 Wed,  9 Sep 2020 11:00:17 +0000 (UTC)
Message-ID: <e2dfa0e0c279cd39a0b7ab725a634831e1f188cc.camel@perches.com>
Subject: Re: [PATCH][next] mt7601u: Use fallthrough pseudo-keyword
From: Joe Perches <joe@perches.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>, Jakub Kicinski
 <kubakici@wp.pl>, Kalle Valo <kvalo@codeaurora.org>, "David S. Miller"
 <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>
Date: Wed, 09 Sep 2020 04:00:16 -0700
In-Reply-To: <20200901173603.GA2701@embeddedor>
References: <20200901173603.GA2701@embeddedor>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_070022_362728_A5ED024B 
X-CRM114-Status: UNSURE (   9.07  )
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
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-09-01 at 12:36 -0500, Gustavo A. R. Silva wrote:
> Replace the existing /* fall through */ comments and its variants with
> the new pseudo-keyword macro fallthrough[1]. Also, remove unnecessary
> fall-through markings when it is the case.
[]
> diff --git a/drivers/net/wireless/mediatek/mt7601u/dma.c b/drivers/net/wireless/mediatek/mt7601u/dma.c
[]
> @@ -196,7 +196,7 @@ static void mt7601u_complete_rx(struct urb *urb)
>  	default:
>  		dev_err_ratelimited(dev->dev, "rx urb failed: %d\n",
>  				    urb->status);
> -		/* fall through */
> +		fallthrough;
		
		fallthrough to break is odd.
		break would probably be better.

>  	case 0:
>  		break;
>  	}
> @@ -241,7 +241,7 @@ static void mt7601u_complete_tx(struct urb *urb)
>  	default:
>  		dev_err_ratelimited(dev->dev, "tx urb failed: %d\n",
>  				    urb->status);
> -		/* fall through */
> +		fallthrough;

here too...

>  	case 0:
>  		break;
>  	}
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

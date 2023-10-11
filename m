Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7C2CD98E3
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Oct 2023 01:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jrBARauvKO5bXj4/z3JabNLTPC5n3Bm+xpPysDJ+pI4=; b=Oxj5A+8jh1wG/maLWJ8GATL1Kd
	WJb4JAqtlmAoJoluocHu2mwLRS83tia/kFGQfw16m9DyB4BlkCE7TMWeXqjk0FpPYcV6Y0innvA4P
	OLpI6/R3MwSb5mMrZrz47w86gkLqVCUYLnQVPe4eiV0KaHFLIHh9u2i4gZkBcaV8Uwnjva/xy7xah
	nvX7eLsOSbqezWOcytXy9Y2SDZyuUo68mKTIS+XoSbmIBo3nKyzk3A/0fbVaGcK8ojoHHxF28dqop
	bCmz1qAGi8ti0ZbbSL4CpOgJxWZFG/nvNoNIJPU0rBuJZjstViGzK6hqejNyR4CnpOJY8LmZupCik
	H7zYxteA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqNzU-00EVOZ-1F;
	Wed, 11 Oct 2023 01:26:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqNzS-00EVOH-0R;
	Wed, 11 Oct 2023 01:26:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jrBARauvKO5bXj4/z3JabNLTPC5n3Bm+xpPysDJ+pI4=; b=GUebrjpJfA8+/hnX/ubMR0F9/t
	yXwpz5AnaBr5BJEMQ8DojgdYDQg6x7aBawHL8BuYywS58yOKfqJfQqCvjvZxq/CBtHNzT4lncMqPC
	o7sIR/2c/HY1+n/6hwfMUtdcE3FvhXHyasJ8h05yd66FF8wd0f8W4+RXJW5NnH1KTMvfJVkhDzn2X
	5nopaYzUMBVKbgnUBEJl+c6CLmtSafpjzgm+VFIfoUAk6A7/p61FrHDk1etEIyhbnPm3nO1I5Cvr6
	P4JswrM4lm+/Emt5CSKpLzL7RIRe27LItv/AqIaaFJ2LtwlucC+uYTfr1VgtWhbHzlBXzAEPTmHQW
	Do6SrrHA==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qqNzO-007vNb-F5; Wed, 11 Oct 2023 01:26:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=jrBARauvKO5bXj4/z3JabNLTPC5n3Bm+xpPysDJ+pI4=; b=B9uIJsB/DtjzIKSFaoJWTj2obe
	w27vMYq7GufA8gdAaNleiqpJMpuKvQJe5LBk+lY1Jw35b1Ii/7YL2IgqKGVujLYO/1qQA27gRrYIR
	CVdbgPENQnJ9rrwywzDo+/rMuzuZtsiZOF5LFax5HzTjldGI5q9EDaLD5Qdo4qeMzQ+Y=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qqNyu-001PlJ-TW; Wed, 11 Oct 2023 03:25:48 +0200
Date: Wed, 11 Oct 2023 03:25:48 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: netdev@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	"open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH net-next 2/2] net: dsa: Rename IFLA_DSA_MASTER to
 IFLA_DSA_CONDUIT
Message-ID: <9fd77135-22df-4d3f-a0a5-9548829d4124@lunn.ch>
References: <20231010213942.3633407-1-florian.fainelli@broadcom.com>
 <20231010213942.3633407-3-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010213942.3633407-3-florian.fainelli@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_022618_512356_30FCA0AE 
X-CRM114-Status: UNSURE (   6.28  )
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

>  enum {
>  	IFLA_DSA_UNSPEC,
> -	IFLA_DSA_MASTER,
> +	IFLA_DSA_MASTER,	/* Deprecated, use IFLA_DSA_CONDUIT instead */
> +	IFLA_DSA_CONDUIT = IFLA_DSA_MASTER,
>  	__IFLA_DSA_MAX,
>  };

Minor point, but maybe it seems better if we flip this around?

 enum {
 	IFLA_DSA_UNSPEC,
-	IFLA_DSA_MASTER,
+	IFLA_DSA_CONDUIT,	
+	IFLA_DSA_MASTER = IFLA_DSA_CONDUIT, /* Deprecated */
 	__IFLA_DSA_MAX,
 };

 Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew


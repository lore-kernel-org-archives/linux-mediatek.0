Return-Path: <SRS0=Tto8=C2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D44C43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2020 07:33:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05D9A2072E
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2020 07:33:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lZXq1tqj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="OOGU1T9k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05D9A2072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y6IUWQKhKap3CmMJsHcZtlCd3dYR29IxI+NK11B79hM=; b=lZXq1tqjQx9UGwjAEzEZx352r
	swMHr9BZxQ4nAff1HUkLtAPRcvApX9BjWDjieNiJuzMN0euK5tDEUW9YBJYFxP7Xs0wItpLiGS16v
	Q2Jzz9w4/F5La49Xmx0S8+GZ8hTnxCRn77ZFGUCENHcmFUO0hRfr74/KpUhCtXp903q3XvKCak2Vr
	heSCNuY+cYJhMw772+uyqdTAqBiPzzPEONaijMhXni5CXD5kZFNMglAXB74Ss1UeWo8WATm9l1BRi
	WhV7FBx4aqNF9td6c16UV7XAJFY4N2K+1p3DFnQ029p+Poj/Mw2k/dEZkYDODD/VU5wqgdpgV2Abn
	UVMM9K9rQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIoPo-0005ny-QN; Thu, 17 Sep 2020 07:33:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIoPk-0005ma-Uh; Thu, 17 Sep 2020 07:33:10 +0000
X-UUID: d124505e645c4d2f8305fbf92be535c1-20200916
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=cSlCNcl11u7qHTtN7BxhpCgzqViFmJKikDj8COuqZE8=; 
 b=OOGU1T9kbZHyfUTyYSEZ4xcpLiixKJpx9xdV16W1ThP3YNzvqyAdScINoP2cRaA3tasXqbxUK/92B+RC6PDnijMnrH/w1vWlKY9i12d1eCW3bDTP2inY/+9SJEs4iM2eUuU8iy1iYPpYHIBYP7NWG6NbyOtuPcqQ/uK7AoJrLGU=;
X-UUID: d124505e645c4d2f8305fbf92be535c1-20200916
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <landen.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1316167356; Wed, 16 Sep 2020 23:33:01 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Sep 2020 00:32:58 -0700
Received: from [172.21.84.99] (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Sep 2020 15:32:58 +0800
Message-ID: <1600327978.11746.22.camel@mtksdccf07>
Subject: Re: [PATCH] net: dsa: mt7530: Add some return-value checks
From: Landen Chao <landen.chao@mediatek.com>
To: Alex Dewar <alex.dewar90@gmail.com>
Date: Thu, 17 Sep 2020 15:32:58 +0800
In-Reply-To: <20200916195017.34057-1-alex.dewar90@gmail.com>
References: <20200916195017.34057-1-alex.dewar90@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_033309_256209_9106FD58 
X-CRM114-Status: GOOD (  19.82  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Sean Wang <Sean.Wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Alex,

Thanks for your review and fixing.
On Thu, 2020-09-17 at 03:50 +0800, Alex Dewar wrote:
[..]
> 
> If it is not expected that these functions will throw errors (i.e.
> because the parameters passed will always be correct), we could dispense
> with the use of EINVAL errors and just use BUG*() macros instead. Let me
> know if you'd rather I fix things up in that way.
The cpu port setting is passed by dts. Use EINVAL to catch unexpected
setting is fine.
> 
> Best,
> Alex
> 
>  drivers/net/dsa/mt7530.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 61388945d316..157d0a01faae 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -945,10 +945,14 @@ static int
>  mt753x_cpu_port_enable(struct dsa_switch *ds, int port)
>  {
>  	struct mt7530_priv *priv = ds->priv;
> +	int ret;
>  
>  	/* Setup max capability of CPU port at first */
> -	if (priv->info->cpu_port_config)
> -		priv->info->cpu_port_config(ds, port);
> +	if (priv->info->cpu_port_config) {
> +		ret = priv->info->cpu_port_config(ds, port);
> +		if (ret)
> +			return ret;
> +	}
How about check return value in caller function, mt7530_setup() and
mt7531_setup(), too?
                if (dsa_is_cpu_port(ds, i)) {
                        ret = mt753x_cpu_port_enable(ds, i);
			if (ret)
				return ret;
		} else {
[..]
regards,
landen

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

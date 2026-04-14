Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B155F9D0CD
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2026 13:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7SB2FdFz1cnEJeeU7lmGtgbspb+2GXG652NxyTVE25c=; b=rQGfA+Ts4agMizaTvLugzRd8ox
	ah5CVUwh3RY4tTgyBwajotj9UvhR1Jq8jVdIEjpAqX7qBBh/4qV7BFDFgZjZUG26pARsG6T/lkTAE
	5FdwBxXSUyxWWPuUn7QVq04EJSH3gWu7cPk4lbkheK+8MSOrrSZwVR0kcEwAF21E/1OqM9St3V1Ml
	CmQWE8iXT/8bL1Es5EQ434FPSIMv6OtKdf+J2ti/17GPsClSRjjVMMWclBY16mCZxpA8D3jOeBqFe
	dOhtbUVSDs01Bp+JVmeLh1TPTUvTs7Knynj3IbE1mVbdVmtO1J4gzK8pYPjjPZDgPUfBDo7+3pCn4
	HA23WcrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdRd-0000000HLHe-0oll;
	Tue, 14 Apr 2026 13:04:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdRa-0000000HLGI-3Xbc
	for linux-mediatek@lists.infradead.org;
	Tue, 14 Apr 2026 13:04:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776171881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7SB2FdFz1cnEJeeU7lmGtgbspb+2GXG652NxyTVE25c=;
	b=F+ETVXiPx8UQJ805qvIs4CEYvFXOfCNhNHRUOWNlHD1y46sXlsOWSudXq5p9gGcLtTBHwr
	/mfF+TB0jTFJy0ceA7bmwxIvWv0MotNK7vIr+1ZcUN5atWZuSBpqAbjs5gZG6n6ZUt5msd
	keRz0HmWMzh9UfB6VLeM6lwovigswxI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-KtT4dxaiMYe1FOmZ5cqx9w-1; Tue, 14 Apr 2026 09:04:39 -0400
X-MC-Unique: KtT4dxaiMYe1FOmZ5cqx9w-1
X-Mimecast-MFC-AGG-ID: KtT4dxaiMYe1FOmZ5cqx9w_1776171879
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-43d00dd913cso6081592f8f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 14 Apr 2026 06:04:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776171878; x=1776776678;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7SB2FdFz1cnEJeeU7lmGtgbspb+2GXG652NxyTVE25c=;
        b=UrLDFOgVs1d64Cg8DwEUM9tmafBsTnHt5DKG18DYoRVE1z48575aXFYfoGM5vYzgXB
         XxxC4XVy9nNfzktbnfr0YLCZu95NSI9xb/Jh5z/i7WJ5ShjnxYb+QD5Diur+Q4kEzauq
         ws1TeGMY+p+GHEY1oK2daIhtaX+l2WSaAqrYUEzYsjn6aCPEehwTr/NFENnmA4bRUfR7
         SU9Cy5f+SxGlDThvOE8zcMHaUWvdI5cpPGMZ0gln9XyXSC985XiFALb3BT3P3UdlC9SB
         MvZDwtruu9wKUjEEIuxfd8fjdpmtcphnvta2YPCh1t/rDbAVSk5vVfY4RVusqf97sAcd
         a+fw==
X-Forwarded-Encrypted: i=1; AFNElJ/6Y2r+pwngn5Vg2et2Z6kpHwwPQ7PWe32x6Oo8PaIcyiveUGGmJ8fLNDg0ziR1DM3jBne1FfmSB/SN9SaHuw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/tONccS91IMSFh/S/Y2YFmlbusi3q82c91B38fR6Aikhek8dV
	W0zMdIfGImpJJm9f8hdVOP2ewuio0E8I6iAXskSo9S0isI09MyqAKj19XC1L0bbPEeBbltXbRI1
	0qATSYdVXH2VqnI3UNyP14dHyJMFQBzmGA3k/j+K3aYaMsN/r7XsCyACiZqhEd/iRVbJs2bnPfI
	yzJWUKbg==
X-Gm-Gg: AeBDiet9hrq5VUACgJrJpChmrzAZAzriVYgHVd6ROMmpSHPmBOGYsDb/DbFV9nVG56o
	KZonYgQXtjIhdqJQHUHXDU8JpXzzhKy3XOQ1rpZa/C0r2VesMrrpm7KRra6P3uFM8Lzt4S6P9Yt
	3WcRenAJFn/lg9C9FE8D0OTn/UaHD8qkHv12Y3+A3W5oKdIL6la8vkT5HrHqIqxmmumkYIgpnKk
	rvYoxDvoXK2nZR6R2BaLIpZg1tY1/4VFXjmb304eqEoPiJ3mYqNNbDW/smHetMsdqZhK7VDL6lt
	izZotaopTrEJS0GHSNdwcORYqH2DwkfDIBP5Ka7JjiQRHTzg4SxzeYIZLr4sKsn+t62jaTg4m72
	AaYNHFScbdvDJ8U6Z3Uifd1NVqff+NGGo2g6zKI3fogcMCnzJH83UgNHU
X-Received: by 2002:a05:6000:2f88:b0:43e:a69b:d818 with SMTP id ffacd0b85a97d-43ea69bda81mr3521169f8f.38.1776171877506;
        Tue, 14 Apr 2026 06:04:37 -0700 (PDT)
X-Received: by 2002:a05:600c:820a:b0:488:b675:360f with SMTP id 5b1f17b1804b1-488d6889a6bmr214737225e9.27.1776171861891;
        Tue, 14 Apr 2026 06:04:21 -0700 (PDT)
Received: from [192.168.88.32] ([216.128.11.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67b128dsm200877535e9.2.2026.04.14.06.04.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 06:04:20 -0700 (PDT)
Message-ID: <5767dffc-26e7-40da-8be9-46b878795a85@redhat.com>
Date: Tue, 14 Apr 2026 15:04:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: airoha: Fix max TX packet length configuration
To: Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
References: <20260412-airoha-fix-max-mtu-v1-1-333030d0a564@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260412-airoha-fix-max-mtu-v1-1-333030d0a564@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6vrSLCp5oYwMT64vPCIcGVaupK1wOzk9y-EUDkzd1BQ_1776171879
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_060443_021742_B0719023 
X-CRM114-Status: GOOD (  13.11  )
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

On 4/12/26 10:09 AM, Lorenzo Bianconi wrote:
> According to the Airoha documentation, REG_GDM_LEN_CFG() register does not
> include FCS length. Fix MTU configuration removing ETH_FCS_LEN from
> maximum TX packet length configuration.
> 
> Fixes: 54d989d58d2ac ("net: airoha: Move min/max packet len configuration in airoha_dev_open()")
> Fixes: 03b1b69f0662c ("net: airoha: Introduce airoha_dev_change_mtu callback")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
> index c14cdce588a7..a81ffda72b39 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -1629,9 +1629,9 @@ static void airoha_update_hw_stats(struct airoha_gdm_port *port)
>  
>  static int airoha_dev_open(struct net_device *dev)
>  {
> -	int err, len = ETH_HLEN + dev->mtu + ETH_FCS_LEN;
>  	struct airoha_gdm_port *port = netdev_priv(dev);
>  	struct airoha_qdma *qdma = port->qdma;
> +	int err, len = ETH_HLEN + dev->mtu;

Sashiko noted that the above may cause regressions, dropping max MTU
vlan frames.

/P



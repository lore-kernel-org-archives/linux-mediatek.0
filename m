Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41946C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jul 2022 09:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f6sBKLrVXYlyxkScgL1jtWjKEqDacx9EU64k8Ml2D4o=; b=R515ahCakrP9iX8HNxLZYCCYsh
	7JMKKA7wXU8VzHKW8XsQGdCpDBnaZGAp2/DVnI3Mj7Dy3aezEDtCLsOMlQY6BuC+P3F059CZAoyeQ
	o3kI63p43wDbMyG7ddSlW11ezmd8m0DbdF9vA7ywUAyALI++vnsrtEVRGJHSMwS71s+EoEuFw3Dw/
	+dh+JGFtcb0LGHbFufgyGKes5oOvsZFYMeZx12nFuRmXVmte1U+EqiemfEeo+BlV6Vax5FnqYm2EZ
	e4DtlGassDqMF6+u5v4H7mYNyLwYaseoCI2XcIndoCfOSSKoi4yZswqxOUao2jr9nLakpZF6MfrQz
	ikgYzhqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDjSb-007Ij5-GZ; Tue, 19 Jul 2022 09:24:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDjR5-007Gpu-2T
	for linux-mediatek@lists.infradead.org; Tue, 19 Jul 2022 09:22:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658222552;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f6sBKLrVXYlyxkScgL1jtWjKEqDacx9EU64k8Ml2D4o=;
	b=jR/+MFVL0yu6JudP7RD1l/H/E+ha+cbPtxYX6vvaeQUvjq0F1d8xoHMbQdCvt0anHCIJ+4
	CcvCyO8s8XKUb+eWRZof0wXR2awBwpuIerJhOU6rXSORKv7lWW79Ylt/8j+8shekJeae+A
	gnGnQ7dXSSgczvfSl5cG9NSPDvqOLUA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-_xrFAkM4MwOlBHNj1HNwbw-1; Tue, 19 Jul 2022 05:22:31 -0400
X-MC-Unique: _xrFAkM4MwOlBHNj1HNwbw-1
Received: by mail-qk1-f197.google.com with SMTP id n15-20020a05620a294f00b006b5768a0ed0so11237742qkp.7
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Jul 2022 02:22:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=f6sBKLrVXYlyxkScgL1jtWjKEqDacx9EU64k8Ml2D4o=;
        b=6srr8yKUmnqW+SuVsBv0wN7hVEpHbLbng7HanpPxl0LYkyCi//sdv0sNIMkL7RyzAM
         SYgqGYmk0ruGSbQt+RKlPZCqBH5qL5qOHKsOPvQxJD1yTi/WcCs/ZMen91OU/bpN1OYz
         tE5ntjztZ6xtPqAbkcX0m0lsLoc40p4U3k9o/UUjRnN5wJq5pYSKC2y/3i+Ow1Xb9dkl
         mTabSn8rQLlpowpDGYJ0hi5SPisyCNRV+8jQSIA3YrtqZZBP+Ox+iFk9Jm/0xRwfGRr+
         QxE5dp76C4sPDrqaLdhOKc7zyv98OAuW+kJI8O5xhnjca+Y45j43shjpu5yUDsNRh0H0
         3fJg==
X-Gm-Message-State: AJIora+I+gONyCjUjgdGHSm+j7UHnelheTHAS39xI6GHOXlCrQNNq/uX
	tFXQL1GiK3JRwltRWaDzcxqcgQ50LB9feWjP9y6lPuKuvrj9CTLqSgJetisZMchSh2uQheU4WlB
	hkRVXhOfXhZuqns9INO5nJGuCfAQFG9gv
X-Received: by 2002:ac8:5a4d:0:b0:31d:c63:5637 with SMTP id o13-20020ac85a4d000000b0031d0c635637mr24267819qta.102.1658222550601;
        Tue, 19 Jul 2022 02:22:30 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ta6RBeMCca4dcr7N4HKWm9/CbhNzTlB7iOKWildOahnuuuK5LJ69MgTFKI2a0pLvQcNMl5Ow==
X-Received: by 2002:ac8:5a4d:0:b0:31d:c63:5637 with SMTP id o13-20020ac85a4d000000b0031d0c635637mr24267796qta.102.1658222550359;
        Tue, 19 Jul 2022 02:22:30 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-104-164.dyn.eolo.it. [146.241.104.164])
        by smtp.gmail.com with ESMTPSA id t18-20020a05620a451200b006a6b374d8bbsm199262qkp.69.2022.07.19.02.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 02:22:29 -0700 (PDT)
Message-ID: <5b6d4061bd12a9079e882742c750962816ee6567.camel@redhat.com>
Subject: Re: [PATCH v3 net-next 2/5] net: ethernet: mtk_eth_soc: add basic
 XDP support
From: Paolo Abeni <pabeni@redhat.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>, netdev@vger.kernel.org
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com, 
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com, 
 kuba@kernel.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org,  ilias.apalodimas@linaro.org,
 lorenzo.bianconi@redhat.com, jbrouer@redhat.com
Date: Tue, 19 Jul 2022 11:22:26 +0200
In-Reply-To: <b4c7646e70b1b719b8ae87a90bb8e4cf57b1a26d.1657956652.git.lorenzo@kernel.org>
References: <cover.1657956652.git.lorenzo@kernel.org>
	 <b4c7646e70b1b719b8ae87a90bb8e4cf57b1a26d.1657956652.git.lorenzo@kernel.org>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pabeni@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_022235_235622_D0B9B696 
X-CRM114-Status: GOOD (  13.31  )
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

On Sat, 2022-07-16 at 09:34 +0200, Lorenzo Bianconi wrote:
> Introduce basic XDP support to mtk_eth_soc driver.
> Supported XDP verdicts:
> - XDP_PASS
> - XDP_DROP
> - XDP_REDIRECT
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 147 +++++++++++++++++---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.h |   2 +
>  2 files changed, 131 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index 9a92d602ebd5..bc3a7dcab207 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -1494,11 +1494,44 @@ static void mtk_rx_put_buff(struct mtk_rx_ring *ring, void *data, bool napi)
>  		skb_free_frag(data);
>  }
>  
> +static u32 mtk_xdp_run(struct mtk_eth *eth, struct mtk_rx_ring *ring,
> +		       struct xdp_buff *xdp, struct net_device *dev)
> +{
> +	struct bpf_prog *prog = rcu_dereference(eth->prog);

It looks like here you need to acquire the RCU read lock. lockdep
should splat otherwise.

/P



Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8660C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 14:46:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C65260F45
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 14:46:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C65260F45
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IZ99o/sVOfMPBTMYkTwM563DOPbKlrHpM8U8QoTVqKs=; b=W5UXB8RpK/NicW
	xgkuDVfbE1/TQSH5DGwR8sYkENzC7QyhsEMUfLIvsQqgKzboVIAuOwdou51oW/2kaw4dv2TWlT1Ye
	9q7Q2wH5njDwZAMcwDZcKu5QXe+rPZsFXBRYmPHC4XiV6ZwWZ8+/5y478I94dY6EN7LoDjBrBmz75
	Bh9cOLjj2pWnjTbgeAhyfnW3IryCsnm7jH+eWuGLD9JbdcSAOtFN0/BBluQx9FBTb7lq3IUWRFAJH
	LXGU85waJTOvUsB6Yi/UQgISThPF2Heb6jRY17laNqx1/7fX9kO6PAYkzjXc4UU/XuzfwFxrf9O+a
	75NtigYDzLhP6eiNFTEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAvgH-003GEy-82; Tue, 03 Aug 2021 14:46:09 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAvg4-003GCp-0M; Tue, 03 Aug 2021 14:45:57 +0000
Received: by mail-ed1-x536.google.com with SMTP id f13so29235665edq.13;
 Tue, 03 Aug 2021 07:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nLjEw0HuIJj34h6UU+m/vkoLg+whogx5QH5dKh0TA1A=;
 b=aRSQXGQlKK76xI1w7OSHP7cBvNpZGU15KzeZeqH3cDl0kUuLvC+B6xNdkO9Clg7xz0
 mPshYEYJEX5GYkJKW7r4yuNGmHjdkF+m5umM/PFmOzyqBgRTRR5CNp+rUE+SlNE4Izb1
 3Q+KGc8vOZ/yq/Ya8otsRjhq7+jGjifH2quonMlY8pcsnROXYXZ8GhfQ3tllyodcKEtv
 Py4WnMQOxX3kgM7a1VeVrXRBGi13NRSfswqfY6Cy92vh1T2Md6dY9sjFEonJpzNcIymp
 CbUzCMHCa58RAmB3KpdrbD3NlmQwJSg/jDo+gBnTEMidK4w+eqYJWRXK0H1qvapkj7IJ
 1cSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nLjEw0HuIJj34h6UU+m/vkoLg+whogx5QH5dKh0TA1A=;
 b=CjjQ+WDslV0fElVTmjS4obVpJ6yS1/CFR1INQisE9CD7xFhumBPHZ29WvxccHs/PAp
 FXreql1ZIH/UmJhPFKRJvtAZBx/alCESgysKeWQ4xEt9NtZvQcyfENqLyFv+NI67+zWc
 fGwNgISZqxZKQxdqHMX639TTDYoxhvqeyvf49AjhChgiMno8p3xvjU/7JizEOBCk6za/
 7T0AAk5B6QtIAbyGVq5ntu3+F5NLgSaJBe7EaS9tlmuPqPNTa/1e8pIJNKPUkMFprL0f
 RLzbDbGZFEg7dsCOAO6LZYFKwcGrnMqTsDAjBCUPedxKvMexgNI6w+v7nMoIfycZjahb
 lcEQ==
X-Gm-Message-State: AOAM532ULA9kIcIHUxUF84brvwM5gJcJMnSoE72QfVhnpWMPAVIfksOE
 eIf0JUS/BubKIKfLOQzloQs=
X-Google-Smtp-Source: ABdhPJysB/KYPljDZl8pqFu38R/m8VQYjciFVwRM65/pDUF9OZlb1yM/kbSAt6w9AUrYvkrXO4OxWw==
X-Received: by 2002:a05:6402:270f:: with SMTP id
 y15mr25959942edd.65.1628001954301; 
 Tue, 03 Aug 2021 07:45:54 -0700 (PDT)
Received: from skbuf ([188.25.144.60])
 by smtp.gmail.com with ESMTPSA id cm1sm8246886edb.68.2021.08.03.07.45.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 07:45:53 -0700 (PDT)
Date: Tue, 3 Aug 2021 17:45:52 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Eric Woudstra <ericwouds@gmail.com>,
 =?utf-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: Re: [PATCH net-next 4/4] net: dsa: mt7530: always install FDB
 entries with IVL and FID 1
Message-ID: <20210803144552.fluxxfoey2tbqyyu@skbuf>
References: <20210803124022.2912298-1-dqfext@gmail.com>
 <20210803124022.2912298-5-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210803124022.2912298-5-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_074556_102681_BD8890F7 
X-CRM114-Status: GOOD (  24.46  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Aug 03, 2021 at 08:40:22PM +0800, DENG Qingfang wrote:
> This reverts commit 7e777021780e ("mt7530 mt7530_fdb_write only set ivl
> bit vid larger than 1").
> 
> Before this series, the default value of all ports' PVID is 1, which is
> copied into the FDB entry, even if the ports are VLAN unaware. So
> `bridge fdb show` will show entries like `dev swp0 vlan 1 self` even on
> a VLAN-unaware bridge.
> 
> The blamed commit does not solve that issue completely, instead it may
> cause a new issue that FDB is inaccessible in a VLAN-aware bridge with
> PVID 1.
> 
> This series sets PVID to 0 on VLAN-unaware ports, so `bridge fdb show`
> will no longer print `vlan 1` on VLAN-unaware bridges, and that special
> case in fdb_write is not required anymore.
> 
> Set FDB entries' filter ID to 1 to match the VLAN table.
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> ---
> RFC -> v1: Detailed commit message. Also set FDB entries' FID to 1.
> 
>  drivers/net/dsa/mt7530.c | 4 ++--
>  drivers/net/dsa/mt7530.h | 1 +
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 8d84d7ddad38..ac2b45e472bd 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -366,8 +366,8 @@ mt7530_fdb_write(struct mt7530_priv *priv, u16 vid,
>  	int i;
>  
>  	reg[1] |= vid & CVID_MASK;
> -	if (vid > 1)
> -		reg[1] |= ATA2_IVL;
> +	reg[1] |= ATA2_IVL;
> +	reg[1] |= ATA2_FID(1);

Maybe it would be good to resend with a set of #defines for the
standalone/bridged port FID values after all, what do you think?

>  	reg[2] |= (aging & AGE_TIMER_MASK) << AGE_TIMER;
>  	reg[2] |= (port_mask & PORT_MAP_MASK) << PORT_MAP;
>  	/* STATIC_ENT indicate that entry is static wouldn't
> diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
> index 53b7bb1f5368..73b0e0eb8f2f 100644
> --- a/drivers/net/dsa/mt7530.h
> +++ b/drivers/net/dsa/mt7530.h
> @@ -80,6 +80,7 @@ enum mt753x_bpdu_port_fw {
>  #define  STATIC_ENT			3
>  #define MT7530_ATA2			0x78
>  #define  ATA2_IVL			BIT(15)
> +#define  ATA2_FID(x)			(((x) & 0x7) << 12)
>  
>  /* Register for address table write data */
>  #define MT7530_ATWD			0x7c
> -- 
> 2.25.1
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

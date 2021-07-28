Return-Path: <SRS0=pZ6D=MU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79192C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 18:48:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3864D60525
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 18:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3864D60525
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JkfKra3hQEU1fwUvPyP0yaGfv9JgajdkBC0XyyR3Wnw=; b=Jfsk98iiM/soO3
	XZV0GTh3mWpm3YelJnGdLMpqnLM31VfITS6AMJg5gUYO8SfeSK6rOBYtuT7egaX5l1q7r2vElfMJl
	16Nl4VOIYD6Na/iw7VpcioKYCAkDRM44AcmCHaF2xItaSOr011JjPqdhpKP4ZlpZYN7v4C4jszJqF
	GgJzVbPB5BKzAUosuNNzczQdlvgAd2wXIJGITs2xJtyBKdKSvvVTtpiICumqnbzLdRcyLb2YcGIcA
	Vfh6X36LfT4x0her0ZDL6stoY12YkNAcibyKY33FYrR7QkJlhokTZ++PUJ5T6W4z8NFe75PAamkLh
	SLkDNZx01ujSvIsvjT0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8obA-00284q-Pm; Wed, 28 Jul 2021 18:48:08 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8oao-0027vy-7e; Wed, 28 Jul 2021 18:47:47 +0000
Received: by mail-ej1-x631.google.com with SMTP id jg2so6287052ejc.0;
 Wed, 28 Jul 2021 11:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rw1im/4KKTL6GDAfF73CRmLTIbz+OF0JjH7lHeKRYlQ=;
 b=hWEENPPhfpw22zsbzZ+sNGX02aq9HWzFfb5S7Ijrz+11UNSRxaa9/ecl0m+g9VEP2Y
 rKIqH/43TbQdMF1LM4YmM0g5/9r+KTJpZPotC7M0ZoODR7QFYX4Ofb72bKk9SO/GZUN6
 BNN9xgO88X2kMLgdplL6z8TQ3w8Oi2MnhSriiXejlK4grTZEDpoTnJwDI68O6obM2gna
 bVntCdmHPZaljVwCLCRIHSyf27AR9iS51V8hoLMzg1mQ2m33GqAk/d+HcqRhUdsURAOd
 fqQlUawCvnZfoOKOdoY0R0Jy8DgOaMzEgMbNlu0QPjJzu+SM8M58zrPOUEyxgO/wnup3
 k7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rw1im/4KKTL6GDAfF73CRmLTIbz+OF0JjH7lHeKRYlQ=;
 b=cjlufuA2mibSoosT877IjMnSf+IZNdDN8KGmtzHg5aUjp2Eyu6xkq5wInE6tC/FrQh
 GOHCWU6xFH0rOqczS1Kn7XZv3unxhrhPvys1dvC3vmN8+4bTC0aUApVFUgEJRaKRv2Pq
 QWteSsa2J8x5pHL5b3s3QNoYMgJ14GkGUAkrLeu3UoOxu0VWQs8l7NHvkXzMB6/fM45V
 nGKXBff5ubHLPg7D96MTjpgg9/uZH++d0AX/2erstcqn5xw/bBhLjLdZpJslzVa+NZb4
 mmp5g2Mv15eQbgyYEnmzdWMZA+bTbk3k1RU0AQRrrOGqlegMwufyKxs5WwUGz6+UP93b
 uwvw==
X-Gm-Message-State: AOAM533DnkrG9hF7clU77gPfYnb55ShUerwtzFZnQu2KuyxvpwP+JZCW
 TLD872zNEqBUgj6H8J4IV1E=
X-Google-Smtp-Source: ABdhPJyrA1FU5+Q1j3pmfXnRdR9xvKtg4sq1W9c+KbbUMEyrWKfBM3aem+xcjtncDkPRLpxOUbVyrA==
X-Received: by 2002:a17:907:2d28:: with SMTP id
 gs40mr815302ejc.193.1627498064631; 
 Wed, 28 Jul 2021 11:47:44 -0700 (PDT)
Received: from skbuf ([82.76.66.29])
 by smtp.gmail.com with ESMTPSA id i11sm175324ejx.82.2021.07.28.11.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 11:47:44 -0700 (PDT)
Date: Wed, 28 Jul 2021 21:47:42 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC net-next 2/2] net: dsa: mt7530: trap packets from
 standalone ports to the CPU
Message-ID: <20210728184742.cyoh7ucvxwlbdpnu@skbuf>
References: <20210728175327.1150120-1-dqfext@gmail.com>
 <20210728175327.1150120-3-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210728175327.1150120-3-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_114746_310358_BE634B29 
X-CRM114-Status: GOOD (  12.27  )
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

On Thu, Jul 29, 2021 at 01:53:26AM +0800, DENG Qingfang wrote:
>  /* Register for setup vlan and acl write data */
> @@ -153,6 +162,35 @@ enum mt7530_vlan_cmd {
>  #define  PORT_MEM_SHFT			16
>  #define  PORT_MEM_MASK			0xff
>  
> +/* ACL rule pattern */
> +#define  BIT_CMP(x)			(((x) & 0xffff) << 16)
> +#define  CMP_PAT(x)			((x) & 0xffff)

not used

> +
> +/* ACL rule action */
> +#define  ACL_MANG			BIT(29)
> +#define  ACL_INT_EN			BIT(28)
> +#define  ACL_CNT_EN			BIT(27)
> +#define  ACL_CNT_IDX(x)			(((x) & 0x7) << 24)
> +#define  VLAN_PORT_EN			BIT(23)
> +#define  DA_SWAP			BIT(22)
> +#define  SA_SWAP			BIT(21)
> +#define  PPP_RM				BIT(20)
> +#define  LKY_VLAN			BIT(19)
> +#define  ACL_EG_TAG(x)			(((x) & 0x7) << 16)
> +#define  ACL_PORT(x)			(((x) & 0xff) << 8)
> +#define  ACL_PORT_EN			BIT(7)
> +#define  PRI_USER(x)			(((x) & 0x7) << 4)
> +#define  ACL_MIR_EN			BIT(3)
> +#define  ACL_PORT_FW(x)			((x) & 0x7)
> +
> +enum mt7530_to_cpu_port_fw {
> +	PORT_FW_DEFAULT,
> +	PORT_FW_EXCLUDE_CPU = 4,
> +	PORT_FW_INCLUDE_CPU,
> +	PORT_FW_CPU_ONLY,
> +	PORT_FW_DROP,
> +};

not used

> +
>  #define MT7530_VAWD2			0x98
>  /* Egress Tag Control */
>  #define  ETAG_CTRL_P(p, x)		(((x) & 0x3) << ((p) << 1))
> @@ -164,6 +202,23 @@ enum mt7530_vlan_egress_attr {
>  	MT7530_VLAN_EGRESS_STACK = 3,
>  };
>  
> +/* ACL rule pattern */
> +#define  ACL_TABLE_EN			BIT(19)
> +#define  OFST_TP(x)			(((x) & 0x7) << 16)
> +#define  ACL_SP(x)			(((x) & 0xff) << 8)
> +#define  WORD_OFST(x)			(((x) & 0x7f) << 1)
> +#define  CMP_SEL			BIT(0)

not used

> +
> +enum mt7530_acl_offset_type {
> +	MT7530_ACL_MAC_HEADER,
> +	MT7530_ACL_L2_PAYLOAD,
> +	MT7530_ACL_IP_HEADER,
> +	MT7530_ACL_IP_DATAGRAM,
> +	MT7530_ACL_TCP_UDP_HEADER,
> +	MT7530_ACL_TCP_UDP_DATAGRAM,
> +	MT7530_ACL_IPV6_HEADER,
> +};

not used

> +
>  /* Register for address age control */
>  #define MT7530_AAC			0xa0
>  /* Disable ageing */
> @@ -192,6 +247,7 @@ enum mt7530_stp_state {
>  
>  /* Register for port control */
>  #define MT7530_PCR_P(x)			(0x2004 + ((x) * 0x100))
> +#define  PORT_ACL_EN			BIT(10)
>  #define  PORT_TX_MIR			BIT(9)
>  #define  PORT_RX_MIR			BIT(8)
>  #define  PORT_VLAN(x)			((x) & 0x3)
> -- 
> 2.25.1
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

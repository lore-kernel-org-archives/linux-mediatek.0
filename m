Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D220CA101F
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Sep 2025 08:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/L/ZiHIMyXmxKkiSLCWK4pWAdvwcf6C/7sfjkt+r2Zs=; b=Rd1JiFmaY+paKQrbmrkxQbutv9
	3NtCEV7K9Zkm1YzZi32OuEi3lA2Pt+YxvE5LOWjiR2RxT61xODKRWo+lrm5pvEK6OqqN94vpbwqzO
	V4eTpMM0pwiYGr8daa593hOZUTQvxIVkyBlnlvbEHbbGz8WLrEScHp/PmtGb5tFcUSzdlXr0kofmb
	ZSmzx9lDHmygkSsB2eoQFMZHEwr5rK4Q6pRgker2yE0HxBD+SFOLJdkfLG3BIC6dQn/DZWkl2rhzs
	HuZICVCOlwfciTWPW3s/U4+65o5DPCESvQFEVPs0kywFuKBM2KOYrxB4cKPCojxKY+x0VpWjstsiZ
	fZJedx6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwG42-0000000Cs4U-0KAm;
	Wed, 10 Sep 2025 08:20:26 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwG3z-0000000Cs3e-0vkr
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Sep 2025 08:20:24 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b0419ea6241so70733066b.3
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Sep 2025 01:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757492421; x=1758097221; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/L/ZiHIMyXmxKkiSLCWK4pWAdvwcf6C/7sfjkt+r2Zs=;
        b=k7QDAykrqpEZ+kuWThsDvjjlqLDEvtl3pfgdH7GB0/89gH3Ey75EeTRUecl8Yo2hT7
         AHEt2EHCU5ctdBy3WNFBXpmHHcHIdyQ9IvdI7h8huqY7ptePG0UV0yeOWtkdSBR6hJDO
         UMfaH53UY4BQbzMHVlYzjEiF8SQgkP/xp8uBvetG/WyChggrIYMz1YH4QZoWYWYNlYnP
         cxgUtR0JYpn1kcLuNC28bTwwzKd1mQuhNo9mxlLwtPilHsUct5VPGRtdoFuJ7TfHt0IO
         lQmnV/5K+cOC49m9XADfLpyhOjO90RUQQ7UV7oEzByyydUrV/BfqYYLMdE6URQ4YwHUD
         HJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757492421; x=1758097221;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/L/ZiHIMyXmxKkiSLCWK4pWAdvwcf6C/7sfjkt+r2Zs=;
        b=xJ7ROCFqYgM13XYEg405qn+/l4anRYS1dMaK5BItGYPblIy0XHPKsDpUXEQGRnjayI
         PGq2bOe1SfairDQDSbuVaoKUwDxE9BdnulvdY3iao8aYK4NSIIlTaURgXjyGKW2QsIXE
         fEGx3ETZDGlWirRdzqVvAFmhFF9C5Pk68JNiurgQi/m6m8mZYUSVsYeOgYqJzBQiy7zn
         3A2u83AsBCbXztMCQcnC6DxvNx1GXOWCbftgs86uyYbS5q4rggQf4LHydp7aFgM8mTT/
         V7XyvqHlbKDbIlNtxJQy2/IPhPHg0bHcyKrHEfaKxcVYuVf2BrIKeREcJGZ8rY/49SUg
         GODw==
X-Forwarded-Encrypted: i=1; AJvYcCU2WAkBhO4vGHRVCOHc/Pg8KFluxWLw9XEj4uQynFbgX1tYQTc9/WedJkVgzuaNJEtUiNuEIUV8Lg7UOxfPyw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWmE4QnfEVtjMnKYCl112SxKRuOl1Evl03ApKuiWO14cWml6pd
	hd4TstnvF2vbYnv8JsRnxvanLREkhup9ixrKWkd4+/DzJD+QbfIQlWx3
X-Gm-Gg: ASbGncvJErdSUKiDBVspp0RYlZo5wH3dUKtkfmhzmr4GCmQVIw+7OOnu+ofrEf1TOjP
	O/+8zL646Djg86K0LzSIcYORoMpEwtsRRQERkHbo8IkSF4M5QWAWe1uz/ksit1maX7lXivrRvVo
	v2ZA7ncgl0ZwzwFFaAg2rPsSnXhHtw5B1Gn1jF8/5+6FG31PMNeXPjau1XJwNnaD3mFuPIArGQM
	IoTF25NU3CdXomp95mqOpyB9J2+rrOcObB5PECTbGeKMCG9OKwpUVQormAeZdjFS4U00HU0DIUW
	rHJEKuoHwmflFFTJwoqsGZN1kLR8xY263zToRuPVWjfoOWmC0pnonkgK/J7EvA7w5ohFMVhocUa
	P6WOBqWEgKLKgxyfxVq6TmMFqxQ==
X-Google-Smtp-Source: AGHT+IEZ6Y8m9czCHfXyGir/VeA90+bvrcMtK66llF0DDBp7AdUVUAE+7FZ2p8xLZJOlSOvaso7zZw==
X-Received: by 2002:a17:907:9718:b0:afe:b131:1820 with SMTP id a640c23a62f3a-b04b155985emr758644266b.6.1757492420788;
        Wed, 10 Sep 2025 01:20:20 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d005:3b00:6669:35e7:fc93:9b1c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07833ffa91sm122826066b.91.2025.09.10.01.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 01:20:20 -0700 (PDT)
Date: Wed, 10 Sep 2025 11:20:17 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Simon Horman <horms@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [net-next PATCH v16 10/10] net: dsa: tag_mtk: add comments about
 Airoha usage of this TAG
Message-ID: <20250910082017.hjlq3664xvg5qjub@skbuf>
References: <20250909004343.18790-1-ansuelsmth@gmail.com>
 <20250909004343.18790-1-ansuelsmth@gmail.com>
 <20250909004343.18790-11-ansuelsmth@gmail.com>
 <20250909004343.18790-11-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909004343.18790-11-ansuelsmth@gmail.com>
 <20250909004343.18790-11-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_012023_274287_DCB58176 
X-CRM114-Status: GOOD (  20.93  )
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

On Tue, Sep 09, 2025 at 02:43:41AM +0200, Christian Marangi wrote:
> Add comments about difference between Airoha AN8855 and Mediatek tag
> bitmap.
> 
> Airoha AN88555 doesn't support controlling SA learning and Leaky VLAN

Is there an extra 5 in AN88555?

> from tag. Although these bits are not used (and even not defined for
> Leaky VLAN), it's worth to add comments for these difference to prevent
> any kind of regression in the future if ever these bits will be used.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  net/dsa/tag_mtk.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/net/dsa/tag_mtk.c b/net/dsa/tag_mtk.c
> index b670e3c53e91..ac3f956abe39 100644
> --- a/net/dsa/tag_mtk.c
> +++ b/net/dsa/tag_mtk.c
> @@ -18,6 +18,9 @@
>  #define MTK_HDR_XMIT_TAGGED_TPID_88A8	2
>  #define MTK_HDR_RECV_SOURCE_PORT_MASK	GENMASK(2, 0)
>  #define MTK_HDR_XMIT_DP_BIT_MASK	GENMASK(5, 0)
> +/* AN8855 doesn't support SA_DIS and Leaky VLAN
> + * control in tag as these bits doesn't exist.
> + */

I think it would be good to present the AN8855 tag using a different
string, so that libpcap knows it shouldn't decode these bits. The code
can be reused for now.

>  #define MTK_HDR_XMIT_SA_DIS		BIT(6)
>  
>  static struct sk_buff *mtk_tag_xmit(struct sk_buff *skb,
> -- 
> 2.51.0
> 



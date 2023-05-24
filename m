Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01CDFC7EE2C
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 May 2023 14:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FyedHscGEFlAyTcL2YX1NQlnWA/wiw8R69Wx/wJ/hdc=; b=UuKmjE4fYvcQASJAyIepjVMVyD
	oRO7NnIhJVm76fLq5r7oRzIIBs7pq/bI2tYNpLcAVBQ57MNuzq5Ud2//Y8DZnBkoR+4dh5RBevtK3
	ItPzqJsURTqhfIkSp0jxOqDeM/KNLmWtjfnjBYxP97NsgJbrn5O9vF0YmJfnVVkc7pcUGYnPbjBM4
	S5/kle7nceD5V7DdM7kmovcc7WonESyGF/mTETn1SIvC/wcf8aV2Y8mRQMX/FX9JleTrfhX5hGdaP
	44SCIKjJw+jVRe8E0iIsje+Yjm7L7r5kc9MuUxd2x9kMrjNtrs6bwqnUFyjrPKiclzVAX5B8b1q34
	yGDTa3gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1poI-00Djjg-1w;
	Wed, 24 May 2023 14:49:54 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1poF-00DjiY-3A;
	Wed, 24 May 2023 14:49:53 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-96f53c06babso188036466b.3;
        Wed, 24 May 2023 07:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684939790; x=1687531790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FyedHscGEFlAyTcL2YX1NQlnWA/wiw8R69Wx/wJ/hdc=;
        b=RV82gdRnlL16Wu65qUhDbXspGrdeIIJWl7xoa/6zOSti527MJevjRimiCUzTPziFZO
         LXQF1ZDTV/3/zcamdtRZz8ZjTaCRwsRV9S4pFZ5uklNReyQaGjFVv3TJgM4bAWXjYWza
         5scM0fGoMJ8KHYC5sOXZKcIu/O7oNwIojF7xr6ksdH8Y/wsUh0ZyAQ63d0autUHNZ+2u
         twl1rjWsIe9uU1TwygoWEQUSMnIkZxXuGB36/3ZQrCHItcfEfFNz/Ks7G+2HWFII+w15
         iVvlxK9KgFPbc/ltVEXrdiH94N3tysE4hkZxe5PjKCfJbv7tdp0ZDa1jmwaj+2d0e82d
         h0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684939790; x=1687531790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FyedHscGEFlAyTcL2YX1NQlnWA/wiw8R69Wx/wJ/hdc=;
        b=j1CZTV5e/mXWXyJJW7VKxcoeXP0LWIjGUsl2wpelK1NopSA9ZEIMehtQbU5CEX349p
         8wXz3+ajEV2ZnmvEkVMo/W+Xjcfe8qvhLEfRvcnmZcxhvOtNfuYs913ApZMitQv7JWM3
         VLmv/+mVshaPviBjOLcA+jCYujgLApp+HWZfoRk5qUOfSyLdr4mI1HLFoxVFYbKorg0O
         mdXY5oCfuLC6dVLf8hMsX7A1UyPiE4g63twRXyYIfF1NIZ5ed+6Gb6oPjZQtzPaCnflq
         /tmOm65WzhYvxaBUnPfWJRlS8DvODYLm+JCeNwAbTtj/w4YFNnaM8wENQ8aVI3vv+muo
         GmiA==
X-Gm-Message-State: AC+VfDzk6d/iF0OSsOCWWbMKk7AQp0aFB/e3o81gFZD/ggCqewNNfUNH
	5NWsmCFXg8g7YzqQMO/v1H0=
X-Google-Smtp-Source: ACHHUZ5f5jpmlXfXl69c8NP7gio6BtFCBwM5CIosxzVdgEMVR+GMD/bINdQsFaYe/W+T8c0ISQL5aw==
X-Received: by 2002:a17:907:9308:b0:969:fc68:fa9a with SMTP id bu8-20020a170907930800b00969fc68fa9amr16755972ejc.40.1684939790273;
        Wed, 24 May 2023 07:49:50 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id z27-20020a17090674db00b0096efa536229sm6055956ejl.149.2023.05.24.07.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 07:49:50 -0700 (PDT)
Date: Wed, 24 May 2023 17:49:47 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: arinc9.unal@gmail.com
Subject: Re: [PATCH net-next 04/30] net: dsa: mt7530: improve comments
 regarding port 5 and 6
Message-ID: <20230524144947.tdpwdvcssjkr7efu@skbuf>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-5-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230522121532.86610-5-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_074952_015591_B8AB4CC8 
X-CRM114-Status: GOOD (  13.20  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, May 22, 2023 at 03:15:06PM +0300, arinc9.unal@gmail.com wrote:
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 024b853f9558..b28d66a7c0b2 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -2499,7 +2499,9 @@ static void mt7530_mac_port_get_caps(struct dsa_switch *ds, int port,
>  			  config->supported_interfaces);
>  		break;
>  
> -	case 5: /* 2nd cpu port with phy of port 0 or 4 / external phy */
> +	case 5: /* Port 5 which can be used as a CPU port supports rgmii with
> +		 * delays, mii, and gmii.
> +		 */

Please put the comments on dedicated lines:

	/* Port X can be used as ... */
	case X:


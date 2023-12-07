Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9607C4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 18:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kigIueQOAcLn75XXfZ0Gwh0kRvsokZ/Ypm7K8+pRm4g=; b=0nYBsFSjAvGDg8DkzASuPXBG/v
	5pp7AaYLpjGCOUTKBEZLyCAGqTiW75fsdESuV1d+TPOpXFzz8BUIVTNBjjZIaPELmx8TvSpwEB5uF
	hUshpUQOJy248xvNU4h4anT+BVuS3T3LtuYhIfeNI6OpYvXb12Jn6vcLB7IfPKaXw/00ARwTcx+E6
	SUF4LAMye6v3U52ZcWTIlyFs4uNAiQ2+RNueqrhmWR8Vd8XPF1bpZAogOrj2fDeGy/TH/1JajLz3g
	oH4DUaQsHv/7onMwfACPwVqUvojRqWmLQYt6V9e7BYwHnaRaeQantB9lQ5GBGUL5oWriobcK0rKk3
	am5nRsXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBJIO-00DfRE-2T;
	Thu, 07 Dec 2023 18:40:24 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBJIK-00DfQ7-1P;
	Thu, 07 Dec 2023 18:40:21 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-54c4f95e27fso1190536a12.1;
        Thu, 07 Dec 2023 10:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701974419; x=1702579219; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kigIueQOAcLn75XXfZ0Gwh0kRvsokZ/Ypm7K8+pRm4g=;
        b=cU6Mv+9sZirWEMllZTg71mNBdqtvdnWiDYmD8v2xNsgT8FKuYFgEkP7PWVkpmJE+l6
         p10QeQhBHfVVW1l/97+1m/AAwe2jdeMgB/ZcKn/OB+1wphf1ilJtoLvxr61ZOz3AXcZL
         fXUtJRQXrV/F2GZmT8Lk27khQVzXAHpy9D0UhEcXd21OP0hkbRilLfdw1m8pKGqgUYEV
         oKFkmDnFErgSOn8LCzybornX6ne8RcF7vBbXy3tIWNHB0AKDDF7qRf9BaGTnZtX3qFig
         s64n3UOI6R6i8zRSzt+Oz+4MocjXsmFk30RcK08wOr7baN8TdSIU5oF/iJlEQmuk+pSr
         ZmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701974419; x=1702579219;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kigIueQOAcLn75XXfZ0Gwh0kRvsokZ/Ypm7K8+pRm4g=;
        b=vYIH05aW0/5wOP4hITKqOW6/qONRN/afZZwXD/HszZUrLmO5OoJpTFoN6L5xnCWvK3
         JL1Iv92hBkt8HPN7tF1YbFRZcngAsTayblOKNlmtvSszdK0PgUbTNDejRUGGn7OVt8Zh
         8R4rV/CczoAatsVHTX5iL0Gqo9j8OQNVerqiuIFjioWTVx2EFLgy5efFdghhjQQtK+A4
         nHGrm+cr0AY548uBBIOU/7Z0/8nd10cl2SGg41BQfR/Fiim6VMyjvonmoiz2YJpPOe2t
         7IuuOBJA0YbspBNvTIqrfgkkFXM7Rc52+t34uOs34I+ZhyQa2yb0rSCoTR8p+z3K4bHg
         LPow==
X-Gm-Message-State: AOJu0Yw1XxZ9Aps8Q02RhSwVfwQlbnVmi9wxJPEyRTC0Jq22EMaPULle
	JwWnSxOy61u/woXkLn2auxY=
X-Google-Smtp-Source: AGHT+IEyVEmWPr683mIgsYZk1wfGxtefcti3FrQu/q9XZjuViGfGsnMvgIfr5NwzTX0f4Wg9AjJQQg==
X-Received: by 2002:a05:6402:1d91:b0:54c:4837:903e with SMTP id dk17-20020a0564021d9100b0054c4837903emr1942092edb.54.1701974418673;
        Thu, 07 Dec 2023 10:40:18 -0800 (PST)
Received: from skbuf ([188.27.185.68])
        by smtp.gmail.com with ESMTPSA id l12-20020a50cbcc000000b0054b53aacd86sm113790edi.65.2023.12.07.10.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 10:40:18 -0800 (PST)
Date: Thu, 7 Dec 2023 20:40:15 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net-next 07/15] net: dsa: mt7530: do not run
 mt7530_setup_port5() if port 5 is disabled
Message-ID: <20231207184015.u7uoyfhdxiyuw6hh@skbuf>
References: <20231118123205.266819-1-arinc.unal@arinc9.com>
 <20231118123205.266819-8-arinc.unal@arinc9.com>
 <20231121185358.GA16629@kernel.org>
 <a2826485-70a6-4ba7-89e1-59e68e622901@arinc9.com>
 <90fde560-054e-4188-b15c-df2e082d3e33@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90fde560-054e-4188-b15c-df2e082d3e33@moroto.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_104020_475929_ED1479A0 
X-CRM114-Status: GOOD (  25.11  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Dan Carpenter <dan.carpenter@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Dec 07, 2023 at 09:51:07AM +0300, Dan Carpenter wrote:
> On Sat, Dec 02, 2023 at 11:45:42AM +0300, Arınç ÜNAL wrote:
> > 
> > I'm not sure why it doesn't catch that for mt7530_setup_port5() to run
> > here, priv->p5_intf_sel must be either P5_INTF_SEL_PHY_P0 or
> > P5_INTF_SEL_PHY_P4. And for that to happen, the interface variable will be
> > initialised.
> > 
> > for_each_child_of_node(dn, mac_np) {
> > 	if (!of_device_is_compatible(mac_np,
> > 				     "mediatek,eth-mac"))
> > 		continue;
> > 
> > 	ret = of_property_read_u32(mac_np, "reg", &id);
> > 	if (ret < 0 || id != 1)
> > 		continue;
> > 
> > 	phy_node = of_parse_phandle(mac_np, "phy-handle", 0);
> > 	if (!phy_node)
> > 		continue;
> > 
> > 	if (phy_node->parent == priv->dev->of_node->parent) {
> > 		ret = of_get_phy_mode(mac_np, &interface);
> > 		if (ret && ret != -ENODEV) {
> > 			of_node_put(mac_np);
> > 			of_node_put(phy_node);
> > 			return ret;
> > 		}
> > 		id = of_mdio_parse_addr(ds->dev, phy_node);
> > 		if (id == 0)
> > 			priv->p5_intf_sel = P5_INTF_SEL_PHY_P0;
> > 		if (id == 4)
> > 			priv->p5_intf_sel = P5_INTF_SEL_PHY_P4;
> > 	}
> > 	of_node_put(mac_np);
> > 	of_node_put(phy_node);
> > 	break;
> > }
> > 
> > if (priv->p5_intf_sel == P5_INTF_SEL_PHY_P0 ||
> >     priv->p5_intf_sel == P5_INTF_SEL_PHY_P4)
> > 	mt7530_setup_port5(ds, interface);
> 
> Smatch doesn't know:
> 1) What the value of priv->p5_intf_sel is going into this function
> 2) We enter the for_each_child_of_node() loop
> 3) That if (phy_node->parent == priv->dev->of_node->parent) { is
>    definitely true for one element on the list.
> 
> Looking at how Smatch parses this code, I could probably improve problem
> #1 a bit.  Right now Smatch sees "struct mt7530_priv *priv = ds->priv;"
> and "priv->p5_intf_sel" is unknown, but I could probably improve it to
> where it says that it's in the 1-3 range.  But that doesn't help here
> and it doesn't address problems 2 and 3.
> 
> It's a hard problem.
> 
> regards,
> dan carpenter
> 

We could be more pragmatic about this whole sparse false positive warning,
and just move the "if" block which calls mt7530_setup_port5() right
after the priv->p5_intf_sel assignments, instead of waiting to "break;"
from the for_each_child_of_node() loop.

for_each_child_of_node(dn, mac_np) {
	if (!of_device_is_compatible(mac_np,
				     "mediatek,eth-mac"))
		continue;

	ret = of_property_read_u32(mac_np, "reg", &id);
	if (ret < 0 || id != 1)
		continue;

	phy_node = of_parse_phandle(mac_np, "phy-handle", 0);
	if (!phy_node)
		continue;

	if (phy_node->parent == priv->dev->of_node->parent) {
		ret = of_get_phy_mode(mac_np, &interface);
		if (ret && ret != -ENODEV) {
			of_node_put(mac_np);
			of_node_put(phy_node);
			return ret;
		}
		id = of_mdio_parse_addr(ds->dev, phy_node);
		if (id == 0)
			priv->p5_intf_sel = P5_INTF_SEL_PHY_P0;
		if (id == 4)
			priv->p5_intf_sel = P5_INTF_SEL_PHY_P4;

		if (priv->p5_intf_sel == P5_INTF_SEL_PHY_P0 || <---- here
		    priv->p5_intf_sel == P5_INTF_SEL_PHY_P4)
			mt7530_setup_port5(ds, interface);
	}
	of_node_put(mac_np);
	of_node_put(phy_node);
	break;
}

I hope it's now much clearer to sparse that "interface" is used within
the same basic block in which it also got assigned, and that determination
does not depend upon the values taken by a second variable.

Maybe it's also a bit clearer for us humans.

What would also help us humans even more is to extract the entire "dn"
handling from mt7530_setup() into a separate mt7530_setup_phy_muxing()
function, and put a good comment there about what's going on with this
PHY muxing thing.

The advantage of splitting this up is that we don't pollute mt7530_setup()
with finding the "dn" if dsa_is_unused_port(ds, 5) returns false.

Also, reducing the indentation level of for_each_child_of_node() by one
can't be bad. Maybe even by more. There's this pattern:

for_each_child_of_node(dn, mac_np) {
	// do stuff with mac_np
	break;
}

aka we only care about the first child of dn. We could find the mac_np
as the only operation inside for_each_child_of_node(), break directly,
and "do stuff with mac_np" could be done outside, further reducing the
indentation by 1 level.


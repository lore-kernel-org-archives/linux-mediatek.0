Return-Path: <SRS0=YIXp=5T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A11FDC43331
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Apr 2020 17:03:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BBFD206F6
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Apr 2020 17:03:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NXhxPSB0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hENydy7D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BBFD206F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eLFtWIKSOlOQjE6/La8TuATZiW6r1JO9VGNd6wMi8cs=; b=NXhxPSB0vlGY+0
	g73O5KKc6DvYSOr6qNFxhu05FR2liFxy4Rde578wcy+D9eGrBGZE7JzXb0RNm5/+bj1Kk0FsRuo59
	sy55e+r5SvsscuNBMakZrNl7SyEMG963s4Pp10vFk73e6Lj/h69T0e43tPj7K79qhIymrt6/VJNRc
	0V1CSDeLuBC8/fno0ZM7JwmIWppo9+iMaL7C7rNBaKUi6jERfBdvPKcbFLweMAoB/gzZcLpfj+AiV
	eoNRMFRjQJ1maS9ifsB3ZCOX+ULB7a64ED8tvt6Y/ceDlPPxjzc777J/Yj71yzlaalrrwUuovnoZW
	LhJqAciUsC3Ge+3Olo8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKPj0-00027u-8V; Fri, 03 Apr 2020 17:03:22 +0000
Received: from mail-qv1-xf43.google.com ([2607:f8b0:4864:20::f43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKPiq-000202-1Q; Fri, 03 Apr 2020 17:03:13 +0000
Received: by mail-qv1-xf43.google.com with SMTP id s18so3957211qvn.1;
 Fri, 03 Apr 2020 10:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:message-id:from:to:cc:subject:in-reply-to:references
 :mime-version:content-disposition:content-transfer-encoding;
 bh=C18c1IugNAFxFaCXPQKTt7OVFB64Oo1MwWK6g2EBugk=;
 b=hENydy7D0JCIgFa87b7M0ed1qoGpz0QGXHyXVDmHGDh7zw+L+WUhbK8IW02pBk8qHM
 ADsA25xAJ67o4Ra6VRdXBwMhcZMuHy475xAxlyiU1YuRkbqv+PF2ir5V5qEjMcANfQVn
 jGY8UQU13Viwi+GDqFDM01+/XrhVQbFZPaY/Tb2zki4oxJUEWTJXSoycxyeREVVBXM5T
 uUK7ezP46TqBapFishKlJi3Sy21RVUbp0ZoycRDNJ8VBJIH1oXob0kZUNKCSq+meSRlw
 PvtxAFdZSw3sGPJDdA0MlyJjyUWjLDDi5bCftL5qN/hJ4Jis+/StdK4ZXo5AsP3JJEfj
 3FBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:from:to:cc:subject:in-reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding;
 bh=C18c1IugNAFxFaCXPQKTt7OVFB64Oo1MwWK6g2EBugk=;
 b=GYNccaGCap4sm67d/BbFr9kalfK44XfKfuR5sPd6oIa6lCc9+IB7ZthkUKqlt0nUax
 Cf7ibxphIkTlTMDZ0jvw9c/ddatwsad1wPDR1tfGufeJyWA6RQ9S6wquVM0sY1xq61nW
 W4qlQZys/Z2NBEgHr8TY81RWNh9IYOqHOGvHEfR8xEkheM04Y/zjRXibu7UtcBwFEWpw
 H7AeOKBYBz4E+lbAZ6/ohSQo1NACRXnAZEWp33ngTorL/fVWZABDmaWWKHVw9NX5jwaF
 ByD3Cw+MkNsulAVfgCW8A2lCqEescrdMozJx4qXB8xVbcp6oiHyAwLf0hPBjI6TQ6HyL
 6InA==
X-Gm-Message-State: AGi0PuYIVMCa/ao4hxufzXaWxMp0YzFN2QjQH0h0n1CtZavRBsTuD1vl
 byb2cfW0UGKp2g0vj4ulSb8=
X-Google-Smtp-Source: APiQypI7c1myt6pyEA1+Je1XA2txJx4TleqRCwZGZQeWyffLtTOCPCApztHQrbf9btvLkagoi//UCw==
X-Received: by 2002:a05:6214:1933:: with SMTP id
 es19mr9320626qvb.186.1585933389339; 
 Fri, 03 Apr 2020 10:03:09 -0700 (PDT)
Received: from localhost (modemcable249.105-163-184.mc.videotron.ca.
 [184.163.105.249])
 by smtp.gmail.com with ESMTPSA id k2sm6777761qte.16.2020.04.03.10.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 10:03:08 -0700 (PDT)
Date: Fri, 3 Apr 2020 13:03:05 -0400
Message-ID: <20200403130305.GB6453@t480s.localdomain>
From: Vivien Didelot <vivien.didelot@gmail.com>
To: Chuanhong Guo <gch981213@gmail.com>
Subject: Re: [PATCH] net: dsa: mt7530: fix null pointer dereferencing in port5
 setup
In-Reply-To: <20200403112830.505720-1-gch981213@gmail.com>
References: <20200403112830.505720-1-gch981213@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200403_100312_135394_C8E577A1 
X-CRM114-Status: UNSURE (   9.81  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 =?UTF-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Chuanhong Guo <gch981213@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri,  3 Apr 2020 19:28:24 +0800, Chuanhong Guo <gch981213@gmail.com> wrote:
> The 2nd gmac of mediatek soc ethernet may not be connected to a PHY
> and a phy-handle isn't always available.
> Unfortunately, mt7530 dsa driver assumes that the 2nd gmac is always
> connected to switch port 5 and setup mt7530 according to phy address
> of 2nd gmac node, causing null pointer dereferencing when phy-handle
> isn't defined in dts.
> This commit fix this setup code by checking return value of
> of_parse_phandle before using it.
> 
> Fixes: 38f790a80560 ("net: dsa: mt7530: Add support for port 5")
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> Cc: stable@vger.kernel.org

Reviewed-by: Vivien Didelot <vivien.didelot@gmail.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

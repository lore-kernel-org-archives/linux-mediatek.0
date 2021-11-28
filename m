Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFC7C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 28 Nov 2021 23:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KCuW25Nhpv3U7WkPd+XfxgwU7Q/lKTfc6CiXeMWXKdk=; b=mugyaep2/YcaAb
	a9jEWloF3ktm7jjgCxVpE8xNwQ4XyP2fl0Vyn89phA3hkmP4qx0bsyp8+LOmv2E/HloXM5EIaOLoL
	cUyENBlZ9KRfFnPLkJwzaiI0KUhJ/NO5Op6zXg+54baWxsEg2jMt5q7hcWcJsaEwWbhQcGDe7rIqK
	7eUsieN5+OoPz/oCqAzFbVEbVK/LL4q0NqQj4E8vAenLb6tT6UV95OJybjatp3kttDZ6Dw5Boguxf
	rXhlw8QP6qEpaWGQvhAsguEHPbEObIfRs8hnsZjuyBIB3YhMYm60HtkNLQcyHaA3FfibI9PjvmcKn
	Q4+3YI9iWwsRRieC/d6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrTfS-00GphD-MS; Sun, 28 Nov 2021 23:33:10 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrTfO-00Gpf2-Mh; Sun, 28 Nov 2021 23:33:08 +0000
Received: by mail-oi1-f177.google.com with SMTP id bk14so31143767oib.7;
 Sun, 28 Nov 2021 15:33:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DLaIVrzhsciazb/WMOwbxqo54xmjIGiDFmP43lfbZuI=;
 b=qtvSvX/wKkNbXwsEO4sQ/SvCClZEdO/XD6OQKCACGuf1LKombHuYmYzD3R4HujC0eF
 +4WmK/KDvXViUCwYQOu21VdiVMUQ4vp8xK/o98GsN5dVp8mHZwuwknornqUkNMympNry
 K6XPOpWfVimqMbXUuYyncBbHHSwTkZlfbo9HKwc1omQucmxYZoB52khzQpLf18a82QQO
 oTQsfmrkLYM4wl1wYbY9r8+o2lMThbVUme3qx+3jq0Gm9u2Vb7gcRCZ4up5JEe9bv8bV
 8Ic1J6ewMnHfBoidzdpzjhwc8lxtHvDQJ77hrxaKxXA2xtbPYjrROpb4KC/AydSj33Jk
 qc2g==
X-Gm-Message-State: AOAM531tLiC4ax64pM93TUIeCNsDF8NdnHHWw1HZcsPK6I0nsA109fNC
 w/orvADFlQwKsritnD1UAg==
X-Google-Smtp-Source: ABdhPJwMvO66agETDTyVrjALemeJhiff9EcntyMtFDg9PxbsUwq45QUEQmuet6J8vRtgnsPxptaZyg==
X-Received: by 2002:a05:6808:210c:: with SMTP id
 r12mr36201697oiw.104.1638142385795; 
 Sun, 28 Nov 2021 15:33:05 -0800 (PST)
Received: from robh.at.kernel.org ([2607:fb90:5fe7:4487:4f99:dbc0:75d1:3e27])
 by smtp.gmail.com with ESMTPSA id
 e16sm2022706ook.38.2021.11.28.15.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 15:33:05 -0800 (PST)
Received: (nullmailer pid 2820721 invoked by uid 1000);
 Sun, 28 Nov 2021 23:32:41 -0000
Date: Sun, 28 Nov 2021 17:32:41 -0600
From: Rob Herring <robh@kernel.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, linux-kernel@vger.kernel.org,
 Jianjun Wang <jianjun.wang@mediatek.com>, john@phrozen.org,
 Ryder Lee <ryder.lee@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 08/12] dt-bindings: PCI: Add support for Airoha EN7532
Message-ID: <YaQRmdHdFgIDo9yS@robh.at.kernel.org>
References: <20211125110738.41028-1-nbd@nbd.name>
 <20211125110738.41028-9-nbd@nbd.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211125110738.41028-9-nbd@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_153306_811645_909596ED 
X-CRM114-Status: GOOD (  11.22  )
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

On Thu, 25 Nov 2021 12:07:34 +0100, Felix Fietkau wrote:
> From: John Crispin <john@phrozen.org>
> 
> EN7532 is an ARM based platform SoC integrating the same PCIe IP as
> MT7622, add a binding for it.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> ---
>  Documentation/devicetree/bindings/pci/mediatek-pcie.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

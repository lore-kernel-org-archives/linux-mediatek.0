Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04BF5C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 19:31:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C459560F26
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 19:31:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C459560F26
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e1gG9rZ7mTjHkssXpOXMco1DrkR3Z1AwpmKERXSekvk=; b=vDyXWw6LOx89U5
	dOva8Lz/oKT7Mk4+4rXMbAFf3AhWXnywU+c4xl1sbfGFkiyky9wp8R1z1NfFGxI8Bidtc0XOuioty
	Vw5tEduTNqQDHS4LYuKBk9rZKLdEhWDcSyLZe86qHBUrFCGvam+lvwGoS/NjG471eOZuE/hETDLwl
	nJfIj9ksNoOmM5MHekliYvUqwCPMyx2f1aYv3QErTiJqey7QT3vWXJKBzNFNy3ktTcEbAZeQoW1Bo
	THNTGhni8muY33QJucMc0k1Fab284aWK+GKinnWEja8wuVMHyzRuRfB1cPBoLwaEMcJXZevK7rltR
	+/RObY3fDfghVwIgfWqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9YDz-00A66z-HM; Fri, 30 Jul 2021 19:31:15 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9YDk-00A5zm-5s; Fri, 30 Jul 2021 19:31:01 +0000
Received: by mail-ed1-x52d.google.com with SMTP id y7so12425472eda.5;
 Fri, 30 Jul 2021 12:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zxmFnKmrbzC01vibbcZbCwfThDgwyJDKO9mjaDJdf4Q=;
 b=klZjUNFrmqh5cLgy/VXo6hou9+QrP5pePgd9SLL+4SDgA3y6GAOaSxd+DfADIerLWZ
 quXYnuiIrIqh52hZ2AwKn4e7TF5llnKebULpa7ny0C/lliSiZwdkmvesZOBefQzsHbKb
 MntKTtjxs/ydSHgQ8nRuahv1ZgfCgLCA+WlI9Alrkv6bCuxdhGd93q/XeT/rR7DG82Qg
 LquVD2d8Tmb/TkN1QnmaMqV1MWEagEOoALqLZpy0t25N6Mdu5iVGbaRLuMagnoqg/f7U
 CSKU089Is04zsMwWdtCGOMxb9JwJ+sOAUfTUmMvwcI+kjO2+0iVgVv5cc3Ovc3rAXe8m
 Ze9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zxmFnKmrbzC01vibbcZbCwfThDgwyJDKO9mjaDJdf4Q=;
 b=UvIcOrE5gbZZQe48X8JQ+1Z8U9gi75bLKUTbLZNUMYQAv7avczo+pBOCYaz7dGvey8
 GXcVcQIdsFW1iNKKXlj8Mj7/F9bTM95Wy3l37cmqN2k1PvSYQuj8LvqHdWtt4JarRR98
 KiSAG7bttnLzGvoL6c5TBj4k4uIflBzdxHxvG6BHw1rurp+o65Muu3/dVKoC6YGz7kdQ
 5HB9KDx/qz5B8QxOBXbwy44OpcegCNIe56kAHZR5q27s1pFpwReRlex9HrodMbpgNwg/
 Js/j9BuNh/rr5kIe+MqThwvP2+72GnUg9qyJD4kqKmz9eneqphcj4qtNrTIrYC24Hg3Y
 yzNA==
X-Gm-Message-State: AOAM530Xf8IydnRoyX+/1jR1pHGyeiNomIzCe1lZQBtB+/dytLLUEKu/
 IvwHbo5h6NhfVbXv1Pqniwg=
X-Google-Smtp-Source: ABdhPJwmaQpRc62eWEILeOk95XVTegm2+paD53ybnJ7M0WRyCXpfkE7Y+duCEOXbhFOpsyQ6lXHEpw==
X-Received: by 2002:a50:c092:: with SMTP id k18mr2544420edf.361.1627673458891; 
 Fri, 30 Jul 2021 12:30:58 -0700 (PDT)
Received: from skbuf ([82.76.66.29])
 by smtp.gmail.com with ESMTPSA id b5sm886286ejq.56.2021.07.30.12.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 12:30:58 -0700 (PDT)
Date: Fri, 30 Jul 2021 22:30:57 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC net-next 1/2] net: dsa: tag_mtk: skip address learning on
 transmit to standalone ports
Message-ID: <20210730193057.k7su2njgdakhsnah@skbuf>
References: <20210728175327.1150120-1-dqfext@gmail.com>
 <20210728175327.1150120-2-dqfext@gmail.com>
 <20210728183705.4gea64qlbe64kkpl@skbuf>
 <20210730162403.p2dnwvwwgsxttomg@skbuf>
 <20210730190020.638409-1-dqfext@gmail.com>
 <20210730190706.jm7uizyqltmle2bi@skbuf>
 <20210730192555.638774-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210730192555.638774-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_123100_288273_BA48BCD1 
X-CRM114-Status: GOOD (  15.30  )
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

On Sat, Jul 31, 2021 at 03:25:55AM +0800, DENG Qingfang wrote:
> On Fri, Jul 30, 2021 at 10:07:06PM +0300, Vladimir Oltean wrote:
> > > After enabling it, I noticed .port_fdb_{add,del} are called with VID=0
> > > (which it does not use now) unless I turn on VLAN filtering. Is that
> > > normal?
> > 
> > They are called with the VID from the learned packet.
> > If the bridge is VLAN-unaware, the MAC SA is learned with VID 0.
> > Generally, VID 0 is always used for VLAN-unaware bridging. You can
> > privately translate VID 0 to whatever VLAN ID you use in VLAN-unaware
> > mode.
> 
> Now the issue is PVID is always set to the bridge's vlan_default_pvid,
> regardless of VLAN awareless.

Then change that, sja1105 and ocelot/felix are good examples of how to
set a pvid in VLAN-unaware mode that is independent of what the bridge
asks for.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

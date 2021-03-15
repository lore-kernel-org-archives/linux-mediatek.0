Return-Path: <SRS0=+2NV=IN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD00C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 20:10:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CB3264E61
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 20:10:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CB3264E61
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GLwyuWpVSf8iZxVj7+77bO09aIVIpqF7I0ywZkCPA9c=; b=WXLzH+M+Q70IUQwkv1UIz8rfy
	L8gIHwnwLz/DI0CzgJwKu4F1F6sXRh+0JAv0vhNWVbsQfz3/+wCiHJhqHtpVz/aAn+CWcVln4cCAP
	eLe4+0oAPAxa1TBqV7bZCYI2z8Fk5Gp5jY8DmyLHF8wOE4RvAsZd1s901K8uazLprJBM6T3NgJIlY
	p8RaO5mcqTKMGP6Y4BhS713CDabZfLwN/3hU9yhAKY/k2b1VYIm+Xdij3eMtpjb0cR8npLq0sZSel
	rBfxRzNyR5ND0SNYIZhQHFUis+TG9+Kd2AN52WzU7HxMGHiQvZZG5hiRPGL1deZtqqthr1km2777m
	kmFeiYoLA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLtXK-00Gpci-ID; Mon, 15 Mar 2021 20:09:58 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLtX5-00GpbJ-St; Mon, 15 Mar 2021 20:09:46 +0000
Received: by mail-ej1-x62e.google.com with SMTP id c10so68339093ejx.9;
 Mon, 15 Mar 2021 13:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XFZxaapEfrnceu1DR1QvIoySAx6HSdaqEW24Vu33n7o=;
 b=dOVrq4x9RRGKeAZWpe0l6ucz5AeUQM7VDOh2ZWfjnRiPbT2yn2dKYXq5KwqqY47S4i
 T2anIK/nBWZyUyZE/zAOwzdBDLRI42837cM6YIxU050itPRlkKly2qRNITaaen86ZiUS
 M1aQsDJ+hcPGmkKyfRf+XEOPS9HUtSX+4Ed5bhBnHX7xxgpFamBaZaAOflVlt8xOt21s
 2w8irqDcrmPyybrj57acXyGq6AHPbLTH1DdZRXyZBjlnJOJWjNVlJcyGfzlfKzW9JWa8
 /wZ2wyJM4AQeqfq48fK0EdNaAcsYrYFOPiKdm0AybyQK72dNcliSiuQijvpDWpfJ3Vei
 9PiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XFZxaapEfrnceu1DR1QvIoySAx6HSdaqEW24Vu33n7o=;
 b=hyymOU4EtqMS+4i15EHs2TLpEqyhG/2PBbCiTsQ+U7UHal9QA11e7e3wW6DiP/volu
 Sj1BjBDG3aZalaqJxjfDjj9eP+ZyqHqSrGhxDSwKvr6x5Vy0Vvvc83DXu0JtdPXwgdya
 bxaM6en/PQXJRipsSqdhlg1gCon1T+clJKlTVpwfeMBP12Sa8FXie/A1oBShSDDTL0cQ
 BGAPtN6KkrReBEsaAcgUhps+5DfXVodjmwNsLXvhH1TZj2YgHg4N/74tlVFbc9DCd40Q
 yVAIlt1fhzyWtcwfSCMLa9voHaHVSij3jEkA7kFXK+ZUZ9F2g+IgjFSBJo9DczzvpE1e
 2Aig==
X-Gm-Message-State: AOAM533E2cs9vHcLO6z/Z9KSDGHuKjZtC9gyPmrkSGxYp6XWG+zYE430
 Hr3Ax8ahxfx+9daHSrB+XUY=
X-Google-Smtp-Source: ABdhPJwMRUIBF5tThWFDvF1cvUf3QS3BRDtqjRPx8hgfPLPM8Na+4GdEa3fdfpEQizG7fxOz+AVQEA==
X-Received: by 2002:a17:906:2786:: with SMTP id
 j6mr9901004ejc.157.1615838981122; 
 Mon, 15 Mar 2021 13:09:41 -0700 (PDT)
Received: from skbuf ([188.25.219.167])
 by smtp.gmail.com with ESMTPSA id r5sm8839502eds.49.2021.03.15.13.09.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 13:09:40 -0700 (PDT)
Date: Mon, 15 Mar 2021 22:09:39 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Landen Chao <Landen.Chao@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Frank Wunderlich <frank-w@public-files.de>,
 =?utf-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>
Subject: Re: [PATCH net-next] net: dsa: mt7530: support MDB and bridge flag
 operations
Message-ID: <20210315200939.irwyiru6m62g4a7f@skbuf>
References: <20210315170940.2414854-1-dqfext@gmail.com>
 <892918f1-bee6-7603-b8e1-3efb93104f6f@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <892918f1-bee6-7603-b8e1-3efb93104f6f@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_200944_292734_C67852DC 
X-CRM114-Status: GOOD (  18.90  )
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

On Mon, Mar 15, 2021 at 01:03:10PM -0700, Florian Fainelli wrote:
> 
> 
> On 3/15/2021 10:09 AM, DENG Qingfang wrote:
> > Support port MDB and bridge flag operations.
> > 
> > As the hardware can manage multicast forwarding itself, offload_fwd_mark
> > can be unconditionally set to true.
> > 
> > Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> > ---
> > Changes since RFC:
> >   Replaced BR_AUTO_MASK with BR_FLOOD | BR_LEARNING
> > 
> >  drivers/net/dsa/mt7530.c | 124 +++++++++++++++++++++++++++++++++++++--
> >  drivers/net/dsa/mt7530.h |   1 +
> >  net/dsa/tag_mtk.c        |  14 +----
> >  3 files changed, 122 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> > index 2342d4528b4c..f765984330c9 100644
> > --- a/drivers/net/dsa/mt7530.c
> > +++ b/drivers/net/dsa/mt7530.c
> > @@ -1000,8 +1000,9 @@ mt753x_cpu_port_enable(struct dsa_switch *ds, int port)
> >  	mt7530_write(priv, MT7530_PVC_P(port),
> >  		     PORT_SPEC_TAG);
> >  
> > -	/* Unknown multicast frame forwarding to the cpu port */
> > -	mt7530_rmw(priv, MT7530_MFC, UNM_FFP_MASK, UNM_FFP(BIT(port)));
> > +	/* Disable flooding by default */
> > +	mt7530_rmw(priv, MT7530_MFC, BC_FFP_MASK | UNM_FFP_MASK | UNU_FFP_MASK,
> > +		   BC_FFP(BIT(port)) | UNM_FFP(BIT(port)) | UNU_FFP(BIT(port)));
> 
> It's not clear to me why this is appropriate especially when the ports
> operated in standalone mode, can you expand a bit more on this?

We are in the function called "mt753x_cpu_port_enable" here. It's ok to
apply this config for the CPU port.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

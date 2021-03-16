Return-Path: <SRS0=yOeO=IO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51265C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 09:55:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6F7065014
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 09:55:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6F7065014
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9jxu0vygrssOVr40MKuFU09eBgW+dP5egkDmW+ALj74=; b=p50+uf4bQtHZjwbtPgtZACNTP
	aecvu+uYCMQNhZWLdGDOACFdLw+zC9kzml5wBjgzxCMA9YrUza8pFX+nPJD9IImxzklLTLDkpqczk
	Oxjoqcm1YlIZVmYD9pCOuCCMnvqCya8A4bryjvYJmyxgnv3xpJhkWjANkR7qMdDOl3h/I1q3Pfa/Y
	ShlE3nnnpWM7DYIk/n8qRY03nNe7EJ8x8tfi9Tw9EKur84o6IrYEAlmld5TyY8yH0Pe+n/7gkMVhx
	GjlZWilFTexP5KBJ1BDYFk6H/hOWHMA7jfkztJuGG78Ahc8E3do74YT6vjfRIquIrpaiKmMTVjBWt
	e+0k62S3A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lM6QR-000KQ1-OP; Tue, 16 Mar 2021 09:55:43 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lM6QH-000KOs-H3; Tue, 16 Mar 2021 09:55:35 +0000
Received: by mail-ej1-x62f.google.com with SMTP id dx17so71105815ejb.2;
 Tue, 16 Mar 2021 02:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=D8pE+gAt6ykTk6iu18Gsykjh2e+iH3BpnPTvA4JqlAY=;
 b=XiFI45IJLFKHVOizWJznMDvgItTaoT+GMKNp70BMoRkEIlCLDvWGkTnZL3tkyyR4FM
 ZhWdpdE5Hmk8vJfqBqgEhOle9ghmPvNAeA7n55zWcfvjMSmei1GV/x4WqAz3c2emWGkk
 QrGZBBRcQffol+xQTy6MuOKTudSL2zukXg8A38i8xu4jmQ/ALPC+9nJ+fuGBzRTsuPlM
 PGZyVuX7N3RXkvlXxvR7kw5DT1murOweNYyB+DmjEpYjYVSaSVEu5pRPG05fNkswD+/l
 +7SYcx2HAiEAheJRqAKckE7v4fa2vT9jISSOpgG8YK4TTbIjkT52UcsydJLXrBljQQvw
 KFVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=D8pE+gAt6ykTk6iu18Gsykjh2e+iH3BpnPTvA4JqlAY=;
 b=S6tup6mvljVjkW65zVtdKv5UzvFt0vutOzUPYsIa58gOAKoZyo4yKVtOOmWQdKxMCb
 oTJAIIqPsQOVfujNLeP+CfM5YFE5A6sQwRqkx0+3qjhMp2X0sC64PesBXM98ENvNLXDP
 E94hterSco907mu8L3tNYEB3Jaoo0g45Fo7cUDry1CA32dI9i276vuWEQmAZY8zxvZZb
 nLWTBX+J1lQo4rqTuvfxX1I8Es/VA+ZJoPB52d6lxnPeATHgFG7BlfpjXD8Eqs2fipGm
 uSQjEYYveY5jombgCt/LjtZDer6+xK0IGWW50x/A+s7QicfKNr8z1rg56Z2pVzdvl3hi
 VTIw==
X-Gm-Message-State: AOAM530oNm+C01tKTNPVrARjxjrAMT7qt/cXhvQq2DQCPWKGHFI42pNc
 HWoOGuB9y/1cLGVEohQWFiw=
X-Google-Smtp-Source: ABdhPJwlSzu63hjHYO/dHln4WJdHEkcor0oiJEgjcMH7GmLuqXTnl+VEpGHjveeFrFCE9UX1a5Vj/w==
X-Received: by 2002:a17:906:4d85:: with SMTP id
 s5mr26962757eju.43.1615888530393; 
 Tue, 16 Mar 2021 02:55:30 -0700 (PDT)
Received: from skbuf (5-12-16-165.residential.rdsnet.ro. [5.12.16.165])
 by smtp.gmail.com with ESMTPSA id u14sm8986535ejx.60.2021.03.16.02.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 02:55:30 -0700 (PDT)
Date: Tue, 16 Mar 2021 11:55:28 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Russell King <linux@armlinux.org.uk>, netdev <netdev@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel@vger.kernel.org, Frank Wunderlich <frank-w@public-files.de>,
 =?utf-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>
Subject: Re: [PATCH net-next] net: dsa: mt7530: support MDB and bridge flag
 operations
Message-ID: <20210316095528.kl37helfv5jblsih@skbuf>
References: <20210315170940.2414854-1-dqfext@gmail.com>
 <892918f1-bee6-7603-b8e1-3efb93104f6f@gmail.com>
 <20210315200939.irwyiru6m62g4a7f@skbuf>
 <84bb93da-cc3b-d2a5-dda8-a8fb973c3bae@gmail.com>
 <20210315211541.pj5mpy2foi3wlhbe@skbuf>
 <CALW65jbZ1_A-HwzKwKfavQQUBfNZuBSdL8xTGuRrS5qDqi6j3A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALW65jbZ1_A-HwzKwKfavQQUBfNZuBSdL8xTGuRrS5qDqi6j3A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_095533_726537_03CE44ED 
X-CRM114-Status: GOOD (  16.06  )
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

On Tue, Mar 16, 2021 at 12:36:24PM +0800, DENG Qingfang wrote:
> On Tue, Mar 16, 2021 at 5:15 AM Vladimir Oltean <olteanv@gmail.com> wrote:
> >
> > Actually this is just how Qingfang explained it:
> > https://patchwork.kernel.org/project/netdevbpf/patch/20210224081018.24719-1-dqfext@gmail.com/
> >
> > I just assume that MT7530/7531 switches don't need to enable flooding on
> > user ports when the only possible traffic source is the CPU port - the
> > CPU port can inject traffic into any port regardless of egress flooding
> > setting. If that's not true, I don't see how traffic in standalone ports
> > mode would work after this patch.
> 
> Correct. Don't forget the earlier version of this driver (before my
> attempt to fix roaming) disabled unknown unicast flooding (trapped to
> CPU) in the same way.

Ok, so in practice you don't really need to touch this register if it's
already all ones.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
